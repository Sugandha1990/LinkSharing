package linksharingapplication

class DocumentResource extends Resource {
    String fileType
    String filePath
    static constraints = {
        fileType blank:false
        filePath blank:false
    }
}
