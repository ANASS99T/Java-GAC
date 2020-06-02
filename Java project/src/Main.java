import java.sql.Connection;
import java.sql.PreparedStatement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;

import com.mysql.jdbc.Statement;
public class Main {
	
	public static void main(String args[]) throws ParseException, SQLException {


		new GAC();
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("HH:mm:ss"); 
		 LocalDateTime now = LocalDateTime.now(); 
		 String date = dtf.format(now);
		 System.out.println(date);
		 System.out.println(date.compareTo("20:50:00"));
		   
	}
}
