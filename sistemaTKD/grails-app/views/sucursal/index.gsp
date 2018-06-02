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
        <h3 class="box-title">
            Lista de Sucursales
        </h3>

          <div class="pull-right">
            <a class="btn btn-success" href="${createLink(uri: "/sucursal/create")}">Registrar Sucursal</a>
        </div>
    </div>
    <div class="box-body">
        <div class="table-responsive">
            <table id="table-empleados" class="table table-bordered">
                <thead>
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Direccion</th>
                        <th scope="col">Clave de Escuela</th>
                        <th scope="col">Grupos</th>
                        <th scope="col">Opciones</th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${sucursales}">
                        <tr>
                            <th scope="row">${it.id}</th>
                            <td>${it.nombreSucursal}</td>
                            <td>${it.direccion}</td>
                            <td>${it.registroClave}</td>
                            <td>
                                <g:link action="verGrupos" id="${it.id}" class="btn btn-primary"><span class="fa fa-edit"></span> Ver Grupos
                                </g:link>
                            <td>
                            <g:link action="editar" id="${it.id}" class="btn btn-warning"><span class="fa fa-edit"></span> Editar
                            </g:link>
                            <a class="btn btn-danger text-dark"
                                data-toggle="modal" data-target="#modal${it.id}">
                                <span class="oi oi-circle-x text-info"></span>
                                Eliminar
                            </a>
                            </td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
        </div>
    </div>
</div>


<g:each in="${sucursales}" var="sucursal">
            <div class="modal fade" id="modal${sucursal.id}" tabindex="-1"
                role="dialog" aria-labelledby="tituloModal" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">

                        <div class="modal-header">
                            <h5 class="modal-title" id="tituloModal">
                                <strong>Advertencia</strong>
                            </h5>
                            <button type="button" class="close" data-dismiss="modal"
                                aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                        <div class="modal-body text-center bg-danger text-white">
                            ¿Está seguro que desea Eliminar este registro?<br>
                            "${sucursal.nombreSucursal} <strong>(${sucursal.registroClave} </strong>)"?
                            <br />
                            <br />
                        
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary"
                                data-dismiss="modal">Cancelar</button>
                            <g:link action="eliminar" id="${sucursal.id}" controller="sucursal"
                                params="['sucursal': sucursal.id]"
                                class="btn btn-danger">
                                Eliminar
                            </g:link>
                        </div>

                    </div>
                </div>
            </div>
        </g:each>



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
