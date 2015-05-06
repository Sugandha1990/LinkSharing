
<%@ page import="linksharingapplication.ReadResources" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'readResources.label', default: 'ReadResources')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-readResources" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-readResources" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list readResources">
			
				<g:if test="${readResourcesInstance?.readFlg}">
				<li class="fieldcontain">
					<span id="readFlg-label" class="property-label"><g:message code="readResources.readFlg.label" default="Read Flg" /></span>
					
						<span class="property-value" aria-labelledby="readFlg-label"><g:formatBoolean boolean="${readResourcesInstance?.readFlg}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${readResourcesInstance?.resource}">
				<li class="fieldcontain">
					<span id="resource-label" class="property-label"><g:message code="readResources.resource.label" default="Resource" /></span>
					
						<span class="property-value" aria-labelledby="resource-label"><g:link controller="resource" action="show" id="${readResourcesInstance?.resource?.id}">${readResourcesInstance?.resource?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${readResourcesInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="readResources.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${readResourcesInstance?.user?.id}">${readResourcesInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:readResourcesInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${readResourcesInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
