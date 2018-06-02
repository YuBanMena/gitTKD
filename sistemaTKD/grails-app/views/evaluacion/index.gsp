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

  <a class="btn btn-success text-dark"
                                data-toggle="modal" data-target="#modal">
                                <span class="oi oi-circle-x text-info"></span>
                                Generar Evaluación Global
  </a>

    <a class="btn btn-warning text-dark" onclick="imprimir('auto-evaluacion')">
                                <span class="oi oi-circle-x text-info"></span>
                               Imprimir Auto-Evaluaciones
  </a>


 <div class="modal fade" id="modal" tabindex="-1"
                role="dialog" aria-labelledby="tituloModal" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">

                        <div class="modal-header">
                            <h5 class="modal-title" id="tituloModal">
                                <strong>Advertencia</strong>
                            </h5>
                            <button type="button" class="close" data-dismiss="modal"
                                aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                        <div class="modal-body text-center bg-info text-white">
                            ¿Está seguro que desea generar La Evaluación Docente?<br>
                           <strong>Esta Acción Generará una evaluación por cada
                           profesor existente. Además que enviará un examen a cada
                         alumno dependiendo de sus profesores</strong>
                            <br />
                            <br>
                            Esta acción no podrá ser cancelada. Finaliza en una semana.
                            <br />
                        
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary"
                                data-dismiss="modal">Cancelar</button>
                            <g:link action="generarAllEvaluaciones" controller="evaluacion"
                                class="btn btn-success">
                                Generar Evaluación Global
                            </g:link>
                        </div>

                    </div>
                </div>
            </div>


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


<g:each var="c" in="${cuestionarios}">
<h3>Cuestionario: <strong>${c.tipo.tipo}</strong></h3>
<table class="table table-striped">
  <tr class="success">
    <td class="text-center">Pregunta</td>
    <td class="text-center">Totalmente en Desacuerdo</td>
    <td class="text-center">En desacuerdo</td>
    <td class="text-center">Neutral</td>
    <td class="text-center">De acuerdo</td>
    <td class="text-center">Totalmente De acuerdo</td>
  </tr>
    <g:each in="${vinculos}">
  <tr>
    <g:if test="${it.cuestionario.id==c.id}">
    <td>${it.pregunta.pregunta}</td>

    <td class="text-center">
      <input type="radio" name="${it.pregunta.id}" value="1"><br>
    </td>
    <td class="text-center"> 
      <input type="radio" name="${it.pregunta.id}" value="2"><br>
    </td>
    <td class="text-center">  
      <input type="radio" name="${it.pregunta.id}" value="3"><br>
    </td>
    <td class="text-center">
      <input type="radio" name="${it.pregunta.id}" value="4"><br>
    </td>
    <td class="text-center">
      <input type="radio" name="${it.pregunta.id}" value="5"><br>
    </td>
    </g:if>
  </tr> 
  </g:each>
</table>
</g:each>
<div class="text-center">
<input type="submit" class="btn btn-primary" name="">
</div>

</div>
</div>

<script>
  function imprimir(divName) {

  var datos = document.getElementById('datos');
   var printContents = document.getElementById(divName).innerHTML;
     var originalContents = document.body.innerHTML;
     document.body.innerHTML = printContents;
     window.print();
     document.body.innerHTML = originalContents;

}  

</script>



<div id="auto-evaluacion" class="hidden">
    <h2 class="text-center">Auto Evaluación Docente</h2>
    <h3>Apellidos/Nombre :______________________________________________________________ </strong></h3>
    <h4>Instrucciones:El presente cuestionario se rellena con pluma de color azul o negro. Deberás rellenar el circulo que mejor creas conveniente en cada una de las preguntas. Evita rellenar más de dos circulos por cada pregunta. Cuando termines de contestar esta auto-evaluación, regresa estos cuestionarios al aplicador. Tu ayuda es muy importante.</h4><br><br><br><br>

<table id="tabla" class="table table-striped">
<h5><strong>${cuest1.tipo.tipo}</strong></h5>

  <tr class="success">
    <td class="text-center">Pregunta</td>
    <td class="text-center">Totalmente en Desacuerdo</td>
    <td class="text-center">En desacuerdo</td>
    <td class="text-center">Neutral</td>
    <td class="text-center">De acuerdo</td>
    <td class="text-center">Totalmente De acuerdo</td>
  </tr>
    <g:each in="${preguntas1}">
  <tr>
    <td>${it.pregunta.pregunta}</td>
    <td class="text-center">
      <input type="radio" name="${it.pregunta.id}" value="1"><br>
    </td>
    <td class="text-center"> 
      <input type="radio" name="${it.pregunta.id}" value="2"><br>
    </td>
    <td class="text-center">  
      <input type="radio" name="${it.pregunta.id}" value="3"><br>
    </td>
    <td class="text-center">
      <input type="radio" name="${it.pregunta.id}" value="4"><br>
    </td>
    <td class="text-center">
      <input type="radio" name="${it.pregunta.id}" value="5"><br>
    </td>
  </tr> 
  </g:each>
</table>


