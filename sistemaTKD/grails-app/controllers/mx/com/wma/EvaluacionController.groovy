package mx.com.wma
import java.util.*;
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import grails.gorm.DetachedCriteria
import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.security.core.Authentication
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.stereotype.Controller
import org.springframework.ui.ModelMap
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod

@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = false)
class EvaluacionController {


    def index() { 
    def cuestionarios = Cuestionario.findAll()
    //Cuestionario cuest = Cuestionario.where {(tipo.id==1)}.find()
    //def preguntas = PreguntaCuestionario.findAllByCuestionario(cuest.tipo.id)


        Cuestionario cuest1 = Cuestionario.where {(tipo.id==7)}.find()
    def preguntas1 = PreguntaCuestionario.findAllByCuestionario(cuest1)
        Cuestionario cuest2 = Cuestionario.where {(tipo.id==8)}.find()
    def preguntas2 = PreguntaCuestionario.findAllByCuestionario(cuest2)
        Cuestionario cuest3 = Cuestionario.where {(tipo.id==9)}.find()
    def preguntas3 = PreguntaCuestionario.findAllByCuestionario(cuest3)
        Cuestionario cuest4 = Cuestionario.where {(tipo.id==10)}.find()
    def preguntas4 = PreguntaCuestionario.findAllByCuestionario(cuest4)
        Cuestionario cuest5 = Cuestionario.where {(tipo.id==11)}.find()
    def preguntas5 = PreguntaCuestionario.findAllByCuestionario(cuest5)
        Cuestionario cuest6 = Cuestionario.where {(tipo.id==12)}.find()
    def preguntas6 = PreguntaCuestionario.findAllByCuestionario(cuest6)

    def vinculos = PreguntaCuestionario.findAll()
    [cuestionarios:cuestionarios,vinculos:vinculos,
    preguntas1:preguntas1,preguntas2:preguntas2,preguntas3:preguntas3,
    preguntas4:preguntas4,preguntas5:preguntas5,preguntas6:preguntas6,
    cuest1:cuest1,cuest2:cuest2,cuest3:cuest3,cuest4:cuest4,cuest5:cuest5,cuest6:cuest6,
    ]
    //[preguntas:preguntas,cuestionario:cuest,cuestionarios:cuestionarios]
    }

    def evaluacionAlumno79(){
        Cuestionario cuest = Cuestionario.where {(tipo.id==19)}.find()   
    	def preguntas = PreguntaCuestionario.findAllByCuestionario(cuest)
    	[preguntas:preguntas,cuest:cuest]
    }

@Secured(['ROLE_ALUMNO'])
    def registrarEvaluacionAlumno79(){

        println params
        def evaluacionAlumno = EvaluacionAlumno.findById(params.evaluacion)
        //println "ID EVALUACION ALUMNO:"+evaluacionAlumno
        println "CCalificacion Antes:" + evaluacionAlumno.calificacion
        evaluacionAlumno.calificacion=Double.parseDouble(params.total)
        evaluacionAlumno.save(flush: true)
        println "Calificacion Despues:" + evaluacionAlumno.calificacion


        flash.icon = "check"
        flash.messageType = "success"
        flash.title = "Evaluacion Enviada!"
        flash.message = "Los puntajes se registraron correctamente:"
        redirect(action: "alumnoEvalua") 
    }

    def evaluacionAlumno1012(){
        Cuestionario cuest = Cuestionario.where {(tipo.id==20)}.find()   
        def preguntas = PreguntaCuestionario.findAllByCuestionario(cuest)
        [preguntas:preguntas,cuest:cuest]
    }

    @Secured(['ROLE_ALUMNO'])
        def registrarEvaluacionAlumno1012(){

            println params
            def evaluacionAlumno = EvaluacionAlumno.findById(params.evaluacion)
            //println "ID EVALUACION ALUMNO:"+evaluacionAlumno
            println "Calificacion Antes:" + evaluacionAlumno.calificacion
            evaluacionAlumno.calificacion=Double.parseDouble(params.total)
            evaluacionAlumno.save(flush: true)
            println "Calificacion Despues:" + evaluacionAlumno.calificacion


            flash.icon = "check"
            flash.messageType = "success"
            flash.title = "Evaluacion Enviada!"
            flash.message = "Los puntajes se registraron correctamente:"
            redirect(action: "alumnoEvalua") 
        }


