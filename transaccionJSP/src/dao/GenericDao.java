package dao;

import java.util.List;



public interface GenericDao <T>{

	public T buscar(int id);
	public List<T> consultar(int desde, int hasta);
	public List<T> listar();
	public int eliminar(int id);
	public int actualizar(T obj);
	public int insertar(T obj);
}
