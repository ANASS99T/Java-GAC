import java.sql.Connection;
import javax.swing.JOptionPane;
import com.mysql.jdbc.Statement;
import java.sql.ResultSet;
import java.sql.PreparedStatement;

public class GestioEleve {
	static Connection conn = Utilitaire.getConnection();
	public static void ajouterEleve(String nomEleve, String prenomEleve, String adresseEleve, String teleParent, int idClasse) {
		int nombreEleve = Affectation.getNombreEleve(idClasse);
		if (nombreEleve < 45) {
			try {
				Statement stm = (Statement) conn.createStatement();
				String query = "INSERT INTO eleve "
						+ "(idEleve, nomEleve, prenomEleve, idClasse, adresseEleve, teleparentEleve)"
						+ "VALUES (NULL," + "\""+nomEleve +"\""+ ", "+"\""+ prenomEleve +"\""+ ", " + idClasse + " , " + "\""+adresseEleve + "\""+" ," +"\""+ teleParent +"\""+ ")";
				if(JOptionPane.showConfirmDialog(GAC.App, "Veuillez confirmer l'operation","Gestion d'un colege",
						JOptionPane.YES_NO_OPTION)==JOptionPane.YES_OPTION) {
				stm.executeUpdate(query);
				JOptionPane.showMessageDialog(GAC.App, "l'operation est reusite");
				String Queryele = "UPDATE classe SET nombreEleve = nombreEleve + 1 WHERE idClasse = " + idClasse;
				stm.executeUpdate(Queryele);
				}else {
					JOptionPane.showMessageDialog(GAC.App, "l'operation est arrete");
					return;
				}
			}catch (Exception e) {
				
			}
			
		}
		else {
			JOptionPane.showMessageDialog(GAC.App, "Cette classe est plein, l'operation est arrete");
			return;
		}
		
	}
	
	public static void transferEleve(int idEleve , int newIdClasse) {
		int nombreEleve = Affectation.getNombreEleve(newIdClasse);
		int niveauEleve = getNiveauEleve(idEleve);
		int niveauClasse = getNiveauClasse(newIdClasse);
		if(niveauEleve > niveauClasse) {
			JOptionPane.showMessageDialog(GAC.App, "le niveau de classe est inferieur au niveau d'eleve");
			return;
		}
		else if (niveauEleve < niveauClasse) {
			JOptionPane.showMessageDialog(GAC.App, "le niveau de classe est superieur au niveau d'eleve");
		}
		else {
			if(nombreEleve < 45) {
				try {
					String query = "UPDATE eleve SET idClasse = " + newIdClasse + " WHERE idEleve = " + idEleve ;
					Statement stm = (Statement) conn.createStatement();
					if(JOptionPane.showConfirmDialog(GAC.App, "Veuillez confirmer l'operation","Gestion d'un colege",
							JOptionPane.YES_NO_OPTION)==JOptionPane.YES_OPTION) {
					stm.executeUpdate(query);
					JOptionPane.showMessageDialog(GAC.App, "l'operation est reusite");
					}else {
						JOptionPane.showMessageDialog(GAC.App, "l'operation est arrete");
						return;
					}
				}catch (Exception e) {
				}
			}
			else {
				JOptionPane.showMessageDialog(GAC.App, "Cette classe est plein, l'operation est arrete");
				return;
			}
		}
		
	}
	
	public static int getNiveauEleve(int idEleve) {
		try {
			PreparedStatement ps = conn.prepareStatement("SELECT niveau FROM eleve, classe WHERE eleve.idEleve = ? AND eleve.idClasse = classe.idClasse");
			ps.setInt(1,idEleve);
			ResultSet rs = ps.executeQuery();
			rs.next();
			int niveau = rs.getInt(1);
			return niveau;
			}catch (Exception e) {
				System.out.println("Error in getNiveauEleve function it will return 0");
				return 0;
			}
	}
	public static int getNiveauClasse(int idClasse) {
		try {
			PreparedStatement ps = conn.prepareStatement("SELECT niveau FROM classe WHERE idClasse = ?");
			ps.setInt(1,idClasse);
			ResultSet rs = ps.executeQuery();
			rs.next();
			int niveau = rs.getInt(1);
			return niveau;
			}catch (Exception e) {
				System.out.println("Error in getNiveauClasse function it will return 0");
				return 0;
			}
	}

}
