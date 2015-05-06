package linksharingapplication

import co.ResourceCO
import co.TopicCO
import dto.DashboardDTO
import dto.TopicDTO
import org.apache.commons.io.IOUtils
import org.springframework.web.multipart.MultipartFile

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional
class TopicController {
    def asynchronousMailService
    def topicService
    def userService
    def resourceService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Topic.list(params), model: [topicInstanceCount: Topic.count()]
    }

    def createTopic(TopicCO topicCO) {
        println session
        println "::::::::::::::::::::" + topicCO.properties
        if (!topicCO.hasErrors()) {
            def obj = topicService.createTopic(topicCO)
            redirect(controller: 'user', action: 'dashboard', model: [Topic: obj], view: 'dashboard1')
        } else {
            println topicCO.errors
            render(action: 'dashboard', model: [topicCO: topicCO], view: 'dashboard1')
        }
    }

    def show() {
        Topic topic = Topic.load(params.id)
        println "topic params" + params
        println "topic:::" + topic.properties
        if (topic) {
            TopicDTO topicDTO = topicService.show(topic,session.user)
            println 'topicDTO:::'+topicDTO.properties
            render view: 'showTopic', model: [data: topicDTO]
        }
    }

    def unsubscribe() {
        topicService.unsubscribe(params.topic, params.user)
        flash.message = "You have unsubscribed Successfully !!! "
        redirect controller: 'user', action: 'dashboard'
    }

    def subscriptionList() {
        User user = session.user
        println "subscriptionList user ::::" + params
        DashboardDTO dashboardDTO = topicService.subsciptionList(user, params)
        println "dashboardDTO::::" + dashboardDTO.properties
        [data: dashboardDTO]
    }

    def deleteTopic() {
        println "params::::::::::" + params
        topicService.deleteTopic(params)
        flash.message = "Topic successfully deleted !!! "
        redirect controller: 'user', action: 'dashboard'
    }

    def updateTopic(TopicCO topicCO) {
        println "updateTopic:::::::" + topicCO.properties
        if(topicCO.hasErrors()){
            flash.message = topicCO.errors
            render(action: 'dashboard', model: [topicCO: topicCO], view: 'dashboard1')
        }
        else{
        topicService.editTopic(params, session.user)
        flash.message = "Topic successfully updated !!! "
        redirect controller: 'user', action: 'dashboard'
    }
    }

    def downloadFile() {
        InputStream contentStream
        try {
           DocumentResource resource = DocumentResource.findById(params.resId)
            File file = new File(resource.filePath)
            response.setHeader "Content-disposition", "attachment; filename=${resource.fileType}"
            response.setHeader("Content-Length", "file-size")
            response.setContentType("file-mime-type")
            contentStream = file.newInputStream()
            render file:contentStream,contentType: resource.fileType
          //  response.outputStream << contentStream
            webRequest.renderView = true
        }
        finally {
            IOUtils.closeQuietly(contentStream)
        }
    }

    def sendMail() {
        println "sendmail...."
        asynchronousMailService.sendMail {
            to "kumar.atul@intelligrape.com"
            subject "Test"
            body "Mail body111111111"
        }
    }

    def createLinkResource(LinkResource resource){
        resource.createdBy=session.user
        println "resource added: "+resource.properties
        resourceService.saveLinkResource(resource)
        redirect controller: 'user', action: 'dashboard'
    }


    def createDocResource(ResourceCO resourceCO) {
        println("resourceCO::::::::" + resourceCO.properties)
        println resourceCO.file.originalFilename
        if (!resourceCO.hasErrors()) {
        }
        if (resourceCO.file) {
            resourceCO.filePath = System.getProperty('user.home') + File.separator + 'Uploads' + File.separator + resourceCO.file.originalFilename
            resourceCO.file.transferTo(new File(resourceCO.filePath))


        resourceCO.fileType = resourceCO.file.originalFilename
        resourceService.saveDocResource(resourceCO,session.user)
    }
    else {
            flash.message = "error "+resourceCO.errors
    }
     //   params.id=resourceCO.topic
        println "prms:::"+params
        redirect controller: 'topic', action: 'show',params: [id:resourceCO.topic.id]
    }
        def markAsRead(){
            println params
            resourceService.markRead(params)
            flash.message = "Marked As Read Successfully !!! "
            redirect controller: 'user', action: 'dashboard'

        }

    def subscribe(){
        println params
        topicService.subscribe(params,session.user)

        flash.message = "You have subscribed Successfully !!! "
        redirect controller: 'user', action: 'dashboard'
    }

    def showPost(){
        DashboardDTO dashboardDTO = topicService.showPost(params)
        println "dashboardDTO::::" + dashboardDTO.properties
        [data: dashboardDTO]
    }
    /*def createTopic(){

    }


    def show(Topic topicInstance) {
        respond topicInstance
    }

    def create() {
        respond new Topic(params)
    }

    @Transactional
    def save(Topic topicInstance) {
        if (topicInstance == null) {
            notFound()
            return
        }

        if (topicInstance.hasErrors()) {
            respond topicInstance.errors, view: 'create'
            return
        }

        topicInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'topic.label', default: 'Topic'), topicInstance.id])
                redirect topicInstance
            }
            '*' { respond topicInstance, [status: CREATED] }
        }
    }

    def edit(Topic topicInstance) {
        respond topicInstance
    }

    @Transactional
    def update(Topic topicInstance) {
        if (topicInstance == null) {
            notFound()
            return
        }

        if (topicInstance.hasErrors()) {
            respond topicInstance.errors, view: 'edit'
            return
        }

        topicInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Topic.label', default: 'Topic'), topicInstance.id])
                redirect topicInstance
            }
            '*' { respond topicInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Topic topicInstance) {

        if (topicInstance == null) {
            notFound()
            return
        }

        topicInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Topic.label', default: 'Topic'), topicInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'topic.label', default: 'Topic'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }*/
}
