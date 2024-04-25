package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import conexion.ConexionMysql;
import entity.Curso;

public class CursoDaoImpl implements CursoDao {

	@Override
	public Curso buscar(int id) {
			Connection conn= null;
			PreparedStatement pstm = null;
			ResultSet rs = null;
			Curso obj = null;
			try {
				conn = ConexionMysql.getConexion();
				String sql ="select * from curso where idCurso=?";
				pstm = conn.prepareStatement(sql);
				pstm.setInt(1, id);
				rs = pstm.executeQuery();
				if(rs.next()){
					obj = new Curso();
					obj.setIdCurso(rs.getInt(1));
					obj.setNombre(rs.getString(2));
					obj.setDescripcion(rs.getString(3));
					obj.setImagen(rs.getString(4));
					obj.setCapacidad(rs.getInt(5));
					return obj;
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally{
				try {
					if(rs!= null) rs.close();
					if(pstm!= null) pstm.close();
					if(conn!= null) conn.close();
				} catch (Exception e2) {
				}
			}
			
			return obj;
		}
	@Override
	public List<Curso> consultar(int desde, int hasta) {
		return null;
	}

	@Override
	public List<Curso> listar() {
		List<Curso> data = new ArrayList<Curso>();
		
		Connection conn= null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			conn = ConexionMysql.getConexion();
			String sql ="select * from curso order by idcurso  desc";
			pstm = conn.prepareStatement(sql);
			rs = pstm.executeQuery();
			Curso obj = null;
			while(rs.next()){
				obj = new Curso();
				obj.setIdCurso(rs.getInt(1));
				obj.setNombre(rs.getString(2));
				obj.setDescripcion(rs.getString(3));
				obj.setImagen(rs.getString(4));
				obj.setCapacidad(rs.getInt(5));
				data.add(obj);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				if(rs!= null) rs.close();
				if(pstm!= null) pstm.close();
				if(conn!= null) conn.close();
			} catch (Exception e2) {
			}
		}
		
		return data;

	}

	@Override
	public int eliminar(int id) {
int salida = -1;
		
		Connection conn= null;
		PreparedStatement pstm = null;
		try {
			
			conn = ConexionMysql.getConexion();
			String sql ="delete from curso where idCurso=?";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, id);
			salida = pstm.executeUpdate();
			System.out.println("eliminado correctamente ");
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				if(pstm!= null) pstm.close(
						);
				if(conn!= null) conn.close();
			} catch (Exception e2) {
			}
		}
		return salida;
	}

	@Override
	public int actualizar(Curso obj) {
int salida = -1;
		
		Connection conn= null;
		PreparedStatement pstm = null;
		try {
			
			conn = ConexionMysql.getConexion();
			String sql ="update curso set nombre=?,descripcion=?,imagen=capacidad=? where idcurso=?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getNombre());
			pstm.setString(2, obj.getDescripcion());
			pstm.setString(3, obj.getImagen());
			pstm.setInt(4, obj.getCapacidad());
			pstm.setInt(5, obj.getIdCurso());
			salida = pstm.executeUpdate();
			System.out.println("actualizado correctamente "+obj.getNombre());
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				if(pstm!= null) pstm.close(
						);
				if(conn!= null) conn.close();
			} catch (Exception e2) {
			}
		}
		return salida;
	}

	@Override
	public int insertar(Curso obj) {
int salida = -1;
		
		Connection conn= null;
		PreparedStatement pstm = null;
		try {
			
			conn = ConexionMysql.getConexion();
			String sql ="insert into curso values(null,?,?,?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getNombre());
			pstm.setString(2, obj.getDescripcion());
			pstm.setString(3, obj.getImagen());
			pstm.setInt(4, obj.getCapacidad());
			salida = pstm.executeUpdate();
			System.out.println("agregado correctamente "+obj.getNombre());
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				if(pstm!= null) pstm.close(
						);
				if(conn!= null) conn.close();
			} catch (Exception e2) {
			}
		}
		return salida;
	}

}
