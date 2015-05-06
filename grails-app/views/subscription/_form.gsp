<%@ page import="linksharingapplication.Subscription" %>



<div class="fieldcontain ${hasErrors(bean: subscriptionInstance, field: 'topic', 'error')} required">
	<label for="topic">
		<g:message code="subscription.topic.label" default="Topic" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="topic" name="topic.id" from="${linksharingapplication.Topic.list()}" optionKey="id" required="" value="${subscriptionInstance?.topic?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: subscriptionInstance, field: 'seriousness', 'error')} required">
	<label for="seriousness">
		<g:message code="subscription.seriousness.label" default="Seriousness" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="seriousness" from="${linksharingapplication.Subscription$SeriousnessValue?.values()}" keys="${linksharingapplication.Subscription$SeriousnessValue.values()*.name()}" required="" value="${subscriptionInstance?.seriousness?.name()}" />

</div>

<div class="fieldcontain ${hasErrors(bean: subscriptionInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="subscription.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${linksharingapplication.User.list()}" optionKey="id" required="" value="${subscriptionInstance?.user?.id}" class="many-to-one"/>

</div>

