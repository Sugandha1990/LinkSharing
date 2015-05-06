package linksharingapplication

class Invitation {

    User sender
    String receiverEmail
    String token
    Date dateCreated

    static belongsTo = [sender:User]
    static constraints = {
        receiverEmail email: true,blank:false
        token blank: false

    }
}
