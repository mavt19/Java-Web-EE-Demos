package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import conexion.MysqlDBConexion;
import dto.Alumno;
import interfaces.InterfaceGlobal;

public class AlumnoDAOImpl implements InterfaceGlobal<Alumno>{

	private static final String SQL_INSERT="insert into tbalumno values(null,?,?,?)";
	private static final String SQL_UPDATE="update tbAlumno set nombre=?, apellido=?, edad=? where idtbalumno=?";
	private static final String SQL_DELETE="delete from tbalumno where idtbAlumno=?";
	private static final String SQL_READ="select * from tbalumno where idtbAlumno=?";
	private static final String SQL_READALL="select * from tbalumno";

	public static final MysqlDBConexion cnn = MysqlDBConexion.Conexion();
	@Override
	public boolean create(Alumno c) {
		// TODO Auto-generated method stub
		
		PreparedStatement pstm;
		try {
			pstm=cnn.getCnn().prepareStatement(SQL_INSERT);
			pstm.setString(1, c.getNombre());
			pstm.setString(2, c.getApellido());
			pstm.setInt(3, c.getEdad());
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

	@Override
	public boolean update(Alumno c) {
		// TODO Auto-generated method stub

		PreparedStatement pstm;
		try {
			pstm=cnn.getCnn().prepareStatement(SQL_UPDATE);
			pstm.setString(1, c.getNombre());
			pstm.setString(2, c.getApellido());
			pstm.setInt(3, c.getEdad());
			pstm.setInt(4, c.getIdAlumno());
			
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

	@Override
	public boolean delete(Object key) {
		
		PreparedStatement pstm;
		try {
			pstm=cnn.getCnn().prepareStatement(SQL_DELETE);
			
			pstm.setInt(1, (int) key);
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

	@Override
	public Alumno read(Object key) {
		// TODO Auto-generated method stub
		ResultSet rs = null;
		PreparedStatement pstm;
		Alumno obj=null;
		try {
			pstm=cnn.getCnn().prepareStatement(SQL_READ);
			pstm.setInt(1, (int)(key));
			rs=pstm.executeQuery();
			while(rs.next()){
				obj = new Alumno();
				obj.setIdAlumno(rs.getInt("idtbalumno"));
				obj.setNombre(rs.getString("nombre"));
				obj.setApellido(rs.getString("apellido"));
				obj.setEdad(rs.getInt("edad"));
				
			}
			
		} catch (SQLException e) {
			// TODO: handle exception
			Logger.getLogger(AlumnoDAOImpl.class.getName()).log(Level.SEVERE,null,e);
		}
		finally {
			cnn.cerrarConexion();
		}
		return obj;
	}

	@Override
	public List<Alumno> readAll() {
		// TODO Auto-generated method stub

			List<Alumno>data = new ArrayList<Alumno>();
			ResultSet rs = null;
			PreparedStatement pstm;
			try {
				pstm=cnn.getCnn().prepareStatement(SQL_READALL);
		
				rs=pstm.executeQuery();
				Alumno obj = null;
				while(rs.next()){
					obj = new Alumno();
					obj.setIdAlumno(rs.getInt("idtbalumno"));
					obj.setNombre(rs.getString("nombre"));
					obj.setApellido(rs.getString("apellido"));
					obj.setEdad(rs.getInt("edad"));
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

}
