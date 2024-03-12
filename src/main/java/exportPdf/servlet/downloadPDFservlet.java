package exportPdf.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.owasp.encoder.Encode;
import File_Utility.FileUtils;
import logger.System;

@WebServlet("/downloadPDFservlet")
public class downloadPDFservlet extends HttpServlet {
	private final int ARBITARY_SIZE = 1048;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String downloadFilePath = request.getParameter("path").replaceAll("'","");//"S:\\sample.pdf";//request.getParameter("path");
        File f =FileUtils.createFile(downloadFilePath);
		response.setContentType("application/pdf");
		response.setContentLength((int) f.length());
		response.setHeader( "Content-Disposition", Encode.forJava("attachment; filename=" +f.getName()) );
        try(InputStream in = new FileInputStream(FileUtils.createFile(downloadFilePath));
          OutputStream out = response.getOutputStream()) {

            byte[] buffer = new byte[ARBITARY_SIZE];
        
            int numBytesRead;
            while ((numBytesRead = in.read(buffer)) > 0) {
                out.write(buffer, 0, numBytesRead);
            }
        }
        
	}
}
