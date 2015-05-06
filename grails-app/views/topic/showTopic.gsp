
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
        <div class="sharetweets subscriptions">
            <div class="myheading" >
                <h2>Topic:${data.topic.name}</h2>
            </div></br>
            <g:render template="/login/topicTemplate" model="${[topicList:data.topic]}" />
        </div>
        <br/>
        <div class="sharetweets subscriptions">
            <div class="myheading">
                <h2>Users:${data.topic.name}</h2>
            </div></br>
            <g:render template="/login/userTemplate" model="${[userList:data.users]}" />
        </div>
        </div>
    <div class="col-md-offset-1 col-md-6 col-lg-6">
        <div class="sharetweets">
            <div class="myheading">
                <h2>Posts:${data.topic.name}</h2>
            </div>
     <br/>
            <g:render template="/login/resourceTemplate" model="${[resourceList: data.resources]}" />
        </div>
    </div>
        </div>
    <div class="popup-wrapper popup-class" id="popup3">
        <div class="popup-container">
            <g:uploadForm enctype="multipart/form-data" controller="topic" action="createDocResource" class="form-signin2" name="userForm">
                <div class="myHeading2">
                    <h2>Share Document</h2>
                </div>
                <br/>
                <input type="file" class="form-control" name="file" class="form-control" placeholder="Document"/>
                </br>
                <g:textArea name="title" class="form-control"  placeholder="Title*"/>
                </br>
                <g:textArea name="description" class="form-control" placeholder="Description*"/>
                </br>
                <g:select name="topic" from="${data.subscriptions}" optionKey="id" optionValue="name"  title="Select a Topic" class="form-control"/>
                </br>
                <g:submitButton name="Share" class="btn btn-lg btn-primary btn-block" type="submit" style="background-color: rgb(213, 162, 242)">Share</g:submitButton>
                <button name="Cancel" class="btn btn-lg btn-primary btn-block"  value="Cancel"  style="background-color: rgb(213, 162, 242)">Cancel</button>
            </g:uploadForm>
            <a class="popup-close" href="#closed">X</a>
        </div>
    </div>
    <br/>
    <div class="popup-wrapper popup-class" id="popup4">
        <div class="popup-container">
            <g:form controller="topic" action="createLinkResource" class="form-signin2" name="userForm">
                <div class="myHeading2">
                    <h2>Share Link</h2>
                </div>
                <br/>
                <g:textArea name="title" class="form-control"  placeholder="Title*"/>
                </br>
                <g:textField name="url" class="form-control" placeholder="Link*"/>
                </br>
                <g:textArea name="description" class="form-control"  placeholder="Description*"/>
                </br>
                <g:select name="topic" from="${data.subscriptions}" value="${data.subscriptions}" optionKey="id" optionValue="name" title="Select a Topic" class="form-control"/>
                </br>
                <g:submitButton name="Share" class="btn btn-lg btn-primary btn-block" type="submit" style="background-color: rgb(213, 162, 242)">Share</g:submitButton>
                <button name="Cancel" class="btn btn-lg btn-primary btn-block"  value="Cancel"  style="background-color: rgb(213, 162, 242)">Cancel</button>
            </g:form>
            <a class="popup-close" href="#closed">X</a>
        </div>
    </div>
    <div class="popup-wrapper popup-class" id="popup2">
        <div class="popup-container">
            <g:form controller="topic" action="sendMail" class="form-signin2" name="userForm">
                <div class="myHeading2">
                    <h2>Share Invitation</h2>
                </div>
                <br/>
                <input type="email" id="inputEmail" class="form-control" placeholder="Name" required=""
                       autofocus="">
                </br>
                <g:select name="topic" from="${data.subscriptions.name}" title="Select a Topic"
                          class="form-control"/>
                <br/>
                <g:submitButton name="Invite" class="btn btn-lg btn-primary btn-block" type="submit"
                                style="background-color: rgb(213, 162, 242)">Share</g:submitButton>
                <button name="Cancel" class="btn btn-lg btn-primary btn-block" value="Cancel"
                        style="background-color: rgb(213, 162, 242)">Cancel</button>
            </g:form>
            <a class="popup-close" href="#closed">X</a>
        </div>
    </div>
    </div>


</body>
</html>