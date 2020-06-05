import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.Time;

import javax.swing.JOptionPane;

import com.mysql.jdbc.Statement;

public class GestionAbsence {
	static Connection conn = Utilitaire.getConnection();
	
	public static void AjouterAbsence(int idEleve,boolean b,String jour ,String heureDebut,String heureFin) {
		if(JOptionPane.showConfirmDialog(GAC.App, "Confirmation d'opperation", "Gestion d'un colege",
				JOptionPane.YES_NO_OPTION)==JOptionPane.YES_OPTION) {
		
			String Query = "INSERT INTO absence "
					+ "(idAbsence, jour, heureDebut,heureFin, excuse, idEleve) "
					+ "VALUES (NULL,"+ "\"" + jour + "\" ," + "\"" + heureDebut+"\" ," +"\""+ heureFin+"\" ," +b + ", "+ idEleve+")";
			System.out.println(Query);
			try {
			Statement st = (Statement) conn.createStatement();
			st.executeUpdate(Query);
			JOptionPane.showMessageDialog(GAC.App, "insertion termin\u00e9 ... l'affectation reusite");
			return;
			}catch (Exception e) {
				JOptionPane.showMessageDialog(GAC.App, "L'op\u00e9ration est arr\u00e9t\u00e9e");
				return;
			}
		}
		else {
			JOptionPane.showMessageDialog(GAC.App, "L'op\u00e9ration est arr\u00e9t\u00e9e");
			return;
		}
		}
	
	
		
	}


