package Action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ProfileAction")
public class ProfileAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProfileAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		HttpSession session = request.getSession(true);
		String user = (String) session.getAttribute("UsernameSession");
		
		String first_name, last_name, email, username, password, dob_month, gender, phone;
		int uid=0, dob_day, dob_year;
		
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
			ResultSet rs1 = st.executeQuery("select user_id from userlogin where username='"+user+"'");
			if(rs1.next())
				uid = rs1.getInt(1);
			
			PreparedStatement ps = con.prepareStatement("update userprofile set first_name=?, last_name=?, email=? ,dob_month=?, dob_day=?, dob_year=?, gender=?, phone=? where user_id='"+uid+"'");
			PreparedStatement ps1 = con.prepareStatement("update userlogin set password=? where user_id='"+uid+"'");
			
			ps.setString(1, first_name);
			ps.setString(2, last_name);
			ps.setString(3, email);
			ps.setString(4, dob_month);
			ps.setInt(5, dob_day);
			ps.setInt(6, dob_year);
			ps.setString(7, gender);
			ps.setString(8, phone);

			ps.executeUpdate();
			ps1.setString(1, password);
			ps1.executeUpdate();
			con.commit();
			con.close();
			response.sendRedirect("profileupdatesuccess.jsp");
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
	}

}
