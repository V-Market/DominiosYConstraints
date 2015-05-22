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
                <div>
                    <!-- Este es el pedazo que cambia de la barra de navegacion -->
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="<g:createLink controller='user' action='login'/>" class="login">        Login       </a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Esta es la fila que cambia -->
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
                        <li><a href="<g:createLink controller='user' action='index'/>" >Usuarios</a></li>
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
                    Maximo diez
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>

                    </div>
                </div>
            </div>

            <div class="col-sm-3">
                <div class="text-center" style="border: 2px solid black">
                    Foros con mas entradas
                    <div class="rectbox">
                        Maximo 10
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
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
