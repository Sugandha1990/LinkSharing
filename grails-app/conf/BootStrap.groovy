import linksharingapplication.DocumentResource
import linksharingapplication.LinkResource
import linksharingapplication.ReadResources
import linksharingapplication.ResourceRating
import linksharingapplication.Subscription
import linksharingapplication.Topic
import linksharingapplication.User

class BootStrap {

    def init = { servletContext ->


        List<User> users = new ArrayList<User>();
        File f = new File("/home/intelligrape/Desktop/dp.jpeg")

        User user1 =new User(email: 'gandhi@gmail.com',firstName: 'Sugandha',lastName: 'Gandhi',password: 'g1234',username: 'sugandh',admin: true,photo:new FileInputStream(f).getBytes())
        User  user2 =new User(email: 'gandhisug90@gmail.com',firstName: 'Sugandha1',lastName: 'Gandhi1',password: 'g1234',username: 'gandhi',admin: false,photo:new FileInputStream(f).getBytes())
        users.add(user1)
        users.add(user2)

        List
        users.each {u ->
            u.save(failOnError: true)
            5.times { i->
            Topic t =    new Topic(createdBy: u, name: "Grails ${i}", visibility: Topic.VisibilityValue.PUBLIC)
                t.save(failOnError: true)
                5.times{j->
                    LinkResource lr = new LinkResource(title: "titleResource${j}",url:"http://www.google.com",topic: t,description: "The jQuery load() method is a simple, but powerful AJAX method.The load() method loads data from a server and puts the returned data into the selected element."
                            ,createdBy: u)
                    lr.title="titleResource${j}"
                    lr.save(failOnError: true)
                    ResourceRating resourceRating1 =  new ResourceRating(user:u,resource: lr,score:2)
                    resourceRating1.save(flush: true,failOnError: true)
                    lr.addToResourceRatings(resourceRating1)
                    lr.merge(flush:true)
                    t.addToResources(lr)

                }
                5.times{j->
                    DocumentResource dr = new DocumentResource(title: "titleDocResource${j}",filePath: "/type/path",fileType: "img", topic: t,description: "DocResource${j}"
                            ,createdBy: u)
                  dr.title="titleDocResource${j}"

                    dr.save(failOnError: true)
                    ResourceRating resourceRating =  new ResourceRating(user:u,resource: dr,score:3)
                    resourceRating.save(flush: true,failOnError: true)
                    dr.addToResourceRatings(resourceRating)
                    dr.merge(flush:true)
                    t.addToResources(dr)

                }
                u.addToTopics(t)
               // Subscription s = new Subscription(topic:t,user: u,seriousness: Subscription.SeriousnessValue.CASUAL)
                //s.save(failOnError: true)
            }
            u.save(failOnError: true)
        }


    }

    def destroy = {
    }
}
