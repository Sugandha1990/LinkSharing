package linksharingapplication

class AppMailController {
def asynchronousMailService
    def index() {

        println "index.."
    }

    def sendMail()
    {

        println "sendmail...."
        asynchronousMailService.sendMail{
            // Mail parameters
            to "sugandha.gandhi@intelligrape.com"
            subject "Test"
            body "Mail body111111111"

        }


    }
}
