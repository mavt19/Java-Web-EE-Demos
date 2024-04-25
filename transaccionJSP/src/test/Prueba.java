package test;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import conexion.ConexionMysql;
import dao.CursoDao;
import dao.CursoDaoImpl;
import dao.ReservaDAO;
import dao.ReservaDaoImpl;
import dao.UsuarioDao;
import dao.UsuarioDaoImpl;
import entity.Curso;
import entity.Reserva;
import entity.Usuario;

public class Prueba {

	public static void main(String[] args) {
		Connection conn = ConexionMysql.getConexion();
		
		if(conn !=null) {
			System.out.println("Conectado Correctamente");
			CursoDao dao= new CursoDaoImpl();
			
			Curso c = new Curso();
			c.setNombre("sds");
			c.setDescripcion("dfsfd0");
			c.setImagen("sddg");
			c.setCapacidad(2);
			dao.insertar(c);
//			
//			List<Curso> lista = dao.listar();
//			lista.forEach(System.out::println);
			
//			ReservaDAO dao= new ReservaDaoImpl();
//			
//			Curso curso = new Curso();
//			Usuario u = new Usuario();
//			curso.setIdCurso(2);
//			u.setId(1);
//			Reserva obj = new Reserva();
//			obj.setCurso(curso);
//			obj.setUsuario(u);
//			System.out.println(dao.insertar(obj));
			
//			UsuarioDao dao= new UsuarioDaoImpl();
//			Usuario u = new Usuario();
//			u.setUsername("cerdo");
//			u.setPassword("12345");
//			
//			System.out.println(dao.obtenerPorId(u));
			
			
		}else {
			System.out.println("Error");
		}
	}
}
