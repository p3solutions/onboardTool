package servlet;

import com.docusign.esign.model.Signer;
import com.google.common.collect.Table;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import docusign.DocusignUtility;
import intake.IntakeReportUtil;
import net.sf.dynamicreports.report.exception.DRException;
import net.sf.jasperreports.engine.JRException;
import org.apache.log4j.Logger;
import reportutils.ReportPojo;
import reportutils.ReportUtils;
import reportutils.StaticReportGenerator;
import reportutils.TableReportGenerator;
import service.IntakeInformationService;
import service.ListUserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.*;

@WebServlet("/Priority_Review_Email")
public class Priority_Review_Email extends HttpServlet {
    final static Logger logger = Logger.getLogger(Priority_Review_Email.class);


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("testing---->");
        try {
            String source = request.getReader().readLine();
            JsonObject infojson = new JsonParser().parse(source).getAsJsonObject();
            boolean isSignOrdered = Boolean.valueOf(request.getHeader("signorder"));
            String email = infojson.get("selectedEmail").toString();
            logger.info("Email_ID" + email);
            //String app_Name = request.getSession().getAttribute("appidd").toString();

            JsonObject tableData = infojson.get("mydata").getAsJsonObject();
            JsonArray recepientsIdArray = new JsonParser().parse(email).getAsJsonArray();
            Map<String, String> users = getUserOrder(recepientsIdArray);
            ByteArrayOutputStream pdfReportOutputStream = new TableReportGenerator().build(tableData.get("header").getAsJsonArray(), tableData.get("data").getAsJsonArray(), ReportUtils.PDF, "Priority_Review", "");
            DocusignUtility docusignUtility = new DocusignUtility();
            if (isSignOrdered) {
                sendSigningEmail(users, pdfReportOutputStream, docusignUtility);
            } else {
                sendIndividualEmail(users, pdfReportOutputStream, docusignUtility);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void sendSigningEmail(Map<String, String> users, ByteArrayOutputStream byteArrayOutputStream, DocusignUtility docusignUtility) {
        List<Signer> signerList = new ArrayList();
        int order = 1;
        for (Map.Entry<String, String> s : users.entrySet()) {
            Signer signer = new Signer();
            signer.routingOrder(String.valueOf(order));
            signer.setEmail(s.getKey());
            signer.setName(s.getValue());
            signer.setRecipientId(UUID.randomUUID().toString());
            signerList.add(signer);
            order++;
        }

        docusignUtility.priorityrequestRoutingDocumentSigning(byteArrayOutputStream, signerList);
    }

    private void sendIndividualEmail(Map<String, String> users, ByteArrayOutputStream byteArrayOutputStream, DocusignUtility docusignUtility) {
        for (Map.Entry<String, String> s : users.entrySet()) {
            Signer signer = new Signer();
            signer.routingOrder(s.getKey());
            docusignUtility.priorityrequestIndividualDocumentSigning(byteArrayOutputStream, s);
        }
    }

    private Map<String, String> getUserOrder(JsonArray recepientsIdArray) {
        List<Integer> recepientId = new ArrayList();
        recepientsIdArray.forEach(s ->
                recepientId.add(s.getAsInt()));
        Table<String, String, String> recipients = new ListUserService().getRecipients(recepientId);
        Map<String, String> users = new LinkedHashMap();
        recepientId.stream().forEachOrdered(recId ->
        {
            recipients.row(String.valueOf(recId)).forEach((userName, email) ->
            {
                users.put(userName, email);
            });
        });
        return users;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
