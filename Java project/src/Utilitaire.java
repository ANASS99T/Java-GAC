import java.io.ObjectInputStream.GetField;
import java.sql.Connection;
import java.sql.DriverManager;


public class Utilitaire {
	private static Connection conn;
	static {
				
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_project", "root", "");
			//System.out.println("connected to server successfully");
			
		}catch (Exception e) {
			System.out.println("exception : " + e.getMessage());
		}
		}
	public static Connection getConnection() {
		return conn;
	}
}
