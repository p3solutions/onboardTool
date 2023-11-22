package Finance.FinanceScreenshot.servlet;

import onboard.DBconnection;
import org.owasp.encoder.Encode;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/Finance_scr_download")
public class Finance_scr_download  extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Finance_scr_download() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        //response.getWriter().append("Served at: ").append(request.getContextPath());


    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession details = request.getSession();
        String sessionId = (String) details.getAttribute("APPID");
        String sessionOppName = (String) details.getAttribute("APPNAME");
        System.out.println("The ID for screenshot Delete "+ sessionId +" The Name of the application "+sessionOppName);
        String File = request.getParameter("File_Name");
        System.out.println("File Name : "+File);
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            System.out.println("Connected...");
            String selectQuery = "select AppId,File_Name,doc from finance_application_screenshot where AppId=? and File_Name=?";
            PreparedStatement st=connection.prepareStatement(selectQuery);
            st.setString(1, sessionId);
            st.setString(2,File);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                // gets file name and file blob data
                String fileName = rs.getString("File_Name");
                Blob blob = rs.getBlob("doc");
                InputStream inputStream = blob.getBinaryStream();
                int fileLength = inputStream.available();

                System.out.println("fileLength = " + fileLength);

                ServletContext context = getServletContext();

                // sets MIME type for the file download
                String mimeType = context.getMimeType(fileName);
                if (mimeType == null) {
                    mimeType = "application/octet-stream";
                }

                // set content properties and header attributes for the response
                response.setContentType(Encode.forJava(mimeType));
                response.setContentLength(fileLength);
                String headerKey = "Content-Disposition";
                String headerValue = String.format("attachment; filename=%s", fileName);
                response.setHeader(Encode.forJava(headerKey), Encode.forJava(headerValue));

                // writes the file to the client
                OutputStream outStream = response.getOutputStream();
                int BUFFER_SIZE=4096;
                byte[] buffer = new byte[BUFFER_SIZE];
                int bytesRead = -1;

                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outStream.write(buffer, 0, bytesRead);
                }

                System.out.println("Downloaded File : "+fileName);
                inputStream.close();
                outStream.close();
                connection.close();
                response.flushBuffer();
            } else {
                // no file found
                response.getWriter().print("File not found for the id: " );
            }
        }
        catch (Exception ex) {
            ex.printStackTrace();
            response.getWriter().print("Check Database Connection");
        }

    }
}
