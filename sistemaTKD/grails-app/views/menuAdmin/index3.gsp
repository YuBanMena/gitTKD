<!doctype html>
<html>
<head>
    <meta name="layout" content="adminLte"/>
    <title>Inicio</title>
</head>
<body>

<content tag="nav">
    <g:render template="/menuAdmin/menu"/>
</content>

<content tag="header">
    <h1>
        Bienvenido! Alumno: 
        <small>Sistema de Evaluación Docente</small>
        <strong></strong>
    

    </h1>
    <ol class="breadcrumb">
        <li><a href="${createLink(uri: '/')}" class="active"><i class="fa fa-home"></i>Inicio</a></li>
    </ol>
</content>
<sec:access expression="hasRole('ROLE_ALUMNO')">
    <div class="row">

    <div class="col-md-6 col-md-offset-3 text-center" style="border: 1px solid #17202A;"> 
   <strong> EVALUACIÓN DOCENTE</strong>
     
   <p> Te agradecemos dediques un poco de tu tiempo para evaluar el desempeño de tus profesores, con el objetivo de lograr la excelencia académica y mejorar constantemente en la práctica profesional de cada docente.</p>

    <strong>INSTRUCCIONES:</strong>
    <p>
    Antes de empezar a evaluar LEE CUIDADOSAMENTE las instrucciones y REFLEXIONA sobre cada uno de los ítems que se presentan. A continuación se muestra una lista de tus profesores, selecciona cada uno de ellos y evalúa.</p>
    <p>
    <strong>Fracción I: </strong>encontrarás una serie de ítems, referidos a conductas o indicadores que forman parte de la práctica diaria de su profesor. Asigna un valor de acuerdo a la escala que se presenta en cada ítem.
    </p>
    <p>
    <strong>Fracción II:</strong> escribe libremente tus comentarios u observaciones sobre el desempeño general de tu profesor, puedes considerar: aspectos positivos, aspectos a mejorar.
    </p>
    <strong>IMPORTANTE:</strong><p>
    -En caso de que un mismo profesor te imparta dos o más materias deberás de valorar su desempeño de manera independiente en cada una de ellas. 
    -La información que proporciones será tratada de manera ANÓNIMA y CONFIDENCIAL.
    ¡Gracias por su colaboración!
    </p>
</div>

<div class="col-md-6 col-md-offset-3 text-center" style="border: 1px solid #17202A;"> 
            <div class="small-box bg-purple">
                <div class="inner">
                    <h1>Empezar</h1>
                </div>
                <div class="icon">
                <i class="fa fa-address-book-o" aria-hidden="true"></i>
                </div>
                <g:link action="alumnoEvalua" controller="evaluacion"
                class="small-box-footer">Evaluar
                </g:link>
            </div>
</div>


</div>
</sec:access>
<content tag="scripts">
</content>


</body>
</html>
