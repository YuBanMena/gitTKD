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
<h4>Evaluacion: (${evaluacion.id}) por Alumno:<strong>${evaluacion.alumno.nombre} ${evaluacion.alumno.apellidos} de edad: ${evaluacion.alumno.edad}</strong> </h4>
<h4>Evaluando a : <strong> ${evaluacion.evaluacion.profesor.nombre}  ${evaluacion.evaluacion.profesor.apellidos}</strong> </h4> 
<h2>Cuestionario <strong></strong> </h2>
<h4>Por favor contesta estas preguntas. Tu ayuda es muy importante.</h4>
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

<script>
  
function sumatoria (element){

var padre = document.querySelector('#cajasocultas');
  var inputs = padre.querySelectorAll('input');
  var sumatoria=0;
  for(i=0;i<inputs.length;i++) {
      sumatoria=sumatoria+parseInt(inputs[i].value);
  }

alert("sumatoria:"+sumatoria);
document.getElementById("total").value=parseInt(sumatoria);
}
</script>


<g:if test="${evaluacion.alumno.edad<=9}">
<form id="cajasocultas"name ="cajasocultas">
<input type="hidden" name="77" id="77" value="2">
<input type="hidden" name="78" id="78" value="2">
<input type="hidden" name="79" id="79" value="2">
<input type="hidden" name="80" id="80" value="2">
<input type="hidden" name="81" id="81" value="2">
<input type="hidden" name="82" id="82" value="2">
<input type="hidden" name="83" id="83" value="2">
<input type="hidden" name="84" id="84" value="2">
</form>
<g:each var="p" in="${preguntas79}">
<div class="row">
  <div class="col-md-4 col-md-offset-4">

          <div>
          <h4 class="text-center"><strong>${p.pregunta.id}${p.pregunta.pregunta}</strong></h4>
          </div>
        
        <div class="col-md-4 col-md-offset-4">
            <div id="div2" nam e="div2"class="div2 text-center">
                      <div name="hola"class="div1"><br>
                        <input type="radio" name="${p.pregunta.id}" value="3" onclick="cambiarColor1(this)">
                      </div>
                      <div  class="div1"><br>
                        <input type="radio" name="${p.pregunta.id}" value="2" onclick="cambiarColor2(this)">
                      </div>
                      <div class="div1"><br>
                        <input type="radio" name="${p.pregunta.id}" value="1" onclick="cambiarColor3(this)">
                      </div>
            </div>
        </div>
  </div>
</div>
  </g:each>
<br>
<center>
         <g:form action="registrarEvaluacionAlumno79" method="POST" controller="evaluacion">
           <input type="hidden" name="evaluacion" value="${evaluacion.id}">
           <input type="text" id="total" name="total">
           <input class="btn btn-success" onclick="sumatoria(document.cajasocultas)" type="submit">
         </g:form>
</center>
</div>

<script>
  
  this.colores = {
        rojo: "rgb(255, 29, 29)",
        amarillo: "rgb(255, 235, 29)",
        verde: "rgb(35, 253, 0)",
        blanco:"rgb(255, 255, 255)"
      };

  function cambiarColor1(element){
    var parent0 = element.name;
    var cajaAux = document.getElementById(parent0);
    var parent =element.parentNode.parentNode;
    var divs= parent.getElementsByTagName("div");
    var circulo1 = parent.getElementsByTagName("div")[0];
    var circulo2 = parent.getElementsByTagName("div")[1];
    var circulo3 = parent.getElementsByTagName("div")[2];

    cajaAux.value=3;
    circulo1.style.background = this.colores.verde;
    circulo2.style.background = this.colores.blanco;
    circulo3.style.background = this.colores.blanco;
    //alert("Valor:"+cajaAux.value);
  }
   function cambiarColor2(element){
    var parent0 = element.name;
    var cajaAux = document.getElementById(parent0);
    var parent =element.parentNode.parentNode;
    var divs= parent.getElementsByTagName("div");
    var circulo1 = parent.getElementsByTagName("div")[0];
    var circulo2 = parent.getElementsByTagName("div")[1];
    var circulo3 = parent.getElementsByTagName("div")[2];
    cajaAux.value=2;
    circulo1.style.background = this.colores.blanco;
    circulo2.style.background = this.colores.amarillo;
    circulo3.style.background = this.colores.blanco;
    //alert("Valor:"+cajaAux.value);
  }
   function cambiarColor3(element){
    var parent0 = element.name;
    var cajaAux = document.getElementById(parent0);
    var parent =element.parentNode.parentNode;
    var divs= parent.getElementsByTagName("div");
    var circulo1 = parent.getElementsByTagName("div")[0];
    var circulo2 = parent.getElementsByTagName("div")[1];
    var circulo3 = parent.getElementsByTagName("div")[2];
    cajaAux.value=1;
    circulo1.style.background = this.colores.blanco;
    circulo2.style.background = this.colores.blanco;
    circulo3.style.background = this.colores.rojo;
    //alert("Valor:"+cajaAux.value);
  }
