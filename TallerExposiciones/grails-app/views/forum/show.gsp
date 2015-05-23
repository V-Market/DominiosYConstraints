
<%@ page import="tallerexposiciones.Forum" %>
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
                        <li><a href="<g:createLink controller='forum' action='index'/>">Lista de Foros</a></li>
                        <li><a href="<g:createLink controller='forum' action='create'/>">Crear nuevo foro</a></li>

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
                        <li><a href="<g:createLink controller='forum' action='index'/>">Lista de Foros</a></li>
                        <li><a href="<g:createLink controller='forum' action='create'/>">Crear nuevo foro</a></li>
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
		<div id="show-forum" class="content scaffold-show" role="main">
            <h1>Foro</h1>
			<ol class="property-list forum">
			
				<g:if test="${forumInstance?.posts}">
				<li class="fieldcontain">
					<span id="posts-label" class="property-label"><g:message code="forum.posts.label" default="Posts" /></span>
					
						<g:each in="${forumInstance.posts}" var="p">
						<span class="property-value" aria-labelledby="posts-label"><g:link controller="post" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${forumInstance?.admin}">
				<li class="fieldcontain">
					<span id="admin-label" class="property-label"><g:message code="forum.admin.label" default="Admin" /></span>
					
						<span class="property-value" aria-labelledby="admin-label"><g:link controller="admin" action="show" id="${forumInstance?.admin?.id}">${forumInstance?.admin?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${forumInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="forum.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${forumInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${forumInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="forum.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${forumInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${forumInstance?.category}">
				<li class="fieldcontain">
					<span id="category-label" class="property-label"><g:message code="forum.category.label" default="Category" /></span>
					
						<span class="property-value" aria-labelledby="category-label"><g:fieldValue bean="${forumInstance}" field="category"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:forumInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${forumInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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
