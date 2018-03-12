package Action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;

@WebServlet("/AdminApproveAction")
public class AdminApproveAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminApproveAction() {
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
		try {
			
			String pptid = request.getParameter("delete_ppt");
			// Connect to Oracle
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "system", "aniruddha16");
			con.setAutoCommit(false);

			PreparedStatement ps = con.prepareStatement("delete from presentation where PRESENTATION_ID='"+pptid+"'");
			ps.executeUpdate();

			con.commit();
			response.sendRedirect("adminapprove.jsp");
			//out.println("Photo Deleted Successfully. <p>   ");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

}
