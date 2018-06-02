<!doctype html>
<html>
<head>
    <meta name="layout" content="adminLte"/>
    <title>Inicio</title>
</head>
<content tag="nav">
    <g:render template="/menuAdmin/menu"/>
</content>

 <content tag="header">
    <h1>
        Registrar Sucursal
        <small></small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${createLink(uri: '/menuAdmin/index')}"><i class="fa fa-home"></i>Inicio</a></li>
        <li><a href="${createLink(uri: '/sucursal')}"><i class="fa fa-building"></i>Sucursal</a></li>
        <li><g:link action="editar" id="${sucursal.id}" class="active"><i class="fa fa-edit"></i>Registrar Sucursal</g:link></li>
    </ol>
</content>

<g:hasErrors bean="${this.menuAdmin}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.menuAdmin}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
</g:hasErrors>


<div class="caja">
<g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
</g:if>
<g:if test="${flash.message}">
    <div class="alert alert-${flash.messageType} alert-dismissable">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <h4><i class="icon fa fa-${flash.icon}"></i>${flash.title}</h4>
        ${flash.message}
    </div>
</g:if>

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Datos de la Sucursal</h3>
    </div>
<div class="box-body">
<g:form action="save" method="POST" controller="sucursal">
            <div class="form-group">
              <label for="uno">Nombre</label>
              <input type="text" class="form-control" id="nombreSucursal" name="nombreSucursal" placeholder="Nombre..." required>
            </div>
              <div class="form-group">
              <label for="uno">Dirección</label>
              <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Nombre..." required>
            </div>
              <div class="form-group">
              <label for="uno">Clave de Escuela</label>
              <input type="text" class="form-control" id="registroClave" name="registroClave" placeholder="Nombre..." required>
            </div>

<button type="submit" class="btn btn-success"/>Guardar</button>
</g:form>
</div>
</div>
</html>