    def evaluacionAlumnoSecundaria(){
        Cuestionario cuest = Cuestionario.where {(tipo.id==21)}.find()   
        def preguntas = PreguntaCuestionario.findAllByCuestionario(cuest)
        [preguntas:preguntas,cuest:cuest]
    }

    @Secured(['ROLE_ALUMNO'])
        def registrarEvaluacionSecundaria(){

            println params
            def evaluacionAlumno = EvaluacionAlumno.findById(params.evaluacion)
            //println "ID EVALUACION ALUMNO:"+evaluacionAlumno
            println "Calificacion Antes:" + evaluacionAlumno.calificacion
            evaluacionAlumno.calificacion=Double.parseDouble(params.total)
            evaluacionAlumno.save(flush: true)
            println "Calificacion Despues:" + evaluacionAlumno.calificacion


            flash.icon = "check"
            flash.messageType = "success"
            flash.title = "Evaluacion Enviada!"
            flash.message = "Los puntajes se registraron correctamente:"
            redirect(action: "alumnoEvalua") 
        }

@Secured(['ROLE_ALUMNO'])
    def alumnoEvalua(){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication()
        String online=auth.getName()
        //Encontrar el usuario con ese nombre
        def usuario1 = Usuario.where{(username==online)}.find();

        //Encontrar el objeto alumno del usuario en linea
        def alumno = Alumno.where{(usuario==usuario1)}.find();
       def evaluaciones = EvaluacionAlumno.findAllByAlumno(alumno)
        [usuario:online,alumno:alumno,evaluaciones:evaluaciones]


        //def evaluacionesAlumno = Evaluacion.findAllByTipo(3);

    }

