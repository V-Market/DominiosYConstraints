<%@ page import="tallerexposiciones.Post" %>



<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'topic', 'error')} required">
	<label for="topic">
		<g:message code="post.topic.label" default="Topic" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="topic" required="" value="${postInstance?.topic}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'itsAllowed', 'error')} ">
	<label for="itsAllowed">
		<g:message code="post.itsAllowed.label" default="Its Allowed" />
		
	</label>
	<g:checkBox name="itsAllowed" value="${postInstance?.itsAllowed}" />

</div>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'forum', 'error')} required">
	<label for="forum">
		<g:message code="post.forum.label" default="Forum" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="forum" name="forum.id" from="${tallerexposiciones.Forum.list()}" optionKey="id" required="" value="${postInstance?.forum?.id}" class="many-to-one"/>

</div>

