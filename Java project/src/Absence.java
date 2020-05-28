import java.sql.Date;
import java.sql.Time;

public class Absence {
	private int idAbsence;
	private String jour ;
	private String heureDebut;
	private String heureFin;
	private boolean excuse;
	private int idEleve;
	public Absence(int idAbsence, String jour, String heureDebut,String heureFin, boolean excuse, int idEleve) {
		this.idAbsence = idAbsence;
		this.jour = jour;
		this.heureDebut = heureDebut;
		this.heureDebut = heureFin;
		this.excuse = excuse;
		this.idEleve = idEleve;
	}
	public String getHeureDebut() {
		return heureDebut;
	}
	public void setHeureDebut(String heureDebut) {
		this.heureDebut = heureDebut;
	}
	public String getHeureFin() {
		return heureFin;
	}
	public void setHeureFin(String heureFin) {
		this.heureFin = heureFin;
	}
	//constructeur vide on va etre besoin 
	public Absence() {
		
	}
	public int getIdAbsence() {
		return idAbsence;
	}
	public void setIdAbsence(int idAbsence) {
		this.idAbsence = idAbsence;
	}
	public String getJour() {
		return jour;
	}
	public void setJour(String jour) {
		this.jour = jour;
	}
	
	public boolean getExcuse() {
		return excuse;
	}
	public void setExcuse(boolean excuse) {
		this.excuse = excuse;
	}
	public int getIdEleve() {
		return idEleve;
	}
	public void setIdEleve(int idEleve) {
		this.idEleve = idEleve;
	}
	@Override
	public String toString() {
		return "Absence [idAbsence=" + idAbsence + ", jour=" + jour + ", heureDebut=" + heureDebut + ", heureFin="
				+ heureFin + ", excuse=" + excuse + ", idEleve=" + idEleve + "]";
	}
	
}
