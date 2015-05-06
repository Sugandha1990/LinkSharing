package linksharingapplication

import co.RegisterCO
import dto.HomeDTO

class LoginController {
    def  userService
    def  homeService
    def index() {
        HomeDTO homeDTO = homeService.home()
            println homeDTO.properties
            render view:'index', model:  [data:homeDTO]
    }
def login(){
    println params
        def u = User.findByEmailAndPassword(params.email, params.password)
        if(!u)
         u = User.findByUsernameAndPassword(params.email, params.password)
        if (u) {
            session.user = u
            println session.user
                      redirect(controller:'user',action:'dashboard')
        } else {
            flash.message = "User not found"
            redirect(controller:'login',action: 'index')
        }
}

    def register(RegisterCO registerCO) {

        println registerCO.properties

        if (!registerCO.hasErrors()) {
            User user =new User()
            user.properties = registerCO.properties
            if(user.photo==[]){
                File f = grailsAttributes.getApplicationContext()
                        .getResource("/images/dp.jpeg").getFile()
                user.photo = new FileInputStream(f).getBytes()
            }
            userService.saveUser(user,false)
            session.user =user
            redirect(controller:'user',action:'dashboard')
        } else {

            println "in errors"
            HomeDTO homeDTO = homeService.home()
            render (model: [registerCO:registerCO,data:homeDTO] ,view: 'index')
        }
    }

    def logout(){
        session.user=null
        redirect(controller:'login',action: 'index')
    }
 
}