<table id="tabla" class="table table-striped">
<h5><strong>${cuest2.tipo.tipo}</strong></h5>

  <tr class="success">
    <td class="text-center">Pregunta</td>
    <td class="text-center">Totalmente en Desacuerdo</td>
    <td class="text-center">En desacuerdo</td>
    <td class="text-center">Neutral</td>
    <td class="text-center">De acuerdo</td>
    <td class="text-center">Totalmente De acuerdo</td>
  </tr>
    <g:each in="${preguntas2}">
  <tr>
    <td>${it.pregunta.pregunta}</td>
    <td class="text-center">
      <input type="radio" name="${it.pregunta.id}" value="1"><br>
    </td>
    <td class="text-center"> 
      <input type="radio" name="${it.pregunta.id}" value="2"><br>
    </td>
    <td class="text-center">  
      <input type="radio" name="${it.pregunta.id}" value="3"><br>
    </td>
    <td class="text-center">
      <input type="radio" name="${it.pregunta.id}" value="4"><br>
    </td>
    <td class="text-center">
      <input type="radio" name="${it.pregunta.id}" value="5"><br>
    </td>
  </tr> 
  </g:each>
</table>

<table id="tabla" class="table table-striped">
<h5><strong>${cuest3.tipo.tipo}</strong></h5>

  <tr class="success">
    <td class="text-center">Pregunta</td>
    <td class="text-center">Totalmente en Desacuerdo</td>
    <td class="text-center">En desacuerdo</td>
    <td class="text-center">Neutral</td>
    <td class="text-center">De acuerdo</td>
    <td class="text-center">Totalmente De acuerdo</td>
  </tr>
    <g:each in="${preguntas3}">
  <tr>
    <td>${it.pregunta.pregunta}</td>
    <td class="text-center">
      <input type="radio" name="${it.pregunta.id}" value="1"><br>
    </td>
    <td class="text-center"> 
      <input type="radio" name="${it.pregunta.id}" value="2"><br>
    </td>
    <td class="text-center">  
      <input type="radio" name="${it.pregunta.id}" value="3"><br>
    </td>
    <td class="text-center">
      <input type="radio" name="${it.pregunta.id}" value="4"><br>
    </td>
    <td class="text-center">
      <input type="radio" name="${it.pregunta.id}" value="5"><br>
    </td>
  </tr> 
  </g:each>
</table>


<table id="tabla" class="table table-striped">
<h5><strong>${cuest4.tipo.tipo}</strong></h5>

  <tr class="success">
    <td class="text-center">Pregunta</td>
    <td class="text-center">Totalmente en Desacuerdo</td>
    <td class="text-center">En desacuerdo</td>
    <td class="text-center">Neutral</td>
    <td class="text-center">De acuerdo</td>
    <td class="text-center">Totalmente De acuerdo</td>
  </tr>
    <g:each in="${preguntas4}">
  <tr>
    <td>${it.pregunta.pregunta}</td>
    <td class="text-center">
      <input type="radio" name="${it.pregunta.id}" value="1"><br>
    </td>
    <td class="text-center"> 
      <input type="radio" name="${it.pregunta.id}" value="2"><br>
    </td>
    <td class="text-center">  
      <input type="radio" name="${it.pregunta.id}" value="3"><br>
    </td>
    <td class="text-center">
      <input type="radio" name="${it.pregunta.id}" value="4"><br>
    </td>
    <td class="text-center">
      <input type="radio" name="${it.pregunta.id}" value="5"><br>
    </td>
  </tr> 
  </g:each>
</table>

<table id="tabla" class="table table-striped">
<h5><strong>${cuest5.tipo.tipo}</strong></h5>

  <tr class="success">
    <td class="text-center">Pregunta</td>
    <td class="text-center">Totalmente en Desacuerdo</td>
    <td class="text-center">En desacuerdo</td>
    <td class="text-center">Neutral</td>
    <td class="text-center">De acuerdo</td>
    <td class="text-center">Totalmente De acuerdo</td>
  </tr>
    <g:each in="${preguntas5}">
  <tr>
    <td>${it.pregunta.pregunta}</td>
    <td class="text-center">
      <input type="radio" name="${it.pregunta.id}" value="1"><br>
    </td>
    <td class="text-center"> 
      <input type="radio" name="${it.pregunta.id}" value="2"><br>
    </td>
    <td class="text-center">  
      <input type="radio" name="${it.pregunta.id}" value="3"><br>
    </td>
    <td class="text-center">
      <input type="radio" name="${it.pregunta.id}" value="4"><br>
    </td>
    <td class="text-center">
      <input type="radio" name="${it.pregunta.id}" value="5"><br>
    </td>
  </tr> 
  </g:each>
</table>
<table id="tabla" class="table table-striped">
<h5><strong>${cuest6.tipo.tipo}</strong></h5>

  <tr class="success">
    <td class="text-center">Pregunta</td>
    <td class="text-center">Totalmente en Desacuerdo</td>
    <td class="text-center">En desacuerdo</td>
    <td class="text-center">Neutral</td>
    <td class="text-center">De acuerdo</td>
    <td class="text-center">Totalmente De acuerdo</td>
  </tr>
    <g:each in="${preguntas6}">
  <tr>
    <td>${it.pregunta.pregunta}</td>
    <td class="text-center">
      <input type="radio" name="${it.pregunta.id}" value="1"><br>
    </td>
    <td class="text-center"> 
      <input type="radio" name="${it.pregunta.id}" value="2"><br>
    </td>
    <td class="text-center">  
      <input type="radio" name="${it.pregunta.id}" value="3"><br>
    </td>
    <td class="text-center">
      <input type="radio" name="${it.pregunta.id}" value="4"><br>
    </td>
    <td class="text-center">
      <input type="radio" name="${it.pregunta.id}" value="5"><br>
    </td>
  </tr> 
  </g:each>
</table>
</div>

</html>
