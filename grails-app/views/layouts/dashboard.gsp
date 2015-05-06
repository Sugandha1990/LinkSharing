<!DOCTYPE html>
<head>
    <title><g:layoutTitle default="Link Sharing"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="${assetPath(src: 'link.png')}" type="image/x-icon">
    <asset:javascript src="application.js"/>
    <link rel="stylesheet" type="text/css" href="${resource(dir:'css', file:'bootstrap.min.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir:'css', file:'dashboardcss.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir:'css', file:'popupcss.css')}">
    <style>
    .multi-columns-row .col-xs-6 {
        margin-bottom: 30px;
    }
    </style>
    <div style="background-color: rgb(213, 162, 242);margin-top: 10px">

        <div class="nav" role="navigation">

               <g:link controller="user" action="dashboard"><g:img dir="images" file="link.png" style="height: 38px;width: 38px;float: left"/>

        <h1 class="pull-left">Link Sharing</h1></g:link>

<g:if test="${session.user}">
            <div class="top-menu" style="background-color: rgb(213, 162, 242);">

                <ul class="nav navbar-nav pull-right">
                    <li class="dropdown dropdown-user dropdown-dark">  <div class="myMenu">
                        <g:render template="/layouts/menu"></g:render></div></li>
                    <li class="dropdown dropdown-user dropdown-dark" style="margin-top: -15px; height:38px;">
                        <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                           data-close-others="true" style="height: 79px">
                            <img  style="background-color: rgb(213, 162, 242);width:35px;height: 38px" alt="" class="img-circle"
                                 src="${createLink(controller: 'user', action: 'displayLogo', id: session.user.id)}">
                            <span class="username username-hide-mobile">${session.user.firstName}</span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-default">
                            <li>
                                <g:link controller="user" action="profile" id="${session.user.id}">
                                    <i class="icon-user"></i> My Profile</g:link>
                            </li>
                            <g:if test="${session.user.admin}">
                                <li>
                                    <a href="extra_profile.html">
                                        <i class="icon-bag"></i> Topics</a>
                                </li>

                                <li>
                                    <a href="extra_profile.html">
                                        <i class="icon-book-open"></i> Posts</a>
                                </li>

                                <li>
                                    <a href="extra_profile.html">
                                        <i class="icon-users"></i> Users</a>
                                </li>

                            </g:if>

                            <li class="divider">
                            </li>
                            <li>
                                <g:link controller="login" action="logout">
                                    <i class="icon-key"></i> Log Out</g:link>
                            </li>
                        </ul>
                    </li>
                    <!-- END USER LOGIN DROPDOWN -->
                </ul>

        </div>
    </div>
</g:if>
        </div>
    </div>
    <g:layoutHead/>
</head>
<body>
<div class="container">

    </div>
<g:layoutBody/>
</body>
</html>
