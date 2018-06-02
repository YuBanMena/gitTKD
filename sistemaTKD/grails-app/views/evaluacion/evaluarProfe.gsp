<!doctype html>
<html>
<head>
    <meta name="layout" content="adminLte"/>
    <title>Inicio</title>
     <asset:stylesheet src="dataTables.bootstrap.min.css" />
     <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
      <script src="http://www.chartjs.org/samples/latest/utils.js"></script>
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
  <div id="datos">
	<h2>Evaluación Docente a:</h2>
<h3><strong>${profesor.nombre} </strong>${profesor.apellidos}</h3>
</div>

<div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Opciones de Impresión</h3>
            </div>
            <div class="box-body">
              <button  onclick="printDiv('tabla1')" type="button" class="btn btn-default" >
                Imprimir Tabla de Calificaciones
              </button>
              <button  onclick="printDiv('alumnos1')" type="button" class="btn btn-info" >
               Evaluaciones de Alumnos  7 -  9 años
              </button>
              <button onclick="printDiv('alumnos2')"  type="button" class="btn btn-danger">
              Evaluaciones de Alumnos   10 - 12  años    
            </button>
              <button onclick="printDiv('alumnos3')" type="button" class="btn btn-warning">
              Evaluaciones de Alumnos   mayores a 13 años           
            </button>
            </div>
          </div>

<div class="row">
  <div class="col-md-4">
  	<div class="small-box bg-aqua">
            <div class="inner">
              <h3>1</h3>

              <p>Practica Docente</p>
            </div>
            <div class="icon">
              <i class="fa fa-user"></i>
            </div>

         <g:link action="evalPracticaDocente" id="${profesor.id}" controller="evaluacion"
                                params="['profe': profesor.id]"
                                class="small-box-footer">
                                Evaluar<i class="fa fa-arrow-circle-right"></i>
          </g:link>
            
          </div>
  </div>
  <div class="col-md-4">
  	<div class="small-box bg-red">
            <div class="inner">
              <h3>2</h3>

              <p>Reglamento y Normativas</p>
            </div>
            <div class="icon">
              <i class="fa fa-file-text"></i>
            </div>
            <g:link action="evalReglamento" id="${profesor.id}" controller="evaluacion"
                                params="['profe': profesor.id]"
                                class="small-box-footer">
                                Evaluar<i class="fa fa-arrow-circle-right"></i>
          </g:link>
          </div>
  	
  </div>
  <div class="col-md-4">
  	<div class="small-box bg-yellow">
            <div class="inner">
              <h3>3</h3>

              <p>Gestión Educativa</p>
            </div>
            <div class="icon">
              <i class="fa fa-file-text"></i>
            </div>
             <g:link action="evalGestion" id="${profesor.id}" controller="evaluacion"
                                params="['profe': profesor.id]"
                                class="small-box-footer">
                                Evaluar<i class="fa fa-arrow-circle-right"></i>
          </g:link>
            
          </div>
  	
  </div>

</div>
<div class="row">
	<div class="col-md-4">
  	<div class="small-box bg-yellow">
            <div class="inner">
              <h3>4</h3>

              <p>Ambiente y convivencia</p>
            </div>
            <div class="icon">
              <i class="fa fa-file-text"></i>
            </div>
            <g:link action="evalAmbiente" id="${profesor.id}" controller="evaluacion"
                                params="['profe': profesor.id]"
                                class="small-box-footer">
                                Evaluar<i class="fa fa-arrow-circle-right"></i>
          </g:link>
          </div>
  	
  </div>
  <div class="col-md-4">
  	<div class="small-box bg-green">
            <div class="inner">
              <h3>5</h3>

              <p>Padres de Familia</p>
            </div>
            <div class="icon">
              <i class="fa fa-users"></i>
            </div>
            <g:link action="evalPadres" id="${profesor.id}" controller="evaluacion"
                                params="['profe': profesor.id]"
                                class="small-box-footer">
                                Evaluar<i class="fa fa-arrow-circle-right"></i>
          </g:link>
            
          </div>
  </div>
  <div class="col-md-4">
  	<div class="small-box bg-aqua">
            <div class="inner">
              <h3>6</h3>

              <p>Consideraciones Culturales</p>
            </div>
            <div class="icon">
              <i class="fa fa-file-text"></i>
            </div>
            <g:link action="evalConsideraciones" id="${profesor.id}" controller="evaluacion"
                                params="['profe': profesor.id]"
                                class="small-box-footer">
                                Evaluar<i class="fa fa-arrow-circle-right"></i>
          </g:link>
          </div>
  </div>
