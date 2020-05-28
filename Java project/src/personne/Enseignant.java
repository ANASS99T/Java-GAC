package personne;

public class Enseignant {

	private int idEnseignant;
	private String nomEnseignant;
	private String prenomEnseignant;
	private String adresseEnseignant;
	private String telEnseignant;
	public Enseignant(int idEnseignant, String nomEnseignant, String prenomEnseignant, String adresseEnseignant,
			String telEnseignant) {
		this.idEnseignant = idEnseignant;
		this.nomEnseignant = nomEnseignant;
		this.prenomEnseignant = prenomEnseignant;
		this.adresseEnseignant = adresseEnseignant;
		this.telEnseignant = telEnseignant;
	}
	public String getNomEnseignant() {
		return nomEnseignant;
	}
	public void setNomEnseignant(String nomEnseignant) {
		this.nomEnseignant = nomEnseignant;
	}
	public String getPrenomEnseignant() {
		return prenomEnseignant;
	}
	public void setPrenomEnseignant(String prenomEnseignant) {
		this.prenomEnseignant = prenomEnseignant;
	}
	public String getAdresseEnseignant() {
		return adresseEnseignant;
	}
	public void setAdresseEnseignant(String adresseEnseignant) {
		this.adresseEnseignant = adresseEnseignant;
	}
	public String getTelEnseignant() {
		return telEnseignant;
	}
	public void setTelEnseignant(String telEnseignant) {
		this.telEnseignant = telEnseignant;
	}
	public int getIdEnseignant() {
		return idEnseignant;
	}
	@Override
	public String toString() {
		return "Enseignant [idEnseignant=" + idEnseignant + ", nomEnseignant=" + nomEnseignant + ", prenomEnseignant="
				+ prenomEnseignant + ", adresseEnseignant=" + adresseEnseignant + ", telEnseignant=" + telEnseignant
				+ "]";
	}
	
	
}
