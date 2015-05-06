<div  class="userPost">
    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
        <div class="row">
            <h2 name="e-${topic.id}"><g:link action="show" controller="topic" id="${topic.id}">${fieldValue(bean: topic, field: "name")}</g:link></h2>
        </div>
        <div class="row">
            <p>  <g:link controller="topic" action="unsubscribe" params="[topic:topic.id,user:session.user.id]">Unsubscribe</g:link>

            </p>
        </div>
        <div class="row form-inline">
            <g:form controller="topic" action="updateTopic">
                <g:hiddenField name="id" value="${topic.id}"/>
                <g:textField name="name" id="t-${topic.id}"  value="${topic.name}" style="display: none"></g:textField>
                <span><g:submitButton name="s-${topic.id}" value="save" style="display: none"/>
                    <button id="c-${topic.id}" onclick="updateCancel('e-'+${topic.id},'t-'+${topic.id},'s-'+${topic.id},'c-'+${topic.id})" style="display: none">Cancel</button>
                </span>
                <g:select name="seriousness" from="${linksharingapplication.Subscription.SeriousnessValue}" value="${topic.seriousness}"/>
                <g:select name="visibility" from="${linksharingapplication.Topic.VisibilityValue}" value="${topic.visibility}"/>

            </g:form></div>
    </div>

    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6"><h2>@${topic.createdBy.username}</h2>
        <div class="row">
            <p>
                Subscriptions( ${topic.subscriptions.size()} ) Posts(  ${topic.resources.size()})
            </p>
        </div>

        <div class="row">
            <g:if test="${topic.visibility.equals(Topic.VisibilityValue.PUBLIC)}">
                <g:link controller="user" action="dashboard"><g:img dir="images" file="envelope54.png"
                                                                    style="height: 45px;width: 45px"/></g:link>
            </g:if>

            <g:if test="${topic.createdBy.id.equals(session.user.id)}">
                <a  href="#" onclick="editFunction('e-'+${topic.id},'t-'+${topic.id},'s-'+${topic.id},'c-'+${topic.id})"><g:img dir="images" file="pencil124.png"
                                                                                                                                style="height: 45px;width: 45px"/></a>
                <g:link  name="delete" onclick="deleteConfirm(${topic.id})"><g:img dir="images" file="bin9.png"
                                                                                   style="height:45px;width: 45px"/></g:link>
            </g:if>
        </div>
    </div>
</div><%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 30/4/15
  Time: 11:38 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>

</body>
</html>