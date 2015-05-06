package linksharingapplication

class Subscription {

    Topic topic
    User user
    Date dateCreated
    enum SeriousnessValue {SERIOUS,VERY_SERIOUS,CASUAL}
    SeriousnessValue seriousness

    static belongsTo = [topic:Topic,user:User]
    static constraints = {
    topic unique: 'user'

    }
}
