package tallerexposiciones

class File {

    String fileType
    byte[] content
    double size
    static belongsTo = [post: Post]
    static constraints = {
        fileType(blank: false, matches: "[a-zA-Z]+"+"/"+"[a-zA-Z]+")
        content(blank:false,nullable: false)
        size(blank: false,max: (double)1000000.0)
    }

    def download(){

    }

    def share(){

    }
}