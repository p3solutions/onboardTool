package NewArchiveRequirements.addendumInfo.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import File_Utility.FileUtils;
import common.constant.COMMON_CONSTANTS;
import common.constant.EMAIL_SERVICE_CONSTANT;
import common.email.service.EmailApprovalService;
import onboard.DBconnection;

import java.util.Enumeration;
import java.util.List;
import java.util.Properties;

/**
 * Servlet implementation class legacyApplicationScreenshotsUpload
 */
@WebServlet("/ArchiveRequirementsAddendumFileUpload")
public class ArchiveRequirementsAddendumFileUpload extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		JsonObject jsonObj = new JsonObject();
		InputStream fileInput = null;
		try {
			HttpSession details = request.getSession();
			String Id = (String) details.getAttribute("ID");
			String seqNoSection = request.getParameter("section_no");
			Properties properties = new Properties();
			String workingDir = System.getProperty(COMMON_CONSTANTS.CATALINA_BASE) + File.separator
					+ COMMON_CONSTANTS.D3SIXTY_CONF;
			File configFile = new File(workingDir, COMMON_CONSTANTS.FILE_UPLOAD_PROPS);
			if (configFile.exists()) {
				properties.load(new FileReader(configFile));
			} else {
				fileInput = ArchiveRequirementsAddendumFileUpload.class
						.getResourceAsStream(COMMON_CONSTANTS.FILE_UPLOAD_PROPS_STREAM);
				properties.load(fileInput);
			}
			String path = properties.getProperty(COMMON_CONSTANTS.FILE_PROPS_SCREENSHOT_PATH);
			File directory = FileUtils.createFile(path + File.separator + Id);
			if (!directory.exists())
				directory.mkdir();
			ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
			List<FileItem> multiFiles = sf.parseRequest(request);
			DBconnection dBconnection = new DBconnection();
			Connection con = (Connection) dBconnection.getConnection();
			int lastrow_count = 0;
			for (FileItem item : multiFiles) {
				String selectQuery3 = "SELECT COUNT(*) FROM decom3sixtytool.archive_req_addendum_fileupload where oppId=? and section_no=?";
				PreparedStatement st3 = con.prepareStatement(selectQuery3);
				st3.setString(1, Id);
				st3.setString(2, seqNoSection);
				ResultSet rs3 = st3.executeQuery();
				rs3.next();
				lastrow_count = rs3.getInt(1);
				if (lastrow_count > 0) {
					String insertQuery = "INSERT INTO decom3sixtytool.archive_req_addendum_fileupload (seq_num,section_no,oppId,File_Name,doc) VALUES (?, ?, ?, ?,?);";
					InputStream is = (InputStream) item.getInputStream();
					PreparedStatement pstmt = con.prepareStatement(insertQuery);
					pstmt.setInt(1, lastrow_count + 1);
					pstmt.setString(2, seqNoSection);
					pstmt.setString(3, Id);
					pstmt.setString(4, item.getName());
					pstmt.setBinaryStream(5, is);
					pstmt.executeUpdate();
					pstmt.close();
					is.close();
				} else {
					lastrow_count = 1;
					String insertQuery = "INSERT INTO decom3sixtytool.archive_req_addendum_fileupload (seq_num,section_no,oppId,File_Name,doc) VALUES (?, ?, ?, ?,?);";
					InputStream is = (InputStream) item.getInputStream();
					PreparedStatement pstmt = con.prepareStatement(insertQuery);
					pstmt.setInt(1, lastrow_count);
					pstmt.setString(2, seqNoSection);
					pstmt.setString(3, Id);
					pstmt.setString(4, item.getName());
					pstmt.setBinaryStream(5, is);
					pstmt.executeUpdate();
					pstmt.close();
					is.close();
				}
				st3.close();
				rs3.close();

				// item.write(new
				// File(directory.getAbsolutePath()+File.separator+item.getName()));
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
