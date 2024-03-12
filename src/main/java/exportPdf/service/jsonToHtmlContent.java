package exportPdf.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.codec.binary.Base64;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import IntakeDetails.IntakePreviewDetails.service.intakePreviewHtmlContentService;
import NewArchiveRequirements.archiveRequirementReview.service.archivePreviewHtmlContentService;
import common.constant.APPROVAL_CONSTANT;
import common.constant.MODULE_NAME;
import logger.System;

public class jsonToHtmlContent {
	private static StringBuffer buffer = null;
	private String appName;
	private String imagePath="S:/Decom3Sixty/D3S_21092021/D3S/src/main/webapp/images/D3Sixty_logo.png";
	private SimpleDateFormat dateFormat = new SimpleDateFormat("MMM dd yyyy");

	public String getHtmlContentFromJson(JsonArray jsonArray,String modulename) {
		System.out.println("htmlContent:"+jsonArray);
		//int index=0;
		
		buffer = new StringBuffer();
		if(modulename.equals(MODULE_NAME.INTAKE_MODULE))
		{
		new intakePreviewHtmlContentService(jsonArray).getHtmlContent();
		}
		else if(modulename.equals(MODULE_NAME.ARCHIVE_REQUIREMENTS_MODULE))
		{
			new archivePreviewHtmlContentService(jsonArray).getHtmlContent();
		}
		return buffer.toString();
	}
	
	protected void writeStartingTags() {
	   buffer.append("<html>\n");
	   buffer.append("<head>\n");
	  // buffer.append("<link rel=\"stylesheet\" type=\"text/css\" href=\"//fonts.googleapis.com/css?family=Lato\" />");
	   buffer.append("<style>\n");
	   //buffer.append("body{font-family:Lato;} ");
	   buffer.append(".mainHeader { font-size:24px;}");
	   buffer.append(".header { font-size:18px;}");
	   buffer.append(".subHeader { font-size:12px;}");
	   buffer.append("th, td {border: 1px solid black; }");
	   buffer.append("table {\r\n" + 
	   		"  border-collapse: collapse;\r\n" + 
	   		"  width: 100%;\r\n" + 
	   		"}\r\n");
       buffer.append("td {\r\n" + 
	   		"  text-align: center;\r\n" + 
	   		"}");
       buffer.append(
	   		"img {\r\n" + 
	   		"  display: block;\r\n" + 
	   		"  margin-left: auto;\r\n" + 
	   		"  margin-right: auto;\r\n" + 
	   		"}");
       buffer.append(
	   		".watermarked {\r\n" + 
	   		"  position: relative;\r\n" + 
	   		"}\r\n");
       buffer.append(
	   		".watermarked:after {\r\n" + 
	   		"  content: \"\";\r\n" + 
	   		"  display: block;\r\n" + 
	   		"  width: 100%;\r\n" + 
	   		"  height: 100%;\r\n" + 
	   		"  position: absolute;\r\n" + 
	   		"  top: 0px;\r\n" + 
	   		"  left: 0px;\r\n" + 
	   		"  background-image: url(\"http://placehold.it/100x100/09f/fff.png\");\r\n" + 
	   		"  background-size: 100px 100px;\r\n" + 
	   		"  background-position: 30px 30px;\r\n" + 
	   		"  background-repeat: no-repeat;\r\n" + 
	   		"  opacity: 0.7;\r\n" + 
	   		"}");
	   buffer.append("</style>\n");
	   buffer.append("</head>\n");
	   buffer.append("<body>\n");
	}
	
	protected void writeTableHeadingTags(String[] columnNames) {
		buffer.append("<thead>");
		for(String column:columnNames)
			buffer.append("<th style='text-align:left; background-color:#737373;color:white;table-layout:fixed;padding: 10px;'>"+column+"</th>\n");
		buffer.append("</thead>");
	}
	
