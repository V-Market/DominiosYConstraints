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
                    <li><g:link controller="admin" action="showProfile">Mi perfil</g:link></li>
                    <li><a href="#">Mis foros</a></li>
                    <li><g:link controller="user" action="logOut">Logout</g:link></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Esta es la fila que cambia -->
    <div class="row">
        <div class="col-sm-8 col-sm-offset-2">
            <table class="table">
                <thead>
                <tr>

                    <th><g:message code="forum.admin.label" default="Admin" /></th>

                    <g:sortableColumn property="name" title="${message(code: 'forum.name.label', default: 'Name')}" />

                    <g:sortableColumn property="dateCreated" title="${message(code: 'forum.dateCreated.label', default: 'Date Created')}" />

                    <g:sortableColumn property="category" title="${message(code: 'forum.category.label', default: 'Category')}" />

                </tr>
                </thead>
                <tbody>
                <g:each in="${params.userForumList}" status="i" var="forumInstance">
                    <tr>

                        <td><g:link action="show" id="${forumInstance.id}">${fieldValue(bean: forumInstance, field: "admin")}</g:link></td>

                        <td>${fieldValue(bean: forumInstance, field: "name")}</td>

                        <td><g:formatDate date="${forumInstance.dateCreated}" /></td>

                        <td>${fieldValue(bean: forumInstance, field: "category")}</td>

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