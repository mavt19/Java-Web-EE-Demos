package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AlumnoDAOImpl;
import dao.UserDao;
import dto.Alumno;
import dto.UserBean;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/validar")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated me
		if(request.getParameter("metodo")==null)
		{
			request.getRequestDispatcher("/inicio.jsp").forward(request, response);
			return;
		}
		String metodo=request.getParameter("metodo");
		switch (metodo) {
		case "login":
			login(request,response);			
			break;
		case "logon":
			logon(request,response);
			break;
		case "register":
			register(request,response);
			break;
		default:
			request.getRequestDispatcher("/error.jsp").forward(request, response);
			break;

	}
	}


	private void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String correo = request.getParameter("correo");
		String user_name = request.getParameter("user_name");
		String pass_name = request.getParameter("pass_name");
		
		UserDao dao = new UserDao();
		UserBean bean = new UserBean();
		bean.setFirstname(firstname);
		bean.setLastname(lastname);
		bean.setEmial(correo);
		bean.setUsername(user_name);
		bean.setPassname(pass_name);
		
		if (firstname.isEmpty() || lastname.isEmpty() || correo.isEmpty() || user_name.isEmpty() || pass_name.isEmpty()) {
			request.setAttribute("errBean", "no se pudo registrar :( /n vuelva a intentarlo");
			System.out.println("error al registrar");
			
		}
		

		else {

			dao.create(bean);
		}
		
		HttpSession session =request.getSession();
		session.setAttribute("user", user_name);


		login(request, response);
	}


	private void logon(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session =request.getSession(false);
		if (session!=null) {
			session.invalidate();
			request.setAttribute("logoutMesage", "Cerraste sesion con exito :)");
			RequestDispatcher rd=
					request.getRequestDispatcher("/inicio.jsp");
			rd.forward(request, response);
			System.out.println("Logged out");
		}
	}


	private void login(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException {
		// TODO Auto-generated method stub
		
		String userName=request.getParameter("username");
		String passName=request.getParameter("password");
		
		UserBean user= new UserBean();
		user.setUsername(userName);
		user.setPassname(passName);
		
		UserDao dao= new  UserDao();
		
		try {
			String ValidarUser=dao.ValidateUser(user);
			if (ValidarUser.equals("Admin_Role")) {
				System.out.println("Bienvenido Admin");
				HttpSession session =request.getSession();
				session.setAttribute("admin", userName);
				request.setAttribute("userName", userName);

				request.setAttribute("exitoMesage", "Iniciaste sesion con exito :)!!");
				request.getRequestDispatcher("/inicio.jsp").forward(request, response);
				
			}else if (ValidarUser.equals("User_Role")) {
				System.out.println("Bienvenido Usuario");
				HttpSession session =request.getSession();
				session.setAttribute("user", userName);
				request.setAttribute("userName", userName);

				request.setAttribute("exitoMesage", "Iniciaste sesion con exito :)!!");
				request.getRequestDispatcher("/inicio.jsp").forward(request, response);
				
			}else if (ValidarUser.equals("Otro_Role")) {
				System.out.println("Bienvenido Extraño..");
				HttpSession session =request.getSession();
				session.setAttribute("user", userName);
				request.setAttribute("userName", userName);
				request.setAttribute("exitoMesage", "Iniciaste sesion con exito :)!!");
				request.getRequestDispatcher("/inicio.jsp").forward(request, response);
				
			}else {
				if (userName.isEmpty() && passName.isEmpty()) {
					request.setAttribute("vacio", "ingrese valores");
				}
				System.out.println("error = "+ValidarUser);
				request.setAttribute("errMesage", ValidarUser);

				request.getRequestDispatcher("/inicio.jsp").forward(request, response);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

}
