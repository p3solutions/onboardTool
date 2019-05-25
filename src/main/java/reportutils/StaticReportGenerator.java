package reportutils;


import net.sf.dynamicreports.jasper.builder.JasperReportBuilder;
import net.sf.dynamicreports.jasper.constant.JasperProperty;
import net.sf.dynamicreports.report.builder.component.HorizontalListBuilder;
import net.sf.dynamicreports.report.builder.component.VerticalListBuilder;
import net.sf.dynamicreports.report.constant.*;
import net.sf.dynamicreports.report.exception.DRException;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRParagraph;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;
import net.sf.jasperreports.engine.util.JRProperties;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import static net.sf.dynamicreports.report.builder.DynamicReports.*;

//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;

@SuppressWarnings("deprecation")
public class StaticReportGenerator {

    //private static Logger logger = LoggerFactory.getLogger(StaticReportGenerator.class);
    public static SimpleDateFormat smpDateFmt = new SimpleDateFormat("dd-MMM-YYY HH:mm:ss a",Locale.US);


    /// for dms

    public static ByteArrayOutputStream build(List<ReportPojo> data, String exportType, String reportTitle,String realPath
    )
            throws InstantiationException, IllegalAccessException, DRException, IOException, JRException {
        VerticalListBuilder listBuilder = cmp.verticalList();
        data.forEach(s ->
        {
            if (s.isHeading() == true) {

                //listBuilder.add(cmp.text(s.getName()).setStyle(stl.style().bold().setFontSize(18).setUnderline(true)));
                listBuilder.add(cmp.text(s.getName()).setStyle(stl.style().bold().setFontSize(18)));
            }
            if (s.isSubHeading() == true) {

                //listBuilder.add(cmp.text(s.getName()).setStyle(stl.style().bold().setFontSize(15).setUnderline(true)));
                listBuilder.add(cmp.text(s.getName()).setStyle(stl.style().bold().setFontSize(15)));
            } else {
                HorizontalListBuilder horizontalListBuilder = cmp.horizontalList();

                horizontalListBuilder.setGap(50);
                horizontalListBuilder.add(cmp.text(s.getName() + "  :  ").setStyle(stl.style().setFontSize(11)));
                horizontalListBuilder.add(cmp.text(s.getValue()).setStyle(stl.style().bold().setFontSize(11)));
                listBuilder.add(horizontalListBuilder);
            }
            listBuilder.add(cmp.verticalGap(15));
        });

        JRProperties.setProperty(JRParagraph.DEFAULT_TAB_STOP_WIDTH, "22");
        JasperReportBuilder reportBuilder = new JasperReportBuilder();

        reportBuilder.setTemplate(Templates.reportTemplate);
        reportBuilder.addDetail(listBuilder);
        reportBuilder.setIgnorePageWidth(false);
        reportBuilder.setDataSource(new JREmptyDataSource());
        reportBuilder.addProperty(JasperProperty.EXPORT_PDF_PRINT_SCALING, "true");
        reportBuilder.addProperty("net.sf.jasperreports.print.keep.full.text", "true");
        reportBuilder.addProperty("net.sf.jasperreports.export.pdf.force.linebreak.policy", "true");
        reportBuilder.setPageFormat(PageType.A4, PageOrientation.PORTRAIT);
        reportBuilder.setDetailSplitType(SplitType.IMMEDIATE);
        reportBuilder.pageHeader(Templates.createTitleComponent(realPath));
        reportBuilder.pageFooter(Templates.createFooterComponent(smpDateFmt.format(new Date())));

        JasperPrint jasperPrint = reportBuilder.toJasperPrint();
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        JRPdfExporter jrPdfExporter = new JRPdfExporter();
        jrPdfExporter.setParameter(JRXlsExporterParameter.JASPER_PRINT, jasperPrint);
        //jrPdfExporter.setParameter(JRXlsExporterParameter.OUTPUT_FILE_NAME, "D:\\shankar\\officeproject\\onboarding_gradle_project\\src\\main\\webapp\\docs\\Intake.pdf");
        jrPdfExporter.setParameter(JRXlsExporterParameter.OUTPUT_STREAM, output);
        jrPdfExporter.exportReport();
        return output;
    }
}
