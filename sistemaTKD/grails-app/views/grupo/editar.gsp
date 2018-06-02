<!doctype html>
<html>
<head>
    <meta name="layout" content="adminLte" />
    <title>Editar Grupo</title>
</head>
<content tag="nav">
    <g:render template="/menuAdmin/menu"/>
</content>
<content tag="header">
    <h1>
        Editar Datos del Grupo
        <small></small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${createLink(uri: '/menuAdmin/index')}"><i class="fa fa-home"></i>Inicio</a></li>
        <li><a href="${createLink(uri: '/grupo')}"><i class="fa fa-building"></i>Grupo</a></li>
        <li><g:link action="editar" id="${grupo.id}" class="active"><i class="fa fa-edit"></i>Editar Grupo</g:link></li>
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
        <h3 class="box-title">Datos del Grupo</h3>
    </div>
    <div class="box-body">
<g:form action="editar" method="POST" controller="grupo">
<div class="form-group">
  <input type="hidden" class="form-control" id="id" name="id" placeholder="Nombre..." value="${grupo.id}">
            
                          <label for="uno">Horario</label><br>
              <select class="form-control" id="horario" name="horario" placeholder="Horario...">
                <option value="14:00 a 15:00">14:00 a 15:00</option>
                <option value="15:00 a 16:00">15:00 a 16:00</option>
                <option value="16:00 a 17:00">16:00 a 17:00</option>
                <option value="17:00 a 18:00">17:00 a 18:00</option>
                <option value="18:00 a 19:00">18:00 a 19:00</option>
                <option value="Matutino">Matutino</option>
                <option value="Vespertino">Vespertino</option>
                </select>
</div>
         
<div class="form-group">
            <label for="uno">Programa</label><br>
            <select class="form-control" id="programa" name="programa" placeholder="Programa...">
                <option value="Litle Snakes">Litle Snakes</option>
                <option value="Champion Snakes">Champion Snakes</option>
                <option value="Black Snakes">Black Snakes</option>
                <option value="Lider Snakes">Lider Snakes</option>
                <option value="Challenger Snakes">Challenger Snakes</option>
                </select>
</div>

<div class="form-group">
              <label for="uno">Modalidad</label><br>
              <select class="form-control" id="modalidad" name="modalidad" placeholder="Modalidad...">
                <option value="Formas">Formas</option>
                <option value="Combate">Combate</option>
                <option value="Defensa Personal">Defensa Personal</option>
                <option value="Mixto">Mixto</option>
                </select>
</div>
          <input type="submit" class="btn btn-primary btn-block" value="Guardar" />
</g:form>
    </div>
</div>
</html>