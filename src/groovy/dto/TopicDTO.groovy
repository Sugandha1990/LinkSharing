package dto

import linksharingapplication.Resource
import linksharingapplication.Topic
import linksharingapplication.User

/**
 * Created by intelligrape on 28/4/15.
 */
class TopicDTO {
    Topic topic
    List<User> users
    List<Resource> resources
   List<Topic> subscriptions
    TopicDTO(Map topicDTOMap){
        this.users=topicDTOMap.users
        this.topic=topicDTOMap.topic
        this.resources=topicDTOMap.resources
        this.subscriptions =topicDTOMap.subscriptions
    }
}
