package entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Curso {

	
	private int idCurso;
	private String nombre;
	private String descripcion;
	private String imagen;
	private int capacidad;
	
	
}
