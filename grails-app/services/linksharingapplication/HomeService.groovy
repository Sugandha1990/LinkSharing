package linksharingapplication

import grails.transaction.Transactional

@Transactional
class HomeService {

    def serviceMethod() {

    }

    Map home(){
        List<Resource> topResources = topResources()
        List<Resource> recentResources =recentResources()
        [topResources:topResources,recentResources:recentResources]
    }


    List<Resource> topResources(){
      /*  List<ResourceRating> rating = ResourceRating.createCriteria().list([max:5]){
            order('score','desc')
        }*/

        List list = ResourceRating.createCriteria().list {
            projections {
                groupProperty('resource')
                avg('score', 'avg')
                maxResults 5
                order('avg', 'desc')
            }
        }

        List<Resource> topResources =  []
        list?.each {
            topResources.add(it[0])
        }

        println "top res::"+topResources
        return topResources
    }


    List<Resource> recentResources(){
        List<Resource> resources = Resource.list([max: 5])
        println resources
        return resources
    }
}
