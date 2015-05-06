<%@ page import="linksharingapplication.User" %>
<!DOCTYPE html>
<html>
<head>
    <title>Link Sharing</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="layout" content="dashboard">
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'bootstrap.min.css')}">
    <link rel="shortcut icon" href="${assetPath(src: 'link.png')}" type="image/x-icon">
    <asset:javascript src="application.js"/>
    <style>
    .multi-columns-row .col-xs-6 {
        margin-bottom: 30px;
    }
    </style>
</head>

<body>
<div class="container">

        <div class="col-md-12 col-lg-9 col-md-push-1">
    </div><br/><br/>

    <div class="row clearfix">
        <div class="col-md-6 col-lg-6">
            <div class="sharetweets clearfix">
                <div class="myHeading clearfix">
                    <h2>Recent Shares</h2>
                </div>
                <g:render template="resourceTemplate"
                          model="${[resourceList: data.recentResources]}"/>
            </div>
        </div>

        <div class="col-md-offset-2 col-md-4 col-lg-4">
            <g:form controller="login" action="login" class="form-signin2" name="userForm">
                <div class="myHeading clearfix">
                    <h2>Login</h2>
                </div>
                <br/>

                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                    <g:textField name="email" class="form-control" placeholder="Email address"/>
                </div>
                <br/>

                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                    <g:passwordField name="password" class="form-control" placeholder="Password"/>
                </div>

                <br/>
                <g:link title="Forgot Password" controller="login" action="index"
                        style="color: rgb(213, 162, 242)">Forgot Password</g:link>
                <br/>
                <g:submitButton name="login" class="btn btn-lg btn-primary btn-block"
                                style="background-color: rgb(213, 162, 242)"/>
            </g:form>

            <g:hasErrors bean="${registerCO}">
                <g:eachError><script>showError('${it}')</script></g:eachError>
            </g:hasErrors>
            <g:uploadForm enctype="multipart/form-data" controller="login"
                          action="register" class="form-signin3" name="registerForm">
                <div class="myHeading clearfix panel">
                    <h2>Register</h2>
                </div></br>
                <g:textField name="firstName" class="form-control" placeholder="First Name"/>
                <g:textField name="lastName" class="form-control" placeholder="Last Name"/>
                <g:textField name="email" class="form-control" placeholder="Email address"/>
                <g:textField name="username" class="form-control" placeholder="Username"/>
                <g:passwordField name="password" class="form-control" placeholder="Password"/>
                <g:passwordField name="confirmPassword" class="form-control" placeholder="Confirm Password"/>
                <input type="file" class="form-control" name="photo" class="form-control" placeholder="Photo"/>

                <br/>
                <g:submitButton name="Register" class="btn btn-lg btn-primary btn-block"
                                style="background-color: rgb(213, 162, 242)"/>
                </fieldset>
            </g:uploadForm>
        </div>
    </div>

</br>
    <div class="row clearfix">
        <div class="col-md-6 col-lg-6">
            <div class="sharetweets clearfix">
                <div class="myHeading clearfix">
                    <h2>Top posts</h2>
                </div></br>
                <g:render template="resourceTemplate"
                          model="${[resourceList: data.topResources]}"/>

            </div>
        </div>


    </div>

</div>
<script>
    $(document).ready(function () {


        $('#registerForm').validate({
            rules: {
                username: {

                    required: true
                },
                email: {
                    required: true,
                    email: true
                },
                firstName: {
                    required: true
                },
                lastName: {
                    required: true

                },
                password: {
                    required: true
                },
                confirmPassword: {
                    required: true


                }
            },
            messages: {
                username: {
                    required: "Please enter your user name."
                },
                password: {
                    required: "Please enter your password."

                },
                firstName: {
                    required: "Please enter your firstname."
                },
                lastName: {
                    required: "Please enter your last name."

                },
                email: {
                    required: "Please enter your email."
                },
                confirmPassword: {
                    required: "Please confirm your password."

                }
            }
        });

        $("#login").click(function () {
            $('#userForm').validate({
                rules: {
                    email: {
                        required: true,
                        email: true
                    },
                    password: {
                        required: true,
                        password: true

                    }

                },
                messages: {
                    email: {
                        required: "Please enter your email."
                    },
                    password: {
                        required: "Please enter your password."

                    }
                }
            });
        });
    })
</script>
<g:if test="${flash.message}">
    <script>showSuccess('${flash.message}')</script>
%{--  <g:message error="${flash.message}" class="error"/>--}%
</g:if>

%{--<g:if test="${registerCO && registerCO.errors}">
    <script>showError('${registerCO.errors}')</script>
--}%%{--  <g:message error="${flash.message}" class="error"/>--}%%{--

</g:if>--}%
</body>
</html>
