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


<a href="${createLink(uri: '/evaluacion/evaluacionAlumno79')}" class="btn btn-primary">Evaluación Alumno 7 - 9</a>
<a href="${createLink(uri: '/evaluacion/evaluacionAlumno1012')}" class="btn btn-primary">Evaluación Alumno 10-12</a>
<a href="${createLink(uri: '/evaluacion/evaluacionAlumnoSecundaria')}" class="btn btn-primary">Evaluación Alumno Secundaria</a>



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
<h2>Cuestionario <strong>${cuest.tipo.tipo}</strong> </h2>
<h3>Por favor contesta estas preguntas. Tu ayuda es muy importante.</h3>
<h4>Contesta con la verdad. Marca el semáforo que mejor creas conveniente.</h4>
</div>

<table class="table table-striped">
  <tr class="success">
    <td class="text-center">Pregunta</td>
    <td class="text-center">Nunca</td>
    <td class="text-center">Casi Nunca</td>
    <td class="text-center">A veces</td>
    <td class="text-center">Siempre</td>
  </tr>
  <g:each var="p" in="${preguntas}">
  <tr>
    <td>${p.pregunta.pregunta}</td>
    <td class="text-center">
      <input type="radio" name="${p.pregunta.id}" value="1"><br>
    </td>
    <td class="text-center"> 
      <input type="radio" name="${p.pregunta.id}" value="2"><br>
    </td>
    <td class="text-center">  
      <input type="radio" name="${p.pregunta.id}" value="3"><br>
    </td>
    <td class="text-center">  
      <input type="radio" name="${p.pregunta.id}" value="3"><br>
    </td>
  </tr>
    </g:each>
 
</table>
<div class="text-center">
<input type="submit" class="btn btn-primary" name="">
</div>

</div>
</html>