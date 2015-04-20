<%@ page import="tallerexposiciones.Forum" %>



<div class="fieldcontain ${hasErrors(bean: forumInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="forum.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${forumInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: forumInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="forum.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="category" required="" value="${forumInstance?.category}"/>

</div>

