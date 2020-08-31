package servlet;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import intake.IntakeReportUtil;
import net.sf.dynamicreports.report.exception.DRException;
import net.sf.jasperreports.engine.JRException;
import org.apache.log4j.Logger;
import reportutils.ReportPojo;
import reportutils.ReportUtils;
import reportutils.StaticReportGenerator;
import service.IntakeInformationService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

/**
 * Servlet implementation class Edit_Intake
 */
@WebServlet("/Intake_Review_Data")
public class Intake_Review_Data extends HttpServlet {
    final static Logger logger = Logger.getLogger(Intake_Review_Data.class);

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Intake_Review_Data() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        // response.getWriter().append("Served at: ").append(request.getContextPath());

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        //final Logger LOGGER = Logger.getLogger(Intake_Review_Data.class);
        String realPath = "";

        final int ARBITARY_SIZE = 1048;
        String data_submit = request.getParameter("data_submit");
        logger.info("data_submit");

        HttpSession details = request.getSession();
        HttpSession session = request.getSession();
        String app_Name = request.getParameter("appname");
        if (app_Name != null && !app_Name.isEmpty()) {
            session.setAttribute("appidd", app_Name);
        }
        app_Name = (String) session.getAttribute("appidd");
        JsonObject infojson = new IntakeInformationService().getInformation(app_Name);
        if (data_submit != null && data_submit.equals("true")) {
            List<ReportPojo> masterReportPojoList = new IntakeReportUtil().intakeReviewPdf(app_Name, infojson);
            String filename = "Intake_review.pdf";
            try {
                ByteArrayOutputStream byteArrayOutputStream = StaticReportGenerator.build(masterReportPojoList, ReportUtils.PDF, "sample", realPath);
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
            /* System.out.println("json--->" + json);*/
            logger.info("json--->" + json);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);

        }

    }

}
