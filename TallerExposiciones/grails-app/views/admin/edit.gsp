<%@ page import="tallerexposiciones.File" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Admin</title>

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

    <nav class="navbar navbar-default">
        <div class="container">
            <div>
                <ul class="nav navbar-nav">
                    <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                    <li><g:link class="list" action="index">Lista de Administradores</g:link></li>
                    <li><g:link class="create" action="create">Crear Administrador</g:link></li>
                </ul>
            </div>
            <div>
                <div class="container modificacionContainer">
                    <g:if test="${session.user}">
                        <div>
                            <!-- Este es el pedazo que cambia de la barra de navegacion -->
                            <ul class="nav navbar-nav navbar-right">
                                <li><g:link controller="user" action="show" id="${session.user.id}">Mi perfil</g:link></li>
                                <li><a href="#">Mis posts</a></li>
                                <li><g:link controller="user" action="logOut">Logout</g:link></li>
                            </ul>
                        </div>
                    </g:if>
                    <g:else>
                        <div>
                            <!-- Este es el pedazo que cambia de la barra de navegacion -->
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="<g:createLink controller='user' action='login'/>" class="login">Login</a></li>
                            </ul>
                        </div>
                    </g:else>
                </div>
            </div>
        </div>
    </nav>
    <div class="row">
        <div class="col-sm-5">
            <div></div>
        </div>
        <div class="col-sm-5">
            <div id="edit-admin" class="content scaffold-edit" role="main">
                <h1>Editar Administrador</h1>
                <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
                </g:if>
                <g:hasErrors bean="${adminInstance}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${adminInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
                </g:hasErrors>
                <g:form url="[resource:adminInstance, action:'update']" method="PUT" >
                    <g:hiddenField name="version" value="${adminInstance?.version}" />
                    <fieldset class="form">
                        <g:render template="form"/>
                    </fieldset>
                    <fieldset class="buttons">
                        <g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                    </fieldset>
                </g:form>
            </div>
        </div>
    </div>
    <hr/>

    <footer>
        <p> Aplicacion hecha por : V-Market </p>
    </footer>
</div>
</body>
</html>