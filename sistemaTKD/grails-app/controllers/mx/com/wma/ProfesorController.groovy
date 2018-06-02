package mx.com.wma
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = false)
class ProfesorController {

    def index(Integer max) {
    	[profesores: Profesor.list()]
    }

    def create() {
        respond new Profesor(params)
    }

    @Transactional
    def save(Profesor profesor) {
        if (profesor == null) {
            transactionStatus.setRollbackOnly()
            respond profesor.errors, view:'create'
            return
        }

        if (profesor.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond profesor.errors, view:'create'
            return
        }


        String nombreUsuario=params.user
        def usuarioExiste = Usuario.findByUsername(nombreUsuario)
        if(usuarioExiste!=null){
            println "usuario:" + usuarioExiste
            params.user =(int) (Math.random() * 1000000) + 1;
        }

        def usuario =new Usuario(username:params.user,password:params.contra).save(flush:true)
        params.usuario = usuario

        def profesor2 = new Profesor(params).save(flush:true)

          def rol = Rol.findByAuthority("ROLE_DOCENTE")

          UsuarioRol.create usuario,rol
          UsuarioRol.withSession {
            it.flush()
            it.clear()
          }

        flash.icon = "check"
        flash.messageType = "success"
        flash.title = "Profesor Registrado! USUARIO:"+params.user
        flash.message = "El profesor ha sido registrado correctamente"
        redirect(action: "index")
        println "termine"
    }

    @Transactional
    def editar(Profesor profesor) {
        println "PARAMS TRAE:"+ params
        if (profesor == null) {
            println "llegue aqui3"
            notFound()
            return
        }
        if (!request.post) {
            return [profesor: profesor]
        }

        if (profesor.hasErrors()) {
            return [profesor: profesor]
        }

        //obtener el usuario anterior
        String nombreUsuario=params.user2
        def usuarioAnterior = Usuario.findByUsername(nombreUsuario)
        println usuarioAnterior.properties
        
        usuarioAnterior.username =params.user
        usuarioAnterior.save();

        profesor.save(flush: true)
        flash.icon = "check"
        flash.messageType = "success"
        flash.title = "Profesor actualizado"
        flash.message = "Se ha actualizado el profesor correctamente"
        redirect(action: "index")
    }

    @Transactional

    def eliminar(Profesor profesor){
        if (profesor == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        profesor.delete flush:true
        flash.icon = "check"
        flash.messageType = "success"
        flash.title = "Profesor borrado"
        flash.message = "Se ha borrado el profesor correctamente"
        redirect(action: "index")
       
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.icon = "check"
                flash.title = "Error"
                flash.messageType = "danger"
                flash.message = "No se encontro el profesor"
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
