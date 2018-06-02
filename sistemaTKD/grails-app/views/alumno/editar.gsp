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
        Editar Alumno
        <small></small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${createLink(uri: '/menuAdmin/index')}"><i class="fa fa-home"></i>Inicio</a></li>
        <li><a href="${createLink(uri: '/alumno')}"><i class="fa fa-building"></i>Alumno</a></li>
        <li><g:link action="editar" id="${alumno.id}" class="active"><i class="fa fa-edit"></i>EditarAlumno</g:link></li>
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
        <h3 class="box-title">Datos del Alumno</h3>
    </div>
<div class="box-body">
<g:form action="editar" method="POST" controller="alumno">
<div class="col-md-6">
            <div class="form-group">
            <input type="hidden" class="form-control" id="id" name="id" placeholder="" value="${alumno.id}">
              <label for="uno">Nombre</label>
              <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre..." value="${alumno.nombre}" required>
            </div>
             <div class="form-group">
              <label for="uno">Apellidos</label>
              <input type="text" class="form-control" id="apellidos" name="apellidos" placeholder="Apellidos..." value="${alumno.apellidos}" required>
            </div>
            <div class="form-group">
              <label for="uno">Edad</label>
              <input type="number" class="form-control" id="edad" name="edad" placeholder="Edad..." value="${alumno.edad}" required>
            </div>
            <div class="form-group">
            <label for="uno">Genero</label><br>
            <select class="form-control" id="genero" name="genero" placeholder="Genero...">
              <g:if test="${alumno.genero == 'Masculino'}">
              <option selected value="Masculino">Masculino</option>
              <option value="Femenino">Femenino</option>
              </g:if>
              <g:if test="${alumno.genero == 'Femenino'}">
              <option value="Masculino">Masculino</option>
              <option value="Femenino" selected>Femenino</option>
              </g:if>
              </select>
          </div>
             <div class="form-group">
              <label for="uno">RIF</label>
              <input type="text" class="form-control" id="rifAnual" name="rifAnual" placeholder="Registro Federal..." value="${alumno.rifAnual}" required>
            </div>
            <div class="form-group">
              <label for="uno">Dirección</label>
              <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Dirección..." value="${alumno.direccion}" required>
            </div>

            <div class="form-group">
              <label for="uno">Telefono</label>
              <input type="number" class="form-control" id="telefono" name="telefono" placeholder="Teléfono..." value="${alumno.telefono}" required>
            </div>
            <div class="form-group">
              <label for="uno">Grado</label><br>
              <select class="form-control" id="gradoCinta" name="gradoCinta" placeholder="Grado...">
                <g:each in="${grados}">
                <g:if test="${it.id == alumno.gradoCinta.id}">
                <option selected value="${it.id}">${it.nombreGrado}</option>
                </g:if>
                <option value="${it.id}">${it.nombreGrado}</option>
                </g:each>
              </select>
            </div>
          <input type="hidden" class="form-control" id="user2" name="user2" placeholder="Usuario..." value="${alumno.usuario.username}">

            <div class="form-group">
                <label for="user">Usuario</label>
                <input type="text" class="form-control" value="${alumno.usuario.username}" id="user" name="user" placeholder="Usuario..." required>
          </div>
            
  <button type="submit" class="btn btn-success"/>Guardar</button>
</g:form>
</div>
</div>
</html>
