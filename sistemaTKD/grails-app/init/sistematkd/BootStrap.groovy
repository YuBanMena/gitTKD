package sistematkd

import mx.com.wma.Rol;
import mx.com.wma.Usuario;
import mx.com.wma.UsuarioRol;
import mx.com.wma.Grado;
import mx.com.wma.Profesor;
import mx.com.wma.Alumno;
import mx.com.wma.Tipo;
import mx.com.wma.Cuestionario;
import mx.com.wma.Pregunta;
import mx.com.wma.PreguntaCuestionario;
import mx.com.wma.*;
class BootStrap {

 def init = { servletContext ->

/* ----------------------------------------------------------------------------------------------------*/
    def tipo1= new Tipo (id:1,tipo:'Practica Docente').save()
    def cuestionario1 = new Cuestionario (tipo:tipo1,calificacion:0).save()
    def pregunta1 = new Pregunta(pregunta:'Responde a los llamados a juntas de planeación y capacitación por el director.',puntaje:0).save()
    def pregunta2 = new Pregunta(pregunta:'Utiliza los manuales y carpeta técnicos como una estrategia de estudio para fortalecer su desarrollo profesional',puntaje:0).save()
    def pregunta3 = new Pregunta(pregunta:'Participa activamente en las juntas de planeación y capacitación, aportando y proponiendo ideas de desarrollo.',puntaje:0).save()
    def pregunta4 = new Pregunta(pregunta:'Utiliza y participa en el Consejo Técnico como espacio para aprender y desarrollar su actividad profesional.',puntaje:0).save()
    def pregunta5 = new Pregunta(pregunta:'Utiliza materiales y literatura impresa disponibles en su contexto como medios para fortalecer su desarrollo profesional.',puntaje:0).save()
    def pregunta6 = new Pregunta(pregunta:'Responde favorablemente a los llamados a cursos del CONAE para fortalecer su desarrollo profesional.',puntaje:0).save()
    def pregunta7 = new Pregunta(pregunta:'Acepta críticas y retroalimentación proporcionada por sus compañeros docentes.',puntaje:0).save()


    def asignar1 = new PreguntaCuestionario(pregunta:pregunta1,cuestionario:cuestionario1).save()
    def asignar2 = new PreguntaCuestionario(pregunta:pregunta2,cuestionario:cuestionario1).save()
    def asignar3 = new PreguntaCuestionario(pregunta:pregunta3,cuestionario:cuestionario1).save()
    def asignar4 = new PreguntaCuestionario(pregunta:pregunta4,cuestionario:cuestionario1).save()
    def asignar5 = new PreguntaCuestionario(pregunta:pregunta5,cuestionario:cuestionario1).save()
    def asignar6 = new PreguntaCuestionario(pregunta:pregunta6,cuestionario:cuestionario1).save()
    def asignar7 = new PreguntaCuestionario(pregunta:pregunta7,cuestionario:cuestionario1).save()


/* -----------------------------------------------------------------------------------------------------*/
    def tipo2= new Tipo (id:2,tipo:'Reglamento y Normativas').save()
    def cuestionario2 = new Cuestionario (tipo:tipo2,calificacion:0).save()
    def pregunta21 = new Pregunta(pregunta:'Aplica el reglamento y disposiciones normativas vigentes estipuladas en la carpeta técnica.',puntaje:0).save()
    def pregunta22 = new Pregunta(pregunta:'Define a sus alumnos las reglas de convivencia en clase, acorde a la edad, características, genero de los alumnos.',puntaje:0).save()
    def pregunta23 = new Pregunta(pregunta:'Distribuye y fomenta el cumplimiento del reglamento escolar.',puntaje:0).save()


    def asignar21 = new PreguntaCuestionario(pregunta:pregunta21,cuestionario:cuestionario2).save()
    def asignar22 = new PreguntaCuestionario(pregunta:pregunta22,cuestionario:cuestionario2).save()
    def asignar23 = new PreguntaCuestionario(pregunta:pregunta23,cuestionario:cuestionario2).save()
    

/* -----------------------------------------------------------------------------------------------------*/

    def tipo3= new Tipo (id:3,tipo:'Ambiente favorable y sana convivencia').save()
    def cuestionario3 = new Cuestionario (tipo:tipo3,calificacion:0).save()
    def pregunta31 = new Pregunta(pregunta:'Implementa estrategias con sus alumnos que fomentan actitudes de compromiso, colaboración y solidaridad para la sana convivencia.',puntaje:0).save()
    def pregunta32 = new Pregunta(pregunta:'Implementa estrategias con sus alumnos que fomentan el respeto, igualdad y equidad.',puntaje:0).save()
    def pregunta33 = new Pregunta(pregunta:'Implementa estrategias que contribuyen a eliminar o minimizar las barreras para el aprendizaje y de participación.',puntaje:0).save()

    def asignar31 = new PreguntaCuestionario(pregunta:pregunta31,cuestionario:cuestionario3).save()
    def asignar32 = new PreguntaCuestionario(pregunta:pregunta32,cuestionario:cuestionario3).save()
    def asignar33 = new PreguntaCuestionario(pregunta:pregunta33,cuestionario:cuestionario3).save()
/* -----------------------------------------------------------------------------------------------------*/

def tipo4= new Tipo (id:4,tipo:'Gestión Educativa').save()
    def cuestionario4 = new Cuestionario (tipo:tipo4,calificacion:0).save()
    def pregunta41 = new Pregunta(pregunta:'Participa en el colectivo docente en el análisis de resultados de evaluaciones bimestrales para diseñar estrategias que permitan cumplir con objetivos educativos.',puntaje:0).save()
    def pregunta42 = new Pregunta(pregunta:'Propone ideas para atender la mejora del aprendizaje, combate contra el abandono, convivencia deportiva, entre otros.',puntaje:0).save()
    def pregunta43 = new Pregunta(pregunta:'Realiza la inscripción de alumnos al RIF, en tiempo y forma ante la dirección.',puntaje:0).save()
    def pregunta44 = new Pregunta(pregunta:'Realiza la inscripción de alumnos a exámenes bimestrales en tiempo y forma ante la dirección.',puntaje:0).save()

    def asignar41 = new PreguntaCuestionario(pregunta:pregunta41,cuestionario:cuestionario4).save()
    def asignar42 = new PreguntaCuestionario(pregunta:pregunta42,cuestionario:cuestionario4).save()
    def asignar43 = new PreguntaCuestionario(pregunta:pregunta43,cuestionario:cuestionario4).save()
    def asignar44 = new PreguntaCuestionario(pregunta:pregunta44,cuestionario:cuestionario4).save()

/* -----------------------------------------------------------------------------------------------------*/

    def tipo5= new Tipo (id:5,tipo:'Padres de Familia').save()
    def cuestionario5 = new Cuestionario (tipo:tipo5,calificacion:0).save()
    def pregunta51 = new Pregunta(pregunta:'Atiende a padres de familia para atender dudas y aclaraciones.',puntaje:0).save()
    def pregunta52 = new Pregunta(pregunta:'Trata a todos los padres de familia por igual.',puntaje:0).save()
    def pregunta53 = new Pregunta(pregunta:'Involucra a los padres de familia en el desarrollo deportivo de sus alumnos.',puntaje:0).save()
    def pregunta54 = new Pregunta(pregunta:'Atiende a padres de familia para atender dudas, aclaraciones, acuerdos y compromisos.',puntaje:0).save()

    def asignar51 = new PreguntaCuestionario(pregunta:pregunta51,cuestionario:cuestionario5).save()
    def asignar52 = new PreguntaCuestionario(pregunta:pregunta52,cuestionario:cuestionario5).save()
    def asignar53 = new PreguntaCuestionario(pregunta:pregunta53,cuestionario:cuestionario5).save()
    def asignar54 = new PreguntaCuestionario(pregunta:pregunta54,cuestionario:cuestionario5).save()
/* -----------------------------------------------------------------------------------------------------*/
    def tipo6= new Tipo (id:6,tipo:'Consideraciones Culturales').save()
    def cuestionario6 = new Cuestionario (tipo:tipo6,calificacion:0).save()
    def pregunta61 = new Pregunta(pregunta:'Identifica rasgos culturales y lingüísticos de sus alumnos para desarrollar acciones en su labor contemplando estos aspectos.',puntaje:0).save()
    def pregunta62 = new Pregunta(pregunta:'Realiza actividades con sus alumnos para fortalecer la identidad, valores y cultura de sus alumnos.',puntaje:0).save()
    def pregunta63 = new Pregunta(pregunta:'Motiva a sus alumnos a participar en eventos deportivos convocados por la dirección.',puntaje:0).save()
  
    def asignar61 = new PreguntaCuestionario(pregunta:pregunta61,cuestionario:cuestionario6).save()
    def asignar62 = new PreguntaCuestionario(pregunta:pregunta62,cuestionario:cuestionario6).save()
    def asignar63 = new PreguntaCuestionario(pregunta:pregunta63,cuestionario:cuestionario6).save()

/* -----------------------------------------------------------------------------------------------------*/
    
    def tipo7= new Tipo (id:7,tipo:'Auto-Evaluación Práctica docente').save()
    def cuestionario7 = new Cuestionario (tipo:tipo7,calificacion:0).save()
    def pregunta71 = new Pregunta(pregunta:'Respondo a los llamados a juntas de planeación y capacitación por el director.',puntaje:0).save()
    def pregunta72 = new Pregunta(pregunta:'Utilizo los manuales y carpeta técnicos como una estrategia de estudio para fortalecer su desarrollo profesional.',puntaje:0).save()
    def pregunta73 = new Pregunta(pregunta:'Participo activamente en las juntas de planeación y capacitación, aportando y proponiendo ideas de desarrollo.',puntaje:0).save()
   def pregunta74 = new Pregunta(pregunta:'Utilizo y participo en el Consejo Técnico como espacio para aprender y desarrollar mi actividad profesional.',puntaje:0).save()
    def pregunta75 = new Pregunta(pregunta:'Utilizo materiales y literatura impresa disponibles en mi contexto como medios para fortalecer mi desarrollo profesional.',puntaje:0).save()
     def pregunta76 = new Pregunta(pregunta:'Respondo favorablemente a los llamados a cursos del CONAE para fortalecer mi desarrollo profesional.',puntaje:0).save()
     def pregunta77 = new Pregunta(pregunta:'Acepto críticas y retroalimentación proporcionada por mis compañeros docentes.',puntaje:0).save()


    def asignar71 = new PreguntaCuestionario(pregunta:pregunta71,cuestionario:cuestionario7).save()
    def asignar72 = new PreguntaCuestionario(pregunta:pregunta72,cuestionario:cuestionario7).save()
    def asignar73 = new PreguntaCuestionario(pregunta:pregunta73,cuestionario:cuestionario7).save()
    def asignar74 = new PreguntaCuestionario(pregunta:pregunta74,cuestionario:cuestionario7).save()
    def asignar75 = new PreguntaCuestionario(pregunta:pregunta75,cuestionario:cuestionario7).save()
    def asignar76 = new PreguntaCuestionario(pregunta:pregunta76,cuestionario:cuestionario7).save()
    def asignar77 = new PreguntaCuestionario(pregunta:pregunta77,cuestionario:cuestionario7).save()

/* -----------------------------------------------------------------------------------------------------*/
    def tipo8= new Tipo (id:8,tipo:'Auto-Evaluación Reglamento y Normativas').save()
    def cuestionario8 = new Cuestionario (tipo:tipo8,calificacion:0).save()
    def pregunta81 = new Pregunta(pregunta:'Aplico el reglamento y disposiciones normativas vigentes estipuladas en la carpeta técnica.',puntaje:0).save()
    def pregunta82 = new Pregunta(pregunta:'Defino a mis alumnos las reglas de convivencia en clase, acorde a la edad, características, genero de los alumnos.',puntaje:0).save()
    def pregunta83 = new Pregunta(pregunta:'Distribuyo y fomento el cumplimiento del reglamento escolar.',puntaje:0).save()


    def asignar81 = new PreguntaCuestionario(pregunta:pregunta81,cuestionario:cuestionario8).save()
    def asignar82 = new PreguntaCuestionario(pregunta:pregunta82,cuestionario:cuestionario8).save()
    def asignar83 = new PreguntaCuestionario(pregunta:pregunta83,cuestionario:cuestionario8).save()
/* -----------------------------------------------------------------------------------------------------*/
    def tipo9= new Tipo (id:9,tipo:'Auto-Evaluación Ambiente favorable y sana convivencia').save()
    def cuestionario9 = new Cuestionario (tipo:tipo9,calificacion:0).save()
    def pregunta91 = new Pregunta(pregunta:'Implemento estrategias con mis alumnos que fomentan actitudes de compromiso, colaboración y solidaridad para la sana convivencia.',puntaje:0).save()
    def pregunta92 = new Pregunta(pregunta:'Implemento estrategias con mis alumnos que fomentan el respeto, igualdad y equidad.',puntaje:0).save()
    def pregunta93 = new Pregunta(pregunta:'Implemento estrategias que contribuyen a eliminar o minimizar las barreras para el aprendizaje y de participación.',puntaje:0).save()

    def asignar91 = new PreguntaCuestionario(pregunta:pregunta91,cuestionario:cuestionario9).save()
    def asignar92 = new PreguntaCuestionario(pregunta:pregunta92,cuestionario:cuestionario9).save()
    def asignar93 = new PreguntaCuestionario(pregunta:pregunta93,cuestionario:cuestionario9).save()

    /*-------------------------------------------------------------------------------------------------------------*/


    def tipo10= new Tipo (id:10,tipo:'Auto-Evaluación Gestión Educativa').save()
    def cuestionario10 = new Cuestionario (tipo:tipo10,calificacion:0).save()
    def pregunta101 = new Pregunta(pregunta:'Participo en el colectivo docente en el análisis de resultados de evaluaciones bimestrales para diseñar estrategias que permitan cumplir con objetivos educativos.',puntaje:0).save()
    def pregunta102 = new Pregunta(pregunta:'Propongo ideas para atender la mejora del aprendizaje, combate contra el abandono, convivencia deportiva, entre otros.',puntaje:0).save()
    def pregunta103 = new Pregunta(pregunta:'Realizo la inscripción de mis alumnos al RIF, en tiempo y forma ante la dirección.',puntaje:0).save()
    def pregunta104 = new Pregunta(pregunta:'Realizo la inscripción de alumnos a exámenes bimestrales en tiempo y forma ante la dirección.',puntaje:0).save()

    def asignar101 = new PreguntaCuestionario(pregunta:pregunta101,cuestionario:cuestionario10).save()
    def asignar102 = new PreguntaCuestionario(pregunta:pregunta102,cuestionario:cuestionario10).save()
    def asignar103 = new PreguntaCuestionario(pregunta:pregunta103,cuestionario:cuestionario10).save()
    def asignar104 = new PreguntaCuestionario(pregunta:pregunta104,cuestionario:cuestionario10).save()
/*-------------------------------------------------------------------------------------------------------------*/

    def tipo11= new Tipo (id:11,tipo:'Auto-Evaluación Mis Padres de Familia').save()
    def cuestionario11 = new Cuestionario (tipo:tipo11,calificacion:0).save()
    def pregunta111 = new Pregunta(pregunta:'Atiendo a padres de familia para atender dudas y aclaraciones.',puntaje:0).save()
    def pregunta112 = new Pregunta(pregunta:'Trato a todos los padres de familia por igual.',puntaje:0).save()
    def pregunta113 = new Pregunta(pregunta:'Involucro a los padres de familia en el desarrollo deportivo de mis alumnos.',puntaje:0).save()
    def pregunta114 = new Pregunta(pregunta:'Atiendo a padres de familia para atender dudas, aclaraciones, acuerdos y compromisos.',puntaje:0).save()

    def asignar111 = new PreguntaCuestionario(pregunta:pregunta111,cuestionario:cuestionario11).save()
    def asignar112 = new PreguntaCuestionario(pregunta:pregunta112,cuestionario:cuestionario11).save()
    def asignar113 = new PreguntaCuestionario(pregunta:pregunta113,cuestionario:cuestionario11).save()
    def asignar114 = new PreguntaCuestionario(pregunta:pregunta114,cuestionario:cuestionario11).save()

/*-------------------------------------------------------------------------------------------------------------*/
    def tipo12= new Tipo (id:12,tipo:' Auto-Evaluación Consideraciones Culturales').save()
    def cuestionario12 = new Cuestionario (tipo:tipo12,calificacion:0).save()
    def pregunta121 = new Pregunta(pregunta:'Identifico rasgos culturales y lingüísticos de mis alumnos para desarrollar acciones en su labor contemplando estos aspectos.',puntaje:0).save()
    def pregunta122 = new Pregunta(pregunta:'Realizo actividades con mis alumnos para fortalecer la identidad, valores y cultura de sus alumnos.',puntaje:0).save()
    def pregunta123 = new Pregunta(pregunta:'Motivo a mis alumnos a participar en eventos deportivos convocados por la dirección. ',puntaje:0).save()

  
    def asignar121 = new PreguntaCuestionario(pregunta:pregunta121,cuestionario:cuestionario12).save()
    def asignar122 = new PreguntaCuestionario(pregunta:pregunta122,cuestionario:cuestionario12).save()
    def asignar123 = new PreguntaCuestionario(pregunta:pregunta123,cuestionario:cuestionario12).save()

    /*-------------------------------------------------------------------------------------------------------------*/
def tipo13= new Tipo (id:13,tipo:'Organización y Comunicación').save()
    def cuestionario13 = new Cuestionario (tipo:tipo13,calificacion:0).save()
    def pregunta131 = new Pregunta(pregunta:'Diseña situaciones didácticas acordes con los aprendizajes esperados, con las necesidades educativas de sus alumnos.',puntaje:0).save()
    def pregunta132 = new Pregunta(pregunta:'Organiza a sus alumnos, dentro del área de entrenamiento.',puntaje:0).save()

    def pregunta133 = new Pregunta(pregunta:'Mantiene su espacio de clases (doyang) en condiciones para que sea lugar propicio para el desarrollo de sus alumnos.',puntaje:0).save()
    def pregunta134 = new Pregunta(pregunta:'Utiliza tiempo de clase para contribuir al logro de los propósitos educativos en todos sus alumnos, reconocimientos e indicaciones generales.',puntaje:0).save()
    def pregunta135 = new Pregunta(pregunta:'La comunicación que realiza con sus alumnos, es acorde a la edad y nivel educativo de cada uno.',puntaje:0).save()
  
    def asignar131 = new PreguntaCuestionario(pregunta:pregunta131,cuestionario:cuestionario13).save()
    def asignar132 = new PreguntaCuestionario(pregunta:pregunta132,cuestionario:cuestionario13).save()
    def asignar133 = new PreguntaCuestionario(pregunta:pregunta133,cuestionario:cuestionario13).save()
    def asignar134 = new PreguntaCuestionario(pregunta:pregunta134,cuestionario:cuestionario13).save()
    def asignar135 = new PreguntaCuestionario(pregunta:pregunta135,cuestionario:cuestionario13).save()
/*-------------------------------------------------------------------------------------------------------------*/
    def tipo14= new Tipo (id:14,tipo:'Estrategias Didácticas').save()
    def cuestionario14 = new Cuestionario (tipo:tipo14,calificacion:0).save()
    def pregunta141 = new Pregunta(pregunta:'Emplea estrategias didácticas para que todos sus alumnos aprendan, considerando nivel de conocimiento, interacción con pares y participación colectiva.',puntaje:0).save()
    def pregunta142 = new Pregunta(pregunta:'Desarrolla estrategias para lograr habilidades de observación, análisis, soluciones propias y pensamiento crítico.',puntaje:0).save()
    def pregunta143 = new Pregunta(pregunta:'Utiliza instrumentos de evaluación externos que permiten identificar el nivel de desarrollo de habilidades y destrezas motrices de sus alumnos.',puntaje:0).save()
    def pregunta144 = new Pregunta(pregunta:'Utiliza los resultados de la evaluación bimestral de sus alumnos para mejorar su práctica como docente deportivo.',puntaje:0).save()
  
    def asignar141 = new PreguntaCuestionario(pregunta:pregunta141,cuestionario:cuestionario14).save()
    def asignar142 = new PreguntaCuestionario(pregunta:pregunta142,cuestionario:cuestionario14).save()
    def asignar143 = new PreguntaCuestionario(pregunta:pregunta143,cuestionario:cuestionario14).save()
    def asignar144 = new PreguntaCuestionario(pregunta:pregunta144,cuestionario:cuestionario14).save()
/*-------------------------------------------------------------------------------------------------------------*/
    def tipo15= new Tipo (id:15,tipo:'Planeación Magisterial').save()
    def cuestionario15 = new Cuestionario (tipo:tipo15,calificacion:0).save()
    def pregunta151 = new Pregunta(pregunta:'Realiza de manera voluntaria una planeación de clases anual y mensual',puntaje:0).save()
    def pregunta152 = new Pregunta(pregunta:'Muestra y expone la planeación diseñada ante la dirección para su conocimiento y aprobación en tiempo y forma.',puntaje:0).save()
    def pregunta153 = new Pregunta(pregunta:'Respeta y sigue con claridad cada punto establecido en su planeación magisterial.',puntaje:0).save()
    def pregunta154 = new Pregunta(pregunta:'Realiza en tiempo y forma su planeación de clases anual y mensual.',puntaje:0).save()
    def pregunta155 = new Pregunta(pregunta:'Notifica a padres de familia sobre su planificación magisterial de manera mensual y anual.',puntaje:0).save()
  
    def asignar151 = new PreguntaCuestionario(pregunta:pregunta151,cuestionario:cuestionario15).save()
    def asignar152 = new PreguntaCuestionario(pregunta:pregunta152,cuestionario:cuestionario15).save()
    def asignar153 = new PreguntaCuestionario(pregunta:pregunta153,cuestionario:cuestionario15).save()
    def asignar154 = new PreguntaCuestionario(pregunta:pregunta154,cuestionario:cuestionario15).save()
    def asignar155 = new PreguntaCuestionario(pregunta:pregunta155,cuestionario:cuestionario15).save()
/*-------------------------------------------------------------------------------------------------------------*/
    /*-------------------------------------------------------------------------------------------------------------*/
    def tipo16= new Tipo (id:16,tipo:'AutoEvaluación - Organización y Comunicación').save()
    def cuestionario16 = new Cuestionario (tipo:tipo16,calificacion:0).save()
    def pregunta161 = new Pregunta(pregunta:'Diseño situaciones didácticas acordes con los aprendizajes esperados, con las necesidades educativas de mis alumnos.',puntaje:0).save()
    def pregunta162 = new Pregunta(pregunta:'Organizo a mis alumnos, dentro del área de entrenamiento.',puntaje:0).save()

    def pregunta163 = new Pregunta(pregunta:'Mantengo el espacio de clases (doyang) en condiciones para que sea lugar propicio para el desarrollo de mis alumnos.',puntaje:0).save()
    def pregunta164 = new Pregunta(pregunta:'Utilizo tiempo de clase para contribuir al logro de los propósitos educativos en todos sus alumnos, reconocimientos e indicaciones generales.',puntaje:0).save()
    def pregunta165 = new Pregunta(pregunta:'La comunicación que realizo con mis alumnos, es acorde a la edad y nivel educativo de cada uno.',puntaje:0).save()
  
    def asignar161 = new PreguntaCuestionario(pregunta:pregunta161,cuestionario:cuestionario16).save()
    def asignar162 = new PreguntaCuestionario(pregunta:pregunta162,cuestionario:cuestionario16).save()
    def asignar163 = new PreguntaCuestionario(pregunta:pregunta163,cuestionario:cuestionario16).save()
    def asignar164 = new PreguntaCuestionario(pregunta:pregunta164,cuestionario:cuestionario16).save()
    def asignar165 = new PreguntaCuestionario(pregunta:pregunta165,cuestionario:cuestionario16).save()
/*-------------------------------------------------------------------------------------------------------------*/
    def tipo17= new Tipo (id:17,tipo:'AutoEvaluación - Estrategias Didácticas').save()
    def cuestionario17 = new Cuestionario (tipo:tipo17,calificacion:0).save()
    def pregunta171 = new Pregunta(pregunta:'Empleo estrategias didácticas para que todos mis alumnos aprendan, considerando nivel de conocimiento, interacción con pares y participación colectiva.',puntaje:0).save()
    def pregunta172 = new Pregunta(pregunta:'Desarrollo estrategias para lograr habilidades de observación, análisis, soluciones propias y pensamiento crítico.',puntaje:0).save()
    def pregunta173 = new Pregunta(pregunta:'Utilizo instrumentos de evaluación externos que me permiten identificar el nivel de desarrollo de habilidades y destrezas motrices de mis alumnos.',puntaje:0).save()
    def pregunta174 = new Pregunta(pregunta:'Utilizo los resultados de la evaluación bimestral de mis alumnos para mejorar mi práctica como docente deportivo.',puntaje:0).save()
  
    def asignar171 = new PreguntaCuestionario(pregunta:pregunta171,cuestionario:cuestionario17).save()
    def asignar172 = new PreguntaCuestionario(pregunta:pregunta172,cuestionario:cuestionario17).save()
    def asignar173 = new PreguntaCuestionario(pregunta:pregunta173,cuestionario:cuestionario17).save()
    def asignar174 = new PreguntaCuestionario(pregunta:pregunta174,cuestionario:cuestionario17).save()
/*-------------------------------------------------------------------------------------------------------------*/
    def tipo18= new Tipo (id:18,tipo:'AutoEvaluación - Planeación Magisterial').save()
    def cuestionario18 = new Cuestionario (tipo:tipo18,calificacion:0).save()
    def pregunta181 = new Pregunta(pregunta:'Realizo de manera voluntaria la planeación de clases anual y mensual',puntaje:0).save()
    def pregunta182 = new Pregunta(pregunta:'Muestro y expongo la planeación diseñada ante la dirección para su conocimiento y aprobación en tiempo y forma.',puntaje:0).save()
    def pregunta183 = new Pregunta(pregunta:'Respeto y sigo con claridad cada punto establecido en mi planeación magisterial.',puntaje:0).save()
    def pregunta184 = new Pregunta(pregunta:'Realizo en tiempo y forma su planeación de clases anual y mensual.',puntaje:0).save()
    def pregunta185 = new Pregunta(pregunta:'Notifico a mis padres de familia sobre mi planificación magisterial de manera mensual y anual.',puntaje:0).save()

    def asignar181 = new PreguntaCuestionario(pregunta:pregunta181,cuestionario:cuestionario18).save()
    def asignar182 = new PreguntaCuestionario(pregunta:pregunta182,cuestionario:cuestionario18).save()
    def asignar183 = new PreguntaCuestionario(pregunta:pregunta183,cuestionario:cuestionario18).save()
    def asignar184 = new PreguntaCuestionario(pregunta:pregunta184,cuestionario:cuestionario18).save()
    def asignar185 = new PreguntaCuestionario(pregunta:pregunta185,cuestionario:cuestionario18).save()
  /*-------------------------------------------------------------------------------------------------------------*/
    def tipo19= new Tipo (id:19,tipo:'Evaluación por Alumnos de 7 a 9 años').save()
    def cuestionario19 = new Cuestionario (tipo:tipo19,calificacion:0).save()
    def pregunta191 = new Pregunta(pregunta:'Hace juegos Divertidos',puntaje:0).save()
    def pregunta192 = new Pregunta(pregunta:'Me escucha cuando le hablo',puntaje:0).save()
    def pregunta193 = new Pregunta(pregunta:'Me ayuda a hacer las cosas difíciles',puntaje:0).save()
    def pregunta194 = new Pregunta(pregunta:'Riñe mucho',puntaje:0).save()
    def pregunta195 = new Pregunta(pregunta:'Juega con Nosotros',puntaje:0).save()
    def pregunta196 = new Pregunta(pregunta:'Usamos muchas cosas',puntaje:0).save()
    def pregunta197 = new Pregunta(pregunta:'Es bueno conmigo y con mis compañeros',puntaje:0).save()
    def pregunta198 = new Pregunta(pregunta:'Castiga cuando hace falta',puntaje:0).save()


    def asignar191 = new PreguntaCuestionario(pregunta:pregunta191,cuestionario:cuestionario19).save()
    def asignar192 = new PreguntaCuestionario(pregunta:pregunta192,cuestionario:cuestionario19).save()
    def asignar193 = new PreguntaCuestionario(pregunta:pregunta193,cuestionario:cuestionario19).save()
    def asignar194 = new PreguntaCuestionario(pregunta:pregunta194,cuestionario:cuestionario19).save()
    def asignar195 = new PreguntaCuestionario(pregunta:pregunta195,cuestionario:cuestionario19).save()
    def asignar196 = new PreguntaCuestionario(pregunta:pregunta196,cuestionario:cuestionario19).save()
    def asignar197 = new PreguntaCuestionario(pregunta:pregunta197,cuestionario:cuestionario19).save()
    def asignar198 = new PreguntaCuestionario(pregunta:pregunta198,cuestionario:cuestionario19).save()
   /* ------------------------------------------------------------------------------------------------------------*/

    def tipo20= new Tipo (id:20,tipo:'Evaluación por Alumnos de 10 a 12 años').save()
    def cuestionario20 = new Cuestionario (tipo:tipo20,calificacion:0).save()
    def pregunta201 = new Pregunta(pregunta:'Las Clases son amenas',puntaje:0).save()
    def pregunta202 = new Pregunta(pregunta:'El maestro nos trata bien',puntaje:0).save()
    def pregunta203 = new Pregunta(pregunta:'Participa en las clases con nosotros',puntaje:0).save()
    def pregunta204 = new Pregunta(pregunta:'Varia las actividades',puntaje:0).save()
    def pregunta205 = new Pregunta(pregunta:'Nos anima durante los ejercicios',puntaje:0).save()
    def pregunta206 = new Pregunta(pregunta:'Ayuda si es necesario',puntaje:0).save()
    def pregunta207 = new Pregunta(pregunta:'Escucha nuestras opiniones',puntaje:0).save()
    def pregunta208 = new Pregunta(pregunta:'Explica con claridad',puntaje:0).save()
    def pregunta209 = new Pregunta(pregunta:'Pregunta si hay dudas',puntaje:0).save()
    def pregunta210 = new Pregunta(pregunta:'Si castiga lo hace justamente',puntaje:0).save()


    def asignar201 = new PreguntaCuestionario(pregunta:pregunta201,cuestionario:cuestionario20).save()
    def asignar202 = new PreguntaCuestionario(pregunta:pregunta202,cuestionario:cuestionario20).save()
    def asignar203 = new PreguntaCuestionario(pregunta:pregunta203,cuestionario:cuestionario20).save()
    def asignar204 = new PreguntaCuestionario(pregunta:pregunta204,cuestionario:cuestionario20).save()
    def asignar205 = new PreguntaCuestionario(pregunta:pregunta205,cuestionario:cuestionario20).save()
    def asignar206 = new PreguntaCuestionario(pregunta:pregunta206,cuestionario:cuestionario20).save()
    def asignar207 = new PreguntaCuestionario(pregunta:pregunta207,cuestionario:cuestionario20).save()
    def asignar208 = new PreguntaCuestionario(pregunta:pregunta208,cuestionario:cuestionario20).save()
    def asignar209 = new PreguntaCuestionario(pregunta:pregunta209,cuestionario:cuestionario20).save()
    def asignar210 = new PreguntaCuestionario(pregunta:pregunta210,cuestionario:cuestionario20).save()
/* ------------------------------------------------------------------------------------------------------------*/

    def tipo21= new Tipo (id:21,tipo:'Evaluación por Alumnos de Nivel Secundaria').save()
    def cuestionario21 = new Cuestionario (tipo:tipo21,calificacion:0).save()
    def pregunta211 = new Pregunta(pregunta:'El Taek-Kwon-Do hace que me sienta bien',puntaje:0).save()
    def pregunta212 = new Pregunta(pregunta:'El profesor nos trata de manera adecuada',puntaje:0).save()
    def pregunta213 = new Pregunta(pregunta:'Explica los ejercicios y actividades con claridad',puntaje:0).save()
    def pregunta214 = new Pregunta(pregunta:'Se dirige a nosotros con respeto',puntaje:0).save()
    def pregunta215 = new Pregunta(pregunta:'Se puede hablar con él',puntaje:0).save()
    def pregunta216 = new Pregunta(pregunta:'Se preocupa por nosotros',puntaje:0).save()
    def pregunta217 = new Pregunta(pregunta:'Nos anima durante los ejercicios y actividades',puntaje:0).save()
    def pregunta218 = new Pregunta(pregunta:'Muestra estusiasmo durante las clases',puntaje:0).save()
    def pregunta219 = new Pregunta(pregunta:'Tiene normas claras para la clase',puntaje:0).save()
    def pregunta220 = new Pregunta(pregunta:'Participa con nostros en las actividades',puntaje:0).save()
    def pregunta221 = new Pregunta(pregunta:'Es muy estricto y rigido',puntaje:0).save()
    def pregunta222 = new Pregunta(pregunta:'Atiende a nuestras propuestas y las valora',puntaje:0).save()
    def pregunta223 = new Pregunta(pregunta:'Nos corrige cuando actuamos de manera inapropiada',puntaje:0).save()
    def pregunta224 = new Pregunta(pregunta:'Pregunta si entendemos lo que nos propone',puntaje:0).save()
    def pregunta225 = new Pregunta(pregunta:'Evalúa de forma correcta',puntaje:0).save()
    def pregunta226 = new Pregunta(pregunta:'Ayuda a realizar las actividades a quien lo necesita',puntaje:0).save()
    def pregunta227 = new Pregunta(pregunta:'Cuado "castiga" suele tener razón',puntaje:0).save()


    def asignar211 = new PreguntaCuestionario(pregunta:pregunta211,cuestionario:cuestionario21).save()
    def asignar212 = new PreguntaCuestionario(pregunta:pregunta212,cuestionario:cuestionario21).save()
    def asignar213 = new PreguntaCuestionario(pregunta:pregunta213,cuestionario:cuestionario21).save()
    def asignar214 = new PreguntaCuestionario(pregunta:pregunta214,cuestionario:cuestionario21).save()
    def asignar215 = new PreguntaCuestionario(pregunta:pregunta215,cuestionario:cuestionario21).save()
    def asignar216 = new PreguntaCuestionario(pregunta:pregunta216,cuestionario:cuestionario21).save()
    def asignar217 = new PreguntaCuestionario(pregunta:pregunta217,cuestionario:cuestionario21).save()
    def asignar218 = new PreguntaCuestionario(pregunta:pregunta218,cuestionario:cuestionario21).save()
    def asignar219 = new PreguntaCuestionario(pregunta:pregunta219,cuestionario:cuestionario21).save()
    def asignar220 = new PreguntaCuestionario(pregunta:pregunta220,cuestionario:cuestionario21).save()
    def asignar221 = new PreguntaCuestionario(pregunta:pregunta221,cuestionario:cuestionario21).save()
    def asignar222 = new PreguntaCuestionario(pregunta:pregunta222,cuestionario:cuestionario21).save()
    def asignar223 = new PreguntaCuestionario(pregunta:pregunta223,cuestionario:cuestionario21).save()
    def asignar224 = new PreguntaCuestionario(pregunta:pregunta224,cuestionario:cuestionario21).save()
    def asignar225 = new PreguntaCuestionario(pregunta:pregunta225,cuestionario:cuestionario21).save()
    def asignar226 = new PreguntaCuestionario(pregunta:pregunta226,cuestionario:cuestionario21).save()
    def asignar227 = new PreguntaCuestionario(pregunta:pregunta227,cuestionario:cuestionario21).save()
    /*----------------------------------------------------------------------------------------------------*/


    def grado1 = new Grado(nombreGrado:'blanco').save()
    def grado2 = new Grado(nombreGrado:'blanco avanzado').save()
    def grado3 = new Grado(nombreGrado:'naranja').save()
    def grado4 = new Grado(nombreGrado:'naranaja avanzado').save()
    def grado5 = new Grado(nombreGrado:'amarillo').save()
    def grado6 = new Grado(nombreGrado:'amarillo avanzado').save()

    def grado7 = new Grado(nombreGrado:'verde').save()
    def grado8 = new Grado(nombreGrado:'verde avanzado').save()
    def grado9 = new Grado(nombreGrado:'verde aspirante').save()
    def grado10 = new Grado(nombreGrado:'azul').save()
    def grado11 = new Grado(nombreGrado:'azul avanzado').save()
    def grado12 = new Grado(nombreGrado:'azul avanzado 2').save()

    def grado13 = new Grado(nombreGrado:'azul aspirante').save()
    def grado14 = new Grado(nombreGrado:'roja').save()
    def grado15= new Grado(nombreGrado:'roja avanzada').save()
    def grado16 = new Grado(nombreGrado:'roja avanzada 2').save()
    def grado17 = new Grado(nombreGrado:'roja avanzada 3').save()
    def grado18 = new Grado(nombreGrado:'roja avanzada 4').save()

    def negra2 = new Grado(nombreGrado:'RojiNegra 1 Poom').save()
    def negra1= new Grado(nombreGrado:'RojiNegra 2 Poom').save()
    def negra3 = new Grado(nombreGrado:'RojiNegra 3 Poom').save()
    def negra4 = new Grado(nombreGrado:'Negra 1 Dan').save()

    def negra5 = new Grado(nombreGrado:'Negra 1 Dan').save()
    def negra6 = new Grado(nombreGrado:'Negra 2 Dan').save()
    def negra7 = new Grado(nombreGrado:'Negra 3 Dan').save()
    def negra8 = new Grado(nombreGrado:'Negra 4 Dan').save()
    def negra9 = new Grado(nombreGrado:'Negra 5 Dan').save()

	def rolAdmin = new Rol(authority: 'ROLE_ADMIN').save()
    def rolDocente = new Rol(authority: 'ROLE_DOCENTE').save()
    def rolAlumno = new Rol(authority: 'ROLE_ALUMNO').save()

    def usuAdmin = new Usuario(username: 'admin',password:'admin').save()
    def usuDocente = new Usuario(username: 'Docente',password:'docente').save()
    def usuAlumno = new Usuario(username: 'Alumno',password:'alumno').save()

    def usuProfe1= new Usuario(username: 'profe1',password:'profe1').save()
    def usuProfe2= new Usuario(username: 'profe2',password:'profe2').save()
    def usuProfe3= new Usuario(username: 'profe3',password:'profe3').save()

    def usuAlum1= new Usuario(username: 'alumno1',password:'alumno1').save()
    def usuAlum2= new Usuario(username: 'alumno2',password:'alumno2').save()
    def usuAlum3= new Usuario(username: 'alumno3',password:'alumno3').save()

    UsuarioRol.create usuAdmin, rolAdmin
    UsuarioRol.create usuDocente, rolDocente
    UsuarioRol.create usuAlumno, rolAlumno

    UsuarioRol.create usuAlum1, rolAlumno
    UsuarioRol.create usuAlum2, rolAlumno
    UsuarioRol.create usuAlum3, rolAlumno

   
    UsuarioRol.create usuProfe1, rolDocente
    UsuarioRol.create usuProfe2, rolDocente
    UsuarioRol.create usuProfe3, rolDocente

    UsuarioRol.withSession {
      it.flush()
      it.clear()
    }

    def alumno1 = new Alumno(
        gradoCinta:grado1,
        usuario:usuAlum1,
        nombre:'Karla',
        apellidos:'Perez Antonio',
        edad: 9,
        direccion: 'direccion 1 calle 10',
        telefono: '1111111111',
        genero: 'Femenino',
        rifAnual:'RIF-1231123'
        ).save()

   def alumno2 = new Alumno(
        gradoCinta:grado1,
        usuario:usuAlum2,
        nombre:'Alberto',
        apellidos:'Kukui Lopez',
        edad: 10,
        direccion: 'direccion 2 calle 20',
        telefono: '222222222',
        genero: 'Masculino',
        rifAnual:'RIF-321312'
        ).save()

   def alumno3 = new Alumno(
        gradoCinta:grado1,
        usuario:usuAlum3,
        nombre:'Cristina',
        apellidos:'Carbajal Olmedo',
        edad: 12,
        direccion: 'direccion 3 calle 30',
        telefono: '33333333',
        genero: 'Femenino',
        rifAnual:'RIF-222222'
        ).save()




    def profe1 = new Profesor(
        nombre:'Juan Carlos',
        apellidos:'Lozano Fernandez',
        genero:'Masculino',
        registroFederal:'MX-1234',
        usuario: usuProfe1
        ).save()

        def profe2 = new Profesor(
        nombre:'José',
        apellidos:'Alfaro Sanchez',
        genero:'Masculino',
        registroFederal:'MX-2234',
        usuario: usuProfe2
        ).save()

        def profe3 = new Profesor(
        nombre:'Colette',
        apellidos:'Ramirez Perez',
        genero:'Femenino',
        registroFederal:'MX-3234',
        usuario: usuProfe3
        ).save()



    def sucursal = new Sucursal(nombreSucursal:'The World Mugung Do Academy Reforma',direccion:'Colonia Reforma 102',registroClave:'MX123123-123').save()

    def grupo1 = new Grupo(profesorDelGrupo:profe2,sucursalDelGrupo:sucursal,horario:'14:00 a 15:00',modalidad:'Litle Snakes',programa:'Formas').save()


    def alumnoGrupo1=new AlumnoGrupo(grupo:grupo1,alumno:alumno1).save()
    def alumnoGrupo2=new AlumnoGrupo(grupo:grupo1,alumno:alumno3).save()

    def grupo2 = new Grupo(profesorDelGrupo:profe3,sucursalDelGrupo:sucursal,horario:'14:00 a 15:00',modalidad:'Litle Snakes',programa:'Formas').save()

    def alumnoGrupo3=new AlumnoGrupo(grupo:grupo2,alumno:alumno2).save()

	}
   
    def destroy = {
    }
}
