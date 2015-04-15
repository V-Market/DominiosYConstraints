package dominiosyconstrains

class Regular extends User{
    int postViews
    int strikesNumber
    int starsNumber

    static constraints = {
        postViews blank:false, min: 0
        strikesNumber blank:false, min:0, max:3
        starsNumber blank:false, min:0, max:5
    }
}
