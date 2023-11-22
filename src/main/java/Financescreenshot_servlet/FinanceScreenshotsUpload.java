package Financescreenshot_servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Properties;

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
import onboard.DBconnection;

/**
 * Servlet implementation class FinanceScreenshotsUpload
 */
@WebServlet("/FinanceScreenshotsUpload")
public class FinanceScreenshotsUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FinanceScreenshotsUpload() {
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
		JsonObject jsonObj = new JsonObject();
	    try
		{
		HttpSession details = request.getSession();
	    String Id=(String)details.getAttribute("app_name");
	    Properties properties = new Properties();
	    InputStream fileInput = FinanceScreenshotsUpload.class
				.getResourceAsStream("/fileUpload.properties");
		properties.load(fileInput);
		fileInput.close();
		String path = properties.getProperty("FILE.REQUIREMENTS.SCREENSHOT.PATH"); 
		File directory=FileUtils.createFile(path+File.separator+Id);
		if(!directory.exists())
			directory.mkdir();
		ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
		 List<FileItem> multiFiles = sf.parseRequest(request);
		 DBconnection dBconnection = new DBconnection();
		 Connection	con = (Connection) dBconnection.getConnection();	 
//		 int seq_num = 1;
		 int lastrow_count=0;
		 for(FileItem item : multiFiles)
		 {
			 String selectQuery3 ="SELECT COUNT(*) FROM decom3sixtytool.finance_screenshot where AppId=? ";
			 PreparedStatement st3 = con.prepareStatement(selectQuery3);
			 st3.setString(1, Id);
			 ResultSet rs3 = st3.executeQuery();
			 rs3.next();
		     lastrow_count = rs3.getInt(1);
			 String selectQuery ="SELECT * FROM finance_screenshot` WHERE AppId=? ORDER BY seq_num;";
			 PreparedStatement st = con.prepareStatement(selectQuery);
			 st.setString(1, Id);
//			 st.setInt(2, lastrow_count);
			 ResultSet rs = st.executeQuery();
			 rs.next();
		     
			 if (lastrow_count > 0) {
			 String insertQuery = "INSERT INTO finance_screenshot` (doc, File_name, seq_num, AppId) VALUES (?, ?, ?, ?);";
			 InputStream is  = (InputStream) item.getInputStream();
			 PreparedStatement pstmt = con.prepareStatement(insertQuery);
			 pstmt.setBinaryStream(1, is);
			 pstmt.setString(2, item.getName());
			 pstmt.setInt(3, lastrow_count+1 );
			 pstmt.setString(4, Id);
			 pstmt.executeUpdate();
			 pstmt.close();
			 is.close();
			 }else {
				 lastrow_count=1;
				 String insertQuery = "INSERT INTO finance_screenshot` (doc, File_name, seq_num, AppId) VALUES (?, ?, ?, ?);";
				 InputStream is  = (InputStream) item.getInputStream();
				 PreparedStatement pstmt = con.prepareStatement(insertQuery);
				 pstmt.setBinaryStream(1, is);
				 pstmt.setString(2, item.getName());
				 pstmt.setInt(3, lastrow_count );
				 pstmt.setString(4, Id);
				 pstmt.executeUpdate();
				 pstmt.close();
				 is.close();
				 
			 }
			 
			 st.close();
			 rs.close();
			 st3.close();
			 rs3.close();
			 
			 //item.write(new File(directory.getAbsolutePath()+File.separator+item.getName()));
		 }
		 System.out.println("File uploaded");
		 jsonObj.addProperty("checkFilesUpload",true);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			jsonObj.addProperty("checkFilesUpload",false);
		}
		System.gc();
	    String json = new Gson().toJson(jsonObj);
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write(json);
		}
	}


