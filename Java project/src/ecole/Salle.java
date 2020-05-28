package ecole;

public class Salle {
	private int idSalle;
	private String nomSalle;
	private int capaciteSalle;
	private boolean disponible;
	public Salle(int idSalle, String nomSalle, int capaciteSalle, boolean disponible) {
		super();
		this.idSalle = idSalle;
		this.nomSalle = nomSalle;
		this.capaciteSalle = capaciteSalle;
		this.disponible = disponible;
	}
	public int getIdSalle() {
		return idSalle;
	}
	public void setIdSalle(int idSalle) {
		this.idSalle = idSalle;
	}
	public String getNomSalle() {
		return nomSalle;
	}
	public void setNomSalle(String nomSalle) {
		this.nomSalle = nomSalle;
	}
	public int getCapaciteSalle() {
		return capaciteSalle;
	}
	public void setCapaciteSalle(int capaciteSalle) {
		this.capaciteSalle = capaciteSalle;
	}
	public boolean isDisponible() {
		return disponible;
	}
	public void setDisponible(boolean disponible) {
		this.disponible = disponible;
	}
	@Override
	public String toString() {
		return "Salle [idSalle=" + idSalle + ", nomSalle=" + nomSalle + ", capaciteSalle=" + capaciteSalle
				+ ", disponible=" + disponible + "]";
	}
	
	
}
