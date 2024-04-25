package conexion;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConexionMysql {
	static{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	public static Connection getConexion(){
		Connection con=null;
		try {
//			con=DriverManager.getConnection("jdbc:mysql://node44883-env-0113449.jelastic.saveincloud.net/proyecto","root","CMSH9pbBZc");
			con=DriverManager.getConnection("jdbc:mysql://localhost/proyecto","root","13111997");
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

}
