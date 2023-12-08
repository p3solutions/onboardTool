package FinanceDetails.Servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import File_Utility.FileUtils;
import onboard.DBconnection;


@WebServlet("/FinanceScreenShotUploadServlet")
public class FinanceScreenShotUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FinanceScreenShotUploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JsonObject jsonObj = new JsonObject();

        try {
            ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
            List<FileItem> multiFiles = sf.parseRequest(request);

            // Extract 'Id' from the form fields
            String Id = null;

            for (FileItem item : multiFiles) {
                if (item.isFormField() && "Id".equals(item.getFieldName())) {
                    Id = item.getString();
                    break;
                }
            }

            if (Id == null) {
                throw new IllegalArgumentException("Missing 'Id' in the request parameters.");
            }

            Properties properties = new Properties();
            InputStream fileInput = FinanceScreenShotUploadServlet.class
                    .getResourceAsStream("/fileUpload.properties");
            properties.load(fileInput);
            fileInput.close();

            String path = properties.getProperty("FILE.REQUIREMENTS.SCREENSHOT.PATH");
            File directory = FileUtils.createFile(path + File.separator + Id);

            if (!directory.exists()) {
                directory.mkdir();
            }

            Connection con = null;

            try {
                DBconnection dBconnection = new DBconnection();
                con = (Connection) dBconnection.getConnection();

                int lastrow_count = 0;

                for (FileItem item : multiFiles) {
                    if (!item.isFormField()) {
                        String selectQuery3 = "SELECT COUNT(*) FROM `finance_screenshot_details` where AppId=? ";
                        PreparedStatement st3 = con.prepareStatement(selectQuery3);
                        st3.setString(1, Id);
                        ResultSet rs3 = st3.executeQuery();
                        rs3.next();
                        lastrow_count = rs3.getInt(1);

                        String selectQuery = "SELECT * FROM `finance_screenshot_details` WHERE appId=? ORDER BY seq_num;";
                        PreparedStatement st = con.prepareStatement(selectQuery);
                        st.setString(1, Id);
                        ResultSet rs = st.executeQuery();
                        rs.next();

                        if (lastrow_count > 0) {
                            String insertQuery = "INSERT INTO `finance_screenshot_details` (doc, File_name, seq_num, AppId) VALUES (?, ?, ?, ?);";
                            InputStream is = (InputStream) item.getInputStream();
                            PreparedStatement pstmt = con.prepareStatement(insertQuery);
                            pstmt.setBinaryStream(1, is);
                            pstmt.setString(2, item.getName());
                            pstmt.setInt(3, lastrow_count + 1);
                            pstmt.setString(4, Id);
                            pstmt.executeUpdate();
                            pstmt.close();
                            is.close();
                        } else {
                            lastrow_count = 1;
                            String insertQuery = "INSERT INTO `finance_screenshot_details` (doc, File_name, seq_num, appId) VALUES (?, ?, ?, ?);";
                            InputStream is = (InputStream) item.getInputStream();
                            PreparedStatement pstmt = con.prepareStatement(insertQuery);
                            pstmt.setBinaryStream(1, is);
                            pstmt.setString(2, item.getName());
                            pstmt.setInt(3, lastrow_count);
                            pstmt.setString(4, Id);
                            pstmt.executeUpdate();
                            pstmt.close();
                            is.close();
                        }

                        st.close();
                        rs.close();
                        st3.close();
                        rs3.close();
                    }
                }

                System.out.println("File uploaded");
                jsonObj.addProperty("checkFilesUpload", true);
            } catch (Exception e) {
                e.printStackTrace();
                jsonObj.addProperty("checkFilesUpload", false);
            } finally {
                if (con != null) {
                    try {
                        con.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            jsonObj.addProperty("checkFilesUpload", false);
        }

        System.gc();
        String json = new Gson().toJson(jsonObj);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }


}
