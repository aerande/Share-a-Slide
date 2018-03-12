package Action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet("/SignupAction")
public class SignupAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SignupAction() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		response.setContentType("text/html");
		String first_name, last_name, email, username, password, dob_month, gender, phone;
		int i=1, dob_day, dob_year;
		
		first_name = request.getParameter("signup_first_name");
		last_name = request.getParameter("signup_last_name");
		email = request.getParameter("signup_email");
		username = request.getParameter("signup_username");
		password = request.getParameter("signup_password");
		dob_month = request.getParameter("Month");
		dob_day =  Integer.parseInt(request.getParameter("Day"));
		dob_year = Integer.parseInt(request.getParameter("Year"));
		gender = request.getParameter("signup_gender");
		phone = request.getParameter("signup_phone");
		
		try {
			
			// Connect to Oracle
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "system", "aniruddha16");
			con.setAutoCommit(false);
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from userprofile");
			while(rs.next()){
				if(rs.getInt(1)==i)
					i++;
			}
			PreparedStatement ps = con.prepareStatement("insert into userprofile values(?,?,?,?,?,?,?,?,?)");
			PreparedStatement ps1 = con.prepareStatement("insert into userlogin values(?,?,?)");
			ps.setInt(1, i);
			ps.setString(2, first_name);
			ps.setString(3, last_name);
			ps.setString(4, email);
			ps.setString(5, dob_month);
			ps.setInt(6, dob_day);
			ps.setInt(7, dob_year);
			ps.setString(8, gender);
			ps.setString(9, phone);
			
			ps1.setInt(1, i);
			ps1.setString(2, username);
			ps1.setString(3, password);

			ps.executeUpdate();
			ps1.executeUpdate();
			con.commit();
			con.close();
			
			HttpSession session = request.getSession(true);
			session.setAttribute("UsernameSession", username);
			response.sendRedirect("homenew.jsp");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

}
