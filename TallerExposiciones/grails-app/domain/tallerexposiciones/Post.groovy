
package tallerexposiciones

class Post {

    String topic
    Date dateCreated = new Date();
    Date lastUpdated;
    def comments
    int rate
    boolean itsAllowed
    static belongsTo = [author: Regular , forum: Forum]
    static hasMany = [files: File]
    static constraints = {
        files(nullable: true)
        forum(blank: false, nullable: false)
        author(blank: false, nullable:false)
        topic(blank:false, validator: { value, object->
            def myString = value.split("")
            if(myString.count {it == it}>=3 && myString.count{it == it} <=50 ) return true;
            return false;
        })
        dateCreated(blank:false, min: new Date()+1)
        lastUpdated(blank:false, min: new Date()+1)
        itsAllowed(blank:false)
        rate(min: 0)
    }

    static mapping = {
        author column: 'owner_id'
        forum column: 'fatherForum_id'

    }

/*    public void comment(){

    }

    public void rate(){

    }

    public void share(){

    } */
}