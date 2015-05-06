package co

import grails.validation.Validateable


/**
 * Created by intelligrape on 28/4/15.
 */
@Validateable
class PasswordCO {
    String password
    String confirmPassword
    static constraints ={

        password  password:true,blank:false
        confirmPassword validator:{val,obj->
            if(val.equals(obj.password)){
                return true
            }
            else
                return false
        }

    }
}
