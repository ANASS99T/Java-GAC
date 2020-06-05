import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JOptionPane;

import com.mysql.jdbc.Statement;



public class Login {
	static Connection conn = Utilitaire.getConnection();
	
	public static boolean login(String username , String password) {
		try {
		String PQuery = "SELECT password FROM users WHERE username = ?";
		PreparedStatement st = conn.prepareStatement(PQuery);
		st.setString(1, username);
		ResultSet rs = st.executeQuery();
		rs.next();
		if(rs.getString(1).equals(password)) {
			JOptionPane.showMessageDialog(GAC.App, "Welcome back "+ username);
			return true;
		}else {
			JOptionPane.showMessageDialog(GAC.App, "Username or password inccorect");
			return false;
		}
		
		
		}catch (Exception e) {
			JOptionPane.showMessageDialog(GAC.App, "inccorect data");
			return false;
		}
	}
	
	public static boolean signUp(String username, String password, String adminCode) {
		try {
			if(username.equals("") || password.equals("")) {
				JOptionPane.showMessageDialog(GAC.App, "username or password textfield is empty");
			}
			String adminCQuery = "SELECT adminCode FROM users WHERE username = \"admin\"";
			Statement st = (Statement) conn.createStatement();
			ResultSet rs = st.executeQuery(adminCQuery);
			rs.next();
			if(adminCode.equals(rs.getString(1))) {
				String VerifyUsernameQuery = "SELECT COUNT(username) FROM users WHERE username = ?";
				PreparedStatement st1 = conn.prepareStatement(VerifyUsernameQuery);
				st1.setString(1, username);
				ResultSet rs1 = st1.executeQuery();
				rs1.next();
				if(rs1.getInt(1) == 0) {
					String signeQuery = "INSERT INTO users (username, password) VALUES (\"" + username + "\", " +"\"" + password + "\""+ ")";
					Statement st2 = (Statement) conn.createStatement();
					st2.executeUpdate(signeQuery);
					JOptionPane.showMessageDialog(GAC.App, username + " signed up successfully");
					return true;
				}else {
					JOptionPane.showMessageDialog(GAC.App, "username already exist");
					return false;
				}
			}else {
				JOptionPane.showMessageDialog(GAC.App, "adminCode inccorect");
				return false;
			}
			
			} catch (Exception e) {
			JOptionPane.showMessageDialog(GAC.App, "Unexpected error in sign-up page");
			return false;
		}
	}
}
