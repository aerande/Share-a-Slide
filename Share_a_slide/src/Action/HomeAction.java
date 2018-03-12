package Action;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import java.sql.*;
import java.util.*;

@WebServlet("/HomeAction")
public class HomeAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public HomeAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {

			String photoid = request.getParameter("search_bar");
			System.out.println(photoid);

			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "system", "aniruddha16");
			PreparedStatement ps = con.prepareStatement("select * from presentation where presentation_topic like ?");

			// ps.setInt(1, id3);
			ps.setString(1, "%" + photoid + "%");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				out.println("<img width='600' height='600'src=Home?id=" + rs.getString(1) + "></img>");
				out.println("<a href='view?pid="+rs.getString(1)+"'>Learn more ...</a>");	
			}

		} catch (Exception e) {
			e.getMessage();
		}
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "system", "aniruddha16");
			PreparedStatement ps = con.prepareStatement("select * from presentation where presentation_id = ?");
			String id = request.getParameter("id");
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			rs.next();
			Blob b = rs.getBlob("PRESENTATION_FIRST_IMAGE");
			response.setContentType("image/jpg");

			response.setContentLength((int) b.length());
			InputStream is = b.getBinaryStream();
			OutputStream os = response.getOutputStream();
			byte buf[] = b.getBytes(1, (int) b.length());
			os.write(buf);
			os.flush();
			os.close();
			con.close();
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}
}
