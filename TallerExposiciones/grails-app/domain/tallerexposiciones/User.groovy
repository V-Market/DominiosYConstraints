package tallerexposiciones


class User {
    String name
    String lastname
    int age
    String username
    String password


    static constraints = {

        name ( size: 3..50 )
        lastname (size: 3..50)
        age (blank:false, nullable: false, min:14)
        username (blank:false, nullable: false, unique: true)
        password  (password: true, minSize: 8 , blank: false, nullable: false, validator: {
            boolean num = true
            myString = password.split()
            if (myString.count {it == it.toLowerCase()} < 1) num = false
            if (myString.count {it == it.toUpperCaase()} < 1) num = false
            if (myString.count {isInteger(it)}<1) num = false
            return num
        })
    }
}
