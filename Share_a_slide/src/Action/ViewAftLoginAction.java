package Action;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

import org.apache.poi.hslf.usermodel.HSLFSlide;
import org.apache.poi.hslf.usermodel.HSLFSlideShow;
import org.apache.poi.hslf.usermodel.HSLFSlideShowImpl;
import java.util.List;
import java.awt.*;
import java.awt.image.BufferedImage;

/**
 * Servlet implementation class ViewAftLoginAction
 */
@WebServlet("/ViewAftLoginAction")
public class ViewAftLoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ViewAftLoginAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		this.getServletContext().getResourceAsStream("/META-INF/MANIFEST.MF");
		String pid = request.getParameter("pid");
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		BufferedInputStream is = null;
		BufferedReader fileReader = null;
		FileOutputStream fos = null;
		// SlideShow ppt = null;
		HSLFSlideShow ppt = null;
		int i=0;
		//String S = "C:/Users/agnan/Downloads/eclipse-jee-mars-2-win32-x86_64/eclipse/projectslide.ppt";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "system", "aniruddha16");
			ps = con.prepareStatement("select * from presentation where presentation_id = ?");
			ps.setString(1, pid);
			rs = ps.executeQuery();

			while (rs.next()) { // for each row
				// take the blob
				Blob blob = rs.getBlob(6);
				is = new BufferedInputStream(blob.getBinaryStream());
				fos = new FileOutputStream("C:/My Data/Share_a_slide/WebContent/images/Download/ForView/ppt_1.ppt");
				// you can set the size of the buffer
				byte[] buffer = new byte[2048];
				int r = 0;
				while ((r = is.read(buffer)) != -1) {
					fos.write(buffer, 0, r);
				}
				fileReader = new BufferedReader(new FileReader("C:/My Data/Share_a_slide/WebContent/images/Download/ForView/ppt_1.ppt"));
			}
			// File file=new File(fileReader);
			File file = new File("C:/My Data/Share_a_slide/WebContent/images/Download/ForView/ppt_1.ppt");
			FileInputStream inputstream = new FileInputStream(file);

			ppt = new HSLFSlideShow(new HSLFSlideShowImpl(inputstream));
			// ppt = new SlideShow(inputstream);
			// XSLFSlide slide = ppt.createSlide();
			Dimension pgsize = ppt.getPageSize();
			List<HSLFSlide> slide = ppt.getSlides();

			for (i = 0; i < slide.size(); i++) {
				BufferedImage img = new BufferedImage(pgsize.width, pgsize.height, BufferedImage.TYPE_INT_RGB);
				Graphics2D graphics = img.createGraphics();
				// clear the drawing area
				graphics.setPaint(Color.white);
				graphics.fill(new Rectangle.Float(0, 0, pgsize.width, pgsize.height));
				slide.get(i).draw(graphics);
				FileOutputStream out = new FileOutputStream("C:/My Data/Share_a_slide/WebContent/images/Download/ForView/Images/ppt_image"+i+".png");
				javax.imageio.ImageIO.write(img, "png", out);
			}
			response.sendRedirect("viewaftlogin.jsp?i="+slide.size());
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				ppt.close();
				is.close();
				fos.flush();
				fos.close();

				rs.close();
				ps.close();
				con.close();
			} catch (Exception e1) {
				e1.getMessage();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
	}

}
