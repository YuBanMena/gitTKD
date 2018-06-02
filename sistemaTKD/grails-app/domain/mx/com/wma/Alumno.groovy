package mx.com.wma

class Alumno {

	Grado gradoCinta
	Usuario usuario
	String nombre
	String apellidos
	Integer edad
	String direccion
	String telefono
	String genero
	String rifAnual

    static constraints = {
    	usuario nullable: true
    	gradoCinta nullable: true

    }
}
