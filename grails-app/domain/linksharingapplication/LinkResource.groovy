package linksharingapplication

class LinkResource extends Resource{
    String url

    static constraints = {
        url url:true, blank:false
    }
}
