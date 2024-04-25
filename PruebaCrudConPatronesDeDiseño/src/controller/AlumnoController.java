package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AlumnoDAOImpl;
import dto.Alumno;

/**
 * Servlet implementation class AlumnoController
 */
@WebServlet("/alumno")
public class AlumnoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	

	
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("metodo")==null)
		{
			listar(request, response);
			return;
		}
		String metodo=request.getParameter("metodo");
		switch (metodo) {
		case "lista":
			listar(request,response);			
			break;
		case "registrar":
			registrar(request,response);
			break;
		case "actualizar":
			actualizar(request,response);
			break;
		case "eliminar":
			eliminar(request,response);
			break;
		case "buscar":
			buscar(request,response);
			break;

		default:
			request.getRequestDispatcher("/error.jsp").forward(request, response);
			break;
		}
	}

	

	private void buscar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		AlumnoDAOImpl dao= new AlumnoDAOImpl();
		
		Alumno a=null;
		a=dao.read(Integer.parseInt(id));
		request.setAttribute("alumno", a);
		listar(request, response);
	}



	private void eliminar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		AlumnoDAOImpl dao=new AlumnoDAOImpl();

		dao.delete(Integer.parseInt(id));
		listar(request, response);
	}



	private void actualizar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// TODO Auto-generated method stub
		
		AlumnoDAOImpl dao= new AlumnoDAOImpl();
		String id = request.getParameter("id");
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		String edad = request.getParameter("edad");
		Alumno a = new Alumno();
		a.setIdAlumno(Integer.parseInt(id));
		a.setNombre(nombre);
		a.setApellido(apellido);
		a.setEdad(Integer.parseInt(edad));
		dao.update(a);
		listar(request, response);
	}



	private void registrar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// TODO Auto-generated method stub
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		String edad = request.getParameter("edad");
		AlumnoDAOImpl dao= new AlumnoDAOImpl();
		Alumno a = new Alumno();
		a.setNombre(nombre);
		a.setApellido(apellido);
		a.setEdad(Integer.parseInt(edad));
		dao.create(a);
		
		listar(request, response);
	}



	private void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// TODO Auto-generated method stub
		AlumnoDAOImpl dao= new AlumnoDAOImpl();

			List<Alumno> lista =dao.readAll();
			request.setAttribute("lista", lista);
			request.getRequestDispatcher("/alumno.jsp").forward(request, response);
		
	}

}
