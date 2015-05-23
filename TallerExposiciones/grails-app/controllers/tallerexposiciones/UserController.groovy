package tallerexposiciones



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController {

    static defaultAction = "indexGrails"
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def beforeInterceptor = {
        println " - Se va a ejecutar la accion: ${actionName}"
        session.setAttribute("authStatus","logged")
    }
    def afterInterceptor = {
        println " - Se ha ejecutado la accion: ${actionName}"
    }

    def indexGrails(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userInstanceCount: User.count()]
    }


    def show(User userInstance) {
        respond userInstance
    }

    def create() {
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

    def index(){

        def posts = Post.findAll()
        posts.sort(new Comparator<Post>() {
            @Override
            int compare(Post o1, Post o2) {
                return o1.dateCreated.compareTo(o2.dateCreated)
            }
        });
        def size = posts.size()
        if(size<=10)
            params.recentPost = posts.subList(0,size)
        else
            params.recentPost = posts.subList(0,10)

        def forums = Forum.findAll()
        forums.sort(new Comparator<Forum>() {
            @Override
            int compare(Forum o1, Forum o2) {
                return o1.posts.size().compareTo(o2.posts.size())
            }
        })

        size = forums.size()
        if(size<=10)
            params.popularForums = forums.subList(0,size)
        else
            params.popularForums = forums.subList(0,10)
    }
}