package mx.com.wma

class Profesor {
	String nombre
	String apellidos
	String genero
	String registroFederal
    Usuario usuario
    static constraints = {
    	usuario nullable: true

    }
}
