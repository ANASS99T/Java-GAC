
import java.sql.Connection;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Scanner;

import javax.swing.JOptionPane;

import com.mysql.jdbc.Statement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;


public class Affectation {
	
	static Connection conn = Utilitaire.getConnection();

	public static void affectSalle(int idClasse, int idCours, int idMateriel,String date, String heurDebut, String heurFin) throws ParseException, SQLException{
		
		String timeFormat = "HH:mm:ss";
		String dateFormat = "yyyy-MM-dd";
		SimpleDateFormat df = new SimpleDateFormat(dateFormat);
		
		try {
		    Date Datetest = df.parse(date);
		    if (!df.format(Datetest).equals(date)) {
		    	JOptionPane.showMessageDialog(AffectationInterface.App, "Erreur sur Input Date");
		    	return;
		    }
		} catch (ParseException ex) {
			JOptionPane.showMessageDialog(AffectationInterface.App, "Erreur sur Input Date");
	    	return;
		}
		SimpleDateFormat tf = new SimpleDateFormat(timeFormat);
		try {
		    Date Timetest1 = tf.parse(heurDebut);
		    if (!tf.format(Timetest1).equals(heurDebut)) {
		    	JOptionPane.showMessageDialog(AffectationInterface.App, "Erreur sur Input Time1");
		    	return;
		    }
		} catch (ParseException ex) {
			JOptionPane.showMessageDialog(AffectationInterface.App, "Erreur sur Input Time1");
	    	return;
		}
		try {
		    Date Timetest2 = tf.parse(heurFin);
		    if (!tf.format(Timetest2).equals(heurFin)) {
		    	JOptionPane.showMessageDialog(AffectationInterface.App, "Erreur sur Input Time2");
		    	return;
		    }
		} catch (ParseException ex) {
			JOptionPane.showMessageDialog(AffectationInterface.App, "Erreur sur Input Time2");
	    	return;
		}
		//int idClasse = getIdClasse(nomClasse);
		//int idCours = getIdCours(nomCours);
		int [] norSalle = {6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};
		
		// get tous les salles disponibles dans un jour donne et duree donnees sauf la salle de sports
		
			String query1 = "SELECT * FROM salle WHERE (salle.idSalle <> ALL (SELECT idSalle FROM affectation WHERE jour = ? AND heurDebut <= ? AND heurFin >= ?)) AND idSalle <> 1";
			PreparedStatement st1 = conn.prepareStatement(query1);
			st1.setString(1, date);
			st1.setString(2, heurDebut);
			st1.setString(3, heurFin);
			ResultSet rs1 = st1.executeQuery();
			ArrayList<Integer> salleLibre = new ArrayList<>();
			ArrayList<Integer> normaleSalle = new ArrayList<Integer>();
			System.out.println("la list des salles dispo sans salle du sport:");
			while(rs1.next()) {
				salleLibre.add(rs1.getInt(1));
				System.out.println(rs1.getInt(1));
				for(int salle : norSalle) {
					if(salle == rs1.getInt(1)) {
						normaleSalle.add(salle);
					}
				}
			}
		//get le nombre d'eleve existe dans la salle du sport
 			
			String query = "SELECT SUM(nombreEleve) AS nombreTotaleEleve FROM classe, affectation WHERE jour = ? AND heurDebut <= ? AND heurFin >= ? AND affectation.idClasse = classe.idClasse AND idSalle = 1";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1,date);
			st.setString(2, heurDebut);
			st.setString(3, heurFin);
			ResultSet rs = st.executeQuery();
			rs.next();
			int nombreEleve = rs.getInt(1);
			System.out.println("nombre d'eleve sur salle du sport : " + nombreEleve);
		
		//get tous les classes disponibles dans un jour et duree donnees
		
