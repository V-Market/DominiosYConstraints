
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
                        <li><a href="<g:createLink controller='admin' action='create'/>">Crear nuevo admin</a></li>
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
                        <li><a href="<g:createLink controller='admin' action='create'/>">Crear nuevo admin</a></li>
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
		<div id="list-admin" class="content scaffold-list" role="main">
            <div class="row">
                <div class="col-sm-4">
                </div>
                <div class="col-sm-4">
                    <h1>Lista de administradores</h1>
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
					
						<g:sortableColumn property="name" title="${message(code: 'admin.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="lastname" title="${message(code: 'admin.lastname.label', default: 'Lastname')}" />
					
						<g:sortableColumn property="age" title="${message(code: 'admin.age.label', default: 'Age')}" />
					
						<g:sortableColumn property="username" title="${message(code: 'admin.username.label', default: 'Username')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'admin.password.label', default: 'Password')}" />
					
						<g:sortableColumn property="level" title="${message(code: 'admin.level.label', default: 'Level')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${adminInstanceList}" status="i" var="adminInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${adminInstance.id}">${fieldValue(bean: adminInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: adminInstance, field: "lastname")}</td>
					
						<td>${fieldValue(bean: adminInstance, field: "age")}</td>
					
						<td>${fieldValue(bean: adminInstance, field: "username")}</td>
					
						<td>${fieldValue(bean: adminInstance, field: "password")}</td>
					
						<td>${fieldValue(bean: adminInstance, field: "level")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
                    <div class="padding"></div>
                </div>
            </div>
            </div>
            <div class="pagination">
                <g:paginate total="${adminInstanceCount ?: 0}" />
            </div>
            <hr/>

            <footer>
                <p> Aplicacion hecha por : V-Market </p>
            </footer>

        </div>
</div>
	</body>
</html>
