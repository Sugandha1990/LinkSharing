<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 29/4/15
  Time: 11:33 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <asset:javascript src="application.js"/>
    <g:javascript library="jquery" />
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
<g:javascript library="jquery" />
<div class="container">
    <div class="row clearfix">
    <div class="col-md-6 col-lg-6">
        <article class="tweet user">
            <%  linksharingapplication.User  user = data.user
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
        <div class="sharetweets subscriptions">
            <div class="myheading">
                <h2>Topics</h2>
            </div></br>
            <div name="repoList">
            <g:render template="/login/topicTemplate" model="${[topicList:data.subscriptions]}" />
            </div>
        <g:paginate action="subscriptionList" total="${data.subscriptionCount}" max="10" params="[top:true,data:data]"/>
        </div>
       %{-- <util:remotePaginate total="${data.subscriptionCount}" update="repoList" maxsteps="2" action="/topic/subcriptionList"/>--}%
    </div>
    <div class="col-md-6 col-lg-6">
        <div class="sharetweets" style="margin-top: 139px">
            <div class="myheading">
                <h2>Posts</h2>
            </div>
        </br>
            <div name="resList">
            <g:render template="/login/resourceTemplate" model="${[resourceList:data.inbox]}" />
            </div><g:paginate action="subscriptionList" total="${data.topicCount}" max="10" params="[res:true,data:data]" />
            </div>
        </div>
        </div>
    </div>
</body>
</html>