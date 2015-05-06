package linksharingapplication


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ReadResourcesController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ReadResources.list(params), model: [readResourcesInstanceCount: ReadResources.count()]
    }

    def show(ReadResources readResourcesInstance) {
        respond readResourcesInstance
    }

    def create() {
        respond new ReadResources(params)
    }

    @Transactional
    def save(ReadResources readResourcesInstance) {
        if (readResourcesInstance == null) {
            notFound()
            return
        }

        if (readResourcesInstance.hasErrors()) {
            respond readResourcesInstance.errors, view: 'create'
            return
        }

        readResourcesInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'readResources.label', default: 'ReadResources'), readResourcesInstance.id])
                redirect readResourcesInstance
            }
            '*' { respond readResourcesInstance, [status: CREATED] }
        }
    }

    def edit(ReadResources readResourcesInstance) {
        respond readResourcesInstance
    }

    @Transactional
    def update(ReadResources readResourcesInstance) {
        if (readResourcesInstance == null) {
            notFound()
            return
        }

        if (readResourcesInstance.hasErrors()) {
            respond readResourcesInstance.errors, view: 'edit'
            return
        }

        readResourcesInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ReadResources.label', default: 'ReadResources'), readResourcesInstance.id])
                redirect readResourcesInstance
            }
            '*' { respond readResourcesInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ReadResources readResourcesInstance) {

        if (readResourcesInstance == null) {
            notFound()
            return
        }

        readResourcesInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ReadResources.label', default: 'ReadResources'), readResourcesInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'readResources.label', default: 'ReadResources'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
