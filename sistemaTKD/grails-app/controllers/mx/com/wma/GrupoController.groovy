package mx.com.wma
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.Authentication
import org.springframework.security.core.context.SecurityContextHolder
@Secured(['ROLE_ADMIN','ROLE_DOCENTE'])
@Transactional(readOnly = false)
class GrupoController {

    def index(Integer max) {
    	[grupos: Grupo.list()]
    }

    def create(Sucursal sucursal) {
        def mapa=[:]
        mapa.put("profesores", Profesor.list())
        mapa.put("sucursal",sucursal)
        respond new Grupo(params),model:mapa
    }


    def createVincular(Grupo grupo){
        [grupo: grupo,grados:Grado.list()]
    }

    def vincularAlumnoExistente(Grupo grupo) {
        [grupo: grupo, alumnos: Alumno.list(),grados:Grado.list()]
    }

    def vincular(Alumno alumno){
     println params
     Alumno al = Alumno.where {(id==params.alumno)}.find()
     Grupo gru = Grupo.where {(id==params.grupo)}.find()
     def alumnoGrupo = new AlumnoGrupo(grupo:gru,alumno:al).save(flush:true)
     println alumnoGrupo
     redirect(controller:"sucursal", action: "index")
    }


    def storeAlumnoAGrupo(Alumno alumno) {
        if (alumno == null) {
            transactionStatus.setRollbackOnly()
            respond alumno.errors, view:'create'
            return
        }

        if (alumno.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond alumno.errors, view:'create'
            return
        }

        println params

        String nombreUsuario=params.user
        def usuarioExiste = Usuario.findByUsername(nombreUsuario)
        if(usuarioExiste!=null){
            println "usuario:" + usuarioExiste
            params.user =(int) (Math.random() * 1000000) + 1;
        }

        def usuario =new Usuario(username:params.user,password:params.contra).save(flush:true)
        params.usuario = usuario
        def alumno2 = new Alumno(params).save(flush:true)

          def rol = Rol.findByAuthority("ROLE_ALUMNO")

          UsuarioRol.create usuario,rol
          UsuarioRol.withSession {
            it.flush()
            it.clear()
          }

        Grupo gru = Grupo.where {(id==params.grupo)}.find()
        def alumnoGrupo = new AlumnoGrupo(grupo:gru,alumno:alumno2).save(flush:true)

        flash.icon = "check"
        flash.messageType = "success"
        flash.title = "Alumno Registrado!"
        flash.message = "El Alumno ha sido registrado correctamente"
        String auth = SecurityContextHolder.getContext().getAuthentication().getAuthorities()
        if(auth.equals('[ROLE_DOCENTE]')){
        println "SOY DOCENTE"
        redirect(controller:"sucursal", action: "sucursalesProfesor")  
        }
        else{
            println "NO SOY DOCENTE"
        redirect(controller:"sucursal", action: "index")  
        } 
        
    }



    def desvincular(Alumno alumno){
     println params
     Alumno al = Alumno.where {(id==params.alumno)}.find()
     Grupo gru = Grupo.where {(id==params.grupo)}.find()
     def alumnoDelGrupo = AlumnoGrupo.where{(alumno==al && grupo==gru)}.find()
     println "alumno: "+al
     println "grupo:"+gru
     println "Se borra:"+alumnoDelGrupo
     alumnoDelGrupo.delete flush:true 
       flash.icon = "check"
        flash.messageType = "success"
        flash.title = "Alumno Desvinculado!"
        flash.message = "El alumno se desvinculo correctamente"
     redirect(controller:"sucursal", action: "index")
    }



    @Transactional
    def save(Grupo grupo) {
        println params
        if (grupo == null) {
            transactionStatus.setRollbackOnly()
            respond grupo.errors, view:'create'
            return
        }

        if (grupo.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond grupo.errors, view:'create'
            return
        }

        def sucursal = grupo.sucursalDelGrupo
        grupo.save(flush:true)

        flash.icon = "check"
        flash.messageType = "success"
        flash.title = "Grupo Registrado! con ID: " + grupo.id
        flash.message = "El grupo ha sido registrado correctamente"
        redirect(controller:"sucursal", action: "index")
        println "termine"
    }

    @Transactional
    def verDetalle(Grupo grupo) {
        Grupo gru = Grupo.where {(id==grupo.id)}.find()
        def alumnosDelGrupo = AlumnoGrupo.findAllByGrupo(gru)
        return [grupo: grupo,alumnosDelGrupo:alumnosDelGrupo]
    }


    @Transactional
    def editar(Grupo grupo) {
        if (grupo == null) {
            notFound()
            return
        }
        if (!request.post) {
            return [grupo: grupo]
        }

        if (grupo.hasErrors()) {
            return [grupo: grupo]
        }

        grupo.save(flush: true)
        flash.icon = "check"
        flash.messageType = "success"
        flash.title = "Grupo actualizado"
        flash.message = "Se ha actualizado el grupo correctamente"
        redirect(controller:"sucursal",action: "index")
    }

    @Transactional

    def eliminar(Grupo grupo){
        if (grupo == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        grupo.delete flush:true
        flash.icon = "check"
        flash.messageType = "success"
        flash.title = "Grupo borrado"
        flash.message = "Se ha borrado el grupo correctamente"
        redirect(controller:"sucursal",action: "index")
       
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.icon = "check"
                flash.title = "Error"
                flash.messageType = "danger"
                flash.message = "No se encontro la grupo"
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