</script>
</g:if>




<script>

Array.prototype.unique=function(a){
  return function(){return this.filter(a)}}(function(a,b,c){return c.indexOf(a,b+1)<0
});


function getNumeros(){
  var aux =[];
  var padre = document.querySelector('#tabla2');
  var inputs = padre.querySelectorAll('input');
  for(i=0;i<inputs.length;i++) {
      console.log(inputs[i])
      aux.push(inputs[i].name);

  }
  var numeros = aux.unique();
  //alert(numeros);
  return numeros;
}

  
function ver(){
if(comprobar()!=true){
  alert("Te falta un campo por rellenar")
  return false;
}
else{
  var arreglo =getNumeros();
  var calificaciones=[];
  arreglo.forEach( function(valor, indice, array) {
    var radios = document.getElementsByName(valor); 
      for(i=0;i<radios.length;i++) 
        if (radios[i].checked) { 
            valor = radios[i].value;
            calificaciones.push(parseInt(valor)); 
            return; 
        }  
  });
 var sum = calificaciones.reduce((x, y) => x + y);
    document.getElementById("total").value=sum;
    alert("calificaciones es:"+calificaciones+"="+sum);
    document.getElementById('botoncito').submit();
  }
}


function comprobar(){
   var seleccionado = false;
   var arreglo =getNumeros();
   var calificaciones=[];
   var trues =[];
   

   arreglo.forEach( function(valor, indice, array) {
      var radios = document.getElementsByName(valor);
       for(i=0;i<radios.length;i++){ 
           console.log("Radio "+i+" esta: "+radios[i].checked)
           if(radios[i].checked){
            trues.push(radios[i].checked);
           }
        } 
  });

   if(trues.length<arreglo.length)
   return false
   else
    return true
}

</script>



<g:if test="${evaluacion.alumno.edad>=10 && evaluacion.alumno.edad<=12}">

<table id="tabla2" class="table table-striped">
  <tr class="success">
    <td class="text-center">Pregunta</td>
    <td class="text-center">Si</td>
    <td class="text-center">Aveces</td>
    <td class="text-center">No</td>
  </tr>
  <g:each var="p" in="${preguntas1013}">
  <tr>
    <td>(${p.pregunta.id})${p.pregunta.pregunta}</td>
    <td class="text-center">
      <input type="radio" id="${p.pregunta.id}" name="${p.pregunta.id}" value="3"><br>
    </td>
    <td class="text-center"> 
      <input type="radio" id="${p.pregunta.id}" name="${p.pregunta.id}" value="2"><br>
    </td>
    <td class="text-center">  
      <input type="radio" id="${p.pregunta.id}" name="${p.pregunta.id}" value="1"><br>
    </td>
  </tr>
    </g:each>
</center>
</table>
<center>
        <g:form action="registrarEvaluacionAlumno79" method="POST" controller="evaluacion">
           <input type="hidden" name="evaluacion" value="${evaluacion.id}">
           <input type="hidden" id="total" name="total">
            <g:submitButton id="botoncito"class="btn btn-primary" name="next" value="Next" onclick="return ver()"></g:submitButton>  
         </g:form>
</center>


</g:if>

<g:if test="${evaluacion.alumno.edad>=13}">
<table id="tabla2" class="table table-striped">
  <tr class="success">
    <td class="text-center">Pregunta</td>
    <td class="text-center">Nunca</td>
    <td class="text-center">Casi Nunca</td>
    <td class="text-center">A veces</td>
    <td class="text-center">Siempre</td>
  </tr>
  <g:each var="p" in="${preguntas}">
  <tr>
    <td>${p.pregunta.id}${p.pregunta.pregunta}</td>
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
      <input type="radio" name="${p.pregunta.id}" value="4"><br>
    </td>
  </tr>
    </g:each>
 
</table>
<center>
         <g:form action="registrarEvaluacionAlumno1012" method="POST" controller="evaluacion">
           <input type="hidden" name="evaluacion" value="${evaluacion.id}">
           <input type="hidden" id="total" name="total">
            <g:submitButton id="botoncito"class="btn btn-primary" name="next" value="Next" onclick="return ver()"></g:submitButton>  

         </g:form>
</center>

</g:if>

</div>
</html>
