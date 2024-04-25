package dao;

public abstract class Fabrica {
	
	public static final int mysql =1;
	public static final int sqlserver =2;
	public static final int oracle=3;
	
	public abstract CursoDao getCurso();
	public abstract ReservaDAO getReserva();
	public abstract UsuarioDao getUsuario();
	
	public static Fabrica subFabrica(int tipo){
		
		switch(tipo){
		
			case mysql: return new subFabricaMysql();
			case sqlserver: return null;
			case oracle: return null;
		
		}
		return null;
		
	}

}
