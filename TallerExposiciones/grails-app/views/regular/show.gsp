
<%@ page import="tallerexposiciones.Regular" %>
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
                        <li><a href="<g:createLink controller='regular' action='index'/>">Lista de Regulares</a></li>
                        <li><a href="<g:createLink controller='regular' action='create'/>">Crear nuevo regular</a></li>

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
                        <li><a href="<g:createLink controller='regular' action='index'/>">Lista de Regulares</a></li>
                        <li><a href="<g:createLink controller='regular' action='create'/>">Crear nuevo regular</a></li>
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
		<div id="show-regular" class="content scaffold-show" role="main">
			<h1>Usuario Regular</h1>
			<ol class="property-list regular">
			
				<g:if test="${regularInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="regular.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${regularInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${regularInstance?.lastname}">
				<li class="fieldcontain">
					<span id="lastname-label" class="property-label"><g:message code="regular.lastname.label" default="Lastname" /></span>
					
						<span class="property-value" aria-labelledby="lastname-label"><g:fieldValue bean="${regularInstance}" field="lastname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${regularInstance?.age}">
				<li class="fieldcontain">
					<span id="age-label" class="property-label"><g:message code="regular.age.label" default="Age" /></span>
					
						<span class="property-value" aria-labelledby="age-label"><g:fieldValue bean="${regularInstance}" field="age"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${regularInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="regular.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${regularInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${regularInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="regular.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${regularInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${regularInstance?.posts}">
				<li class="fieldcontain">
					<span id="posts-label" class="property-label"><g:message code="regular.posts.label" default="Posts" /></span>
					
						<g:each in="${regularInstance.posts}" var="p">
						<span class="property-value" aria-labelledby="posts-label"><g:link controller="post" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${regularInstance?.postViews}">
				<li class="fieldcontain">
					<span id="postViews-label" class="property-label"><g:message code="regular.postViews.label" default="Post Views" /></span>
					
						<span class="property-value" aria-labelledby="postViews-label"><g:fieldValue bean="${regularInstance}" field="postViews"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${regularInstance?.strikesNumber}">
				<li class="fieldcontain">
					<span id="strikesNumber-label" class="property-label"><g:message code="regular.strikesNumber.label" default="Strikes Number" /></span>
					
						<span class="property-value" aria-labelledby="strikesNumber-label"><g:fieldValue bean="${regularInstance}" field="strikesNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${regularInstance?.starsNumber}">
				<li class="fieldcontain">
					<span id="starsNumber-label" class="property-label"><g:message code="regular.starsNumber.label" default="Stars Number" /></span>
					
						<span class="property-value" aria-labelledby="starsNumber-label"><g:fieldValue bean="${regularInstance}" field="starsNumber"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:regularInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${regularInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
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
