
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
            <img src="${resource(dir:'images', file:'post.jpg')}" class="img-responsive" alt="Responsive image">
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
                        <li><a href="<g:createLink controller='file' action='index'/>">Lista de Archivos</a></li>
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
                        <li><a href="<g:createLink controller='file' action='index'/>">Lista de Archivos</a></li>
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

    <div id="show-file" class="content scaffold-show" role="main">
        <h1>Archivo</h1>
        <ol class="property-list file">

            <g:if test="${fileInstance?.post}">
                <li class="fieldcontain">
                    <span id="post-label" class="property-label"><g:message code="file.post.label" default="Post" /></span>

                    <span class="property-value" aria-labelledby="post-label"><g:link controller="post" action="show" id="${fileInstance?.post?.id}">${fileInstance?.post?.encodeAsHTML()}</g:link></span>

                </li>
            </g:if>

            <g:if test="${fileInstance?.fileType}">
                <li class="fieldcontain">
                    <span id="fileType-label" class="property-label"><g:message code="file.fileType.label" default="File Type" /></span>

                    <span class="property-value" aria-labelledby="fileType-label"><g:fieldValue bean="${fileInstance}" field="fileType"/></span>

                </li>
            </g:if>

            <g:if test="${fileInstance?.content}">
                <li class="fieldcontain">
                    <span id="content-label" class="property-label"><g:message code="file.content.label" default="Content" /></span>

                </li>
            </g:if>

            <g:if test="${fileInstance?.size}">
                <li class="fieldcontain">
                    <span id="size-label" class="property-label"><g:message code="file.size.label" default="Size" /></span>

                    <span class="property-value" aria-labelledby="size-label"><g:fieldValue bean="${fileInstance}" field="size"/></span>

                </li>
            </g:if>

        </ol>
        <g:form url="[resource:fileInstance, action:'delete']" method="DELETE">
            <fieldset class="buttons">
                <g:link class="edit" action="edit" resource="${fileInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: '¿Está seguro?')}');" />
            </fieldset>
        </g:form>
    </div>
    <hr/>

    <footer>
        <p> Aplicacion hecha por : V-Market </p>
    </footer>

</div>
</body>
</html>

