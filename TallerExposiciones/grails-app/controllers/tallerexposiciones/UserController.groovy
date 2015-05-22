package tallerexposiciones



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def beforeInterceptor = {
        println " - Se va a ejecutar la accion: ${actionName}"
        session.setAttribute("authStatus","logged")
    }
    def afterInterceptor = {
        println " - Se ha ejecutado la accion: ${actionName}"
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userInstanceCount: User.count()]
    }


    def show(User userInstance) {
        respond userInstance
    }

    def create() {
        respond new User(params)
    }

    @Transactional
    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'create'
            println("\nERRORES EN USER : ")
            println(userInstance.errors)
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }

    def edit(User userInstance) {
        respond userInstance
    }

    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'edit'
            println("\nERRORES EN USER : ")
            println(userInstance.errors)
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*'{ respond userInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def login(){}
    def authUserIndex(){}

    def doLogin(){
        if(request.method=="POST") {
            def user = User.findByUsernameAndPassword(params.username,params.password)
            println user
            if (user) {
                session.setAttribute("authStatus","logged")
                session.user = user
                flash.message = "Hello, ${params.username}."
                params.flashMessage = flash.message
            } else {
                session.setAttribute("authStatus","loggedOut")
                flash.message = "Sorry, ${params.username}. Please try again"
                params.flashMessage = flash.message
            }
            redirect(uri:'/')
        }
    }

    def logOut(){
        println "Logged out"
        session.setAttribute("authStatus","loggedOut")
        session.user = null
        flash.message = "Has cerrado sesion."
        params.flashMessage = flash.message
        redirect(uri:'/')
    }
}