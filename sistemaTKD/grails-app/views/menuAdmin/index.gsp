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
        Bienvenido! Administrador: <strong>${user.username}</strong>
        <small>Sistema de Evaluación Docente</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${createLink(uri: '/')}" class="active"><i class="fa fa-home"></i>Inicio</a></li>
    </ol>
</content>
<sec:access expression="hasRole('ROLE_ADMIN')">
    <div class="row">
        <div class="col-sm-6">
            <div class="small-box bg-aqua">
                <div class="inner">
                    <h3>Alumnos</h3>
                    <p>Alumnos registrados</p>
                </div>
                <div class="icon">
                    <i class="fa fa-users"></i>
                </div>
                <a href="${createLink(uri: '/alumno/index')}" class="small-box-footer">
                    Ver Alumnos <i class="fa fa-arrow-circle-right"></i>
                </a>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="small-box bg-green">
                <div class="inner">
                    <h3>Profesores</h3>
                    <p>Profesores registrados</p>
                </div>
                <div class="icon">
                    <i class="fa fa-users"></i>
                </div>
                <a href="${createLink(uri: '/profesor/index')}" class="small-box-footer">
                    Ver Profesores <i class="fa fa-arrow-circle-right"></i>
                </a>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-6">
            <div class="small-box bg-red">
                <div class="inner">
                    <h3>Sucursales</h3>
                    <p>Ver sucursales</p>
                </div>
                <div class="icon">
                    <i class="fa fa-home" aria-hidden="true"></i>
                </div>
                <a href="${createLink(uri: '/sucursal')}" class="small-box-footer">
                    Ver Sucursales <i class="fa fa-arrow-circle-right"></i>
                </a>
            </div>
        </div>

          <div class="col-sm-6">
            <div class="small-box bg-purple">
                <div class="inner">
                    <h3>Evaluación Docente</h3>
                    <p>Evaluación Docente</p>
                </div>
                <div class="icon">
                <i class="fa fa-address-book-o" aria-hidden="true"></i>
                </div>
                <a href="${createLink(uri: '/evaluacion')}" class="small-box-footer">
                    Revisar <i class="fa fa-arrow-circle-right"></i>
                </a>
            </div>
        </div>
    </div>
</sec:access>
<content tag="scripts">
</content>
</body>
</html>
