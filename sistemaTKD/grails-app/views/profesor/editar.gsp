 required<!doctype html>
<html>
<head>
    <meta name="layout" content="adminLte" />
    <title>Editar Profesor</title>
</head>
<content tag="nav">
    <g:render template="/menuAdmin/menu"/>
</content>
<content tag="header">
    <h1>
        Editar Datos de Profesor
        <small></small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${createLink(uri: '/menuAdmin/index')}"><i class="fa fa-home"></i>Inicio</a></li>
        <li><a href="${createLink(uri: '/profesor')}"><i class="fa fa-building"></i>Profesor</a></li>
        <li><g:link action="editar" id="${profesor.id}" class="active"><i class="fa fa-edit"></i>Editar Profesor</g:link></li>
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
        <h3 class="box-title">Datos del Profesor</h3>
    </div>
    <div class="box-body">
<g:form action="editar" method="POST" controller="profesor">
<div class="form-group">
  <input type="hidden" class="form-control" id="id" name="id" placeholder="Nombre..." value="${profesor.id}">
            <label for="uno">Nombre</label>
            <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre..." value="${profesor.nombre}" required>
          </div>
           <div class="form-group">
            <label for="uno">Apellidos</label>
            <input type="text" class="form-control" id="apellidos" name="apellidos" placeholder="Apellidos..."value="${profesor.apellidos}" required>
          </div>
          <div class="form-group">
            <label for="uno">Genero</label><br>
            <select class="form-control" id="genero" name="genero" placeholder="Genero...">
              <g:if test="${profesor.genero == 'Masculino'}">
              <option selected value="Masculino">Masculino</option>
              <option value="Femenino">Femenino</option>
              </g:if>
              <g:if test="${profesor.genero == 'Femenino'}">
              <option value="Masculino">Masculino</option>
              <option value="Femenino" selected>Femenino</option>
              </g:if>
              </select>
          </div>
           <div class="form-group">
            <label for="uno">Registro Federal</label>
            <input type="text" class="form-control" id="registroFederal" name="registroFederal" placeholder="Registro Federal..." value="${profesor.registroFederal}" required>
          </div>
          
          <input type="hidden" class="form-control" id="user2" name="user2" placeholder="Usuario..." value="${profesor.usuario.username}">

          <div class="form-group">
                <label for="user">Usuario</label>
                <input type="text" class="form-control" value="${profesor.usuario.username}" id="user" name="user" placeholder="Usuario..." required>
          </div>
          <input type="submit" class="btn btn-primary btn-block" value="Guardar" />
</g:form>
    </div>
</div>
</html>