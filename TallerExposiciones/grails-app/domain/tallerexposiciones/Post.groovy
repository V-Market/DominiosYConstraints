package tallerexposiciones

class Post {

    String topic
    Date dateCreated
    Date lastUpdated
    boolean itsAllowed

    static constraints = {
        topic(blank:false, size: 3..50)
        dateCreated(blank:false, min: new Date()+1)
        lastUpdated(blank:false, min: new Date()+1)
        itsAllowed(blank:false)

    }

    public void comment(){

    }

    public void rate(){

    }

    public void share(){

    }
}