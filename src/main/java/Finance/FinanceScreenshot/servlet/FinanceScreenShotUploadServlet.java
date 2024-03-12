package Finance.FinanceScreenshot.servlet;

import File_Utility.FileUtils;
import common.constant.EMAIL_SERVICE_CONSTANT;
import common.email.service.EmailApprovalService;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import onboard.DBconnection;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Properties;

@WebServlet("/FinanceScreenShotUpload")
public class FinanceScreenShotUploadServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		JsonObject jsonObj = new JsonObject();
		InputStream fileInput = null;
		try {
			HttpSession details = request.getSession();
			String sessionId = (String) details.getAttribute("APPID");
			String sessionOppName = (String) details.getAttribute("APPNAME");
			System.out.println(
					"The ID for screenshot upload " + sessionId + " The Name of the application " + sessionOppName);
			Properties properties = new Properties();
			String workingDir = System.getProperty("catalina.base") + File.separator
					+ EMAIL_SERVICE_CONSTANT.D3SIXTY_CONF;
			File configFile = new File(workingDir, "fileUpload.properties");
			if (configFile.exists()) {
				properties.load(new FileReader(configFile));
			} else {
				fileInput = FinanceScreenShotUploadServlet.class.getResourceAsStream("/fileUpload.properties");
				properties.load(fileInput);
			}
			String path = properties.getProperty("FILE.REQUIREMENTS.SCREENSHOT.PATH");
			File directory = FileUtils.createFile(path + File.separator + sessionId);
			if (!directory.exists())
				directory.mkdir();
			ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
			List<FileItem> multiFiles = sf.parseRequest(request);
			DBconnection dBconnection = new DBconnection();
			Connection con = (Connection) dBconnection.getConnection();
//	 int seq_num = 1;
			int lastrow_count = 0;
			for (FileItem item : multiFiles) {
				String selectQuery3 = "SELECT COUNT(*) FROM finance_application_screenshot where AppId=? ";
				PreparedStatement st3 = con.prepareStatement(selectQuery3);
				st3.setString(1, sessionId);
				ResultSet rs3 = st3.executeQuery();
				rs3.next();
				lastrow_count = rs3.getInt(1);
				String selectQuery = "SELECT * FROM `finance_application_screenshot` WHERE appId=? ORDER BY seq_num;";
				PreparedStatement st = con.prepareStatement(selectQuery);
				st.setString(1, sessionId);
//		 st.setInt(2, lastrow_count);
				ResultSet rs = st.executeQuery();
				rs.next();

				if (lastrow_count > 0) {
					String insertQuery = "INSERT INTO `finance_application_screenshot` (doc, File_name, seq_num, appId) VALUES (?, ?, ?, ?);";
					InputStream is = (InputStream) item.getInputStream();
					PreparedStatement pstmt = con.prepareStatement(insertQuery);
					pstmt.setBinaryStream(1, is);
					pstmt.setString(2, item.getName());
					pstmt.setInt(3, lastrow_count + 1);
					pstmt.setString(4, sessionId);
					pstmt.executeUpdate();
					pstmt.close();
					is.close();
				} else {
					lastrow_count = 1;
					String insertQuery = "INSERT INTO `finance_application_screenshot` (doc, File_name, seq_num, appId) VALUES (?, ?, ?, ?);";
					InputStream is = (InputStream) item.getInputStream();
					PreparedStatement pstmt = con.prepareStatement(insertQuery);
					pstmt.setBinaryStream(1, is);
					pstmt.setString(2, item.getName());
					pstmt.setInt(3, lastrow_count);
					pstmt.setString(4, sessionId);
					pstmt.executeUpdate();
					pstmt.close();
					is.close();

				}

				st.close();
				rs.close();
				st3.close();
				rs3.close();

			}
			System.out.println("File uploaded");
			jsonObj.addProperty("checkFilesUpload", true);
		} catch (Exception e) {
			e.printStackTrace();
			jsonObj.addProperty("checkFilesUpload", false);
		} finally {
			if (fileInput != null) {
				fileInput.close();
			}
		}
		System.gc();
		String json = new Gson().toJson(jsonObj);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}

}
