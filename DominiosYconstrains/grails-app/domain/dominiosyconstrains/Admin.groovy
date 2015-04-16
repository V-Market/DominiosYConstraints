package dominiosyconstrains

class Admin extends User{
    int level
    double rating
    static hasMany = [fo = Forum]

    static constraints = {
        level blank:false, size: 1..5
        rating blank:false, size: 0..100
    }
}
