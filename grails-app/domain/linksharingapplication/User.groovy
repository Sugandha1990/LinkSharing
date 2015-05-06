package linksharingapplication

class User {

    String email
    String username
    String password
    String firstName
    String lastName
    byte[] photo
    boolean admin
    boolean active=true
    Date dateCreated
    Date lastUpdated
    String fullName
    Long subcriptionCount

    static transients = ['fullName','subcriptionCount']
    static hasMany = [topics:Topic]
  /*  static mapping = {
        photo type: "blob" // or "blob"?
    }*/
    static constraints ={
        username  unique: true,size:5..15,blank:false
        email email: true,unique: true,blank:false
        password  password:true,blank:false
        lastName nullable:true
        photo nullable:true,maxSize: 10*1024*1024


    }

/**
 *
 * @return Full Name
 */
    String getFullName(){
        return "${this.firstName} ${this.lastName}"
    }


}
