package project;
import java.sql.*;
public class connection {
	public static Connection getcon()
	{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_zone","root","jinal@NEW123");
			return con;
		}catch(Exception e)
		{
			System.out.print(e);
			return null;
		}
	}
}
