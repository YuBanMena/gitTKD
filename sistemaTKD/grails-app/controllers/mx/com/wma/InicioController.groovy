package mx.com.wma

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
@Secured(['ROLE_ADMIN','ROLE_DOCENTE','ROLE_ALUMNO','ROLE_EVALUADOR'])
@Transactional(readOnly = false)
class InicioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Inicio.list(params), model:[inicioCount: Inicio.count()]
    }

    def show(Inicio inicio) {
        respond inicio
    }

    def create() {
        respond new Inicio(params)
    }

    @Transactional
    def save(Inicio inicio) {
        if (inicio == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (inicio.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond inicio.errors, view:'create'
            return
        }

        inicio.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'inicio.label', default: 'Inicio'), inicio.id])
                redirect inicio
            }
            '*' { respond inicio, [status: CREATED] }
        }
    }

    def edit(Inicio inicio) {
        respond inicio
    }

    @Transactional
    def update(Inicio inicio) {
        if (inicio == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (inicio.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond inicio.errors, view:'edit'
            return
        }

        inicio.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'inicio.label', default: 'Inicio'), inicio.id])
                redirect inicio
            }
            '*'{ respond inicio, [status: OK] }
        }
    }

    @Transactional
    def delete(Inicio inicio) {

        if (inicio == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        inicio.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'inicio.label', default: 'Inicio'), inicio.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'inicio.label', default: 'Inicio'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
