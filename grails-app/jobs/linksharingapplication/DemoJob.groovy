package linksharingapplication



class DemoJob {
    static triggers = {
      simple repeatInterval: 5000l // execute job once in 5 seconds
    }

    def execute() {
        // execute job
        println("In Demo job")
    }
}
