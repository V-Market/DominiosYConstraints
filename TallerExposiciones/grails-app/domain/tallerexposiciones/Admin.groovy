package tallerexposiciones

class Admin extends User{
    int level
    double rating
    //static hasMany = [fo : Forum]

    static constraints = {
        level (blank:false, min: 1, max: 5)
        rating (blank:false, min: (double)0, max: (double) 100)
    }
}
