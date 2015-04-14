package dominiosyconstrains

class User {
    String name
    String lastname
    int age
    String username
    String password

    static constraints = {
        name size: 3..50, blank: false, unique: true, nullable: false
        lastname size: 3..50,blank: false, nullable: false
        age blank:false, nullable: false
        username blank:false, nullable: false
        password  minSize: 8 , blank: false, nullable: false, validator: {
            if (!password.) return ['entryMissing']
        }
    }
}
