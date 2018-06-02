 required<!doctype html>
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
        Registrar Profesor
        <small></small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${createLink(uri: '/menuAdmin/index')}"><i class="fa fa-home"></i>Inicio</a></li>
        <li><a href="${createLink(uri: '/profesor')}"><i class="fa fa-building"></i>Profesor</a></li>
        <li><g:link action="editar" id="${profesor.id}" class="active"><i class="fa fa-edit"></i>Registrar Profesor</g:link></li>
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
        <h3 class="box-title">Datos del Profesor</h3>
    </div>
<div class="box-body">
<g:form action="save" method="POST" controller="profesor">
<div class="col-md-6">
  <div class="form-group">
    <input type="hidden" class="form-control" id="id" name="id" placeholder="Nombre...">
              <label for="uno">Nombre</label>
              <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre..." required>
            </div>
             <div class="form-group">
              <label for="uno">Apellidos</label>
              <input type="text" class="form-control" id="apellidos" name="apellidos" placeholder="Apellidos..." required>
            </div>
            <div class="form-group">
              <label for="uno">Genero</label><br>
              <select class="form-control" id="genero" name="genero" placeholder="Genero...">
                <option value="Masculino">Masculino</option>
                <option value="Femenino">Femenino</option>
                
                </select>
            </div>
             <div class="form-group">
              <label for="uno">Registro Federal</label>
              <input type="text" class="form-control" id="registroFederal" name="registroFederal" placeholder="Registro Federal..."  required>
            </div>
          
                <div class="form-group">
                <label for="user">Usuario</label>
                <input type="text" class="form-control" id="user" name="user" placeholder="Usuario..." required>
              </div>
                <div class="form-group">
                <label for="pass">Contraseña</label>
                <input type="text" class="form-control" id="contra" name="contra" placeholder="Contrasena..." required>
                </div>
  <button type="submit" class="btn btn-success"/>Guardar</button>
</g:form>
</div>
</div>
</html>
