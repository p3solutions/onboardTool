package servlet;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import net.sf.dynamicreports.report.exception.DRException;
import net.sf.jasperreports.engine.JRException;
import org.apache.log4j.Logger;
import reportutils.ReportUtils;
import reportutils.TableReportGenerator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

/**
 * Servlet implementation class Edit_Intake
 */
@WebServlet("/priorityreview")
public class PriorityReview extends HttpServlet {

    final static Logger logger = Logger.getLogger(PriorityReview.class);

    private static final long serialVersionUID = 1L;


    public PriorityReview() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        // response.getWriter().append("Served at: ").append(request.getContextPath());

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String realPath = "";
        JsonObject infojson = null;
        final int ARBITARY_SIZE = 1048;
        String data_submit = request.getParameter("mydata");
        if (data_submit != null) {
            String filename = "Priority_Review.pdf";
            infojson = new JsonParser().parse(data_submit).getAsJsonObject();
            try {
                ByteArrayOutputStream byteArrayOutputStream = new TableReportGenerator().build(infojson.getAsJsonArray("header"), infojson.getAsJsonArray("data"), ReportUtils.PDF, "Plan and Priority Review", realPath);
                response.setContentType("application/pdf");
                response.setHeader("Content-Disposition", "inline; filename=\"" + filename + "\"");

                InputStream in = new ByteArrayInputStream(byteArrayOutputStream.toByteArray());
                OutputStream out = response.getOutputStream();
                byte[] buffer = new byte[ARBITARY_SIZE];

                int numBytesRead;
                while ((numBytesRead = in.read(buffer)) > 0) {
                    out.write(buffer, 0, numBytesRead);
                }
                out.close();
                in.close();
            } catch (InstantiationException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (DRException e) {
                e.printStackTrace();
            } catch (JRException e) {
                e.printStackTrace();
            }

        } else {
            String json = new Gson().toJson(infojson);
            logger.info("json--->" + json);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        }

    }

}
