<%--
  Created by IntelliJ IDEA.
  User: johnd_000
  Date: 21/05/2015
  Time: 10:49 PM
--%>

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
            <img src="../images/post.jpg" class="img-responsive" alt="Responsive image">
            <br/>
        </div>
    </div>

    <!-- Esta es la fila que cambia -->
    <nav class="navbar navbar-default">
        <div class="container">
            <div>
                <ul class="nav navbar-nav">
                    <li><a href="/">Bienvenido </a></li>
                </ul>
            </div>
            <div>
                <!-- Este es el pedazo que cambia de la barra de navegacion -->
                <ul class="nav navbar-nav navbar-right">
                    <li><g:link controller="regular" action="showProfile">Mi perfil</g:link></li>
                    <li><g:link controller="post" action="postsUser">Mis posts</g:link></li>
                    <li><g:link controller="user" action="logOut">Logout</g:link></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Esta es la fila que cambia -->
    <div class="row">
        <div class="col-sm-1">
            <div>

            </div>
        </div>

        <div class="col-sm-10">
            <div class="text-center" style="border: 2px solid black">
                <br>
                <br>
                <br>
                Perfil de Usuario<br>
                <br>
                <br>
                Tipo de Usuario: Regular<br>
                <br>
                <br>
                Vistas de Post: ${session.user.postViews}
                <br>
                <br>
                Strikes: ${session.user.strikesNumber}
                <br>
                <br>
                Estrellas: ${session.user.starsNumber}
                <br>
                <br>
            </div>
        </div>

        <div class="col-sm-1">
            <div>
            </div>
        </div>
    </div>
    <br>
    <br>
    <hr/>

    <footer>
        <p class="text-center">
            Aplicacion hecha por : V-Market </p>
    </footer>

</div>

</body>
</html>