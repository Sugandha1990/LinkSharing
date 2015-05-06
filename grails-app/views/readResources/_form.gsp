<%@ page import="linksharingapplication.ReadResources" %>



<div class="fieldcontain ${hasErrors(bean: readResourcesInstance, field: 'readFlg', 'error')} ">
	<label for="readFlg">
		<g:message code="readResources.readFlg.label" default="Read Flg" />
		
	</label>
	<g:checkBox name="readFlg" value="${readResourcesInstance?.readFlg}" />

</div>

<div class="fieldcontain ${hasErrors(bean: readResourcesInstance, field: 'resource', 'error')} required">
	<label for="resource">
		<g:message code="readResources.resource.label" default="Resource" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="resource" name="resource.id" from="${linksharingapplication.Resource.list()}" optionKey="id" required="" value="${readResourcesInstance?.resource?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: readResourcesInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="readResources.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${linksharingapplication.User.list()}" optionKey="id" required="" value="${readResourcesInstance?.user?.id}" class="many-to-one"/>

</div>

