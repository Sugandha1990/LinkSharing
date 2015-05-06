package linksharingapplication

import co.PasswordCO
import co.ProfileCO
import co.RegisterCO
import co.ResourceCO
import co.TopicCO
import dto.DashboardDTO
import org.springframework.web.multipart.MultipartFile

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

//@Transactional(readOnly = true)
class UserController {
    def userService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model: [userInstanceCount: User.count()]
    }


    def displayLogo() {
        def user = User.get(params.id)
        response.contentType = "image/png"
        response.contentLength = user?.photo.length
        response.outputStream.write(user?.photo)
        response.outputStream.flush()
    }

    def dashboard() {
        User user = session.user
        println "In dashboard ${System.currentTimeMillis()}"
        if (user) {

        DashboardDTO dashboardDTO = userService.dashboard(user)

        render view: 'dashboard1', model: [data: dashboardDTO]
    }
    else{
        redirect controller: 'login', action: 'index'
    }
    }

    def dashboardResource() {
        User user = session.user
        if (user) {



            render view: 'dashboard1', model: [data: userService.inbox(user)]
        }
        else{
            redirect controller: 'login', action: 'index'
        }
    }
    def publicProfile() {
        println "userId::"+params.userId
        User user = User.findById(params.userId)
        println "user:::::::::"+user.properties
        if (user) {

            DashboardDTO dashboardDTO = userService.dashboard(user)
            println "dash:::::::::"+dashboardDTO.properties
            render view: 'publicProfile', model: [data: dashboardDTO]
        }

    }
    def profile(){
        User user = session.user
        if (user) {

            DashboardDTO dashboardDTO = userService.dashboard(user)

            render view: 'profile', model: [data: dashboardDTO]
        }
        else{
            redirect controller: 'login', action: 'index'
        }
    }

    def updateProfile(ProfileCO profileCO){
        println "profileCO++++++"+profileCO.properties
        println params
        if (!profileCO.hasErrors()) {
            println "inside if statement"
            User user = session.user as User
            user.properties =profileCO.properties
            userService.saveUser(user,true)
            session.user =user
            redirect(controller:'user',action:'profile')
        } else {
            DashboardDTO dashboardDTO = userService.dashboard(session.user)

            render (view: 'profile',model: [profileCO:profileCO,data:dashboardDTO])
        }
    }


    def updatePassword(PasswordCO passwordCO){
        println "passwordCO++++++"+passwordCO.properties
        println params
        if (!passwordCO.hasErrors()) {
            User user = session.user
            user.properties =passwordCO.properties
            userService.saveUser(user,true)
            session.user =user
            redirect(controller:'user',action:'profile')
        } else {
            DashboardDTO dashboardDTO = userService.dashboard(session.user)
            render (view: 'profile',model: [passwordCO:passwordCO,data:dashboardDTO])
        }
    }


/*
    def show(User userInstance) {
        respond userInstance
    }

    def create() {
        respond new User(params)
    }

    @Transactional
    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'create'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }

    def edit(User userInstance) {
        respond userInstance
    }

    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'edit'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*'{ respond userInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }


    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }


*/








}
