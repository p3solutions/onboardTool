package documentUpload.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Properties;

import org.apache.commons.fileupload.FileItem;

import File_Utility.FileUtils;
import common.constant.ARCHIVE_REQUIREMENTS_SECTION;
import common.constant.ARCHIVE_REQUIREMENT_TABLE;
import common.constant.INTAKE_SECTIONS;
import common.constant.INTAKE_TABLE;
import common.constant.MODULE_NAME;
import onboard.DBconnection;
import logger.System;

public class documentUploadService {

	private String moduleName,sectionName;
	private String appId;
	private DBconnection dBconnection;
	private Connection	con;
	private String tableName;
	private static final String D3SIXTY_CONF="D3Sixty_conf";
	public documentUploadService(String appId,String sectionName) throws ClassNotFoundException, SQLException {
		this.appId = appId;
		this.sectionName = sectionName;
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
		selectModule();
	}

	private void selectModule() {
		
		switch(sectionName) {
		
		case ARCHIVE_REQUIREMENTS_SECTION.LEGACY_APPLICATION_SCREENSHOT:
			moduleName = MODULE_NAME.ARCHIVE_REQUIREMENTS_MODULE;
			tableName = ARCHIVE_REQUIREMENT_TABLE.LEGACY_APPLICATION_SCREENSHOT_TABLE;
			break;
			
		case INTAKE_SECTIONS.ASSESSMENT_APPLICATION_INFO:
			moduleName = MODULE_NAME.INTAKE_MODULE;
			tableName = INTAKE_TABLE.ASSESSMENT_APPlICATION_INFO_BLOB_TABLE;
			break;
			
		}
	}
	
	public boolean uploadDocuments(List<FileItem> multiFiles) {
		try {
			 int seq_num = 1;
			 for(FileItem item : multiFiles)
			 {
				 System.out.println("Table Name : "+tableName);
				 String selectQuery ="SELECT * FROM `"+tableName+"` WHERE appId=? and seq_num =?";
				 PreparedStatement st = con.prepareStatement(selectQuery);
					st.setString(1, appId);
					st.setInt(2, seq_num);
					ResultSet rs = st.executeQuery();
				 if(rs.next()) {
					 String insertQuery = "UPDATE `"+tableName+"` SET doc = ?, File_name = ? WHERE appId = ? AND  seq_num = ?";
					 InputStream is  = (InputStream) item.getInputStream();
					 PreparedStatement pstmt = con.prepareStatement(insertQuery);
					 pstmt.setBinaryStream(1, is);
					 pstmt.setString(2, item.getName());
					 pstmt.setString(3, appId);
					 pstmt.setInt(4, seq_num++ );
					 pstmt.executeUpdate();
					 pstmt.close();
					 is.close();
				 }
				 else {
				 String insertQuery = "INSERT INTO `"+tableName+"` SET doc = ?, File_name = ?, seq_num = ?, appId = ?";
				 InputStream is  = (InputStream) item.getInputStream();
				 PreparedStatement pstmt = con.prepareStatement(insertQuery);
				 pstmt.setBinaryStream(1, is);
				 pstmt.setString(2, item.getName());
				 pstmt.setInt(3, seq_num++ );
				 pstmt.setString(4, appId);
				 pstmt.executeUpdate();
				 pstmt.close();
				 is.close();
				 }
				 st.close();
				 rs.close();
				 //item.write(new File(directory.getAbsolutePath()+File.separator+item.getName()));
			 }
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public boolean retrieveBlob() {
		InputStream resourceStream = null;
		try {
			Properties prop = new Properties();
			String workingDir = System.getProperty("catalina.base") + File.separator + D3SIXTY_CONF;
			File configFile = new File(workingDir, "fileUpload.properties");
			if (configFile.exists()) {
				prop.load(new FileReader(configFile));
			} else {
				// Load from resources folder using class loader
				resourceStream = getClass().getClassLoader().getResourceAsStream("fileUpload.properties");
				if (resourceStream != null) {
					prop.load(new InputStreamReader(resourceStream));
				} else {
					throw new IOException("fileUpload.properties file not found.");
				}
			}
			String Path = prop.getProperty("FILE.REQUIREMENTS.SCREENSHOT.PATH");
			System.out.println("Path : " + Path);
			String selectQuery = "SELECT * FROM " + tableName + " WHERE appId=? AND seq_num=" + 1;
			PreparedStatement st = con.prepareStatement(selectQuery);
			st.setString(1, appId);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				Blob blob = rs.getBlob("doc");
				InputStream in = blob.getBinaryStream();
				Path = Path.concat(rs.getString("File_Name"));
				System.out.println("Path 2 : " + Path);
				OutputStream out = FileUtils.createFileOut(Path);
				byte[] buff = new byte[4096]; // how much of the blob to read/write at a time
				int len = 0;

				while ((len = in.read(buff)) != -1) {
					out.write(buff, 0, len);
				}
				in.close();
				out.close();
			}
			st.close();
			rs.close();

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if (resourceStream != null) {
					resourceStream.close();
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return true;
	}
	
	public boolean deleteDocuments() {
		try {
			String deleteQuery ="DELETE * FROM "+tableName+" WHERE appId=?";
			PreparedStatement st = con.prepareStatement(deleteQuery);
			st.setString(1,appId);
			st.executeUpdate();	
			st.close();
			
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	

	
	@Override
	protected void finalize() throws Throwable {
	  con.close();
	}
}
