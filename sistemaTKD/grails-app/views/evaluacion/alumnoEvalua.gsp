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
</content>

<g:hasErrors bean="${this.menuAdmin}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.menuAdmin}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
</g:hasErrors>


<content tag="header">
    <h1>
        Lista de Profesores de:
        <strong>${alumno.nombre} ${alumno.apellidos}</h3>
        <small>Sistema de Evaluación Docente</small>
    </h1>
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

<div class="text-center">

<g:each var="e" in="${evaluaciones}">

<g:if test="${e.calificacion==0}">

<div class="info-box">
            <span class="info-box-icon bg-purple" style="background-color:purple"><i class="fa fa-user"></i></span>
            <div class="info-box-content">
              <span class="info-box-text">
                <strong>Profesor:</strong>
                    ${e.evaluacion.profesor.nombre} ${e.evaluacion.profesor.apellidos}
                </span>
                <g:link action="alumnoEvalua2" controller="evaluacion" 
                params="['alumno': e.alumno.id,'profesor':e.evaluacion.profesor.id,'evaluacion':e.id]"
                class="btn">Evaluar
                </g:link>            
            </div>
</div>
</g:if>
</g:each>





</div>
</html>
