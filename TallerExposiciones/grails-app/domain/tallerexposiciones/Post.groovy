package tallerexposiciones

class Post {

    String topic
    Date dateCreated
    Date lastUpdated
    boolean itsAllowed
   // Regular author
    static belongsTo = [author: Regular ]

    static constraints = {
        topic(blank:false, validator: { value, object->
            def myString = value.split("")
            if(myString.count {it == it}>=3 && myString.count{it == it} <=50 ) return true;
            return false;
        })
        //dateCreated(blank:false, min: new Date()+1)
        //lastUpdated(blank:false, min: new Date()+1)
        itsAllowed(blank:false)

    }

    public void comment(){

    }

    public void rate(){

    }

    public void share(){

    }
}