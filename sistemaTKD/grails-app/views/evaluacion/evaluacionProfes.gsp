<!doctype html>
<html>
<head>
    <meta name="layout" content="adminLte"/>
    <title>Inicio</title>
     <asset:stylesheet src="dataTables.bootstrap.min.css" />

</head>
<content tag="nav">
    <g:render template="/menuAdmin/menu"/>
</content>

 <content tag="header"> 
</content>


<g:hasErrors bean="${this.menuAdmin}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.menuAdmin}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
</g:hasErrors>

<body>

<g:if test="${ profe.id!=1}">


<section class="content">
      <div class="error-page">
        <h2 class="headline text-purple">Aviso</h2>

        <div class="error-content">
          <h3><i class="fa fa-warning text-yellow"></i> Resultados de Evaluación Docente</h3>

         <p>Pregunta a la alta dirección acerca de los resultados de tu evaluacion docente. La fecha y hora será establecida por el director de la escuela. Te pedimos de tu paciencia y agradecemos tu interés.</p>

        </div>
        <!-- /.error-content -->
      </div>
      <!-- /.error-page -->
    </section>
</g:if>
<g:else>
<div class="box box-danger">
    <div class="box-header with-border">
        <h3 class="box-title">
            Lista de Profesores
        </h3>
          <div class="pull-right">
            <a class="btn btn-success" href="${createLink(uri: "/profesor/create")}">Registrar Profesor</a>
        </div>
    </div>
    <div class="box-body">
        <div class="table-responsive">
            <table id="table-empleados" class="table table-bordered">
                <thead>
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">nombre</th>
                        <th scope="col">Apellidos</th>
                        <th scope="col">Genero</th>
                        <th scope="col">Registro Federal</th>
                        <th> Usuario </th>
                        <th scope="col">Opciones</th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${profesores}">
                        <tr>
                            <th scope="row">${it.id}</th>
                            <td>${it.nombre}</td>
                            <td>${it.apellidos}</td>
                            <td>${it.genero}</td>
                            <td>${it.registroFederal}</td>
                            <g:if test="${it.usuario == null}">
                                <td>" - - - -"</td>
                            </g:if>
                            <g:else>
                            <td>${it.usuario.username}</td>
                            </g:else>
                            <td>
                            <g:link action="evaluarProfe" id="${it.id}" controller="evaluacion"
                                params="['profe': it.id]"
                                class="btn btn-info">
                                Evaluar
                            </g:link>
                       
                            </td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
        </div>
    </div>
</div>


<content tag="scripts">
    <asset:javascript src="jquery.dataTables.min.js" />
    <asset:javascript src="dataTables.bootstrap.min.js" />

    <script type="text/javascript">
        $(function () {
            $('#table-empleados').dataTable({
                "lengthMenu": [[50, 100, -1], [50, 100, "Todos"]],
                "autoWidth": false,
                "order": [[0, "desc"]],
                "language": {
                    "emptyTable": "Sin registros",
                    "info": "Registros _START_ a _END_. Total: _TOTAL_",
                    "infoEmpty": "Sin registros por mostrar",
                    "infoFiltered": "(_MAX_ registros filtrados)",
                    "lengthMenu": "Mostrar _MENU_ registros",
                    "loadingRecords": "Cargando...",
                    "processing": "Procesando...",
                    "search": "Buscar:",
                    "zeroRecords": "No se encontraron resultados",
                    "paginate": {
                        "first": "Inicio",
                        "last": "Fin",
                        "next": "Siguiente",
                        "previous": "Anterior"
                    }
                }
            });
        });
    </script>
</content>
</g:else>
</body>
</html>