
<%@ page import="tallerexposiciones.Post" %>
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
                        <li><a href="<g:createLink controller='post' action='index'/>">Lista de Posts</a></li>
                        <li><a href="<g:createLink controller='post' action='create'/>">Crear nuevo post</a></li>

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
                        <li><a href="<g:createLink controller='post' action='index'/>">Lista de posts</a></li>
                        <li><a href="<g:createLink controller='post' action='create'/>">Crear nuevo post</a></li>
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
		<div id="show-post" class="content scaffold-show" role="main">
			<h1>Post</h1>
			<ol class="property-list post">
			
				<g:if test="${postInstance?.files}">
				<li class="fieldcontain">
					<span id="files-label" class="property-label"><g:message code="post.files.label" default="Files" /></span>
					
						<g:each in="${postInstance.files}" var="f">
						<span class="property-value" aria-labelledby="files-label"><g:link controller="file" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${postInstance?.forum}">
				<li class="fieldcontain">
					<span id="forum-label" class="property-label"><g:message code="post.forum.label" default="Forum" /></span>
					
						<span class="property-value" aria-labelledby="forum-label"><g:link controller="forum" action="show" id="${postInstance?.forum?.id}">${postInstance?.forum?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${postInstance?.author}">
				<li class="fieldcontain">
					<span id="author-label" class="property-label"><g:message code="post.author.label" default="Author" /></span>
					
						<span class="property-value" aria-labelledby="author-label"><g:link controller="regular" action="show" id="${postInstance?.author?.id}">${postInstance?.author?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${postInstance?.topic}">
				<li class="fieldcontain">
					<span id="topic-label" class="property-label"><g:message code="post.topic.label" default="Topic" /></span>
					
						<span class="property-value" aria-labelledby="topic-label"><g:fieldValue bean="${postInstance}" field="topic"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${postInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="post.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${postInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${postInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="post.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${postInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${postInstance?.itsAllowed}">
				<li class="fieldcontain">
					<span id="itsAllowed-label" class="property-label"><g:message code="post.itsAllowed.label" default="Its Allowed" /></span>
					
						<span class="property-value" aria-labelledby="itsAllowed-label"><g:formatBoolean boolean="${postInstance?.itsAllowed}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${postInstance?.rate}">
				<li class="fieldcontain">
					<span id="rate-label" class="property-label"><g:message code="post.rate.label" default="Rate" /></span>
					
						<span class="property-value" aria-labelledby="rate-label"><g:fieldValue bean="${postInstance}" field="rate"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:postInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${postInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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
