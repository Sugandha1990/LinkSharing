package dto

import linksharingapplication.Resource
import linksharingapplication.Topic
import linksharingapplication.User

/**
 * Created by intelligrape on 24/4/15.
 */
class DashboardDTO {
    User user
    List<Topic> subscriptions
    List<Topic> trendings
    List<Resource> inbox
    Integer subscriptionCount = 0
    Integer topicCount = 0
    DashboardDTO(Map dashboardMap){
        this.user=dashboardMap.user
        this.inbox=dashboardMap.inbox
        this.trendings=dashboardMap.trendings
        this.subscriptions=dashboardMap.subscriptions
        this.subscriptionCount=dashboardMap.subscriptionCount
        this.topicCount=dashboardMap.topicCount
    }
}
