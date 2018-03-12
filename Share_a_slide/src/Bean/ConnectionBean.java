package Bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class ConnectionBean {
	Connection con = null;
	Statement st = null;
	ResultSet rs = null;
	PreparedStatement ps = null;
	public void startConnection(){
		try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "system", "aniruddha16");
		}
		catch(Exception e){
			e.printStackTrace();
		}
		/*finally{
			try {
				con.close();
			}
			catch (Exception e2){
				e2.printStackTrace();
			}
		}*/
	}
	
	public ResultSet resultSet(String query){
		try{
		st = con.createStatement();
		ResultSet rs = st.executeQuery(query);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return rs;
	}
	
	public void preparedStatement(String query){
		try {
			ps = con.prepareStatement(query);
		} 
		catch (Exception e) {
		}
	}
}