package tallerexposiciones



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RegularController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def beforeInterceptor = {
        println " - Se va a ejecutar la accion: ${actionName}"
        session.authStatus = 'logged'
    }
    def afterInterceptor = {
        println " - Se ha ejecutado la accion: ${actionName}"
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Regular.list(params), model:[regularInstanceCount: Regular.count()]
    }

    def show(Regular regularInstance) {
        respond regularInstance
    }

    def create() {

        respond new Regular(params)
    }

    @Transactional
    def save(Regular regularInstance) {
        regularInstance.password = regularInstance.password.encodeAsMD5();
        if (regularInstance == null) {
            notFound()
            return
        }

        if (regularInstance.hasErrors()) {
            respond regularInstance.errors, view:'create'
            println("\nERRORES EN REGULAR : ")
            println(regularInstance.errors)
            return
        }

        regularInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'regular.label', default: 'Regular'), regularInstance.id])
                redirect regularInstance
            }
            '*' { respond regularInstance, [status: CREATED] }
        }
    }

    def edit(Regular regularInstance) {
        respond regularInstance
    }

    @Transactional
    def update(Regular regularInstance) {
        if (regularInstance == null) {
            notFound()
            return
        }

        if (regularInstance.hasErrors()) {
            respond regularInstance.errors, view:'edit'
            println("\nERRORES EN REGULAR : ")
            println(regularInstance.errors)
            return
        }

        regularInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Regular.label', default: 'Regular'), regularInstance.id])
                redirect regularInstance
            }
            '*'{ respond regularInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Regular regularInstance) {

        if (regularInstance == null) {
            notFound()
            return
        }

        regularInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Regular.label', default: 'Regular'), regularInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'regular.label', default: 'Regular'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def showProfile(){

    }
}