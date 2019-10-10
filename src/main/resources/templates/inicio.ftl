<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>C.R.U.D B&aacutesico</title>

    <!-- Bootstrap core CSS -->
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/css/heroic-features.css" rel="stylesheet">

  </head>

  <body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
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
              <a class="nav-link" href="/Agregar">Agregar (Create)</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Page Content -->
    <div class="container">

      <!-- Jumbotron Header -->
      <header class="jumbotron my-4 text-center">
        <h1 class="display-3">C.R.U.D de Estudiantes</h1>
        <hr class="my-4">
        <p>Proyecto creado por Iv&aacuten Rodr&iacuteguez para la clase de Programaci&oacuten Web</p>
      </header>

      <!-- Page Features -->
        <div class="text-center">
                <table class="table table-striped table-hover">
                    <thead class="thead-dark">
                    <tr>
                        <th>Matr&iacutecula</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Tel&eacutefono</th>
                        <th> </th>
                        <th> </th>
                        <th> </th>
                    </tr>
                    </thead>
                    <tbody>
                        <#if listaSize>
                        <#assign i = 0>

                        <#list listaStudents as Est>
                        <tr class="animated fadeInUp">
                            <td>${Est.matricula?string["0"]}</td>
                            <td>${Est.nombre}</td>
                            <td>${Est.apellido}</td>
                            <td>${Est.telefono}</td>
                            <td><a href="/VisualizarEst/${i}"  class="btn btn-info" role="button">Ver (Read)</a></td>
                            <td><a href="/Modificar/${i}" class="btn btn-success" role="button">Editar (Update)</a></td>
                            <td><a href="/Eliminar/${i}"  class="btn btn-danger" role="button">Eliminar (Delete)</a></td>
                        </tr>
                            <#assign i++>
                        </#list>
                    </tbody>
                </table>
            </#if>
        </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>