package dominiosyconstrains

class Forum {

    String name
    Date dateCreated
    String category

    static constraints = {
        name(blank: false,size :3..20 )
        dateCreated(blank: false, min: new Date()+1)
        category(blank: false, size: 3..15)
    }
}
