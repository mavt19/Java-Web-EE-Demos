package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import conexion.ConexionMysql;
import entity.Reserva;

public class ReservaDaoImpl implements ReservaDAO {

	@Override
	public Reserva buscar(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Reserva> consultar(int desde, int hasta) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Reserva> listar() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int eliminar(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int actualizar(Reserva obj) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	public int insertar(Reserva obj){
		int salida=-1;
		Connection conn= null;
		PreparedStatement pstm = null;
		ResultSet rs= null;
		try {
			conn = ConexionMysql.getConexion();
			conn.setAutoCommit(false);
			conn.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);
			
			String leer ="select * from curso where idcurso=?";
			
			pstm = conn.prepareStatement(leer);
			pstm.setInt(1, obj.getCurso().getIdCurso());
			 rs=pstm.executeQuery();
			 if(!rs.next()) {
				 throw new SQLException();
				 }
			
			int capacidad = rs.getInt("capacidad");
			
			capacidad--;
			rs.close();
			pstm.close();
			
			
			
			if(capacidad<0) {
				 throw new SQLException("No se puede registrar mas, esta lleno");
				 }
			String sql ="insert into reserva values(null,sysdate(),?,?)";
			pstm = conn.prepareStatement(sql);
//			pstm.setString(1, obj.getFechaReserva());
			pstm.setInt(1, obj.getCurso().getIdCurso());
			pstm.setInt(2, obj.getUsuario().getId());
			salida= pstm.executeUpdate();
			pstm.close();
			String actualizar ="update curso set capacidad=? where idcurso=?";
			pstm =conn.prepareStatement(actualizar);
			pstm.setInt(1, capacidad);
			pstm.setInt(2, obj.getCurso().getIdCurso());
			salida=pstm.executeUpdate();
			pstm.close();
			conn.commit();
			System.out.println(capacidad);
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
		return salida;
	}

}
