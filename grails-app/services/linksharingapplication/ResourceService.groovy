package linksharingapplication

import co.ResourceCO
import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap

@Transactional
class ResourceService {

    def serviceMethod() {

    }
    def saveLinkResource(LinkResource linkResource) {

        linkResource.validate()

        if (!linkResource.hasErrors()) {
            linkResource.save()
        }
        else{
            println linkResource.errors
        }
    }
    def saveDocResource(ResourceCO resourceCO,User user) {
        if (!resourceCO.hasErrors()) {
            Resource documentResource = new DocumentResource()
            documentResource.properties = resourceCO.properties
            documentResource.createdBy=user
            documentResource.validate()
            println "documentResource errors:::"+documentResource.errors
            documentResource.save(flush:true)
            println "idsss::::"+documentResource.properties
            Topic t = resourceCO.topic
            println "befre"+t.resources.size()
            t.addToResources(documentResource)
            t.merge(flush: true)
            println "after"+t.resources.size()
        }
        else{
            println resourceCO.errors
        }
    }

    def markRead(Map params) {
        Resource resource = Resource.load(params.resId)
        User user = User.load(params.uId)
        ReadResources readResources = ReadResources.findByUserAndResource(user,resource)
        if(!readResources){
            println "in If"
            readResources = new ReadResources(resource: resource,user:user,readFlg: true)
            readResources.save(flush: true)
            resource.addToReadResources(readResources)
            resource.merge()
            println "new Read resource"+readResources.properties
        }
        else {
            readResources.readFlg = true
            readResources.merge()
            println "Read resource"+readResources.properties
        }
    }
}
