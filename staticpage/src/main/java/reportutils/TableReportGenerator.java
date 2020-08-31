package reportutils;


import com.google.gson.JsonArray;
import net.sf.dynamicreports.jasper.builder.JasperReportBuilder;
import net.sf.dynamicreports.jasper.constant.JasperProperty;
import net.sf.dynamicreports.report.constant.HorizontalTextAlignment;
import net.sf.dynamicreports.report.constant.PageOrientation;
import net.sf.dynamicreports.report.constant.PageType;
import net.sf.dynamicreports.report.constant.SplitType;
import net.sf.dynamicreports.report.datasource.DRDataSource;
import net.sf.dynamicreports.report.exception.DRException;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Locale;
import java.util.stream.StreamSupport;

import static net.sf.dynamicreports.report.builder.DynamicReports.*;

//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;

@SuppressWarnings("deprecation")
public class TableReportGenerator {

    //private static Logger logger = LoggerFactory.getLogger(StaticReportGenerator.class);
    public static SimpleDateFormat smpDateFmt = new SimpleDateFormat("dd-MMM-YYY HH:mm:ss a", Locale.US);


    /// for dms
    public   ByteArrayOutputStream build(JsonArray head, JsonArray data, String exportType, String reportTitle, String realPath
    )
            throws InstantiationException, IllegalAccessException, DRException, IOException, JRException {
        String[] columns =
                StreamSupport.stream(head.spliterator(), false)
                        .map(s -> s.getAsString()).toArray(String[]::new);
        JasperReportBuilder reportBuilder = new JasperReportBuilder();
        reportBuilder
                .setTemplate(Templates.reportTemplate)
                .columns()
                .title(Templates.createTitleComponent(reportTitle),cmp.horizontalList(cmp.text(reportTitle).setStretchWithOverflow(true)
                        .addProperty(JasperProperty.EXPORT_PDF_PRINT_SCALING, "true")
                        .addProperty("net.sf.jasperreports.print.keep.full.text", "true")
                        .addProperty("net.sf.jasperreports.export.pdf.force.linebreak.policy", "true")
                        .setStyle(stl.style().boldItalic().setFontSize(15))
                        .setHorizontalTextAlignment(HorizontalTextAlignment.CENTER)).setMinHeight(30))
                .pageFooter(Templates.footerComponent)
                .setDataSource(createDataSource(columns,data));

        for (String colname : columns) {
            reportBuilder.columns(col.column(colname, colname, type.stringType())
                    .setStretchWithOverflow(true)
                    .addProperty(JasperProperty.EXPORT_PDF_PRINT_SCALING, "true")
                    .addProperty("net.sf.jasperreports.print.keep.full.text", "true")
                    .addProperty("net.sf.jasperreports.export.pdf.force.linebreak.policy", "true")
                    .addProperty(JasperProperty.PRINT_KEEP_FULL_TEXT, "true"));
        }
        reportBuilder.setIgnorePageWidth(false);
        reportBuilder.addProperty(JasperProperty.EXPORT_PDF_PRINT_SCALING, "true");
        reportBuilder.addProperty("net.sf.jasperreports.print.keep.full.text", "true");
        reportBuilder.addProperty("net.sf.jasperreports.export.pdf.force.linebreak.policy", "true");
        reportBuilder.setDataSource(createDataSource(columns, data));
        reportBuilder.setPageFormat(PageType.A4, PageOrientation.LANDSCAPE);
        reportBuilder.setDetailSplitType(SplitType.PREVENT);
        //reportBuilder.show();
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        JRPdfExporter jrPdfExporter = new JRPdfExporter();
        jrPdfExporter.setParameter(JRXlsExporterParameter.JASPER_PRINT,  reportBuilder.toJasperPrint());
        jrPdfExporter.setParameter(JRXlsExporterParameter.OUTPUT_STREAM, output);
        jrPdfExporter.exportReport();
        return output;
    }


    private static JRDataSource createDataSource(String[] columns, JsonArray data) {
        DRDataSource dataSource = new DRDataSource(columns);
        StreamSupport.stream(data.spliterator(), false)
                .forEach(arr -> {
                    dataSource.add(arr.getAsJsonObject().entrySet().stream().map(s->s.getValue().getAsString()).toArray(String[]::new));
                });
        return dataSource;
    }


}
