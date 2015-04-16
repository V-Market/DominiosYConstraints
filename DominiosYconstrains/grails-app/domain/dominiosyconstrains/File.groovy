package dominiosyconstrains

class File {

    String fileType
    Byte[] content
    double size

    static constraints = {
        fileType(blank: false, matches: "[a-zA-Z]+"+"/"+"[a-zA-Z]+")
        content(blank:false,nullable: false)
        size(blank: false,max: 1000000)
    }

    def download(){

    }

    def share(){

    }
}