</div>

<h1>


<div id="tabla1" class="box-body">
  <h2>Evaluación Docente a:</h2>
<h3><strong>${profesor.nombre} </strong>${profesor.apellidos}</h3>
              <table class="table table-bordered">
                <tbody><tr>
                  <th style="width: 10px">#</th>
                  <th>Evaluación</th>
                  <th>Calificación</th>
                  <th style="width: 40px">#</th>
                </tr>
                <tr>
                  <td>${ce1.evaluacion.id}</td>
                  <td>${ce1.cuestionario.tipo.tipo}</td>
                  <td>
                    <div class="progress progress-xs">
                      <div class="progress-bar progress-bar-danger" style="width: 55%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-red">${ce1.calificacion}</span></td>
                </tr>

                <tr>
                  <td>${ce2.evaluacion.id}</td>
                  <td>${ce2.cuestionario.tipo.tipo}</td>
                  <td>
                    <div class="progress progress-xs">
                      <div class="progress-bar progress-bar-warning" style="width: 55%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-yellow">${ce2.calificacion}</span></td>
                </tr>
                <tr>
                  <td>${ce3.evaluacion.id}</td>
                  <td>${ce3.cuestionario.tipo.tipo}</td>
                  <td>
                    <div class="progress progress-xs">
                      <div class="progress-bar progress-bar-success" style="width: 55%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-green">${ce3.calificacion}</span></td>
                </tr>
                <tr>
                  <td>${ce4.evaluacion.id}</td>
                  <td>${ce4.cuestionario.tipo.tipo}</td>
                  <td>
                    <div class="progress progress-xs">
                      <div class="progress-bar progress-bar-primary" style="width: 55%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-blue">${ce4.calificacion}</span></td>
                </tr>
                <tr>
                  <td>${ce5.evaluacion.id}</td>
                  <td>${ce5.cuestionario.tipo.tipo}</td>
                  <td>
                    <div class="progress progress-xs">
                      <div class="progress-bar progress-bar-info" style="width: 55%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-aqua">${ce5.calificacion}</span></td>
                </tr>
                <tr>
                  <td>${ce6.evaluacion.id}</td>
                  <td>${ce6.cuestionario.tipo.tipo}</td>
                  <td>
                    <div class="progress progress-xs">
                      <div class="progress-bar progress-bar-warning" style="width: 55%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-yellow">${ce6.calificacion}</span></td>
                </tr>
              </tbody></table>
            </div>
</h1>

<div class="text-center"><h2>=  Evaluación Realizada por Alumnos  =</h2></div>
<div class="info-box bg-red">
            <span class="info-box-icon"><i class="fa fa-smile-o"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Alumnos de menores de 9 años</span>
              <span class="info-box-number">${promedio1}</span>

              <div class="progress">
                <div class="progress-bar" style="width: ${promedio1}%"></div>
              </div>
                  <span class="progress-description">
                    Total Acumulado
                  </span>
            </div>
            <!-- /.info-box-content -->
          </div>
<div id="alumnos1" class="box">
  <h2>Evaluación Docente a:</h2>
