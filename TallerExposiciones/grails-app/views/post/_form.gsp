<%@ page import="tallerexposiciones.Post" %>



<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'files', 'error')} ">
	<label for="files">
		<g:message code="post.files.label" default="Files" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${postInstance?.files?}" var="f">
    <li><g:link controller="file" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="file" action="create" params="['post.id': postInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'file.label', default: 'File')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'forum', 'error')} required">
	<label for="forum">
		<g:message code="post.forum.label" default="Forum" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="forum" name="forum.id" from="${tallerexposiciones.Forum.list()}" optionKey="id" required="" value="${postInstance?.forum?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'author', 'error')} required">
	<label for="author">
		<g:message code="post.author.label" default="Author" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="author" name="author.id" from="${tallerexposiciones.Regular.list()}" optionKey="id" required="" value="${postInstance?.author?.id}" class="many-to-one"/>

</div>

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

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'rate', 'error')} required">
	<label for="rate">
		<g:message code="post.rate.label" default="Rate" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="rate" type="number" min="0" value="${postInstance.rate}" required=""/>

</div>

