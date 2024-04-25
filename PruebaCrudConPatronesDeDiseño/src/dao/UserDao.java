package dao;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import conexion.MysqlDBConexion;
import dto.Alumno;
import dto.UserBean;

public class UserDao {

	private static final String SQL_VALIDAR="select u.user_name,u.pass_name,ur.nom_rol from users u inner join user_rol ur on u.id_rol=ur.id_rol";

	private static final  String SQL_REGISTRAR="insert into users values (null,?,?,?,?,?,default);";
	private static final String SQL_READALL="select * from users";
	private static final String SQL_DELETE="delete from users where id_user =?";

	public static final MysqlDBConexion cnn = MysqlDBConexion.Conexion();
	
	
	public boolean create(UserBean c) {
		// TODO Auto-generated method stub
		
		PreparedStatement pstm;
		try {
			pstm=cnn.getCnn().prepareStatement(SQL_REGISTRAR);
			pstm.setString(1, c.getFirstname());
			pstm.setString(2, c.getLastname());
			pstm.setString(3, c.getEmial());
			pstm.setString(4, c.getUsername());
			pstm.setString(5, c.getPassname());
			
			if (pstm.executeUpdate()>0) {
				return true;
			}
			
		} catch (SQLException e) {
			// TODO: handle exception
			Logger.getLogger(AlumnoDAOImpl.class.getName()).log(Level.SEVERE,null,e);
		}
		finally {
			cnn.cerrarConexion();
		}
		return false;
	}

	
	
	public String ValidateUser(UserBean u) {
		String username=u.getUsername();
		String passname=u.getPassname();
		
		PreparedStatement pstm=null;
		ResultSet rs=null;
		
		String userNameBD="";
		String passNameBD="";
		String roleBD="";
		
		try {
			
			pstm=cnn.getCnn().prepareStatement(SQL_VALIDAR);
			rs=pstm.executeQuery();
			while (rs.next()) {
				userNameBD=rs.getString("user_name");
				passNameBD=rs.getString("pass_name");
				roleBD=rs.getString("nom_rol");
				
				if (username.equals(userNameBD)&&passname.equals(passNameBD)&&roleBD.equals("Administrador"))
				{
					return "Admin_Role";
				}else if (username.equals(userNameBD)&&passname.equals(passNameBD)&&roleBD.equals("Usuario")) {
					return "User_Role";
				}else if (username.equals(userNameBD)&&passname.equals(passNameBD)&&roleBD.equals("otro")) {
					return "Otro_Role";
				}
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			cnn.cerrarConexion();
		}
		
		return "Invalid credentials";
	}
	
	public List<UserBean> readAll() {
		// TODO Auto-generated method stub

			List<UserBean>data = new ArrayList<UserBean>();
			ResultSet rs = null;
			PreparedStatement pstm;
			try {
				pstm=cnn.getCnn().prepareStatement(SQL_READALL);
		
				rs=pstm.executeQuery();
				UserBean obj = null;
				while(rs.next()){
					obj = new UserBean();
					obj.setId(rs.getInt(1));
					obj.setFirstname(rs.getString(2));
					obj.setLastname(rs.getString(3));
					obj.setEmial(rs.getString(4));
					obj.setUsername(rs.getString(5));
					obj.setPassname(rs.getString(6));
					obj.setId_rol(rs.getInt(7));
					data.add(obj);

								}
				
			} catch (SQLException e) {
				// TODO: handle exception
				Logger.getLogger(AlumnoDAOImpl.class.getName()).log(Level.SEVERE,null,e);
			}
			finally {
				cnn.cerrarConexion();
			}
			return data;
		}



	public boolean delete(int parseInt) {
		// TODO Auto-generated method stub
		PreparedStatement pstm;
		try {
			pstm=cnn.getCnn().prepareStatement(SQL_DELETE);
			
			pstm.setInt(1, parseInt);
			if (pstm.executeUpdate()>0) {
				return true;
			}
			
		} catch (SQLException e) {
			// TODO: handle exception
			Logger.getLogger(AlumnoDAOImpl.class.getName()).log(Level.SEVERE,null,e);
		}
		finally {
			cnn.cerrarConexion();
		}
		return false;
	
	}

}