<h3><strong>${profesor.nombre} </strong>${profesor.apellidos}</h3>
            <div class="box-header">
              <h3 class="box-title">Alumnos de entre 7 y 9 años</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
              <table class="table table-hover">
                <tbody><tr>
                  <th scope="col">ID Alumno</th>
                  <th scope="col">Alumno</th>
                  <th scope="col">Apellidos</th>
                  <th scope="col">Calificación a profesor</th>
                </tr>
                <g:each in="${calificaciones79}">
                <tr>
                  <th scope="row">${it.alumno.id}</th>
                  <td>${it.alumno.nombre}</td>
                  <td>${it.alumno.apellidos}</td>
                  <td>${(100*it.calificacion)/24}</td>
                </tr>
            </g:each>
              </tbody></table>
        </div>
</div>


          <div class="info-box bg-yellow">
            <span class="info-box-icon"><i class="fa fa-smile-o"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Alumnos de 10 a 12 años</span>
              <span class="info-box-number">${promedio2}</span>

              <div class="progress">
                <div class="progress-bar" style="width: ${promedio2}%"></div>
              </div>
                  <span class="progress-description">
                  Total Acumulado

                  </span>
            </div>
            <!-- /.info-box-content -->
          </div>



          <div id="alumnos2" class="box">
            <h2>Evaluación Docente a:</h2>
<h3><strong>${profesor.nombre} </strong>${profesor.apellidos}</h3>
            <div class="box-header">
              <h3 class="box-title">Alumnos de entre 10 y 12 años</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
              <table class="table table-hover">
                <tbody><tr>
                  <th scope="col">ID Alumno</th>
                  <th scope="col">Alumno</th>
                  <th scope="col">Apellidos</th>
                  <th scope="col">Calificación a profesor</th>
                </tr>
                <g:each in="${eval1012}">
                <tr>
                  <th scope="row">${it.alumno.id}</th>
                  <td>${it.alumno.nombre}</td>
                  <td>${it.alumno.apellidos}</td>
                  <td>${(100*it.calificacion)/30}</td>
                </tr>
            </g:each>
              </tbody></table>
        </div>
</div>

          <div class="info-box bg-blue">
            <span class="info-box-icon"><i class="fa fa-smile-o"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Alumnos mayores de 12 años</span>
              <span class="info-box-number">${promedio3}</span>

              <div class="progress">
                <div class="progress-bar" style="width: ${promedio3}%"></div>
              </div>
                  <span class="progress-description">
                    Total Acumulado

                  </span>
            </div>
            <!-- /.info-box-content -->
          </div>


     <div id="alumnos3" class="box">
      <h2>Evaluación Docente a:</h2>
<h3><strong>${profesor.nombre} </strong>${profesor.apellidos}</h3>
            <div class="box-header">
              <h3 class="box-title">Alumnos mayores de 12 años</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
              <table class="table table-hover">
                <tbody><tr>
                  <th scope="col">ID Alumno</th>
                  <th scope="col">Alumno</th>
                  <th scope="col">Apellidos</th>
                  <th scope="col">Calificación a profesor</th>
                </tr>
                <g:each in="${evalSec}">
                <tr>
                  <th scope="row">${it.alumno.id}</th>
                  <td>${it.alumno.nombre}</td>
                  <td>${it.alumno.apellidos}</td>
                  <td>${(100*it.calificacion)/68}</td>
                </tr>
            </g:each>
              </tbody></table>
        </div>
</div>

<canvas id="myChart" width="400" height="400"></canvas>
<script>
var ctx = document.getElementById("myChart").getContext('2d');
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ["Practica Docente", "Reglamento y Normativas", "Gestión Educativa", "Ambiente y Convivencia", "Padres de Familia", "Culturales"],
        datasets: [{
            label: 'Estadisticas',
            data: [${ce1.calificacion}, ${ce2.calificacion}, ${ce3.calificacion},
             ${ce4.calificacion}, ${ce5.calificacion}, ${ce6.calificacion}],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});




function printDiv(divName) {

  var datos = document.getElementById('datos');
   var printContents = document.getElementById(divName).innerHTML;
     var originalContents = document.body.innerHTML;
     document.body.innerHTML = printContents;
     window.print();
     document.body.innerHTML = originalContents;

}




</script>

</body>
</html>