package tallerexposiciones

class Forum {
    static belongsTo = [admin: Admin]
    static hasMany = [posts: Post]
    static searchable = true

    String name
    Date dateCreated = new Date();
    String category

    static constraints = {
        posts(nullable: true)
        admin(nullable: false, blank:false)
        name(blank: false, unique: true, validator: { value, object->
            def myString = value.split("")
            if(myString.count {it == it}>=3 && myString.count{it == it} <=20 ) return true;
            return false;
        })
        dateCreated(blank: false, nullable: false);
        category(blank: false, validator: { value, object->
            def myString = value.split("")
            if(myString.count {it == it}>=3 && myString.count{it == it} <=15 ) return true;
            return false;
        })
    }

    String toString() {
        return this.name;
    }
}