    @Secured(['ROLE_ALUMNO'])
    def alumnoEvalua2(){
        def alumnoEvaluacion = EvaluacionAlumno.where{(id==params.evaluacion)}.find();
        println "EvaluacionAlumno:"+alumnoEvaluacion.evaluacion
        def cuestGenerales = CuestionarioEvaluacion.findAll();
        def evaluaciones = Evaluacion.findAll();

        evaluaciones.each{e->
        println "IdEvaluacion:"+e.id +" profesor:" + e.profesor.nombre
        }
        cuestGenerales.each{c ->
        println "IdCuestionarioEvaluacion:("+c.id+")"+"Evaluacion Id: ("+c.evaluacion.id +") Cuestionario Id (" + c.cuestionario.id+")"
        }
        //println cuestGenerales.evaluacion
        //def cuestionarios = CuestionarioEvaluacion.findAllByEvaluacion(alumnoEvaluacion.evaluacion)
        //def cuestionario = CuestionarioEvaluacion.where {(cuestionario:21)}.find();
        //println "AEE:"+cuestionarios

        /*cuestionarios.each{cu->
            println "ID Cuestionario:("+cu.cuestionario.id+")"+" ID Evaluacion: ("+cu.evaluacion.id+")"

        }*/

        Cuestionario cuest1 = Cuestionario.where {(tipo.id==19)}.find()   
        def preguntas79 = PreguntaCuestionario.findAllByCuestionario(cuest1)

        Cuestionario cuest2 = Cuestionario.where {(tipo.id==20)}.find()   
        def preguntas1013 = PreguntaCuestionario.findAllByCuestionario(cuest2)

        Cuestionario cuest3 = Cuestionario.where {(tipo.id==21)}.find()   
        def preguntas = PreguntaCuestionario.findAllByCuestionario(cuest3)



        [evaluacion:alumnoEvaluacion,preguntas79:preguntas79,preguntas1013:preguntas1013,preguntas:preguntas]
    }
    
    
    def generarAllEvaluaciones(){

        boolean termino7=true;
        Profesor admin7 = Profesor.where {(id==1)}.find();

        def evaluacionesEvaluador7 = Evaluacion.findAllByTipo(2);
        Calendar c7 = Calendar.getInstance();
        SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy/MM/dd");
        Date hoy7 = c7.getTime();
        String hoy77 = dateFormat2.format(hoy7).toString();

      
        if(evaluacionesEvaluador7!=[]){
            termino7 =false;
        }
      
        String fechaTermino="";
        evaluacionesEvaluador7.each {eva->
            //println "Hoy es :"+hoy7 + " y termino el: "+eva.fechaTermino
            if(!hoy77.equals(eva.fechaTermino)){
                termino7 =false;
                fechaTermino=eva.fechaTermino;
            }
        }
        //CON FECHA INICIO LA DE HOY
            //FECHA DESPUES DE 1 SEMANA
            if(termino7==false){
                flash.icon = "check"
                flash.messageType = "warning"
                flash.title = "Evaluacion Docente Ya fue iniciada!"
                flash.message = "Las Evaluaciones han sido enviadas a los alumnos. Termina el Dia:"+fechaTermino
                redirect(action: "index")
            }
            else {
            Calendar c = Calendar.getInstance();
            Date hoy = c.getTime();

            c.add(Calendar.DAY_OF_MONTH, 7); 
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
            Date termino = c.getTime();
            String hoy1 = dateFormat.format(hoy).toString();
            String termino1 = dateFormat.format(termino).toString();
            println "HOY:"+hoy1;
            println "TERMINO:"+ termino1;
        //TRAETE A TODOS LOS PROFESORES
        def profesores = Profesor.list();

        //Crear evaluaciones para cada profesor
        profesores.each { profe -> 
            //println "profesor:"+profe.nombre
            //POR CADA PROFESOR SE GENERA UNA EVALUACION 
            def autoEvaluacion = new Evaluacion(profesor:profe,fechaInicio:hoy1,fechaTermino:termino1,tipo:1).save(flush:true)
            def evaluacionEvaluador = new Evaluacion(profesor:profe,fechaInicio:hoy1,fechaTermino:termino1,tipo:2).save(flush:true)
            def evaluacionAlumno = new Evaluacion(profesor:profe,fechaInicio:hoy1,fechaTermino:termino1,tipo:3).save(flush:true)
        }
        //println "---------------"
        //ASIGNAR CUESTIONARIOS A LA EVALUACION

        //query1 = Evaluacion.where({tipo==1})
        def autoEvaluaciones = Evaluacion.findAllByTipo(1);

        autoEvaluaciones.each {eva->
            Cuestionario cuest7 = Cuestionario.where {(tipo.id==7)}.find();
            Cuestionario cuest8 = Cuestionario.where {(tipo.id==8)}.find();
            Cuestionario cuest9 = Cuestionario.where {(tipo.id==9)}.find();
            Cuestionario cuest10 = Cuestionario.where {(tipo.id==10)}.find();
            Cuestionario cuest11 = Cuestionario.where {(tipo.id==11)}.find();
            Cuestionario cuest12 = Cuestionario.where {(tipo.id==12)}.find();
            Cuestionario cuest16 = Cuestionario.where {(tipo.id==16)}.find();
            Cuestionario cuest17 = Cuestionario.where {(tipo.id==17)}.find();
            Cuestionario cuest18 = Cuestionario.where {(tipo.id==18)}.find();
            //Cuestionario AUTO-EVALUACION
            def cuestionarioEvaluacion7 = new CuestionarioEvaluacion(evaluacion:eva,cuestionario:cuest7).save(flush:true)
            def cuestionarioEvaluacion8 = new CuestionarioEvaluacion(evaluacion:eva,cuestionario:cuest8).save(flush:true)
            def cuestionarioEvaluacion9 = new CuestionarioEvaluacion(evaluacion:eva,cuestionario:cuest9).save(flush:true)
            def cuestionarioEvaluacion10 = new CuestionarioEvaluacion(evaluacion:eva,cuestionario:cuest10).save(flush:true)
            def cuestionarioEvaluacion11 = new CuestionarioEvaluacion(evaluacion:eva,cuestionario:cuest11).save(flush:true)
            def cuestionarioEvaluacion12 = new CuestionarioEvaluacion(evaluacion:eva,cuestionario:cuest12).save(flush:true)

            def cuestionarioEvaluacion16 = new CuestionarioEvaluacion(evaluacion:eva,cuestionario:cuest16).save(flush:true)
            def cuestionarioEvaluacion17 = new CuestionarioEvaluacion(evaluacion:eva,cuestionario:cuest17).save(flush:true)
            def cuestionarioEvaluacion18 = new CuestionarioEvaluacion(evaluacion:eva,cuestionario:cuest18).save(flush:true)
            println "ID Evaluacion"+eva.id+" Profesor:"+eva.profesor.nombre
        }
        //query2 = Evaluacion.where({tipo==2})
        def evaluacionesEvaluador = Evaluacion.findAllByTipo(2);
        Profesor admin = Profesor.where {(id==1)}.find();

        evaluacionesEvaluador.each {eva->
            Cuestionario cuest1 = Cuestionario.where {(tipo.id==1)}.find();
            Cuestionario cuest2 = Cuestionario.where {(tipo.id==2)}.find();
            Cuestionario cuest3 = Cuestionario.where {(tipo.id==3)}.find();
            Cuestionario cuest4 = Cuestionario.where {(tipo.id==4)}.find();
            Cuestionario cuest5 = Cuestionario.where {(tipo.id==5)}.find();
            Cuestionario cuest6 = Cuestionario.where {(tipo.id==6)}.find();
            Cuestionario cuest13 = Cuestionario.where {(tipo.id==13)}.find();
            Cuestionario cuest14 = Cuestionario.where {(tipo.id==14)}.find();
            Cuestionario cuest15 = Cuestionario.where {(tipo.id==15)}.find();
            //Cuestionario AUTO-EVALUACION
            def cuestionarioEvaluacion1 = new CuestionarioEvaluacion(evaluacion:eva,cuestionario:cuest1,calificacion:0).save(flush:true)
            def cuestionarioEvaluacion2 = new CuestionarioEvaluacion(evaluacion:eva,cuestionario:cuest2,calificacion:0).save(flush:true)
            def cuestionarioEvaluacion3 = new CuestionarioEvaluacion(evaluacion:eva,cuestionario:cuest3,calificacion:0).save(flush:true)
            def cuestionarioEvaluacion4 = new CuestionarioEvaluacion(evaluacion:eva,cuestionario:cuest4,calificacion:0).save(flush:true)
            def cuestionarioEvaluacion5 = new CuestionarioEvaluacion(evaluacion:eva,cuestionario:cuest5,calificacion:0).save(flush:true)
            def cuestionarioEvaluacion6 = new CuestionarioEvaluacion(evaluacion:eva,cuestionario:cuest6,calificacion:0).save(flush:true)
            def cuestionarioEvaluacion13 = new CuestionarioEvaluacion(evaluacion:eva,cuestionario:cuest13,calificacion:0).save(flush:true)
            def cuestionarioEvaluacion14 = new CuestionarioEvaluacion(evaluacion:eva,cuestionario:cuest14,calificacion:0).save(flush:true)
            def cuestionarioEvaluacion15 = new CuestionarioEvaluacion(evaluacion:eva,cuestionario:cuest15,calificacion:0).save(flush:true)
            println "ID Evaluacion"+eva.id+" Profesor:"+eva.profesor.nombre
            //QUIEN EVALUA ES EL PROFESOR CON ID 1
            def vinculo = new EvaluacionEvaluador(evaluacion:eva,profesor:admin,calificacion:0).save(flush:true)
            println "Evaluación Evaluador: "+vinculo.id+" Evaluador:"+vinculo.profesor.nombre +" evalua a"+vinculo.evaluacion.profesor.nombre

        }

        //query3 = Evaluacion.where({tipo==3})
        def evaluacionesAlumno = Evaluacion.findAllByTipo(3);
            evaluacionesAlumno.each {eva->
                //OBTENER LOS GRUPOS DEL PROFESOR
                def grupos =Grupo.findAllByProfesorDelGrupo(eva.profesor);
                 //Grupo.where {(profesorDelGrupo==eva.profesor)}.find();
                // POR CADA GRUPO
                grupos.each {grupo1->
                println "Profesor:"+eva.profesor.nombre +" tiene grupo:"+grupo1.id
                //OBTENER LOS ALUMNOS
                    def alumnosDelGrupo =AlumnoGrupo.findAllByGrupo(grupo1);
                    //AlumnoGrupo.where {(grupo==grupo1)}.find();
                    alumnosDelGrupo.each{vinculo->
                        //println "Alumno del grupo:"+vinculo.grupo.id +" nombre:"+vinculo.alumno.nombre
                        def eval = new EvaluacionAlumno(evaluacion:eva,alumno:vinculo.alumno,calificacion:0).save(flush:true)
                        println "El alumno:"+eval.alumno.nombre +" evaluará al profesor "+eval.evaluacion.profesor.nombre
                        println "EDAD:"+eval.alumno.edad
                        if (eval.alumno.edad>=7 && eval.alumno.edad<=9){
                        Cuestionario cuest1 = Cuestionario.where {(tipo.id==19)}.find();
                        //Cuestionario AUTO-EVALUACION
                        def cuestEvaluacion1 = new CuestionarioEvaluacion(evaluacion:eva,cuestionario:cuest1).save(flush:true)
                        //println "Se imprime el Cuestionario Evaluacion EVALUACION "+cuestEvaluacion3.evaluacion.id +" Cuestionario "+ cuestEvaluacion3.cuestionario.id
                        
                        println eval.alumno.edad+ ": CAI EN 7-9"
                        }
                        if (eval.alumno.edad>=10 && eval.alumno.edad<=12){
                        Cuestionario cuest2 = Cuestionario.where {(tipo.id==20)}.find();
                        //Cuestionario AUTO-EVALUACION
                        def cuestEvaluacion2 = new CuestionarioEvaluacion(evaluacion:eva,cuestionario:cuest2).save(flush:true)
                        //println "Se imprime el Cuestionario Evaluacion EVALUACION "+cuestEvaluacion3.evaluacion.id +" Cuestionario "+ cuestEvaluacion3.cuestionario.id
                        println eval.alumno.edad+ ": CAI EN 10-13"
                        }
                        
                        if (eval.alumno.edad>=13){
                        Cuestionario cuest3 = Cuestionario.where {(tipo.id==21)}.find();
                        println "Se imprime Cuestionario 21: "+cuest3.id
                        //Cuestionario AUTO-EVALUACION
                        def cuestEvaluacion3 = new CuestionarioEvaluacion(evaluacion:eva,cuestionario:cuest3).save(flush:true)
                        //println "Se imprime el Cuestionario Evaluacion EVALUACION "+cuestEvaluacion3.evaluacion.id +" Cuestionario "+ cuestEvaluacion3.cuestionario.id
                        println eval.alumno.edad+ ": CAI EN MAYOR DE 13"
                        }
                    }

                }
        }
        flash.icon = "check"
        flash.messageType = "success"
        flash.title = "Evaluacion Docente Iniciada Correctamente!"
        flash.message = "Las Evaluaciones han sido enviadas a los alumnos. Termina el Dia:"+termino1
        redirect(action: "index")
    }
    }
@Secured(['ROLE_DOCENTE'])
    def evaluacionProfes(){
        def profes = Profesor.findAll();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication()
        String online=auth.getName()
        //Encontrar el usuario con ese nombre
        def usuario1 = Usuario.where{(username==online)}.find();

        //Encontrar el objeto alumno del usuario en linea
        def profe = Profesor.where{(usuario==usuario1)}.find();


        //Obtener la calificación de Practica Docente
        Evaluacion evaluacion = Evaluacion.findByProfesorAndTipo(profe,2);
        //println "evaluación: " + evaluacion.id
        //obtener la evaluacionEvaluador del Profesor
        Cuestionario cuest1 = Cuestionario.where {(tipo.id==1)}.find();
        Cuestionario cuest2 = Cuestionario.where {(tipo.id==2)}.find(); 
        Cuestionario cuest3 = Cuestionario.where {(tipo.id==3)}.find(); 
        Cuestionario cuest4 = Cuestionario.where {(tipo.id==4)}.find(); 
        Cuestionario cuest5 = Cuestionario.where {(tipo.id==5)}.find(); 
        Cuestionario cuest6 = Cuestionario.where {(tipo.id==6)}.find(); 

        //println "cuest:" + cuest.id
        def ce1 = CuestionarioEvaluacion.findByEvaluacionAndCuestionario(evaluacion,cuest1);
        def ce2 = CuestionarioEvaluacion.findByEvaluacionAndCuestionario(evaluacion,cuest2);
        def ce3 = CuestionarioEvaluacion.findByEvaluacionAndCuestionario(evaluacion,cuest3);
        def ce4 = CuestionarioEvaluacion.findByEvaluacionAndCuestionario(evaluacion,cuest4);
        def ce5 = CuestionarioEvaluacion.findByEvaluacionAndCuestionario(evaluacion,cuest5);
        def ce6 = CuestionarioEvaluacion.findByEvaluacionAndCuestionario(evaluacion,cuest6);


        println "ce1:" +ce1
        println "ce2:" +ce2
        println "ce3:" +ce3
        println "ce4:" +ce4
        println "ce5:" +ce5
        println "ce6:" +ce6

        [profesores:profes,profe:profe,ce1:ce1,ce2:ce2,ce3:ce3,ce4:ce4,ce5:ce5,ce6:ce6]
    }

