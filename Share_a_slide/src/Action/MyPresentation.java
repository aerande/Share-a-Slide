package Action;

import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/MyPresentation")
public class MyPresentation extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MyPresentation() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 //request.getRequestDispatcher("/WebContent/mypresentation.jsp").forward(request, response);
		HttpSession session1 = request.getSession(true);
		String user = (String) session1.getAttribute("UsernameSession");
		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=UTF-8");
		//ServletOutputStream out = response.getOutputStream();
		int uid=0,pid=0;
		ResultSet rs1 = null;
		try {

			/*String photoid = request.getParameter("search_bar");
			System.out.println(photoid);*/

			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "system", "aniruddha16");
			//PreparedStatement ps = con.prepareStatement("select * from presentation where user_id='"+user+"'");
			ResultSet rs = con.createStatement().executeQuery("select * from userlogin where username='"+user+"'");
			while(rs.next()){
				uid = rs.getInt(1);
			}
			System.out.println("User id: "+uid);
			rs1 = con.createStatement().executeQuery("select * from presentation where user_id='"+uid+"'");
			while (rs1.next()) {
			
				out.println("<img width='600' height='600'src=mypresentation.jsp?id=" + rs1.getString(1) + "></img>");
				out.println("<a href='view?pid="+rs1.getString(1)+"'>Learn more ...</a>");	
				
			}
				

		} catch (Exception e) {
			e.getMessage();
		}
		 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}
