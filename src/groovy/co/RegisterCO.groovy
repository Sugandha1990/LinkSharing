package co

import grails.validation.Validateable
import linksharingapplication.User

/**
 * Created by intelligrape on 24/4/15.
 */
@Validateable
class RegisterCO {

    String email
    String username
    String password
    String firstName
    String lastName
    String confirmPassword
    byte[] photo

    static constraints ={
        username  size:5..15,blank:false,validator:{val,obj->
        if(User.findByUsername(val)){
            return false
        }
            else
            return true
        }
        email email: true,blank:false,validator:{val,obj->
            if(User.findByEmail(val)){
                return false
            }
            else
                return true
        }
        password  password:true,blank:false
        confirmPassword validator:{val,obj->
            if(val.equals(obj.password)){
                return true
            }
            else
                return false
        }
        lastName nullable:true
        photo nullable:true,maxSize: 10*1024*1024

    }
}