    @Secured(['ROLE_DOCENTE'])
    def evaluarProfe(Profesor profesor){
        def profe = Profesor.findById(params.profe);
         //Obtener la calificación de Practica Docente
        def evaluacion = Evaluacion.findByProfesorAndTipo(profe,2);
        def evaluacionAlumno = Evaluacion.findByProfesorAndTipo(profe,3);

        //println "evaluación: " + evaluacion.id
        //obtener la evaluacionEvaluador del Profesor
        Cuestionario cuest1 = Cuestionario.where {(tipo.id==1)}.find(); 
        Cuestionario cuest2 = Cuestionario.where {(tipo.id==2)}.find(); 
        Cuestionario cuest3 = Cuestionario.where {(tipo.id==3)}.find(); 
        Cuestionario cuest4 = Cuestionario.where {(tipo.id==4)}.find(); 
        Cuestionario cuest5 = Cuestionario.where {(tipo.id==5)}.find(); 
        Cuestionario cuest6 = Cuestionario.where {(tipo.id==6)}.find(); 

        //println "cuest:" + cuest.id
        def ce1 = CuestionarioEvaluacion.findByEvaluacionAndCuestionario(evaluacion,cuest1);
        def ce2 = CuestionarioEvaluacion.findByEvaluacionAndCuestionario(evaluacion,cuest2);
        def ce3 = CuestionarioEvaluacion.findByEvaluacionAndCuestionario(evaluacion,cuest3);
        def ce4 = CuestionarioEvaluacion.findByEvaluacionAndCuestionario(evaluacion,cuest4);
        def ce5 = CuestionarioEvaluacion.findByEvaluacionAndCuestionario(evaluacion,cuest5);
        def ce6 = CuestionarioEvaluacion.findByEvaluacionAndCuestionario(evaluacion,cuest6);



        //OBTENER EL PROMEDIO DE LAS CALIFICACIONES FINALES DE TODOS SUS ALUMNOS
        //del profesor tal

        //def calificaciones79 = EvaluacionAlumno.findAllByEvaluacion(evaluacionAlumno);
        //def calificaciones89 = EvaluacionAlumno.findAllByEvaluacion(evaluacionAlumno);


        //CRISTINA TIENE 12 AÑOS
        //ALBERTO TIENE 10 AÑOS
        //KARLA TIENE 9 AÑOSS


        DetachedCriteria<EvaluacionAlumno> queryEvaluacionAlumno = EvaluacionAlumno.where {
            (evaluacion == evaluacionAlumno && alumno.edad<=9)
        }
        def eval79 = queryEvaluacionAlumno.findAll()

        DetachedCriteria<EvaluacionAlumno> queryEvaluacionAlumno2 = EvaluacionAlumno.where {
            (evaluacion == evaluacionAlumno && alumno.edad>9 && alumno.edad<13)
        }
        def eval1012 = queryEvaluacionAlumno2.findAll()
        

        DetachedCriteria<EvaluacionAlumno> queryEvaluacionAlumno3 = EvaluacionAlumno.where {
            (evaluacion == evaluacionAlumno && alumno.edad>12)
        }
        def evalSec = queryEvaluacionAlumno3.findAll()


        double acumulador1 = 0;
        double acumulador2 = 0;
        double acumulador3 = 0;



        //REGLA DE 3 SIMPLE
        // 24  ->100%
        // CALIFICACION -> X ?

        eval79.each{calificacion ->
            double aux = (100*calificacion.calificacion)/24;
            acumulador1 += aux
        }
        println "--------------------------"
         eval1012.each{calificacion ->
            double aux = (100*calificacion.calificacion)/30;
            acumulador2 += aux
        }
        println "--------------------------"

         evalSec.each{calificacion ->
           double aux = (100*calificacion.calificacion)/68;
            acumulador3 += aux
        }
        println "--------------------------"


        //DIVIDIR ENTRE LOS ALUMNOS
        double nuevo1 = acumulador1/eval79.size();
        double nuevo2 = acumulador2/eval1012.size();
        double nuevo3 = acumulador3/evalSec.size();



        [profesor:profe,ce1:ce1,ce2:ce2,ce3:ce3,ce4:ce4,ce5:ce5,
        ce6:ce6,calificaciones79:eval79,eval1012:eval1012,evalSec:evalSec,
        promedio1:nuevo1,promedio2:nuevo2,promedio3:nuevo3]
    }
    @Secured(['ROLE_DOCENTE'])
    def evalAmbiente(){
       def profe = Profesor.findById(params.profe);
        Cuestionario cuest = Cuestionario.where {(tipo.id==3)}.find()   
        def preguntas = PreguntaCuestionario.findAllByCuestionario(cuest)

        [profesor:profe,preguntas:preguntas,cuest:cuest]
    }

@Secured(['ROLE_DOCENTE'])
    def evalConsideraciones(){
        def profe = Profesor.findById(params.profe);
        Cuestionario cuest = Cuestionario.where {(tipo.id==6)}.find()   
        def preguntas = PreguntaCuestionario.findAllByCuestionario(cuest)

        [profesor:profe,preguntas:preguntas,cuest:cuest]
    }
    @Secured(['ROLE_DOCENTE'])
    def evalGestion(){
        def profe = Profesor.findById(params.profe);
        Cuestionario cuest = Cuestionario.where {(tipo.id==4)}.find()   
        def preguntas = PreguntaCuestionario.findAllByCuestionario(cuest)

        [profesor:profe,preguntas:preguntas,cuest:cuest]
    }
    @Secured(['ROLE_DOCENTE'])
    def evalPadres(){
        def profe = Profesor.findById(params.profe);
        Cuestionario cuest = Cuestionario.where {(tipo.id==5)}.find()   
        def preguntas = PreguntaCuestionario.findAllByCuestionario(cuest)

        [profesor:profe,preguntas:preguntas,cuest:cuest]
    }

