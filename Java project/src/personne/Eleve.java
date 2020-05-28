package personne;

public class Eleve {
	private int idEleve;
	private String nomEleve;
	private String prenomEleve;
	private int idClasse;
	private String adresseEleve;
	private String teleparentEleve;
	public Eleve(int idEleve, String nomEleve, String prenomEleve, int idClasse, String adresseEleve,
			String teleparentEleve) {
		super();
		this.idEleve = idEleve;
		this.nomEleve = nomEleve;
		this.prenomEleve = prenomEleve;
		this.idClasse = idClasse;
		this.adresseEleve = adresseEleve;
		this.teleparentEleve = teleparentEleve;
	}
	public int getIdEleve() {
		return idEleve;
	}
	public void setIdEleve(int idEleve) {
		this.idEleve = idEleve;
	}
	public String getNomEleve() {
		return nomEleve;
	}
	public void setNomEleve(String nomEleve) {
		this.nomEleve = nomEleve;
	}
	public String getPrenomEleve() {
		return prenomEleve;
	}
	public void setPrenomEleve(String prenomEleve) {
		this.prenomEleve = prenomEleve;
	}
	public int getIdClasse() {
		return idClasse;
	}
	public void setIdClasse(int idClasse) {
		this.idClasse = idClasse;
	}
	public String getAdresseEleve() {
		return adresseEleve;
	}
	public void setAdresseEleve(String adresseEleve) {
		this.adresseEleve = adresseEleve;
	}
	public String getTeleparentEleve() {
		return teleparentEleve;
	}
	public void setTeleparentEleve(String teleparentEleve) {
		this.teleparentEleve = teleparentEleve;
	}
	@Override
	public String toString() {
		return "Eleve [idEleve=" + idEleve + ", nomEleve=" + nomEleve + ", prenomEleve=" + prenomEleve + ", idClasse="
				+ idClasse + ", adresseEleve=" + adresseEleve + ", teleparentEleve=" + teleparentEleve + "]";
	}
	
}
