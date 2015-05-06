package linksharingapplication

import co.TopicCO
import grails.transaction.Transactional

@Transactional
class TopicService {
    def userService
    def serviceMethod() {

    }

    def createTopic(TopicCO topic) {


            Topic top = new Topic()

            //        top.properties = topic.properties
            top.name =topic.name
            top.createdBy=User.get(topic.createdById)
            if(topic.visibility.toString().equals(Topic.VisibilityValue.PUBLIC.toString()))
                top.visibility = Topic.VisibilityValue.PUBLIC
            else
                top.visibility = Topic.VisibilityValue.PRIVATE
            top.validate()
            println top.errors
            top.save(flush: true)
            println "final topic:::::"+top.properties
            return top


    }

    Map show(Topic topic,User user){
        List<User> users = users(topic)
        List<Topic> subscriptions = []
        if(user)
        subscriptions = userService.subscriptions(user)
        List<Resource> resources=resources(topic)
        [topic:topic,users:users,resources:resources,subscriptions:subscriptions]
    }


    List<User> users(Topic topic){
        List<Subscription> list = Subscription.createCriteria().list{
            projections {
                groupProperty('user')
                eq('topic',topic)
                count('id', 'count')
                maxResults 5
                order('count', 'desc')
            }


        }


        List<User> users = []
        list?.each {
            User u = (it[0] as User)
            u.setSubcriptionCount(it[1])
            users.add(u)
        }

        println "users List "+users
        return users
    }

    List<Resource> resources(Topic topic){
        println "Topic::::::"+topic.properties
        List<Resource> resourceList = []
        if(topic.resources==null || topic.resources!=[])
            resourceList= topic.resources as List
        return  resourceList
    }

    def unsubscribe(String topic, String user) {
        Topic t = Topic.load(topic)
        User u = User.load(user)
        Subscription subscription = Subscription.findByTopicAndUser(t,u)
        List<Resource> resources = Resource.findAllByTopic(t)
        resources.each {Resource r ->
         ReadResources.findByUserAndResource(u,r).delete(flush:true)
        }
        subscription.delete(flush: true)

    }


    def subscribe(Map params, User user) {
        Topic t = Topic.load(params.topic)
        Subscription.SeriousnessValue seriousnessValue = Subscription.SeriousnessValue.CASUAL

        Subscription subscription = new Subscription(user:user,topic: t,seriousness:seriousnessValue )
        subscription.save(flush: true)
          t.resources.each {
           ReadResources readResources = new ReadResources(resource: it,user:user,readFlg: false)
            readResources.save(flush: true)
            it.addToReadResources(readResources)
            it.merge()
            println "new Read resource"+readResources.properties
        }

    }

    Map subsciptionList(User user,Map params){
        if(!params.offset)
            params.offset=0
        if(!params.max)
            params.max=5
        List<Topic>  topics = []
        /*if(params.top || !params.data)*/
            topics = subscriptions(user,params)
           /* else
            topics = params.data.subscriptions*/
        List<Topic> trendings =[]
        List<Resource> resources = []
        Integer topicCount = 0
        if(topics!=[]) {
     topicCount = Resource.findAllByTopicInList(topics).size()

    if (topics != [])
        resources = resourcesList(topics, params)
}
       /* else
            resources= params.data.inbox*/
        Integer subscriptionCount = Subscription.findAllByUser(user).size()
        println "topicCount---------------"+topicCount
        [user:user,subscriptions:topics,trendings:trendings,inbox:resources,topicCount:topicCount,subscriptionCount:subscriptionCount]
    }


    List<Topic> subscriptions(User user,Map params){
        List<Subscription> subscriptions = Subscription.createCriteria().list(max:5){
            eq('user',user)
            order('dateCreated','desc')
        }
        println "subscriptions:::::"+subscriptions.topic
        return subscriptions.topic
    }

    List<Resource> resourcesList(List<Topic> topics,Map params){
        List<Resource> resources = Resource.createCriteria().list(params){
           inList('topic',topics)

        }
        println "resources:::::"+resources.size()
        return resources
    }

    def deleteTopic(Map params){
        println params
        Topic t = Topic.load(params.topic)
        t.delete(flush:true)
    }


    def editTopic(Map params,User user){
        Topic t = Topic.load(params.id)
        t.name = params.name
        t.visibility = params.visibility
        t.validate()
        if(!t.hasErrors())
        t.merge()

        Subscription s =  Subscription.findByTopicAndUser(t,user)
        if(s){
            s.seriousness = params.seriousness
            s.validate()
            if(!s.hasErrors())
            s.merge()
        }
    }


    def showPost(Map params) {
        Resource resource = Resource.load(params.resId)
        Integer sumRating = 0
        if (resource.resourceRatings) {
         sumRating = resource.resourceRatings.score.sum() / resource.resourceRatings.size()
        println "sumRating" + sumRating
    }
        [inbox: resource as List,trendings: userService.trendings(),topicCount:sumRating]
    }
}
