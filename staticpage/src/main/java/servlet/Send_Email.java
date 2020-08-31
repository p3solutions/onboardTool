package servlet;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import docusign.DocusignUtility;
import intake.IntakeReportUtil;
import org.apache.log4j.Logger;
import reportutils.ReportPojo;
import reportutils.ReportUtils;
import reportutils.StaticReportGenerator;
import service.IntakeInformationService;
import service.ListUserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/Send_Email")
public class Send_Email extends HttpServlet {
    final static Logger LOGGER = Logger.getLogger(Send_Email.class);

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("hello");
        try {
            String email = request.getReader().readLine();
            System.out.println("Email_ID" + email);
            String app_Name = request.getSession().getAttribute("appidd").toString();
            JsonArray recepientsIdArray;
            List<Integer> recepientId = new ArrayList();
            recepientsIdArray = new JsonParser().parse(email).getAsJsonArray();
            recepientsIdArray.forEach(s ->
                    recepientId.add(s.getAsInt()));
            JsonArray jsonArray = new ListUserService().getRecipients(recepientId);
            Map<String, String> users = new HashMap<>();
            jsonArray.forEach(s ->
            {
                s.getAsJsonObject().entrySet().forEach(a -> {
                    users.put(a.getKey(), a.getValue().getAsString());
                });
            });
            JsonObject infojson = new IntakeInformationService().getInformation(app_Name);
            List<ReportPojo> masterReportPojoList = new IntakeReportUtil().intakeReviewPdf(app_Name, infojson);
            ByteArrayOutputStream byteArrayOutputStream = StaticReportGenerator.build(masterReportPojoList, ReportUtils.PDF, "sample", "");
            DocusignUtility docusignUtility = new DocusignUtility();
            docusignUtility.requestDocumentSigning(byteArrayOutputStream, users);
            /*response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(String.valueOf(jsonArray));*/


        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