			String query2 = "SELECT * FROM classe WHERE classe.idClasse <> ALL (SELECT  idClasse FROM affectation WHERE jour = ? AND heurDebut <= ? AND heurFin >= ?)";
			PreparedStatement st2 = conn.prepareStatement(query2);
			st2.setString(1, date);
			st2.setString(2, heurDebut);
			st2.setString(3, heurFin);
			ResultSet rs2 = st2.executeQuery();
			ArrayList<Integer> classeLibre = new ArrayList<>();
			System.out.println("la list des les classes dispo :");
			while(rs2.next()) {
				classeLibre.add(rs2.getInt(1));
				System.out.println(rs2.getInt(1));
			}
		
		//get tous les cours disponibles dans un jour et duree donnees 
		
			
			String query3 = "SELECT idCours, nomCours FROM cours WHERE cours.idCours <> ALL (SELECT idCours FROM affectation where jour = ? AND "
					+ "((heurDebut < ? AND heurDebut < ? AND heurFin > ? AND heurFin < ?)"
					+ " OR (heurDebut > ? AND heurDebut < ? AND heurFin > ? AND heurFin < ?)"
					+ " OR (heurDebut > ? AND heurDebut < ? AND heurFin > ? AND heurFin > ?)))";
			PreparedStatement st3 = conn.prepareStatement(query3);
			st3.setString(1, date);
			st3.setString(2, heurDebut);
			st3.setString(3, heurFin);
			st3.setString(4, heurDebut);
			st3.setString(5, heurFin);
			st3.setString(6, heurDebut);
			st3.setString(7, heurFin);
			st3.setString(8, heurDebut);
			st3.setString(9, heurFin);
			st3.setString(10, heurDebut);
			st3.setString(11, heurFin);
			st3.setString(12, heurDebut);
			st3.setString(13, heurFin);
			ResultSet rs3 = st3.executeQuery();
			 ArrayList<Integer> coursLibre = new ArrayList<>();
			 System.out.println("la list des cours dispo :");
			while(rs3.next()) {
				//coursLibre.add(getIdCours(rs3.getInt(1)));
				coursLibre.add(rs3.getInt(1));
				System.out.println(rs3.getInt(1));
			}

