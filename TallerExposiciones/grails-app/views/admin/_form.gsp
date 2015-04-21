<%@ page import="tallerexposiciones.Admin" %>



<div class="fieldcontain ${hasErrors(bean: adminInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="admin.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${adminInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: adminInstance, field: 'lastname', 'error')} required">
	<label for="lastname">
		<g:message code="admin.lastname.label" default="Lastname" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastname" required="" value="${adminInstance?.lastname}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: adminInstance, field: 'age', 'error')} required">
	<label for="age">
		<g:message code="admin.age.label" default="Age" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="age" type="number" min="14" value="${adminInstance.age}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: adminInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="admin.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${adminInstance?.username}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: adminInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="admin.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" name="password" required="" value="${adminInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: adminInstance, field: 'level', 'error')} required">
	<label for="level">
		<g:message code="admin.level.label" default="Level" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="level" type="number" min="1" max="5" value="${adminInstance.level}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: adminInstance, field: 'rating', 'error')} required">
	<label for="rating">
		<g:message code="admin.rating.label" default="Rating" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="rating" value="${fieldValue(bean: adminInstance, field: 'rating')}" required=""/>

</div>

