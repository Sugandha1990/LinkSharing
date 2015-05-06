<%@ page import="linksharingapplication.DocumentResource" %>


<g:each in="${resourceList}" var="res" status="i">
    <% String clr = 'rgba(213, 162, 242, 0.19)'
    if (i % 2 == 0)
        clr = 'rgba(134, 114, 145, 0.2)'
    %>


    <article class="tweet" style="background-color: ${clr}">
<div class="row-fluid clearfix">
    <div class="col-md-3 col-lg-3 ">
        <div class="userImg">
            <g:link controller="user" action="publicProfile" params="[userId: res.createdBy.id]">
                <img class="tweetImg"
                     src="${createLink(controller: 'user', action: 'displayLogo ', id: res.createdBy?.id)}"/></g:link>
        </div>
    </div>
    <div class="col-md-9 col-lg-9 ">
        <div class="userPost">
            <div class="row">
                <div class="col-md-8 col-lg-8 ">
                    <div class="row pull-left">
                        <h2>${res.createdBy.fullName}</h2>
                    </div>
                </div>
                <div class="col-md-4 col-lg-4 ">
                    <div class="row pull-right"><h2>
                        <g:link action="show" controller="topic"
                                id="${res.topic.id}">${fieldValue(bean: res.topic, field: "name")}</g:link></h2>
                    </div>
                </div>
            </div>

            <div class="row">
                @${res.createdBy.username}
            </div>
            <g:if test="${params.action.equals('showPost')}">
                <div class="row">
                    <p>${res.dateCreated}</p>
                </div>

                <div class="row">
                    <div id="myRating" class="col-md-6 col-lg-6">
                    </div>
                </div>
                <script>
                    $('#myRating').raty({
                        score: ${rating},
                        starOff: "${resource(dir: 'images',file: '0220-heart-broken.png')}",
                        starOn: "${resource(dir: 'images',file: '0219-heart.png')}"
                    });
                </script>
            </g:if>
            <div class="row">

                <g:if test="${res.description.size() > 115 && !params.action.equals('showPost')}">
                    <p>${res.description.substring(0, 115)}</p>
                </g:if>
                <g:else>
                    <p>${res.description}.</p>
                </g:else>
            </div>
            <div class="row clearfix" style="font-size: 10px">
                <g:if test="${session.user && res.createdBy.id.equals(session.user.id)}">
                    <div class="col-md-3 col-lg-3">
                        <g:link controller="topic" action=""
                                params="[resId: res.id]">Edit</g:link>
                    </div>

                    <div class="col-md-3 col-lg-3">
                        <g:link controller="topic" action=""
                                params="[resId: res.id]">Delete</g:link>
                    </div>
                </g:if>
                <div class="col-md-3 col-lg-3">
                    <g:if test="${res.instanceOf(linksharingapplication.DocumentResource)}">
                        <g:link controller="topic" action="downloadFile" params="[resId: res.id]">Download</g:link>
                    </g:if>
                    <g:else>
                        <a href="${res.url}">View Full Site</a>
                    </g:else>
                </div>

                <div class="col-md-3 col-lg-3 ">
                    <g:link controller="topic" action="markAsRead"
                            params="[uId: res.createdBy.id, resId: res.id]">Mark As Read</g:link>
                </div>

                <div class="col-md-3 col-lg-3 ">
                    <g:link controller="topic" action="showPost" params="[resId: res.id]">View Post</g:link>
                </div>
            </div>

        </div>
</div>
    </div>
    </article>

</g:each>