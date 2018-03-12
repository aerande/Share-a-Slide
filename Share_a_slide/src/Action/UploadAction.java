package Action;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics2D;
import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.*;
import java.sql.*;

import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


import org.apache.poi.hslf.usermodel.HSLFSlide;
import org.apache.poi.hslf.usermodel.HSLFSlideShow;
import org.apache.poi.hslf.usermodel.HSLFSlideShowImpl;

/**
 * Servlet implementation class UploadAction
 */
@WebServlet("/UploadAction")
public class UploadAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		response.setContentType("text/html;charset=UTF-8");
		// response.setContentType("application/ppt");
		HttpSession session = request.getSession(true);
		String user = (String) session.getAttribute("UsernameSession");
		PrintWriter out = response.getWriter();
		int i = 1, uid=0;
		FileOutputStream out1 = null;
		BufferedInputStream is = null;
		FileOutputStream fos = null;
		HSLFSlideShow ppt = null;
		Connection con = null;
		try {
			// Apache Commons-Fileupload library classes
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload sfu = new ServletFileUpload(factory);

			if (!ServletFileUpload.isMultipartContent(request)) {
				System.out.println("Sorry. No file uploaded");
				return;
			}

			// parse request
			List items = sfu.parseRequest(request);
			FileItem topic = (FileItem) items.get(0);
			String topic1 = topic.getString();

			FileItem type = (FileItem) items.get(1);
			String type1 = type.getString();
			
			FileItem purpose = (FileItem) items.get(2);
			String purpose1 = purpose.getString();
			
			FileItem desc = (FileItem) items.get(3);
			String desc1 = desc.getString();

			// get uploaded file
			FileItem file = (FileItem) items.get(4);

			// Connect to Oracle
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "system", "aniruddha16");
			con.setAutoCommit(false);
			Statement st = con.createStatement();
			ResultSet rs2 = st.executeQuery("select * from userlogin where username='"+user+"'");
			while(rs2.next()){
				uid = rs2.getInt(1);
			}
			ResultSet rs = st.executeQuery("select * from presentation");
			while(rs.next()){
				if(rs.getInt(1)==i)
					i++;
			}
			PreparedStatement ps = con.prepareStatement("insert into presentation(presentation_id,presentation_topic,presentation_type,presentation_purpose,presentation_desc,presentation_file,user_id) values(?,?,?,?,?,?,?)");
			ps.setInt(1, i);
			ps.setString(2, topic1);
			ps.setString(3, type1);
			ps.setString(4, purpose1);
			ps.setString(5, desc1);
			ps.setBinaryStream(6, file.getInputStream(), (int) file.getSize());
			ps.setInt(7, uid);
			ps.executeUpdate();
			
			ResultSet rs1 = st.executeQuery("select * from presentation where presentation_id='"+i+"'");
			while(rs1.next()){
				Blob blob = rs1.getBlob(6);
				is = new BufferedInputStream(blob.getBinaryStream());
				File f = new File("C:/My Data/Share_a_slide/Download/3/ppt_"+i+".ppt");
				//if(f.mkdir()){
				fos = new FileOutputStream(f);
				// you can set the size of the buffer
				byte[] buffer = new byte[2048];
				int r = 0;
				while ((r = is.read(buffer)) != -1) {
					fos.write(buffer, 0, r);
				//}
				}

				File file_ppt = new File("C:/My Data/Share_a_slide/Download/3/ppt_"+i+".ppt");
				//if(file_ppt.mkdir()){
				FileInputStream inputstream = new FileInputStream(file_ppt);

				ppt = new HSLFSlideShow(new HSLFSlideShowImpl(inputstream));
				Dimension pgsize = ppt.getPageSize();
				List<HSLFSlide> slide = ppt.getSlides();
				
				BufferedImage img = new BufferedImage(pgsize.width, pgsize.height, BufferedImage.TYPE_INT_RGB);
				Graphics2D graphics = img.createGraphics();
				// clear the drawing area
				graphics.setPaint(Color.white);
				graphics.fill(new Rectangle.Float(0, 0, pgsize.width, pgsize.height));
				slide.get(0).draw(graphics);
				out1 = new FileOutputStream("C:/My Data/Share_a_slide/Download/3/images/ppt_image0.png");
				javax.imageio.ImageIO.write(img, "png", out1);
				
				FileInputStream fdd = new FileInputStream(new File("C:/My Data/Share_a_slide/Download/3/images/ppt_image0.png"));
				PreparedStatement ps1 = con.prepareStatement("update presentation set presentation_first_image=? where presentation_id='"+i+"'");
				ps1.setBinaryStream(1, fdd, (int) file.getSize());
				ps1.executeUpdate();
				//}
			}
			response.sendRedirect("updatesuccessful.jsp");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		finally {
			try {
				ppt.close();
				is.close();
				fos.flush();
				fos.close();
				out1.close();
				con.commit();
				con.close();
			} catch (Exception e1) {
				e1.getMessage();
			}
		}
	}

}
