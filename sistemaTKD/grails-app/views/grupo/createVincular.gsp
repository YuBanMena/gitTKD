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
        Registrar Alumno en grupo ${grupo.id}
        <small></small>
    </h1>
    
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
        <h3 class="box-title">Datos del Alumno</h3>
    </div>
<div class="box-body">
<g:form action="storeAlumnoAGrupo" method="POST" controller="grupo">
<div class="col-md-6">

        <input type="hidden" id="grupo" name="grupo" value="${grupo.id}">

            <div class="form-group">
            <input type="hidden" class="form-control" id="id" name="id" placeholder="Nombre...">
              <label for="uno">Nombre</label>
              <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre...">
            </div>
             <div class="form-group">
              <label for="uno">Apellidos</label>
              <input type="text" class="form-control" id="apellidos" name="apellidos" placeholder="Apellidos...">
            </div>
            <div class="form-group">
              <label for="uno">Edad</label>
              <input type="number" class="form-control" id="edad" name="edad" placeholder="Edad...">
            </div>
            <div class="form-group">
              <label for="uno">Genero</label><br>
              <select class="form-control" id="genero" name="genero" placeholder="Genero...">
                <option value="Masculino">Masculino</option>
                <option value="Femenino">Femenino</option>
              </select>
            </div>
             <div class="form-group">
              <label for="uno">RIF</label>
              <input type="text" class="form-control" id="rifAnual" name="rifAnual" placeholder="Registro Federal..." >
            </div>
            <div class="form-group">
              <label for="uno">Dirección</label>
              <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Dirección..." >
            </div>

            <div class="form-group">
              <label for="uno">Telefono</label>
              <input type="number" class="form-control" id="telefono" name="telefono" placeholder="Teléfono..." >
            </div>
            <div class="form-group">
              <label for="uno">Grado</label><br>
              <select class="form-control" id="gradoCinta" name="gradoCinta" placeholder="Grado...">
                <g:each in="${grados}">
                <option value="${it.id}">${it.nombreGrado}</option>
                </g:each>
              </select>
            </div>

            <h4>Datos de Cuenta a Portal </h4>
                <div class="form-group">
                <label for="user">Usuario</label>
                <input type="text" class="form-control" id="user" name="user" placeholder="Usuario...">
              </div>
                <div class="form-group">
                <label for="pass">Contraseña</label>
                <input type="text" class="form-control" id="contra" name="contra" placeholder="Contrasena...">
                </div>
  <button type="submit" class="btn btn-success"/>Guardar</button>
</g:form>
</div>
</div>
</html>
