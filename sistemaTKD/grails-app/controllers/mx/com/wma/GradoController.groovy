package mx.com.wma

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class GradoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Grado.list(params), model:[gradoCount: Grado.count()]
    }

    def show(Grado grado) {
        respond grado
    }

    def create() {
        respond new Grado(params)
    }

    @Transactional
    def save(Grado grado) {
        if (grado == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (grado.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond grado.errors, view:'create'
            return
        }

        grado.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'grado.label', default: 'Grado'), grado.id])
                redirect grado
            }
            '*' { respond grado, [status: CREATED] }
        }
    }

    def edit(Grado grado) {
        respond grado
    }

    @Transactional
    def update(Grado grado) {
        if (grado == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (grado.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond grado.errors, view:'edit'
            return
        }

        grado.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'grado.label', default: 'Grado'), grado.id])
                redirect grado
            }
            '*'{ respond grado, [status: OK] }
        }
    }

    @Transactional
    def delete(Grado grado) {

        if (grado == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        grado.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'grado.label', default: 'Grado'), grado.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'grado.label', default: 'Grado'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
