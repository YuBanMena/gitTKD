<!doctype html>
<html>
<head>
    <meta name="layout" content="adminLte"/>
    <title>Inicio</title>
</head>
<body>

<content tag="nav">
    <g:render template="/menuAdmin/menu"/>
</content>

<content tag="header">
    <h1>
        Bienvenido! Docente: 
        <small>Sistema de Evaluación Docente</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${createLink(uri: '/')}" class="active"><i class="fa fa-home"></i>Inicio</a></li>
    </ol>
</content>
<sec:access expression="hasRole('ROLE_DOCENTE')">
    <div class="row">
        <div class="col-sm-12">
            <div class="small-box bg-red">
                <div class="inner">
                    <h3>Mis Sucursales</h3>
                    <p>Ver Sucursales asignadas</p>
                </div>
                <div class="icon">
                    <i class="fa  fa-cubes"></i>
                </div>
                <a href="${createLink(uri: '/sucursal/sucursalesProfesor')}" class="small-box-footer">
                    Ver sucursales <i class="fa fa-arrow-circle-right"></i>
                </a>
            </div>
        </div>
    </div>


     <div class="row">
        <div class="col-sm-12">
            <div class="small-box bg-purple">
                <div class="inner">
                    <h3>Evaluación Docente</h3>
                    <p>Evaluar a los docentes deportivos</p>
                </div>
                <div class="icon">
                    <i class="fa fa-hand-o-down"></i>
                </div>
                <a href="${createLink(uri: '/evaluacion/evaluacionProfes')}" class="small-box-footer">
                    Evaluar<i class="fa fa-arrow-circle-right"></i>
                </a>
            </div>
        </div>
    </div>
</sec:access>
<content tag="scripts">
</content>


</body>
</html>
