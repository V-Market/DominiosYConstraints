
<%@ page import="tallerexposiciones.Admin" %>
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
                        <li><a href="<g:createLink controller='admin' action='index'/>">Lista de Administradores</a></li>
                        <li><a href="<g:createLink controller='admin' action='create'/>">Crear nuevo administrador</a></li>

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
                        <li><a href="<g:createLink controller='admin' action='index'/>">Lista de administradores</a></li>
                        <li><a href="<g:createLink controller='admin' action='create'/>">Crear nuevo administrador</a></li>
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

		<div id="show-admin" class="content scaffold-show" role="main">
            <h1>Administrador</h1>
			<ol class="property-list admin">
			
				<g:if test="${adminInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="admin.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${adminInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adminInstance?.lastname}">
				<li class="fieldcontain">
					<span id="lastname-label" class="property-label"><g:message code="admin.lastname.label" default="Lastname" /></span>
					
						<span class="property-value" aria-labelledby="lastname-label"><g:fieldValue bean="${adminInstance}" field="lastname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adminInstance?.age}">
				<li class="fieldcontain">
					<span id="age-label" class="property-label"><g:message code="admin.age.label" default="Age" /></span>
					
						<span class="property-value" aria-labelledby="age-label"><g:fieldValue bean="${adminInstance}" field="age"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adminInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="admin.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${adminInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adminInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="admin.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${adminInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adminInstance?.forums}">
				<li class="fieldcontain">
					<span id="forums-label" class="property-label"><g:message code="admin.forums.label" default="Forums" /></span>
					
						<g:each in="${adminInstance.forums}" var="f">
						<span class="property-value" aria-labelledby="forums-label"><g:link controller="forum" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${adminInstance?.level}">
				<li class="fieldcontain">
					<span id="level-label" class="property-label"><g:message code="admin.level.label" default="Level" /></span>
					
						<span class="property-value" aria-labelledby="level-label"><g:fieldValue bean="${adminInstance}" field="level"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adminInstance?.rating}">
				<li class="fieldcontain">
					<span id="rating-label" class="property-label"><g:message code="admin.rating.label" default="Rating" /></span>
					
						<span class="property-value" aria-labelledby="rating-label"><g:fieldValue bean="${adminInstance}" field="rating"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:adminInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${adminInstance}"><g:message code="default.button.edit.label" default="Editar" /></g:link>
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
