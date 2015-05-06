<%@ page import="linksharingapplication.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="user.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" maxlength="15" required="" value="${userInstance?.username}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${userInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" name="password" required="" value="${userInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="user.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${userInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'photo', 'error')} ">
	<label for="photo">
		<g:message code="user.photo.label" default="Photo" />
		
	</label>
	<input type="file" id="photo" name="photo" />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'active', 'error')} ">
	<label for="active">
		<g:message code="user.active.label" default="Active" />
		
	</label>
	<g:checkBox name="active" value="${userInstance?.active}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'admin', 'error')} ">
	<label for="admin">
		<g:message code="user.admin.label" default="Admin" />
		
	</label>
	<g:checkBox name="admin" value="${userInstance?.admin}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'fName', 'error')} required">
	<label for="fName">
		<g:message code="user.fName.label" default="F Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="fName" required="" value="${userInstance?.fName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'topics', 'error')} ">
	<label for="topics">
		<g:message code="user.topics.label" default="Topics" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userInstance?.topics?}" var="t">
    <li><g:link controller="topic" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="topic" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'topic.label', default: 'Topic')])}</g:link>
</li>
</ul>


</div>

