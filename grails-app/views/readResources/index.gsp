
<%@ page import="linksharingapplication.ReadResources" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'readResources.label', default: 'ReadResources')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-readResources" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-readResources" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="readFlg" title="${message(code: 'readResources.readFlg.label', default: 'Read Flg')}" />
					
						<th><g:message code="readResources.resource.label" default="Resource" /></th>
					
						<th><g:message code="readResources.user.label" default="User" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${readResourcesInstanceList}" status="i" var="readResourcesInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${readResourcesInstance.id}">${fieldValue(bean: readResourcesInstance, field: "readFlg")}</g:link></td>
					
						<td>${fieldValue(bean: readResourcesInstance, field: "resource")}</td>
					
						<td>${fieldValue(bean: readResourcesInstance, field: "user")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${readResourcesInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
