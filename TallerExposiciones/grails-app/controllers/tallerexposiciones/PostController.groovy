package tallerexposiciones


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PostController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def beforeInterceptor = {
        println "Se va a ejecutar la Acción: "+getActionName()
    }
    def afterInterceptor = {
        println "Se ha ejecutado la Acción: "+getActionName()
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Post.list(params), model: [postInstanceCount: Post.count()]
    }

    def show(Post postInstance) {
        respond postInstance
    }

    def create() {
        Post postN = new Post(params)
        postN.comments = []
        postN.dateCreated = new Date()+1
        respond postN
    }

    @Transactional
    def save(Post postInstance) {
        if (postInstance == null) {
            notFound()
            return
        }

        if (postInstance.hasErrors()) {
            respond postInstance.errors, view: 'create'
            return
        }

        postInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'post.label', default: 'Post'), postInstance.id])
                redirect postInstance
            }
            '*' { respond postInstance, [status: CREATED] }
        }
    }

    def edit(Post postInstance) {
        respond postInstance
    }

    @Transactional
    def update(Post postInstance) {
        if (postInstance == null) {
            notFound()
            return
        }

        if (postInstance.hasErrors()) {
            respond postInstance.errors, view: 'edit'
            return
        }

        postInstance.lastUpdated = new Date()+1

        postInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Post.label', default: 'Post'), postInstance.id])
                redirect postInstance
            }
            '*' { respond postInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Post postInstance) {

        if (postInstance == null) {
            notFound()
            return
        }

        postInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Post.label', default: 'Post'), postInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'post.label', default: 'Post'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    def postsUser(){
        params.userPostList = Post.findByAuthor(session.user)
        println params.userPostList
    }

    def share(){
        println("si entra")
        render "No se ha implementado esta funcionalidad"
    }

    def rate(Post postInstance){
        postInstance.rate = postInstance.rate + 1
        println(postInstance.rate+" forum: " + postInstance.forum.name + " " + postInstance.forum.category + " author"
                + postInstance.author.name + " "+postInstance.author.lastname)
        update(postInstance)
    }

    def comment(Post postInstance){
        println(params.commentContent)
        println(postInstance.rate+" forum: " + postInstance.forum.name + " " + postInstance.forum.category + " author"
                + postInstance.author.name + " "+postInstance.author.lastname)
        if(postInstance.comments.equals(null))
            postInstance.comments = []
        postInstance.comments.add(params.commentContent)
        update(postInstance)
    }
}