	protected void writeAddendumFilesTableHeadingTags(String[] columnNames) {
		buffer.append("<thead>");
		for(String column:columnNames) {
			if(column.equalsIgnoreCase("S.No")) {
			buffer.append("<th style='text-align: center; vertical-align: middle; width: 5%;background-color:#737373;color:white;table-layout:fixed;padding: 10px;'>"+column+"</th>\n");			
			}
			else
			{
				buffer.append("<th style='text-align: center; vertical-align: middle; width: 45%;background-color:#737373;color:white;table-layout:fixed;padding: 10px;'>"+column+"</th>\n");
				buffer.append("</thead>");	
			}
		}
	}
	protected void writeTableDataTags(String[] values) {
		buffer.append("<thead>");
		for(String value:values)
			buffer.append("<td style='text-align:left;padding: 10px;'>&nbsp;"+value+"</td>\n");
		buffer.append("</thead>");
	}
	protected void writeTableDataEmptyTags(String[] values) {
		buffer.append("<thead>");
		int count=0;
		for(String value:values) {
			count+=1;
		}
		buffer.append("<td colspan="+count+" style='text-align:center;padding:10px;height:18px;'>No Records Found</td>\n");
		buffer.append("</thead>");
	}
	protected void writeTableFileEmptyTags(String[] values) {
		buffer.append("<thead>");
		int count=0;
		for(String value:values) {
			count+=1;
		}
		buffer.append("<td colspan="+count+" style='text-align:center;padding:10px;height:18px;'>No Attachments Found</td>\n");
		buffer.append("</thead>");
	}
	protected void writeNewLineTags() {
		buffer.append("<br/>");		
	}
	protected void writeTableStartTags() {
		   buffer.append("<table style=\"width:100%;\">\n");
//		   buffer.append("<thead>\n");
//		   buffer.append("<th style='text-align: center;'>Fields</th>\n");
//		   buffer.append("<th style='text-align: center;'>Value</th>\n");
//		   buffer.append("</thead>\n");
	}
	
	protected void writeTableEndTags() {
		buffer.append("</table>\n");
	}
	
	protected void writeImageTag(boolean isWaterMark) {
		String className = isWaterMark?"class='watermarked'":"";
		buffer.append("<div "+className+">\r\n" + 
				"  <img style =\"height:70px;width:100px;float:left;\" src=\"data:image/png;base64,"+encodeImageFileToBase64Binary()+"\"></img>\r\n" + 
				"</div>");
	}
	protected void writeTableContent(String labelName,String value) {
		value =value.equals("")?"-":value;
		buffer.append("<tr>\n");
		buffer.append("<td style='text-align:left; background-color:#737373;color:white;table-layout:fixed;width:40%;padding: 10px;'>"+labelName+"</td>\n");
		buffer.append("<td style='text-align:left;padding: 10px;'>&nbsp;"+value+"</td>\n");
		buffer.append("</tr>\n");
	}
	
	protected void writeEndingTags() {
		   buffer.append("</body>\n");
		   buffer.append("</html>");
		}
	
	protected void writeMainTitle(String mainTitle) {
		buffer.append("<center>\n");
		buffer.append("<h1 class='mainHeader'>"+mainTitle+"</h1>\n");
		buffer.append("</center><br/><br/>\n");
	}
	
	protected void writeHeader(String header) {
		buffer.append("<h3 class='header'>"+header+"</h3>\n");
	}
	
	protected void writeSectionHeader(String header) {
		buffer.append("<h5 class='subHeader' >"+header+"</h5>\n");
	}
	
	protected void writeSectionInfo(String Info) {
		 String[] contentInfo = (Info).split("::");
		 for(int i=0;i<contentInfo.length;i++)
		 {
		 buffer.append("<li>"+contentInfo[i]+"</li>");
		 }
	}
	
	
	private String encodeImageFileToBase64Binary(){
		   File file = null;
		   String encodedfile = null;
	       try {
	    	   file = new File(imagePath);
	           FileInputStream fileInputStreamReader = new FileInputStream(file);
	           byte[] bytes = new byte[(int)file.length()];
	           fileInputStreamReader.read(bytes);
	           encodedfile = new String(Base64.encodeBase64(bytes), "UTF-8");
	       } catch (FileNotFoundException e) {
	           // TODO Auto-generated catch block
	           e.printStackTrace();
	       } catch (IOException e) {
	           // TODO Auto-generated catch block
	           e.printStackTrace();
	       }

	       return encodedfile;
	   }
	
	protected String DateFieldConversion(String value) {
		Date date = new Date(value);
		String resultDate = dateFormat.format(date);
		return resultDate;
	}
}