    @Secured(['ROLE_DOCENTE'])
    def evalPracticaDocente(){
        def profe = Profesor.findById(params.profe);
        Cuestionario cuest = Cuestionario.where {(tipo.id==1)}.find()   
        def preguntas = PreguntaCuestionario.findAllByCuestionario(cuest)

        [profesor:profe,preguntas:preguntas,cuest:cuest]
    }

    @Secured(['ROLE_DOCENTE'])
    def evalReglamento(){
        def profe = Profesor.findById(params.profe);
        Cuestionario cuest = Cuestionario.where {(tipo.id==2)}.find()   
        def preguntas = PreguntaCuestionario.findAllByCuestionario(cuest)

        [profesor:profe,preguntas:preguntas,cuest:cuest]
    }

    @Secured(['ROLE_DOCENTE'])
    def registrarCalificacion(){

            println "Los params son:"+params
            //obtener al profesor
            def profesor = Profesor.findById(params.profesor);
            println "El profesor "+profesor.nombre + " "+profesor.apellidos
            //obtener la evaluacion
            def evaluacion = Evaluacion.findByProfesorAndTipo(profesor,2);
            println "Evaluación:" +evaluacion.id +" "+evaluacion.tipo
            //obtener la evaluacionEvaluador del Profesor
            Cuestionario cuest = Cuestionario.where {(tipo.id==Integer.parseInt(params.tipo))}.find(); 

            def ce = CuestionarioEvaluacion.findByEvaluacionAndCuestionario(evaluacion,cuest);
            println "Cuestionario Evaluacion es:" +ce.id
            //cambiar Calificacion

            //OBTENER EL NUMERO DE PREGUNTAS DEL CUESTIONARIO
            def preguntas = PreguntaCuestionario.findAllByCuestionario(cuest)
            def numPreguntas = preguntas.size();
            def calificacion = (Integer.parseInt(params.total)*10/numPreguntas)*2;

            println "Calificacion Antes:" + ce.calificacion
            ce.calificacion=calificacion;
            ce.save(flush: true);
            println "Calificacion Despues:" + ce.calificacion
            redirect(action: "evaluacionProfes")
        
    }
}
