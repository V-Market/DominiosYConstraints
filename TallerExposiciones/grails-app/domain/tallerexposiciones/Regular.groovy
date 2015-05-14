package tallerexposiciones

class Regular extends User{
    int postViews
    int strikesNumber
    int starsNumber
    static hasMany = [posts:Post]

    static constraints = {
        posts(nullable: true)
        postViews(blank:false, min: 0)
        strikesNumber(blank:false, min:0, max:3)
        starsNumber(blank:false, min:0, max:5)
    }
}
