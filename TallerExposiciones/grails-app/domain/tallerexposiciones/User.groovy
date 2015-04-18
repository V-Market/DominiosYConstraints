package tallerexposiciones


class User {
    String name
    String lastname
    int age
    String username
    String password

    static constraints = {

        name ( validator: { value, object->
            def myString = value.split("")
            if(myString.count {it == it}>=3 && myString.count{it == it} <=50 ) return true;
            return false;
        })
        lastname (  validator: { value, object->
            def myString = value.split("")
            if(myString.count {it == it}>=3 && myString.count{it == it} <=50 ) return true;
            return false;
        })
        age (blank:false, nullable: false, min:14)
        username (blank:false, nullable: false, unique: true)
        password  (password: true, minSize: 8 , blank: false, nullable: false, validator: { value, object->
            boolean num = true
            def com
            def myString = value.split("")
            if (myString.count {
                com = it;
                it== com.toLowerCase()} < 1) num = false
            if (myString.count {
                com = it;
                it== com.toUpperCase()} < 1) num = false
            if (myString.count {it.isInteger()}<1) num = false
            return num
        })
    }
}
