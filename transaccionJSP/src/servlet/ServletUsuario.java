package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UsuarioDao;
import dao.UsuarioDaoImpl;
import entity.Usuario;

/**
 * Servlet implementation class ServletUsuario
 */
@WebServlet("/usuario")
public class ServletUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletUsuario() {
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
			request.getRequestDispatcher("/index.jsp").forward(request, response);
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
		}else if(met.equals("login")){
			login(request, response);
		}else if(met.equals("logon")){
			logon(request, response);
		}else {
			request.setAttribute("error", "Disculpe no se pudo encontrar la página, ingrese una url válida");
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}

	private void logon(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session =request.getSession(false);
		if (session!=null) {
			session.invalidate();
			request.setAttribute("logonMsg", "Cerraste sesion con exito :)");
			RequestDispatcher rd=
					request.getRequestDispatcher("/reserva?metodo=lista");
			rd.forward(request, response);
			System.out.println("Logged out");
		}
	}

	private void login(HttpServletRequest request, HttpServletResponse response) {
		String userName=request.getParameter("username");
		String passName=request.getParameter("password");
		
		Usuario user= new Usuario();
		user.setUsername(userName);
		user.setPassword(passName);
		
		
		UsuarioDao dao= new  UsuarioDaoImpl();
		Usuario usuario = dao.obtenerPorId(user);
		try {
			String ValidarUser=dao.ValidateUser(user);
			if (ValidarUser.equals("Admin_Role")) {
				System.out.println("Bienvenido Admin");
				HttpSession session =request.getSession();
				session.setAttribute("admin", user);
				request.setAttribute("userName", usuario);
				
				request.getRequestDispatcher("/index.jsp").forward(request, response);
				
			}else if (ValidarUser.equals("User_Role")) {
				
				System.out.println("Bienvenido Usuario");
				HttpSession session =request.getSession();
				session.setAttribute("user", user);
				session.setAttribute("userId", usuario.getId());
				session.setAttribute("userName",  usuario.getNombre());
				
				request.getRequestDispatcher("/reserva?metodo=lista").forward(request, response);
				
			}else if (ValidarUser.equals("Otro_Role")) {
				System.out.println("Bienvenido Extraño..");
				HttpSession session =request.getSession();
				session.setAttribute("user", userName);
				request.setAttribute("userName", userName);
				
				request.getRequestDispatcher("/index.jsp").forward(request, response);
				
			}else {
				System.out.println("error = "+ValidarUser);
				request.setAttribute("errMesage", ValidarUser);

				request.getRequestDispatcher("/reserva?metodo=lista").forward(request, response);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	
	}

	private void actualiza(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	private void busca(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	private void elimina(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	private void registra(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	private void lista(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

}
