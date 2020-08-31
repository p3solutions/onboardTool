package intake;

import com.google.gson.JsonObject;
import org.apache.log4j.Logger;
import reportutils.ReportPojo;
import service.IntakeInformationService;

import java.util.LinkedList;
import java.util.List;

public class IntakeReportUtil {

    final static Logger logger = Logger.getLogger(IntakeReportUtil.class);

    public List<ReportPojo> intakeReviewPdf(String app_Name, JsonObject infojson) {
        List<ReportPojo> masterReportPojoList = new LinkedList();
        List<ReportPojo> p1List = new LinkedList();
        p1List.add(new ReportPojo("Intake Business Application Information", "", false, true));
        List<ReportPojo> p2List = new LinkedList();
        p2List.add(new ReportPojo("Intake Business Legal Retention", "", false, true));
        List<ReportPojo> p3List = new LinkedList();
        p3List.add(new ReportPojo("Intake Business Archive Data Management", "", false, true));
        List<ReportPojo> p4List = new LinkedList();
        p4List.add(new ReportPojo("SystemRequirements", "", false, true));

        infojson.entrySet().stream().forEach(s ->
        {
            String[] values = s.getValue().getAsString().split("/");
            ReportPojo reportPojo = new ReportPojo(s.getKey(), values[0], false, false);
            if (values[1].equals("P1")) {
                p1List.add(reportPojo);
            }
            if (values[1].equals("P2")) {
                p2List.add(reportPojo);
            }
            if (values[1].equals("P3")) {
                p3List.add(reportPojo);
            }
            if (values[1].equals("P4")) {
                p4List.add(reportPojo);
            }
        });
        masterReportPojoList.add(new ReportPojo("Bussiness Details", "", false, true));
        masterReportPojoList.addAll(p1List);
        masterReportPojoList.addAll(p2List);
        masterReportPojoList.addAll(p3List);
        masterReportPojoList.addAll(p4List);


        List<ReportPojo> p5List = new LinkedList();
        p5List.add(new ReportPojo("Application Information", "", false, true));
        List<ReportPojo> p6List = new LinkedList();
        p6List.add(new ReportPojo("Legacy Retention Information", "", false, true));
        List<ReportPojo> p7List = new LinkedList();
        p7List.add(new ReportPojo("Intake Documentations", "", false, true));


        infojson.entrySet().stream().forEach(s ->
        {
            String[] values = s.getValue().getAsString().split("/");
            ReportPojo reportPojo = new ReportPojo(s.getKey(), values[0], false, false);
            if (values[1].equals("P5")) {
                p5List.add(reportPojo);
            }
            if (values[1].equals("P6")) {
                p6List.add(reportPojo);
            }
            if (values[1].equals("P7")) {
                p7List.add(reportPojo);
            }
        });
        masterReportPojoList.add(new ReportPojo("Technical Details", "", false, true));
        masterReportPojoList.addAll(p5List);
        masterReportPojoList.addAll(p6List);
        masterReportPojoList.addAll(p7List);

            /*List<ReportPojo> p8List = new LinkedList();
            p5List.add(new ReportPojo("Screen Requirements", "", false, true));*/

        List<ReportPojo> p9List = new LinkedList();
        p9List.add(new ReportPojo("Archive Requirements", "", false, true));


        infojson.entrySet().stream().forEach(s ->
        {
            String[] values = s.getValue().getAsString().split("/");
            ReportPojo reportPojo = new ReportPojo(s.getKey(), values[0], false, false);
                /*if (values[1].equals("P8")) {
                    p8List.add(reportPojo);
                }*/

            if (values[1].equals("P9")) {
                p9List.add(reportPojo);
            }
        });
        masterReportPojoList.add(new ReportPojo("Archival Reqiurements Details", "", false, true));
        /*masterReportPojoList.addAll(p8List);*/
        masterReportPojoList.addAll(p9List);

        return masterReportPojoList;
    }
}
