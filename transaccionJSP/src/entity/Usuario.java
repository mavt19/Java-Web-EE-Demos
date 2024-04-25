package entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Usuario {

//	id int primary key auto_increment,
//	nombre varchar(50),
//	apellido varchar(50),
//	username varchar(50),
//	email varchar(50),
//	password varchar(50),
//	dni int,
//	id_rol int,

	
	private int id;
	private String nombre;
	private String apellido;
	private String username;
	private String email;
	private String password;
	private int dni;
	private Rol rol;
}
