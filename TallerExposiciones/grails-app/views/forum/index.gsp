
<%@ page import="tallerexposiciones.Forum" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'forum.label', default: 'Forum')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-forum" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-forum" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'forum.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'forum.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="category" title="${message(code: 'forum.category.label', default: 'Category')}" />
					
						<th><g:message code="forum.admin.label" default="Admin" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${forumInstanceList}" status="i" var="forumInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${forumInstance.id}">${fieldValue(bean: forumInstance, field: "name")}</g:link></td>
					
						<td><g:formatDate date="${forumInstance.dateCreated}" /></td>
					
						<td>${fieldValue(bean: forumInstance, field: "category")}</td>
					
						<td>${fieldValue(bean: forumInstance, field: "admin")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${forumInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