		//Affectation :
		//Scanner validation = new Scanner(System.in);
		if (classeLibre.contains(idClasse)) {
				if (coursLibre.contains(idCours)) {
						if(idCours == 15 && idMateriel == 7 && coursLibre.contains(14)) {
							
							if(salleLibre.contains(4)) {
									System.out.println("la salle de physique TP va etre affecter a la classe : " + idClasse + " a la date: " + date + " de " + heurDebut + " a " + heurFin);
									//int valider = validation.nextInt();
									if(JOptionPane.showConfirmDialog(AffectationInterface.App, "La salle disponible : Physqiue TP", "Gestion d'un colege",
											JOptionPane.YES_NO_OPTION)==JOptionPane.YES_OPTION) {
										String insert1 = "INSERT INTO affectation "
												+ "(idAffectation, idCours, idSalle, heurDebut, heurFin, jour, idClasse)"
												+ " VALUES (NULL, "+idCours + ", 4," +"\""+ heurDebut+"\""+", " + "\""+heurFin+"\""+ ", "+ "\""+date +"\""+ ", "+idClasse + ")";
										Statement st4 = (Statement) conn.createStatement();
										st4.executeUpdate(insert1);
										JOptionPane.showMessageDialog(AffectationInterface.App, "insertion termine ... l'affectation reusite");
										System.out.println("insertion termine ... et l'affectation reusite");
									//}else if(valider == 0) {
									//	System.out.println("L'operation est arrétée");
									//	return;
									}else {
										JOptionPane.showMessageDialog(AffectationInterface.App, "l'operation est arretee");
										System.out.println("L'operation est arrétée");
										return;
									}
							}else {
								JOptionPane.showMessageDialog(AffectationInterface.App, "la salle de physique TP est plein, l'operation est arretee");
								System.out.println("la salle de physique TP est plein, l'operation est arretee");
								return;
							}
						
						}
						else if(idCours == 17 && idMateriel == 8 && coursLibre.contains(16)) {
							if(salleLibre.contains(5)) {
								System.out.println("la salle de chemie TP va etre affecter a la classe :" + idClasse + " a la date: " + date + " de " + heurDebut + " a " + heurFin );
								//int valider = validation.nextInt();
								if(JOptionPane.showConfirmDialog(AffectationInterface.App, "La salle disponible : chemie TP", "Gestion d'un colege",
										JOptionPane.YES_NO_OPTION)==JOptionPane.YES_OPTION) {
									String insert2 = "INSERT INTO affectation "
											+ "(idAffectation, idCours, idSalle, heurDebut, heurFin, jour, idClasse)"
											+ " VALUES (NULL, "+idCours + ", 5," + "\""+heurDebut+"\""+", " + "\""+heurFin+"\""+ ", "+ "\""+date +"\""+ ", "+idClasse + ")";
									Statement st5 = (Statement) conn.createStatement();
									st5.executeUpdate(insert2);
									JOptionPane.showMessageDialog(AffectationInterface.App, "insertion terminé ... l'affectation reusite");
									System.out.println("insertion terminé ... et l'affectation reusite");
									return;
								//}else if(valider == 0) {
								//	System.out.println("L'opération est arrétée");
								//	return;
								}else {
									JOptionPane.showMessageDialog(AffectationInterface.App, "L'opération est arrétée");
									System.out.println("L'opération est arrétée");
									return;
								}
						}else {
							JOptionPane.showMessageDialog(AffectationInterface.App, "la salle de chemie TP est plein, l'opération est arrétée");
							System.out.println("la salle de chemie TP est plein, l'opération est arrétée");
							return;
							  }
						}
						else if(idMateriel == 1) {
							if(salleLibre.contains(2)) {
								System.out.println("la salle de rideaux noirs et de projecteurs 1 vidéo va etre affecter a la classe : " + idClasse + " a la date: " + date + " de " + heurDebut + " a " + heurFin );
								//int valider = validation.nextInt();
								if(JOptionPane.showConfirmDialog(AffectationInterface.App, "La salle disponible : vidéo 1", "Gestion d'un colege",
										JOptionPane.YES_NO_OPTION)==JOptionPane.YES_OPTION) {
									String insert3 = "INSERT INTO affectation "
											+ "(idAffectation, idCours, idSalle, heurDebut, heurFin, jour, idClasse)"
											+ " VALUES (NULL, "+idCours + ", 2," + "\""+heurDebut+"\""+", " + "\""+heurFin+ "\""+", "+ "\""+date + "\""+", "+idClasse + ")";
									Statement st6 = (Statement) conn.createStatement();
									st6.executeUpdate(insert3);
									System.out.println("insertion terminé ... et l'affectation reusite");
									JOptionPane.showMessageDialog(AffectationInterface.App, "insertion terminé ... l'affectation reusite");
									return;
								//}else if(valider == 0) {
								//	System.out.println("L'opération est arrétée");
								//	return;
								}else {
									JOptionPane.showMessageDialog(AffectationInterface.App, "L'opération est arrétée");
									System.out.println("L'opération est arrétée");
									return;
								}
							}
							else if(salleLibre.contains(3)) {
								System.out.println("la salle de rideaux noirs et de projecteurs 2 vidéo va etre affecter a la classe: " + idClasse + " a la date: " + date + " de " + heurDebut + " a " + heurFin);
								//int valider = validation.nextInt();
								if(JOptionPane.showConfirmDialog(AffectationInterface.App, "La salle disponible : vidéo 2", "Gestion d'un colege",
										JOptionPane.YES_NO_OPTION)==JOptionPane.YES_OPTION){
									String insert3 = "INSERT INTO affectation "
											+ "(idAffectation, idCours, idSalle, heurDebut, heurFin, jour, idClasse)"
											+ " VALUES (NULL, "+idCours + ", 3," + "\""+heurDebut+"\""+", " + "\""+heurFin+"\""+ ", "+ "\""+date + "\""+", "+idClasse + ")";
									Statement st7 = (Statement) conn.createStatement();
									st7.executeUpdate(insert3);
									System.out.println("insertion terminé ... et l'affectation reusite");
									JOptionPane.showMessageDialog(AffectationInterface.App, "insertion terminé ... l'affectation reusite");
									return;
								//}else if(valider == 0) {
								//	System.out.println("L'opération est arrétée");
								//	return;
								}else {
									System.out.println("L'opération est arrétée");
									JOptionPane.showMessageDialog(AffectationInterface.App, "L'opération est arrétée");
									return;
								}
							}
							else {
								System.out.println("les salles de rideaux noirs et de projecteurs sont plein, l'opération est arrétée");
								JOptionPane.showMessageDialog(AffectationInterface.App, "les salles de rideaux noirs et de projecteurs sont plein, l'opération est arrétée");
								return;
							}
							
						}
						else if(idMateriel == 2) {
							for (int i = 0 ; i < normaleSalle.size(); i++) {
								if(getSalleCapacite(normaleSalle.get(i)) >= getNombreEleve(idClasse)) {
									
									System.out.println("la salle normale de l'ID : "+ normaleSalle.get(i)+" va etre affecter a la classe " + idClasse + " a la date: " + date + " de " + heurDebut + " a " + heurFin );
									//int valider = validation.nextInt();
									if(JOptionPane.showConfirmDialog(AffectationInterface.App, "La salle disponible : " + getNomSalle(normaleSalle.get(i)), "Gestion d'un colege",
											JOptionPane.YES_NO_OPTION)==JOptionPane.YES_OPTION) {
										
										String insert3 = "INSERT INTO affectation "
												+ "(idAffectation, idCours, idSalle, heurDebut, heurFin, jour, idClasse)"
												+ " VALUES (NULL, "+idCours + ", "+ normaleSalle.get(i)+", "+ "\""+heurDebut+"\""+", " +"\""+ heurFin+"\""+ ", "+ "\""+date +"\""+ ", "+idClasse + ")";
										System.out.println(insert3);
										Statement st8 = (Statement) conn.createStatement();
										st8.executeUpdate(insert3);
										System.out.println("insertion terminé ... et l'affectation reusite");
										JOptionPane.showMessageDialog(AffectationInterface.App, "insertion terminé ... l'affectation reusite");
										return;
								//	}else if(valider == 0) {
								//		System.out.println("L'opération est arrétée");
								//		return;
									}else {
										System.out.println("L'opération est arrétée");
										JOptionPane.showMessageDialog(AffectationInterface.App, "L'opération est arrétée");
										return;
									}
								
								}
							}
							
							System.out.println("tous les salles de capacite disponible sont plein, l'opération est arrétée ");
							JOptionPane.showMessageDialog(AffectationInterface.App, "tous les salles de capacite disponible sont plein, l'opération est arrétée ");
							return;
						
						}
						else if(idMateriel == 3) {
							int ne = getNombreEleve(idClasse);
							if(ne + nombreEleve <= 150) {
								System.out.println("la salle du sport va etre affceter a la classe: " + idClasse + " a la date: " + date + " de " + heurDebut + " a " + heurFin );
								//int valider = validation.nextInt();
								if(JOptionPane.showConfirmDialog(AffectationInterface.App, "La salle disponible : Sport" , "Gestion d'un colege",
										JOptionPane.YES_NO_OPTION)==JOptionPane.YES_OPTION){
									String insert = "INSERT INTO affectation"
											+"(idAffectation, idCours, idSalle, heurDebut, heurFin, jour, idClasse)"
											+"VALUES (NULL, "+idCours + ", 1"+ ", "+ "\""+heurDebut+"\""+", " +"\""+ heurFin+"\""+ ", "+ "\""+date + "\""+", "+idClasse + ")";
									Statement st9 = (Statement) conn.createStatement();
									st9.executeUpdate(insert);
									System.out.println("insertion terminé ... et l'affectation reusite");
									JOptionPane.showMessageDialog(AffectationInterface.App, "insertion terminé ... l'affectation reusite");
									return;
								}else {
									System.out.println("L'opération est arrétée");
									JOptionPane.showMessageDialog(AffectationInterface.App, "L'opération est arrétée");
									return;
								}
									
								}else {
									JOptionPane.showMessageDialog(AffectationInterface.App, "La salle du sport est plein !. L'opération est arrétée");
									return;
								}
							}
						}else {
							System.out.println("ce cours n'est pas libre");
							JOptionPane.showMessageDialog(AffectationInterface.App, "Ce cours n'est pas libre");
							return;
						}
						
						
			}else {
				System.out.println("Cette classe n'est pas libre");
				JOptionPane.showMessageDialog(AffectationInterface.App, "Cette classe n'est pas libre");
			}
			
		
		
		
	}
	
	public static int getIdClasse(String nomClasse) {
		try {
		PreparedStatement ps = conn.prepareStatement("SELECT idClasse FROM classe WHERE nomClasse = ?");
		ps.setString(1,nomClasse);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int idClasse = rs.getInt(1);
		return idClasse;
		}catch (Exception e) {
			System.out.println("Error in getIdClasse function it will return 0");
			return 0;
		}
	}
	public static int getIdCours(String nomCours) {
		try {
			PreparedStatement ps = conn.prepareStatement("SELECT idCours FROM cours WHERE nomCours = ?");
			ps.setString(1,nomCours);
			ResultSet rs = ps.executeQuery();
			rs.next();
		int idCours = rs.getInt(1);
		return idCours;
		}catch (Exception e) {
			System.out.println("Error in getIdCours function it will return 0");
			return 0;
		}
	}
	public static int getIdCours(int idEnseignant) {
		try {
			PreparedStatement ps = conn.prepareStatement("SELECT idCours FROM cours WHERE idEnseignant = ?");
			ps.setInt(1, idEnseignant);
			ResultSet rs = ps.executeQuery();
			rs.next();
		int idCours = rs.getInt(1);
		return idCours;
		} catch (Exception e) {
			System.out.println("Error in getIdCours function it will return 0");
			return 0;
		}
	}
	public static  int getSalleCapacite(int idsalle) {
		try {
			PreparedStatement ps = conn.prepareStatement("SELECT capaciteSalle FROM salle WHERE idSalle = ?");
			ps.setInt(1, idsalle);
			ResultSet rs = ps.executeQuery();
			rs.next();
		int idEnsignant = rs.getInt(1);
		return idEnsignant;
		} catch (Exception e) {
			System.out.println("Error in getIdEnsignant function it will return 0");
			return 0;
		}
	}
	public static  int getNombreEleve(int idClasse) {
		try {
			PreparedStatement ps = conn.prepareStatement("SELECT nombreEleve FROM classe WHERE idClasse = ?");
			ps.setInt(1, idClasse);
			ResultSet rs = ps.executeQuery();
			rs.next();
		int nombreEleve = rs.getInt(1);
		return nombreEleve;
		} catch (Exception e) {
			System.out.println("Error in getNombreEleve function it will return 0");
			return 0;
		}
	}
	public static String getNomSalle(int idSalle) {
		try {
			PreparedStatement ps = conn.prepareStatement("SELECT nomSalle FROM salle WHERE idSalle = ?");
			ps.setInt(1, idSalle);
			ResultSet rs = ps.executeQuery();
			rs.next();
		String nomSalle = rs.getString(1);
		return nomSalle;
		} catch (Exception e) {
			System.out.println("Error in getNomSalle function it will return null");
			return null;
		}
	}
	public static int getIdMateriel(String nomMateriel) {
		try {
			PreparedStatement ps = conn.prepareStatement("SELECT idMateriel FROM materiel WHERE nomMateriel = ?");
			ps.setString(1,nomMateriel);
			ResultSet rs = ps.executeQuery();
			rs.next();
		int idMateriel = rs.getInt(1);
		return idMateriel;
		}catch (Exception e) {
			System.out.println("Error in getIdMateriel function it will return 0");
			return 0;
		}
	}
//	public static void main(String args[]) throws ParseException, SQLException {
//
//		affectSalle(15, 21, 3, "2020-05-30", "08:00", "10:00");
//		System.out.println("done");
//		
//	
//}
}
