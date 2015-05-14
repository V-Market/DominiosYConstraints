package tallerexposiciones

class File {

    String fileType
    byte[] content
    double size
    static belongsTo = [post: Post]
    static constraints = {
        post(nullable: false, blank: false)
        fileType(blank: false, matches: "[a-zA-Z]+"+"/"+"[a-zA-Z]+")
        content(blank:false,nullable: false)
        size(blank: false,max: (double)1000000.0)
    }

    static mapping = {
        post column: 'post_belongs_id'
    }
    def download(){

    }

    def share(){

    }
}