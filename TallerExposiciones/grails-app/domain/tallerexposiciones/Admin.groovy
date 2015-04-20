package tallerexposiciones

class Admin extends User{
    static hasMany = [forums: Forum]

    int level
    double rating
    static constraints = {
        forums nullable: true
        level (blank:false, min: 1, max: 5)
        rating (blank:false, min: (double)0, max: (double) 100)
    }
}
