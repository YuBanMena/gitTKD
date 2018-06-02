<!doctype html>
<html>
<head>
    <meta name="layout" content="adminLte"/>
    <title>Inicio</title>
     <asset:stylesheet src="dataTables.bootstrap.min.css" />

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

<body>

<script>

Array.prototype.unique=function(a){
  return function(){return this.filter(a)}}(function(a,b,c){return c.indexOf(a,b+1)<0
});


function getNumeros(){
  var aux =[];
  var padre = document.querySelector('#tabla');
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

<h1>${cuest.tipo.tipo}</h1>
<h4>Evaluando a : <strong>${profesor.nombre} ${profesor.apellidos}</strong></h4>
<table id="tabla" class="table table-striped">
  <tr class="success">
    <td class="text-center">Pregunta</td>
    <td class="text-center">Totalmente en Desacuerdo</td>
    <td class="text-center">En desacuerdo</td>
    <td class="text-center">Neutral</td>
    <td class="text-center">De acuerdo</td>
    <td class="text-center">Totalmente De acuerdo</td>
  </tr>
    <g:each in="${preguntas}">
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
<div class="text-center">
         <g:form action="registrarCalificacion" method="POST" controller="evaluacion">
           <input type="hidden" id="total" name="total">
           <input type="hidden" id="profesor" name="profesor" value="${profesor.id}">
           <input type="hidden" id="tipo" name="tipo" value="5">
            <g:submitButton id="botoncito"class="btn btn-primary" name="next" value="Enviar" onclick="return ver()"></g:submitButton>  
         </g:form>
</div>

</body>
</html>