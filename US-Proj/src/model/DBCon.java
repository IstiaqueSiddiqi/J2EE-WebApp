package model;
import java.sql.*;
public class DBCon {
	public static Connection getCon() {
		Connection con=null;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String URL = "jdbc:oracle:thin:@localhost:1521:xe";
			String USER = "university";
			String PASS = "university";
			con = DriverManager.getConnection(URL, USER, PASS);// establishing connection
		}
		catch(Exception e){
			System.out.println(e);
		}
		return con;
	}
}
