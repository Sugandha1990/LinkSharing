package linksharingapplication

class ResourceRating {
    Resource resource
    User user
    Integer score=0

    static belongsTo = [resource:Resource,user:User]
    static constraints = {
        score max:5, min: 0
    }
}
