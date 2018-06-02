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
<h2>Cuestionario</h2>
<h3>Por favor contesta estas preguntas. Tu ayuda es muy importante.</h3>
<h4>Contesta con la verdad. Marca el semáforo que mejor creas conveniente.</h4>
</div>

<style>
.div2{
  border: 1px solid #17202A;
  background-color: #17202A;
  border-radius:30px;
}
.div1{
  width: 50px;
  height: 50px;
  border: 1px solid black;
  margin: 1em;
  border-radius: 50%;
  background-color: white;
}
</style>

<g:set var="counter" value="${0}" />
<g:each var="p" in="${preguntas}">
<g:set var="counter" value="${counter + 1}" />
<div class="row">

  <div class="col-md-4 col-md-offset-4">
          <div>
          <h4 class="text-center">${p.pregunta.pregunta}</h4>
          </div>
        <div class="col-md-4 col-md-offset-4">
            <div id="div2" name="div2"class="div2 text-center">
                      <div name="hola"class="div1"><br>
                        <input type="radio" name="${p.pregunta.id}" value="1" onclick="cambiarColor1(this)">
                      </div>
                      <div  class="div1"><br>
                        <input type="radio" name="${p.pregunta.id}" value="1" onclick="cambiarColor2(this)">
                      </div>
                      <div class="div1"><br>
                        <input type="radio" name="${p.pregunta.id}" value="1" onclick="cambiarColor3(this)">
                      </div>
            </div>
        </div>
  </div>
</div>
  </g:each>
</div>

<script>
  
  this.colores = {
        rojo: "rgb(255, 29, 29)",
        amarillo: "rgb(255, 235, 29)",
        verde: "rgb(35, 253, 0)",
        blanco:"rgb(255, 255, 255)"
      };

  function cambiarColor1(element){
    var parent =element.parentNode.parentNode;
    var divs= parent.getElementsByTagName("div");
    var circulo1 = parent.getElementsByTagName("div")[0];
    var circulo2 = parent.getElementsByTagName("div")[1];
    var circulo3 = parent.getElementsByTagName("div")[2];
    circulo1.style.background = this.colores.verde;
    circulo2.style.background = this.colores.blanco;
    circulo3.style.background = this.colores.blanco;
    

  }
   function cambiarColor2(element){
    var parent =element.parentNode.parentNode;
    var divs= parent.getElementsByTagName("div");
    var circulo1 = parent.getElementsByTagName("div")[0];
    var circulo2 = parent.getElementsByTagName("div")[1];
    var circulo3 = parent.getElementsByTagName("div")[2];
    circulo1.style.background = this.colores.blanco;
    circulo2.style.background = this.colores.amarillo;
    circulo3.style.background = this.colores.blanco;
  }
   function cambiarColor3(element){
    var parent =element.parentNode.parentNode;
    var divs= parent.getElementsByTagName("div");
    var circulo1 = parent.getElementsByTagName("div")[0];
    var circulo2 = parent.getElementsByTagName("div")[1];
    var circulo3 = parent.getElementsByTagName("div")[2];
    circulo1.style.background = this.colores.blanco;
    circulo2.style.background = this.colores.blanco;
    circulo3.style.background = this.colores.rojo;
  }
</script>



</html>
