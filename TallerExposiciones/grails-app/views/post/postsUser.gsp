<%--
  Created by IntelliJ IDEA.
  User: Gabriel
  Date: 21/05/2015
  Time: 18:38
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>V-Market</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" />

    <!-- ||||||||||||||| SCRIPTS ||||||||||||||| -->
    <g:javascript src="jquery-1.11.2.min.js" />
    <g:javascript src="bootstrap.min.js" />
</head>

<body>

<div class="container-fluid">

    <div class="row">
        <div class="col-sm-12">
            <br/>
            <img src="../images/post.jpg" class="img-responsive" alt="Responsive image">
            <br/>
        </div>
    </div>

    <!-- Esta es la fila que cambia -->
    <nav class="navbar navbar-default">
        <div class="container">
            <div>
                <ul class="nav navbar-nav">
                    <li><a href="/">Bienvenido ${session.user.username}</a></li>
                </ul>
            </div>
            <div>
                <!-- Este es el pedazo que cambia de la barra de navegacion -->
                <ul class="nav navbar-nav navbar-right">
                    <li><g:link controller="user" action="show" id="${session.user.id}">Mi perfil</g:link></li>
                    <li><a href="#">Mis posts</a></li>
                    <li><g:link controller="user" action="logOut">Logout</g:link></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Esta es la fila que cambia -->
    <div class="row">
        <div class="col-sm-8 col-sm-offset-2">
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
                            <g:form controller="post">
                                <g:actionSubmit value="rate" action="rate" />
                            </g:form>
                        </td>

                        <td><g:field type="text" name="commentContent"/></td>

                        <td>
                            <g:form controller="post">
                                <g:actionSubmit value="comment" action="comment" />
                            </g:form>
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>

    <hr/>

    <footer>
        <p> Aplicacion hecha por : V-Market </p>
    </footer>

</div>

</body>
</html>