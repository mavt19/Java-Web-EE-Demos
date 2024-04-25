package entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Reserva {

	private int idReserva;
	private String fechaReserva;
	private Curso curso;
	private Usuario usuario;
}
