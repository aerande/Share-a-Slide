package Action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/HomeNewAction")
public class HomeNewAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public HomeNewAction() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		String uname = request.getParameter("name");
		int uid=0;
		String name;
try {
			
			// Connect to Oracle
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "system", "aniruddha16");
			con.setAutoCommit(false);
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from userlogin where username='"+uname+"'");
			if(rs.next()){
				uid = rs.getInt(1);
			}
			ResultSet rs1 = st.executeQuery("select * from userprofile where user_id='"+uid+"'");
			if(rs1.next()){
				name=rs1.getString(2);
			}
			
			
			RequestDispatcher rd=request.getRequestDispatcher("homenew.jsp");  
	        rd.include(request,response);
			response.sendRedirect("homenew.jsp?fname=name");
}
catch(Exception e){
	e.printStackTrace();
}
	}

}
