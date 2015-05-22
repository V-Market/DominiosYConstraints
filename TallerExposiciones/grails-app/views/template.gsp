<%--
  Created by IntelliJ IDEA.
  User: Gabriel
  Date: 21/05/2015
  Time: 18:38
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
                    <li><a href="/">Bienvenido (nombre de usuario)</a></li>
                </ul>
            </div>
            <div>
                <!-- Este es el pedazo que cambia de la barra de navegacion -->
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">Mi perfil</a></li>
                    <li><a href="#">Mis posts</a></li>
                    <li><a href="#">Log out</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Esta es la fila que cambia -->
    <div class="row">
        <div class="col-sm-6">
            <div class="text-center" style="border: 2px solid black">
                Bienvenido a la aplicacion Forum 2.0
            </div>
        </div>

        <div class="col-sm-3">
            <div class="text-center" style="border: 2px solid black">
                Ultimas entradas Post
            </div>
        </div>

        <div class="col-sm-3">
            <div class="text-center" style="border: 2px solid black">
                Foros con mas entradas
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