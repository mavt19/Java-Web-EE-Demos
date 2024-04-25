package dao;

import entity.Curso;
import entity.Usuario;

public interface UsuarioDao extends GenericDao<Usuario>{
	
	public String ValidateUser(Usuario user);
	public Usuario obtenerPorId(Usuario user);
}
