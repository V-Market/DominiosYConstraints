package dominiosyconstrains

class Regular extends User{
    int postViews
    int strikesNumber
    int starsNumber
    static hasMany = [pos:Post]

    static constraints = {
        postViews blank:false, min: 0
        strikesNumber blank:false, min:0, max:3
        starsNumber blank:false, min:0, max:5
    }
    static mapping = {
        postViews DefaultValue = 0
    }
}
