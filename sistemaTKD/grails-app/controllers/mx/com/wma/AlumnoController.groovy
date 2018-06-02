package mx.com.wma
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = false)
class AlumnoController {


    def index(Integer max) {
        [alumnos: Alumno.list()]
    }

    def create() {
        def mapa=[:]
        mapa.put("grados",Grado.list())
        respond new Alumno(params),model:mapa
    }

    @Transactional
    def save(Alumno alumno) {
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

        flash.icon = "check"
        flash.messageType = "success"
        flash.title = "Alumno Registrado!"
        flash.message = "El Alumno ha sido registrado correctamente"


        redirect(action: "index")
        println "termine"
    }

    @Transactional
    def editar(Alumno alumno) {
        println params
        if (alumno == null) {
            println "llegue aqui3"
            notFound()
            return
        }
        if (!request.post) {
            return [alumno: alumno,grados:Grado.list()]
        }
        if (alumno.hasErrors()) {
            return [alumno: alumno,grados:Grado.list()]
        }
        
        //obtener el usuario anterior
        String nombreUsuario=params.user2
        def usuarioAnterior = Usuario.findByUsername(nombreUsuario)
        println usuarioAnterior.properties
        
        usuarioAnterior.username =params.user
        usuarioAnterior.save();
        alumno.save(flush: true)
        flash.icon = "check"
        flash.messageType = "success"
        flash.title = "Alumno actualizado"
        flash.message = "Se ha actualizado el Alumno correctamente"
        redirect(action: "index")
    }

    @Transactional
    def eliminar(Alumno alumno){
        println params
        if (alumno == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }
        alumno.delete flush:true
        flash.icon = "check"
        flash.messageType = "success"
        flash.title = "Alumno borrado"
        flash.message = "Se ha borrado el Alumno correctamente"
        redirect(controller:"alumno", action: "index")
       
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.icon = "check"
                flash.title = "Error"
                flash.messageType = "danger"
                flash.message = "No se encontro el Alumno"
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
