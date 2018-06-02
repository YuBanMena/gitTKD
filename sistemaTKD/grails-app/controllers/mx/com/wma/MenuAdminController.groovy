package mx.com.wma

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.Authentication
import org.springframework.security.core.context.SecurityContextHolder
@Secured(['permitAll'])
@Transactional(readOnly = false)
class MenuAdminController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication()
        String online=auth.getName()
        //Encontrar el usuario con ese nombre
        def usuario = Usuario.where{(username==online)}.find();
        params.max = Math.min(max ?: 10, 100)
        respond MenuAdmin.list(params),
         model:[menuAdminCount: MenuAdmin.count(), user:usuario]
    }
     def index2(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MenuAdmin.list(params), model:[menuAdminCount: MenuAdmin.count()]
    }
     def index3(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MenuAdmin.list(params), model:[menuAdminCount: MenuAdmin.count()]
    }

    def show(MenuAdmin menuAdmin) {
        respond menuAdmin
    }

    def create() {
        respond new MenuAdmin(params)
    }

    @Transactional
    def save(MenuAdmin menuAdmin) {
        if (menuAdmin == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (menuAdmin.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond menuAdmin.errors, view:'create'
            return
        }

        menuAdmin.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'menuAdmin.label', default: 'MenuAdmin'), menuAdmin.id])
                redirect menuAdmin
            }
            '*' { respond menuAdmin, [status: CREATED] }
        }
    }

    def edit(MenuAdmin menuAdmin) {
        respond menuAdmin
    }

    @Transactional
    def update(MenuAdmin menuAdmin) {
        if (menuAdmin == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (menuAdmin.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond menuAdmin.errors, view:'edit'
            return
        }

        menuAdmin.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'menuAdmin.label', default: 'MenuAdmin'), menuAdmin.id])
                redirect menuAdmin
            }
            '*'{ respond menuAdmin, [status: OK] }
        }
    }

    @Transactional
    def delete(MenuAdmin menuAdmin) {

        if (menuAdmin == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        menuAdmin.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'menuAdmin.label', default: 'MenuAdmin'), menuAdmin.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'menuAdmin.label', default: 'MenuAdmin'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
