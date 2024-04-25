package dao;

public class subFabricaMysql extends Fabrica {


	@Override
	public CursoDao getCurso() {
		// TODO Auto-generated method stub
		return new CursoDaoImpl();
	}
	@Override
	public ReservaDAO getReserva() {
		// TODO Auto-generated method stub
		return new ReservaDaoImpl();
	}
	@Override
	public UsuarioDao getUsuario() {
		// TODO Auto-generated method stub
		return new UsuarioDaoImpl();
	}

}
