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
            <img src="${resource(dir:'images', file:'post.jpg')}">
            <br/>
        </div>
    </div>

    <!-- Esta es la fila que cambia -->
    <nav class="navbar navbar-default">
        <div class="container">
            <g:if test="${session.user}">
                <div>
                    <ul class="nav navbar-nav">
                        <li><a href="/">Bienvenido ${session.user.username}</a></li>
                    </ul>
                </div>
                <div>
                    <!-- Este es el pedazo que cambia de la barra de navegacion -->
                    <ul class="nav navbar-nav navbar-right">
                    <li><g:link controller="user" action="show" id="${session.user.id}">Mi perfil</g:link></li>
                    <li><g:link controller="post" action="postsUser">Mis posts</g:link></li>
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
    </nav>

    <!-- Esta es la fila que cambia -->
    <div class="row">
        <div class="col-sm-12">
            <div class="text-center" style="border: 2px solid black">
                <br/>
                <br/>
                <h2>Lo Sentimos. La página solicitada no existe!</h2>
                <div class="row">
                    <div class="col-sm-12">
                        <br/>
                        <img src="${resource(dir:'images', file:'error.jpg')}">
                        <br/>
                        <br/>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <hr/>

    <footer class="footer">
        <div class="container text-center">
            <p class="text-muted">Aplicacion hecha por : V-Market</p>
        </div>
    </footer>

</div>

</body>
</html>