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
        age blank:false, nullable: false, min:14
        username blank:false, nullable: false
        password  minSize: 8 , blank: false, nullable: false, validator: {
            num = true
            myString = password.split()
            if (myString.count {it == it.toLowerCase()} < 1) num = false
            if (myString.count {it == it.toUpperCase()} < 1) num = false
            if (myString.count {isInteger(it)}<1) num = false
            if (!num) return false
        }
    }
}
