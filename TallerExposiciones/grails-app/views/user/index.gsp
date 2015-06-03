<%@ page import="tallerexposiciones.Regular" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Index</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" />
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'styles.css')}" />
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
                        <!-- Este es el pedazo que cambia de la barra de navegacion -->

                        <ul class="nav navbar-nav navbar-right">
                            <g:if test="${session.authStatus != null}">
                                <li><a href="<g:createLink controller='user' action='logout'/>" class="login">Logout</a></li>

                            </g:if>
                            <g:else>
                                <li><a href="<g:createLink controller='user' action='login'/>" class="login">Login</a></li>
                            </g:else>
                        </ul>

                    </div>
                </g:else>
            </div>
        </nav>

        <!-- Esta es la fila que cambia -->
        <g:if test="${flash.message}">
            <div class="row">
                <div class="text-center">
                    <h2>${flash.message}</h2>
                </div>
                <br/>
            </div>
        </g:if>
        <div class="row">
            <div class="col-sm-6">
                <div class="text-center" style="border: 2px solid black">
                    Bienvenido a la aplicacion Forum 2.0
                    <br/>
                    <br/>
                    <br/>
                    <div class="align-leftC">Consultar:</div>
                    <br/>
                    <ul class="align-left">
                        <li><a href="<g:createLink controller='forum' action='index'/>">Foros</a></li>
                        <!--li><a href="<g:createLink controller='user' action='indexGrails'/>" >Usuarios</a></li-->
                        <li><a href="<g:createLink controller='regular' action='index'/>" >Usuarios (regular)</a></li>
                        <li><a href="<g:createLink controller='admin' action='index'/>" >Usuarios (admin)</a></li>
                        <li><a href="<g:createLink controller='post' action='index'/>" >Entradas</a></li>
                        <li><a href="<g:createLink controller='file' action='index'/>" >Archivos</a></li>
                    </ul>
                    <div class="padding"></div>
                </div>


            </div>

            <div class="col-sm-3">
                <div class="text-center" style="border: 2px solid black">
                    Ultimas entradas Post
                    <div class="rectbox">
                    Maximo diez<br>

                    <g:each in="${params.recentPost}" var="par">
                        <a href='<g:createLink controller="post" action="show" id="${par.id}"/>'>${par}</a>
                    </g:each>

                    </div>
                </div>
            </div>

            <div class="col-sm-3">
                <div class="text-center" style="border: 2px solid black">
                    Foros con mas entradas
                    <div class="rectbox">
                        Maximo 10<br>
                    <g:each in="${params.popularForums}" var="forum">
                        <a href='<g:createLink controller="forum" action="show" id="${forum.id}"/>'>${forum}</a><br>
                    </g:each>
                    </div>
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
