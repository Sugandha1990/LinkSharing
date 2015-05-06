package co

import grails.validation.Validateable
import linksharingapplication.Resource
import linksharingapplication.Subscription
import linksharingapplication.Topic
import linksharingapplication.User

/**
 * Created by intelligrape on 26/4/15.
 */
@Validateable
class TopicCO {
    String name
    Integer createdById
    enum VisibilityValue {PUBLIC,PRIVATE}
    VisibilityValue visibility
    Subscription.SeriousnessValue seriousness
    static constraints = {
        name size:5..15,blank:false,validator:{val,obj->
            User user = User.get(obj.createdById)
            if(!Topic.findByNameAndCreatedBy(val,user)){
                return true
            }
            else {
                return false
            }
        }
    }
}
