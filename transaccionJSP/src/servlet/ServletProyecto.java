package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CursoDao;
import dao.Fabrica;
import dao.ReservaDAO;
import entity.Curso;
import entity.Reserva;
import entity.Usuario;

/**
 * Servlet implementation class ServletProyecto
 */
@WebServlet("/reserva")
public class ServletProyecto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletProyecto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String met = request.getParameter("metodo");
		if(request.getParameter("metodo")==null)
		{
			request.getRequestDispatcher("/reserva?metodo=lista").forward(request, response);
			return;
		}
		if(met.equals("lista")){
			lista(request, response);
		}else if(met.equals("registra")){
			registra(request, response);
		}else {
			request.setAttribute("error", "Disculpe no se pudo encontrar la página, ingrese una url válida");
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
//		}else if(met.equals("elimina")){
//			elimina(request, response);
//		}else if(met.equals("busca")){
//			busca(request, response);
//		}else if(met.equals("actualiza")){
//			actualiza(request, response);
//		}else if(met.equals("elimina")){
//			consulta(request, response);
//		}
	}

	private void registra(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idCurso = request.getParameter("idCurso");
		String idUsuario = request.getParameter("idUsuario");
		Reserva a = new Reserva();
		Curso curso = new Curso();
		Usuario usuario = new Usuario();
		usuario.setId(Integer.parseInt(idUsuario));
		curso.setIdCurso(Integer.parseInt(idCurso));
		a.setCurso(curso);
		a.setUsuario(usuario);
		
		
		Fabrica subFabrica = Fabrica.subFabrica(Fabrica.mysql);
		ReservaDAO dao = subFabrica.getReserva();
		int res = dao.insertar(a);
		if(res>0) {
		request.setAttribute("mensaje", "Inscrito en el curso Satisfactoriamente");
		}

		lista(request, response);
	}

	private void lista(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Fabrica subFabrica = Fabrica.subFabrica(Fabrica.mysql);
		CursoDao dao = subFabrica.getCurso();
	
		List<Curso> data = dao.listar();
		request.setAttribute("lista", data);
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
