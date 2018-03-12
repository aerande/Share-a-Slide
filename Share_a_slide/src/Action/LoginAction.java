package Action;

import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

@WebServlet("/LoginAction")
@MultipartConfig
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginAction() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		response.setContentType("text/html");
		String username = request.getParameter("login_username");
		String pass = request.getParameter("login_password");
		/*int uid=0;
		String name=null;*/
		
		try {
			
			// Connect to Oracle
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "system", "aniruddha16");
			con.setAutoCommit(false);
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from userlogin where username='"+username+"' and password='"+pass+"'");
			//ResultSet rs1 = st.executeQuery("select * from userprofile where user_id='"+uid+"'");
			if(rs.next()){
				HttpSession session = request.getSession(true);
				session.setAttribute("UsernameSession", username);
				
				if(username.equals("admin") && pass.equals("admin")){
					/*RequestDispatcher rd=request.getRequestDispatcher("adminpage.jsp");  
			        rd.include(request,response);*/
					response.sendRedirect("adminpage.jsp");
				}
				
				else{
					/*RequestDispatcher rd=request.getRequestDispatcher("homenew.jsp");  
			        rd.include(request,response);*/
					response.sendRedirect("homenew.jsp");
				}
			}
			else{
				response.sendRedirect("login.jsp");
				JOptionPane.showMessageDialog(null,"Username/Password not matching","Error",JOptionPane.ERROR_MESSAGE);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}