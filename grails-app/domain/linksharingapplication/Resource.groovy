package linksharingapplication

abstract class Resource {
    String title
    String description
    Date dateCreated
    Date lastUpdated
    User createdBy
    Topic topic
    List<ReadResources> readResources
    static belongsTo =[createdBy:User,topic:Topic]
    static hasMany = [readResources:ReadResources,resourceRatings:ResourceRating]
    static constraints = {
        description  size:5..1024,blank:false
        topic unique: 'title'
    }

    static mapping = {
        tablePerHierarchy false

            readResources cascade: "all-delete-orphan"
            resourceRatings cascade: "all-delete-orphan"

    }

    def afterInsert = {
        ReadResources readResources = new ReadResources(resource: this,user:this.createdBy,readFlg: true)
        addToReadResources(readResources)
    }

}
