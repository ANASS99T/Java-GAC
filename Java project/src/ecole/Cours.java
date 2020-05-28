package ecole;

public class Cours {
	private int idCours;
	private String nomCours;
	private int idEnseignant;
	public Cours(int idCours, String nomCours, int idEnseignant) {
		super();
		this.idCours = idCours;
		this.nomCours = nomCours;
		this.idEnseignant = idEnseignant;
	}
	public int getIdCours() {
		return idCours;
	}
	public void setIdCours(int idCours) {
		this.idCours = idCours;
	}
	public String getNomCours() {
		return nomCours;
	}
	public void setNomCours(String nomCours) {
		this.nomCours = nomCours;
	}
	public int getIdEnseignant() {
		return idEnseignant;
	}
	public void setIdEnseignant(int idEnseignant) {
		this.idEnseignant = idEnseignant;
	}
	@Override
	public String toString() {
		return "Cours [idCours=" + idCours + ", nomCours=" + nomCours + ", idEnseignant=" + idEnseignant + "]";
	}
	
	
}
