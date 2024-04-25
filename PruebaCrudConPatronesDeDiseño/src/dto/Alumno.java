package dto;


public class Alumno {

	private int idAlumno;
	private String nombre;
	private String apellido;
	private int edad;
	public int getIdAlumno() {
		return idAlumno;
	}
	public void setIdAlumno(int idAlumno) {
		this.idAlumno = idAlumno;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public int getEdad() {
		return edad;
	}
	public void setEdad(int edad) {
		this.edad = edad;
	}

	public Alumno() {
		// TODO Auto-generated constructor stub
	}
	public Alumno(int idAlumno, String nombre, String apellido, int edad) {
		
		this.idAlumno = idAlumno;
		this.nombre = nombre;
		this.apellido = apellido;
		this.edad = edad;
	}
	
public Alumno(int idAlumno) {
		
		this.idAlumno = idAlumno;
		
	}
	
}
