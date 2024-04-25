package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CursoDao;
import dao.Fabrica;
import entity.Curso;

/**
 * Servlet implementation class ServletCurso
 */
@WebServlet("/curso")
public class ServletCurso extends HttpServlet {
	private static final long serialVersionUID = 1L;
   

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String met = request.getParameter("metodo");
		if(request.getParameter("metodo")==null)
		{
//			request.getRequestDispatcher("/curso?metodo=lista").forward(request, response);
//			return;
			lista(request, response);
			return;
		}
		if(met.equals("lista")){
			lista(request, response);
		}else if(met.equals("registra")){
			registra(request, response);
		
		}else if(met.equals("elimina")){
			elimina(request, response);
		}else if(met.equals("busca")){
			busca(request, response);
		}else if(met.equals("actualiza")){
			actualiza(request, response);
		}else if(met.equals("elimina")){
			consulta(request, response);
		}else {
			request.setAttribute("error", "Disculpe no se pudo encontrar la página, ingrese una url válida");
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}

	private void consulta(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	private void actualiza(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String nombre = request.getParameter("nomCurso");
		String descripcion = request.getParameter("desCurso");
		String imagen = request.getParameter("imgCurso");
		String capacidad = request.getParameter("capCurso");

		Curso curso = new Curso();
		
		
		curso.setNombre(nombre);
		curso.setDescripcion(descripcion);
		curso.setImagen(imagen);
		curso.setCapacidad(Integer.parseInt(capacidad));
	
		
		
		Fabrica subFabrica = Fabrica.subFabrica(Fabrica.mysql);
		CursoDao dao = subFabrica.getCurso();
		int res = dao.insertar(curso);
		System.out.println(res);
		if(res>0) {
		request.setAttribute("mensaje", " Curso Agregado Correctamente");
		}

		lista(request, response);
		
	}

	private void busca(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("idCurso");
		
		Fabrica subFabrica = Fabrica.subFabrica(Fabrica.mysql);
		CursoDao dao = subFabrica.getCurso();
	
		Curso curso =  dao.buscar(Integer.parseInt(id));
		
		request.setAttribute("curso", curso);
		request.getRequestDispatcher("/detalleCurso.jsp").forward(request, response);
		
	}

	private void elimina(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("idCurso");	
		
		
		Fabrica subFabrica = Fabrica.subFabrica(Fabrica.mysql);
		CursoDao dao = subFabrica.getCurso();
		int res = dao.eliminar(Integer.parseInt(id));
		System.out.println(res);
		if(res>0) {
		request.setAttribute("mensaje", " Eliminado  Correctamente");
		}

		lista(request, response);
		
	}

	private void registra(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nombre = request.getParameter("nomCurso");
		String descripcion = request.getParameter("desCurso");
		String imagen = request.getParameter("imgCurso");
		String capacidad = request.getParameter("capCurso");

		Curso curso = new Curso();
		
		
		curso.setNombre(nombre);
		curso.setDescripcion(descripcion);
		curso.setImagen(imagen);
		curso.setCapacidad(Integer.parseInt(capacidad));
	
		
		
		Fabrica subFabrica = Fabrica.subFabrica(Fabrica.mysql);
		CursoDao dao = subFabrica.getCurso();
		int res = dao.insertar(curso);
		System.out.println(res);
		if(res>0) {
		request.setAttribute("mensaje", " Curso Agregado Correctamente");
		}

		lista(request, response);
		
	}

	private void lista(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Fabrica subFabrica = Fabrica.subFabrica(Fabrica.mysql);
		CursoDao dao = subFabrica.getCurso();
	
		List<Curso> data = dao.listar();
		request.setAttribute("lista", data);
		request.getRequestDispatcher("/mtCurso.jsp").forward(request, response);
		
	}

}
