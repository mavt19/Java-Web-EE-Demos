package interfaces;

import java.util.List;

public interface InterfaceGlobal <Clase>{

	public boolean create(Clase c);
	public boolean update(Clase c);
	public boolean delete(Object key);
	
	public Clase read(Object key);
	public List<Clase> readAll();
}
