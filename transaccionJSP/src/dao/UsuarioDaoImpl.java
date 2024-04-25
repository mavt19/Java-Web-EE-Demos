package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import conexion.ConexionMysql;
import entity.Curso;
import entity.Usuario;

public class UsuarioDaoImpl implements UsuarioDao {

	
	

	@Override
	public int eliminar(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	

	@Override
	public String ValidateUser(Usuario user) {
		
		String username=user.getUsername();
		String passname=user.getPassword();
		
		
		String usernameDB="";
		String passwordDB="";
		String rolDB="";
		Connection conn= null;
		PreparedStatement pstm = null;
		ResultSet rs= null;
		try {
			conn = ConexionMysql.getConexion();
			
			String leer ="select u.username,u.password,ur.nombre from user u inner join rol ur on u.id_rol=ur.id";
			
			pstm = conn.prepareStatement(leer);
			 rs=pstm.executeQuery();
			 
			 while (rs.next()) {
					usernameDB=rs.getString("username");
					passwordDB=rs.getString("password");
					rolDB=rs.getString("nombre");
					
					if (username.equals(usernameDB)&&passname.equals(passwordDB)&&rolDB.equals("admin"))
					{
						return "Admin_Role";
					}else if (username.equals(usernameDB)&&passname.equals(passwordDB)&&rolDB.equals("user")) {
						return "User_Role";
					}else if (username.equals(usernameDB)&&passname.equals(passwordDB)&&rolDB.equals("otro")) {
						return "Otro_Role";
					}
				}
			 
			rs.close();
			pstm.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
		} finally{
			try {
				if(pstm!= null) pstm.close(
						);
				if(conn!= null) conn.close();
			} catch (Exception e2) {
			}
		}
		return "Invalid credentials";
	}

	@Override
	public Usuario buscar(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int actualizar(Usuario obj) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertar(Usuario obj) {
		// TODO Auto-generated method stub
		return 0;
	}



	@Override
	public List<Usuario> consultar(int desde, int hasta) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public List<Usuario> listar() {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public Usuario obtenerPorId(Usuario user) {
		ResultSet rs = null;
		PreparedStatement pstm = null;
		Usuario obj=null;
		Connection conn=null;
		try {
             conn = ConexionMysql.getConexion();
			
			String leer ="select * from user where username=? and password=?";
			
			pstm = conn.prepareStatement(leer);
			pstm.setString(1,user.getUsername());
			pstm.setString(2,user.getPassword());
			rs=pstm.executeQuery();
			while(rs.next()){
				obj = new Usuario();
				obj.setId(rs.getInt("id"));
				obj.setNombre(rs.getString("nombre"));
				obj.setApellido(rs.getString("apellido"));
				
			}
			
		} catch (SQLException e) {
			// TODO: handle exception
			Logger.getLogger(UsuarioDaoImpl.class.getName()).log(Level.SEVERE,null,e);
		}
		finally {
			try {
				if(pstm!= null) pstm.close(
						);
				if(conn!= null) conn.close();
			} catch (Exception e2) {
			}
		}
		return obj;
	}



}
