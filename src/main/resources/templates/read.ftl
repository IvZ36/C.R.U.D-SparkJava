<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>C.R.U.D Básico</title>

    <!-- Bootstrap core CSS -->
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/css/heroic-features.css" rel="stylesheet">

</head>

<body>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
    <div class="container">
        <a class="navbar-brand" href="#">Create, Read, Update y Delete</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="/">Inicio
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/Agregar">Agregar</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/Modificar/0">Modificar</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/Eliminar/0">Eliminar</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Page Content -->
<div class="container">
    <header class="jumbotron my-4 text-center">
        <h1 class="display-3">Mostrar Estudiante</h1>
    </header>
    <hr>
    <div class="card">
        <div class="text-center"><h3><span class="color: alert-primary">Mostrando el estudiante --> ${Est.nombre}</span></h3></div>
        <div class="card-body">
            <ul class="list-group">
                <li class="list-group-item"><span class="font-weight-bold">Matricula: </span>${Est.matricula?string["0"]}</span></li>
                <li class="list-group-item"><span class="font-weight-bold">Nombre: </span>${Est.nombre}</li>
                <li class="list-group-item"><span class="font-weight-bold">Apellido: </span>${Est.apellido}</li>
                <li class="list-group-item"><span class="font-weight-bold">Teléfono: </span>${Est.telefono}</li>
            </ul>
        </div>
    </div>
</div>
<!-- /.container -->

<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>