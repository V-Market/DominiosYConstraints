package tallerexposiciones

class Forum {
    static belongsTo = [admin: Admin]
    static hasMany = [posts: Post]

    String name
    Date dateCreated
    String category

    static constraints = {
        posts nullable: true
        name(blank: false, validator: { value, object->
            def myString = value.split("")
            if(myString.count {it == it}>=3 && myString.count{it == it} <=20 ) return true;
            return false;
        })
        dateCreated(blank: false, min: new Date()+1)
        category(blank: false, validator: { value, object->
            def myString = value.split("")
            if(myString.count {it == it}>=3 && myString.count{it == it} <=15 ) return true;
            return false;
        })
    }
}

