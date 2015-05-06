package co

import grails.validation.Validateable
import linksharingapplication.Topic
import linksharingapplication.User
import org.springframework.web.multipart.MultipartFile

/**
 * Created by intelligrape on 27/4/15.
 */
@Validateable
class ResourceCO {
    String title
    String description
    Topic topic
    MultipartFile file
    String filePath
    String fileType

    static constraints ={
        fileType nullable: true
        filePath nullable: true
    }
}
