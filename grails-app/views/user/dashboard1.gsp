<%@ page import="linksharingapplication.User" %>
<%@ page import="co.TopicCO" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <asset:javascript src="application.js"/>
    <meta name="layout" content="dashboard">
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'bootstrap.min.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'dashboardcss.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'popupcss.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'bootstrap-dialog.css')}">
    <style>
    .multi-columns-row .col-xs-6 {
        margin-bottom: 30px;
    }
    </style>
</head>

<body>
<div class="container">

    <div class="popup-wrapper popup-class" id="popupError">
        <div class="popup-container">
            <g:message error="${flash.message}" class="error"/>
            <a class="popup-close" href="#closed">X</a>
        </div>
    </div>
<div class="row clearfix">
    <div class="col-md-6 col-lg-6">
        <article class="tweet user">
            <% linksharingapplication.User user = session.user
            %>
            <div class="row-fluid clearfix">
                <div class="col-md-3 col-lg-3 ">
            <div class="userImg" >
                <img src="${createLink(controller: 'user', action: 'displayLogo ', id: user?.id)}"/>
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
        <div class="row-fluid clearfix">
        <div class="sharetweets subscriptions">
            <div class="myheading">
                <h2>Subscriptions  <g:link style="float: right" controller="topic"
                                           action="subscriptionList">view all</g:link></h2>
            </div></br>
            <g:hasErrors bean="${topicCO}">
                <g:eachError><p><g:message error="${it}" class="error"/></p></g:eachError>
            </g:hasErrors>
            <g:render template="/login/topicTemplate" model="${[topicList: data.subscriptions,subscribe:true]}"/>
        </div>
</div>
        <div class="row-fluid clearfix">
        <div class="sharetweets subscriptions">
            <div class="myheading">
                <h2>Trending topics</h2>
            </div></br>
            <g:render template="/login/topicTemplate" model="${[topicList: data.trendings,subscribe:false]}"/>
        </div>
    </div>
</div>
    <div class="col-md-offset-1 col-md-5 col-lg-5">
        <div class="sharetweets">
            <div class="myheading">
                <h2>Inbox
                %{--                        <span class="input-group-addon "  style="float: right"><i class="glyphicon glyphicon-search"  style="float: right"></i></span>--}%
                    <input type="text" class="form-control" id="inputSuccess2" placeholder="Search"
                           style="height: 22px;width: 154px;float: right"/>

                </h2>
            </div>
        </br>
            <div id="repoList">
                <g:render template="/login/resourceTemplate" model="${[resourceList: data.inbox]}"/>
                %{-- <g:render template="resourcePage"/>--}%
            </div>
        </div>


    </div>
    </div>
    <div class="popup-wrapper popup-class" id="popup">
        <div class="popup-container"><!-- Popup Contents, just modify with your own -->
            <g:form controller="topic" action="createTopic" class="form-signin2popup" name="userForm">
                <div class="myHeading2">
                    <h2>Create Topic</h2>
                </div>
                <br/>
                <g:textField name="name" class="form-control" placeholder="Topic Name"/>
                <br/> <g:select name="seriousness" class="form-control"
                                from="${linksharingapplication.Subscription.SeriousnessValue}"/>
                <br/><g:select name="visibility" class="form-control"
                               from="${linksharingapplication.Topic.VisibilityValue}"/>
                <g:hiddenField name="createdById" value="${session.user.id}"/>
                <br/>
                <g:submitButton name="save" class="btn btn-lg btn-primary btn-block"
                                style="background-color: rgb(213, 162, 242)"/>
                <button name="Cancel" class="btn btn-lg btn-primary btn-block" value="Cancel"
                        style="background-color: rgb(213, 162, 242)">Cancel</button>
            </g:form>
        <!-- Popup Content is untill here--><a class="popup-close" href="#closed">X</a>
        </div>
    </div>
    <br/>

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
    <br/>

    <div class="popup-wrapper popup-class" id="popup3">
        <div class="popup-container">
            <g:uploadForm enctype="multipart/form-data" controller="topic" action="createDocResource"
                          class="form-signin2" name="userForm">
                <div class="myHeading2">
                    <h2>Share Document</h2>
                </div>
                <br/>
                <input type="file" class="form-control" name="file" class="form-control" placeholder="Document"/>
                </br>
                <g:textArea name="title" class="form-control" placeholder="Title*"/>
                </br>
                <g:textArea name="description" class="form-control" placeholder="Description*"/>
                </br>
                <g:select name="topic" from="${data.subscriptions}" optionKey="id" optionValue="name"
                          title="Select a Topic" class="form-control"/>
                </br>
                <g:submitButton name="Share" class="btn btn-lg btn-primary btn-block" type="submit"
                                style="background-color: rgb(213, 162, 242)">Share</g:submitButton>
                <button name="Cancel" class="btn btn-lg btn-primary btn-block" value="Cancel"
                        style="background-color: rgb(213, 162, 242)">Cancel</button>
            </g:uploadForm>
            <a class="popup-close" href="#">X</a>
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
                <g:textArea name="title" class="form-control" placeholder="Title*"/>
                </br>
                <g:textField name="url" class="form-control" placeholder="Link*"/>
                </br>
                <g:textArea name="description" class="form-control" placeholder="Description*"/>
                </br>
                <g:select name="topic" from="${data.subscriptions}" value="${data.subscriptions}" optionKey="id"
                          optionValue="name" title="Select a Topic" class="form-control"/>
                </br>
                <g:submitButton name="Share" class="btn btn-lg btn-primary btn-block" type="submit"
                                style="background-color: rgb(213, 162, 242)">Share</g:submitButton>
                <button name="Cancel" class="btn btn-lg btn-primary btn-block" value="Cancel"
                        style="background-color: rgb(213, 162, 242)">Cancel</button>
            </g:form>
            <a class="popup-close" href="#closed">X</a>
        </div>
    </div>
    </div>
</div>

<script type="text/javascript">

</script>
<g:if test="${flash.message}">
    <script>showSuccess('${flash.message}')</script>

</g:if>

</body>
</html>
