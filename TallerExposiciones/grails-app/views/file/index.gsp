
<%@ page import="tallerexposiciones.File" %>
<!DOCTYPE html>
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
        <div class="container modificacionContainer">
            <g:if test="${session.user}">
                <div>
                    <ul class="nav navbar-nav">
                        <li><a href="/">Bienvenido ${session.user.username}</a></li>
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li><a href="<g:createLink controller='file' action='create'/>">Crear nuevo archivo</a></li>
                    </ul>
                </div>
                <div>
                    <!-- Este es el pedazo que cambia de la barra de navegacion -->
                    <ul class="nav navbar-nav navbar-right">
                        <g:if test="${session.user.domainClass == new tallerexposiciones.Regular().domainClass}">
                            <li><g:link controller="regular" action="showProfile">Mi perfil</g:link></li>
                            <li><g:link controller="post" action="postsUser">Mis posts</g:link></li>
                        </g:if>
                        <g:else>
                            <li><g:link controller="admin" action="showProfile">Mi perfil</g:link></li>
                            <li><g:link controller="forum" action="forumsUser">Mis foros</g:link></li>
                        </g:else>
                        <li><g:link controller="user" action="logOut">Logout</g:link></li>
                    </ul>
                </div>
            </g:if>
            <g:else>
                <div>
                    <ul class="nav navbar-nav">
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li><a href="<g:createLink controller='file' action='create'/>">Crear nuevo archivo</a></li>
                    </ul>
                </div>
                <div>
                    <!-- Este es el pedazo que cambia de la barra de navegacion -->
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="<g:createLink controller='user' action='login'/>" class="login">Login</a></li>
                    </ul>
                </div>
            </g:else>
        </div>
    </nav>

    <div id="list-file" class="content scaffold-list" role="main">
        <div class="row">
            <div class="col-sm-4">
            </div>
            <div class="col-sm-4">
                <h1>Lista de archivos</h1>
            </div>
            <div class="col-sm-4">
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="text-center" style="border: 2px solid black">
                    <table class="table table-striped">
                        <thead>
                        <tr>

                            <th><g:message code="file.post.label" default="Post" /></th>

                            <g:sortableColumn property="fileType" title="${message(code: 'file.fileType.label', default: 'File Type')}" />

                            <g:sortableColumn property="content" title="${message(code: 'file.content.label', default: 'Content')}" />

                            <g:sortableColumn property="size" title="${message(code: 'file.size.label', default: 'Size')}" />

                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${fileInstanceList}" status="i" var="fileInstance">
                            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                <td><g:link action="show" id="${fileInstance.id}">${fieldValue(bean: fileInstance, field: "post")}</g:link></td>

                                <td>${fieldValue(bean: fileInstance, field: "fileType")}</td>

                                <td>${fieldValue(bean: fileInstance, field: "content")}</td>

                                <td>${fieldValue(bean: fileInstance, field: "size")}</td>

                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                    <div class="padding"></div>
                </div>
            </div>
        </div>
        <div class="pagination">
            <g:paginate total="${fileInstanceCount ?: 0}" />
        </div>
    </div>
    <hr/>

    <footer>
        <p> Aplicacion hecha por : V-Market </p>
    </footer>

</div>

</body>
</html>
