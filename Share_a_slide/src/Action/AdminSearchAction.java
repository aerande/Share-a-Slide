package Action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import java.io.*;
import java.sql.*;
import java.util.List;

@WebServlet("/AdminSearchAction")
public class AdminSearchAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminSearchAction() {
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
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		try {
			// Apache Commons-Fileupload library classes
			/*DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload sfu = new ServletFileUpload(factory);*/
/*
			if (!ServletFileUpload.isMultipartContent(request)) {
				System.out.println("sorry. No file uploaded");
				return;
			}*/

			// parse request
			/*List items = sfu.parseRequest(request);
			FileItem id = (FileItem) items.get(0);
			String userid = id.getString();*/
			
			String userid = request.getParameter("delete_user");
			// Connect to Oracle
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "system", "aniruddha16");
			con.setAutoCommit(false);

			PreparedStatement ps = con.prepareStatement("delete from userprofile where user_id='"+userid+"'");
			//ps.setString(1, userid);
			ps.executeUpdate();
			PreparedStatement ps1 = con.prepareStatement("delete from userlogin where user_id='"+userid+"'");
			ps1.executeUpdate();
			con.commit();
			response.sendRedirect("adminsearchusers.jsp");
			//out.println("Photo Deleted Successfully. <p>   ");
		} catch (Exception ex) {
			out.println("Error --> " + ex.getMessage());
		}
	}

}
