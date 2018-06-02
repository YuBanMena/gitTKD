<!doctype html>
<html>
<head>
    <meta name="layout" content="adminLte" />
    <title>Editar Sucursal</title>
</head>
<content tag="nav">
    <g:render template="/menuAdmin/menu"/>
</content>
<content tag="header">
    <h1>
        Editar Datos de la Sucursal
        <small></small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${createLink(uri: '/menuAdmin/index')}"><i class="fa fa-home"></i>Inicio</a></li>
        <li><a href="${createLink(uri: '/sucursal')}"><i class="fa fa-building"></i>Sucursal</a></li>
        <li><g:link action="editar" id="${sucursal.id}" class="active"><i class="fa fa-edit"></i>Editar Sucursal</g:link></li>
    </ol>
</content>

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
        <h3 class="box-title">Datos del Sucursal</h3>
    </div>
    <div class="box-body">
<g:form action="editar" method="POST" controller="sucursal">
<div class="form-group">
  <input type="hidden" class="form-control" id="id" name="id" placeholder="Nombre..." value="${sucursal.id}">
            
          <div class="form-group">
              <label for="uno">Nombre</label>
              <input type="text" class="form-control" id="nombreSucursal" name="nombreSucursal" placeholder="Nombre..." value="${sucursal.nombreSucursal}" required>
            </div>
              <div class="form-group">
              <label for="uno">Dirección</label>
              <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Nombre..." value="${sucursal.direccion}" required>
            </div>
              <div class="form-group">
              <label for="uno">Clave de Escuela</label>
              <input type="text" class="form-control" id="registroClave" name="registroClave" placeholder="Nombre..." value="${sucursal.registroClave}" required>
            </div>


          <input type="submit" class="btn btn-primary btn-block" value="Guardar" />
</g:form>
    </div>
</div>
</html>