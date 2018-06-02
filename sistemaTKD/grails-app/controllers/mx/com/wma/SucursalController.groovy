package mx.com.wma
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.Authentication
import org.springframework.security.core.context.SecurityContextHolder
@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = false)
class SucursalController {

    def index(Integer max) {
    	[sucursales: Sucursal.list()]
    }

    def create() {
        respond new Sucursal(params)
    }

    @Transactional
    def save(Sucursal sucursal) {
        if (sucursal == null) {
            transactionStatus.setRollbackOnly()
            respond sucursal.errors, view:'create'
            return
        }

        if (sucursal.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond sucursal.errors, view:'create'
            return
        }

        sucursal.save(flush:true)

        flash.icon = "check"
        flash.messageType = "success"
        flash.title = "sucursal Registrada! con ID: " + sucursal.id
        flash.message = "La sucursal ha sido registrada correctamente"
        redirect(action: "index")
        println "termine"
    }


@Transactional
    def verGrupos(Sucursal sucursal) {
        Sucursal suc = Sucursal.where {(id==sucursal.id)}.find()
        def gruposDeLaSucursal = Grupo.findAllBySucursalDelGrupo(suc)
        return [gruposDeLaSucursal: gruposDeLaSucursal,sucursal:sucursal]
    }


    @Transactional
    def editar(Sucursal sucursal) {
        if (sucursal == null) {
            notFound()
            return
        }
        if (!request.post) {
            return [sucursal: sucursal]
        }

        if (sucursal.hasErrors()) {
            return [sucursal: sucursal]
        }

        sucursal.save(flush: true)
        flash.icon = "check"
        flash.messageType = "success"
        flash.title = "Sucursal actualizada"
        flash.message = "Se ha actualizado la sucursal correctamente"
        redirect(action: "index")
    }

    @Transactional

    def eliminar(Sucursal sucursal){
        if (sucursal == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        sucursal.delete flush:true
        flash.icon = "check"
        flash.messageType = "success"
        flash.title = "Sucursal borrada"
        flash.message = "Se ha borrado la sucursal correctamente"
        redirect(action: "index")
       
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.icon = "check"
                flash.title = "Error"
                flash.messageType = "danger"
                flash.message = "No se encontro la sucursal"
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

  @Secured(['ROLE_DOCENTE'])
  def sucursalesProfesor(){
    //OBTENER AL PROFESOR ONLINE
        Authentication auth = SecurityContextHolder.getContext().getAuthentication()
        String online=auth.getName()
        //Encontrar el usuario con ese nombre
        def usuario1 = Usuario.where{(username==online)}.find();
        //Encontrar el objeto profesor del usuario en linea
        def profe = Profesor.where{(usuario==usuario1)}.find();

        //Obtener todos los grupos de ese profesor
        def grupos = Grupo.where {(profesorDelGrupo==profe)}.findAll();
        [profe:profe,grupos:grupos]
  }
}
