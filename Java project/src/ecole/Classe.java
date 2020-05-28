package ecole;

public class Classe {
	private int idClasse;
	private String nomClasse;
	private int nombreMaxEleve = 45;
	private int nombreEleve;
	private boolean disponible;
	public Classe(int idClasse, String nomClasse, int nombreEleve, boolean disponible) {
		super();
		this.idClasse = idClasse;
		this.nomClasse = nomClasse;
		this.nombreEleve = nombreEleve;
		this.disponible = disponible;
	}
	public int getIdClasse() {
		return idClasse;
	}
	public void setIdClasse(int idClasse) {
		this.idClasse = idClasse;
	}
	public String getNomClasse() {
		return nomClasse;
	}
	public void setNomClasse(String nomClasse) {
		this.nomClasse = nomClasse;
	}
	public int getNombreEleve() {
		return nombreEleve;
	}
	public void setNombreEleve(int nombreEleve) {
		this.nombreEleve = nombreEleve;
	}
	public boolean isDisponible() {
		return disponible;
	}
	public void setDisponible(boolean disponible) {
		this.disponible = disponible;
	}
	@Override
	public String toString() {
		return "Classe [idClasse=" + idClasse + ", nomClasse=" + nomClasse + ", nombreMaxEleve=" + nombreMaxEleve
				+ ", nombreEleve=" + nombreEleve + ", disponible=" + disponible + "]";
	}
	
}
