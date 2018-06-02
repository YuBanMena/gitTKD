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
    <ol class="breadcrumb">
        <li><a href="${createLink(uri: '/menuAdmin/index')}"><i class="fa fa-home"></i>Inicio</a></li>
        <li><a href="${createLink(uri: '/sucursal/index')}"><i class="fa fa-building"></i>Sucursal</a></li>
    </ol>
</content>
<br>
<g:if test="${flash.message}">
    <div class="alert alert-${flash.messageType} alert-dismissable">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <h4><i class="icon fa fa-${flash.icon}"></i>${flash.title}</h4>
        ${flash.message}
    </div>
</g:if>
<br>

<div class="box box-danger">
    <div class="box-header with-border">
        <h1 class="box-title">
            Lista de Grupos del Profesor: <strong>${profe.nombre} ${profe.apellidos}</strong>
        </h1>
    </div>
    <div class="box-body">
        <div class="table-responsive">
            <table id="table-empleados" class="table table-bordered">
                <thead>
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Sucursal</th>
                        <th scope="col">Profesor</th>
                        <th scope="col">Horario</th>
                        <th scope="col">Modalidad</th>
                        <th scope="col">Programa</th>
                        <th scope="col">Opciones</th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${grupos}">
                        <tr>
                            <th scope="row">${it.id}</th>
                            <td>${it.sucursalDelGrupo.nombreSucursal}</td>
                            <td>${it.profesorDelGrupo.nombre} ${it.profesorDelGrupo.apellidos} </td>
                            <td>${it.horario}</td>
                            <td>${it.modalidad}</td>
                            <td>${it.programa}</td>
                            <td>
                                <g:link action="verDetalle" controller="grupo" id="${it.id}" class="btn btn-primary"><span class="fa fa-edit"></span> Ver Detalles
                                </g:link>
                            <td>
                            
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
</html>