<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 28/4/15
  Time: 11:16 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <asset:javascript src="application.js"/>
    <meta name="layout" content="dashboard">
    <link rel="stylesheet" type="text/css" href="${resource(dir:'css', file:'bootstrap.min.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir:'css', file:'dashboardcss.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir:'css', file:'popupcss.css')}">
    <style>
    .multi-columns-row .col-xs-6 {
        margin-bottom: 30px;
    }
    </style>
</head>

<body>
<div class="container">
<div class="row clearfix">
    <div class="col-md-5 col-lg-5">
        <article class="tweet user">
            <%  linksharingapplication.User  user = session.user
            %>
            <div class="row-fluid clearfix">
                <div class="col-md-3 col-lg-3 ">
            <div class="userImg">
                <img src="${createLink(controller: 'user', action:'displayLogo ', id:user?.id)}"/>
            </div>
                    </div>
            <div class="col-md-9 col-lg-9 ">
            <div class="userPost">
                <h2>${user.fullName} @${user.username}</h2>
                <p>Subscriptions           Topics</p>
                ${data.subscriptionCount}               ${data.topicCount}
            </div>
            </div>
            </div>
        </article>
        </div>
    <div class="col-md-offset-3 col-md-4 col-lg-4">
        <br/>
        <g:hasErrors bean="${profileCO}">
            <g:eachError><p ><g:message error="${it}" class="error"/></p></g:eachError>
        </g:hasErrors>
        <g:uploadForm enctype="multipart/form-data" controller="user" action="updateProfile" class="form-signin3"  name="profileForm">

            <div class="myHeading">
                <h2>Profile</h2>
            </div></br>
             <div class="form-group">
                <label style="border:none" class="form-control pull-left">First Name*</label>
                <g:textField name="firstName" class="form-control pull-right" value="${user.firstName}"/>

                <label style="border:none;" class="form-control pull-left">Last Name*</label>
                <g:textField  name="lastName" class="form-control pull-right"  value="${user.lastName}"/>

                <label style="border:none;" class="form-control pull-left">Username*</label>
                <g:textField name="username" class="form-control pull-right"  value="${user.username}"/>
                 <label style="border:none;" class="form-control pull-left">Photo</label>
            <input type="file" class="form-control" name="photo" class="form-control" placeholder="Photo"/>
             </div>
            <br/>
            <g:submitButton name="Update" class="btn btn-lg btn-primary btn-block" style="background-color: rgb(213, 162, 242)"/>
        </g:uploadForm>
        <br/>
        <g:hasErrors bean="${passwordCO}">
            <g:eachError><p ><g:message error="${it}" class="error"/></p></g:eachError>
        </g:hasErrors>
        <g:uploadForm controller="user" action="updatePassword" class="form-signin3"  name="passwordForm">

            <div class="myHeading">
                <h2>Change Password</h2>
            </div></br>
            <div class="form-group">
                <label style="border:none" class="form-control pull-left">Password*</label>
                <g:passwordField name="password" class="form-control pull-right" />

                <label style="border:none;" class="form-control pull-left">Confirm Password*</label>
                <g:passwordField  name="confirmPassword" class="form-control pull-right"/>

              </div>
            <br/>
            <g:submitButton name="Update" class="btn btn-lg btn-primary btn-block" style="background-color: rgb(213, 162, 242)"/>
        </g:uploadForm>
    </div>
</div>
    </div>
<script>
    $(document).ready(function(){


        $('#profileForm').validate({
            rules: {
                username: {

                    required: true
                },

                firstName: {
                    required: true
                },
                lastName: {
                    required: true

                }

            },
            messages:{
                username: {
                    required: "Please enter your user name."
                },
                firstName: {
                    required: "Please enter your firstname."
                },
                lastName: {
                    required: "Please enter your last name."

                }
            }
        });


        $('#passwordForm').validate({
            rules: {
                password: {

                    required: true
                },

                confirmPassword: {
                    required: true
                }

            },
            messages:{
                password: {
                    required: "Please enter your user name."
                },
                confirmPassword: {
                    required: "Please enter your firstname."
                }
            }
        });

    })
</script>
</body>
</html>