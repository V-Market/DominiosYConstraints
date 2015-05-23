
<%@ page import="tallerexposiciones.Post" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<a href="#list-post" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="list-post" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <th><g:message code="post.forum.label" default="Forum" /></th>

            <th><g:message code="post.author.label" default="Author" /></th>

            <g:sortableColumn property="topic" title="${message(code: 'post.topic.label', default: 'Topic')}" />

            <g:sortableColumn property="dateCreated" title="${message(code: 'post.dateCreated.label', default: 'Date Created')}" />

            <g:sortableColumn property="lastUpdated" title="${message(code: 'post.lastUpdated.label', default: 'Last Updated')}" />

            <g:sortableColumn property="itsAllowed" title="${message(code: 'post.itsAllowed.label', default: 'Its Allowed')}" />

        </tr>
        </thead>
        <tbody>
        <g:each in="${postInstanceList}" status="i" var="postInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show" id="${postInstance.id}">${fieldValue(bean: postInstance, field: "forum")}</g:link></td>

                <td>${fieldValue(bean: postInstance, field: "author")}</td>

                <td>${fieldValue(bean: postInstance, field: "topic")}</td>

                <td><g:formatDate date="${postInstance.dateCreated}" /></td>

                <td><g:formatDate date="${postInstance.lastUpdated}" /></td>

                <td><g:formatBoolean boolean="${postInstance.itsAllowed}" /></td>

                <td>
                    <g:form  url="[resource:postInstance, action:'rate']" method="GET" controller="post">
                        <g:actionSubmit value="rate" action="rate" />
                    </g:form>
                </td>

                <td>
                    <g:form url="[resource:postInstance, action:'comment']" method="GET" controller="post">
                        <g:field type="text" name="commentContent"/>
                        <g:actionSubmit value="comment" action="comment" />
                    </g:form>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
    <g:form controller="post">
        <g:actionSubmit value="Share" action="share" />
    </g:form>
    <div class="pagination">
        <g:paginate total="${postInstanceCount ?: 0}" />
    </div>
</div>
</body>
</html>