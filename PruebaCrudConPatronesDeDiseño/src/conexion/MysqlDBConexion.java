package conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MysqlDBConexion {
	
	public static MysqlDBConexion instance;
	private Connection cnn;
	private MysqlDBConexion()
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			cnn=DriverManager.getConnection("jdbc:mysql://localhost/mydb","root","13111997");
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static MysqlDBConexion Conexion() {
		if (instance==null) {
			instance= new MysqlDBConexion();
		}
		return instance;
	}

	public Connection getCnn() {
		return cnn;
	}

	public void setCnn(Connection cnn) {
		this.cnn = cnn;
	}
	
	public void cerrarConexion()
	{
		MysqlDBConexion.instance=null;
	}
		
}
