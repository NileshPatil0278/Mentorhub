package database_connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	static Connection con=null;
	public static Connection connect()
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
		
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/stud_mentor","root","");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return(con);
	}

}
