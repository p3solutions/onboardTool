package exportPdf.service;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Objects;
import java.util.Properties;
import java.util.Set;
import com.google.gson.JsonArray;
import com.itextpdf.html2pdf.ConverterProperties;
import com.itextpdf.html2pdf.HtmlConverter;
import com.itextpdf.io.font.constants.StandardFontFamilies;
import com.itextpdf.io.image.ImageData;
import com.itextpdf.io.image.ImageDataFactory;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfPage;
import com.itextpdf.kernel.pdf.PdfReader;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
import com.itextpdf.kernel.pdf.extgstate.PdfExtGState;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Image;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Text;
import com.itextpdf.layout.properties.TextAlignment;
import com.itextpdf.layout.properties.VerticalAlignment;
import IntakeDetails.IntakePreviewDetails.service.intakePreviewHtmlContentService;
import NewArchiveRequirements.archiveRequirementReview.service.archivePreviewHtmlContentService;
import common.constant.COMMON_CONSTANTS;
import common.constant.MODULE_NAME;
import common.resource.resourceUtils;
import exportPdf.waterMarkConditions;
import net.sf.dynamicreports.report.constant.FontName;
import onboard.DBconnection;
import com.itextpdf.kernel.font.PdfFont;
import File_Utility.FileUtils;
public class exportPdfService extends jsonToHtmlContent {
    DBconnection dBconnection = null;
    Connection con = null;
    private String htmlContent;
    private String home;
    private String modulename;
    private File downloadDirectory;
    private String appName;
    private String appId;
    private static String waterMarkLogo = "classpath:/D3S.png";
    private Properties properties;
    private String pdfPath;
    String applicationId=null;
     public String getAppId() {
         try {
             String applicationIdQuery = "select value from opportunity_info where column_name='apmid' and Id=?;";
             PreparedStatement st = con.prepareStatement(applicationIdQuery);
 			 st.setString(1, appId);
 			 ResultSet rs = st.executeQuery();
             while (rs.next()) {
                 applicationId = rs.getString("value");
             }
             rs.close();
             st.close();
         } catch (Exception e) {
             e.printStackTrace();
         }
         return applicationId;
     }
    public exportPdfService(JsonArray jsonArray,String appName,String appId,String modulename) throws ClassNotFoundException, SQLException, IOException {
    this.home = System.getProperty("user.home");
    this.downloadDirectory = new File(home+"/Downloads");
    this.appName = appName;
    this.appId = appId;
    this.htmlContent = getHtmlContentFromJson(jsonArray,modulename);
    this.properties = new resourceUtils("/"+COMMON_CONSTANTS.FILE_UPLOAD_PROPS).loadProperties();
    this.pdfPath = properties.getProperty(COMMON_CONSTANTS.FILE_PROPS_PDF_PATH)+File.separator;
    this.modulename=modulename;
    dBconnection = new DBconnection();
    con = (Connection) dBconnection.getConnection();
    }
   public String startExportPdf() {
       boolean flag =false;
       String filePath = "";
       try {
           applicationId=getAppId();
           String finalPdfPath = pdfPath+"final.pdf";
           String pdfName="";
           if(modulename.equals(MODULE_NAME.INTAKE_MODULE))
            {
               pdfName= getPdfFileName("intake_summary_"+appName)+".pdf";           }
            else if(modulename.equals(MODULE_NAME.ARCHIVE_REQUIREMENTS_MODULE))
            {
                 pdfName = getPdfFileName("archive_requirements_summary_"+appName)+".pdf";
             }
           String coverPage = createCoverPage(appId,appName,modulename,applicationId);
           String detailsPage = convertHtmltoPdf();
           String srcPath = downloadDirectory+File.separator+"sample.pdf";
           Map<String, waterMarkConditions> fileSet = new LinkedHashMap<>();
            fileSet.put(coverPage,new  waterMarkConditions(appName,appId,true));
            fileSet.put(detailsPage,new  waterMarkConditions(appName,appId,true));
            mergeAndWaterMark( finalPdfPath, fileSet);
            Path TempFilePath = Files.createTempDirectory("TempPDF");
            System.out.println("PDF temp file path:"+TempFilePath.toString());
            filePath = TempFilePath.toString()+File.separator+pdfName;
            manipulatePdf(finalPdfPath, filePath);
            flag = true;
       }
       catch(Exception e) {
           e.printStackTrace();
       }
       //filePath = filePath.replaceAll(File.separator,File.separator+File.separator );
       return filePath;
   }
    public String convertHtmltoPdf() throws IOException {
        String htmlPdfPath = pdfPath+"htmlContent.pdf";
        PdfDocument pdfDocument = new PdfDocument(new PdfWriter(htmlPdfPath));
        ConverterProperties properties = new ConverterProperties();
        pdfDocument.setDefaultPageSize(PageSize.A4);
        HtmlConverter.convertToPdf(htmlContent,pdfDocument, properties);
        pdfDocument.close();
        return htmlPdfPath;
    }
    private String getPdfFileName(String fileName) {
        boolean flag = true;
        int counter = 1;
        String file_name= fileName;
        while(flag) {
            if(!FileUtils.createFile(downloadDirectory+File.separator+file_name+".pdf").exists()) {
            flag =false;
            }
            else {
            file_name = fileName+"("+(counter++)+")";
            }
        }
        return file_name;
    }
    public String createCoverPage(String appId, String appName,String modulename,String applicationId) throws IOException {
        String coverPagePath =  pdfPath+"front_page.pdf";
        PdfWriter pdfWriter = new PdfWriter(new File(coverPagePath));
        PdfDocument pdfDocument = new PdfDocument(pdfWriter);
        Document coverDoc = new Document(pdfDocument, PageSize.A4);
        coverDoc.setMargins(30, 30, 30, 30);
        //coverDoc.add(new Paragraph(new Text("Intake Summary").setFontSize(20)).setTextAlignment(TextAlignment.CENTER));
        addEmptyLines(coverDoc, 25);
        ImageData img = ImageDataFactory.create(waterMarkLogo);
        float w = img.getWidth();
        float h = img.getHeight();
        Rectangle pageSize = coverDoc.getPdfDocument().getPage(1).getPageSize();
        int x = (int) ((pageSize.getLeft() + pageSize.getRight()) / 2);
        int y = (int) ((pageSize.getTop() + pageSize.getBottom()) / 2);
        //coverDoc.add(new Image(ImageDataFactory.create(waterMarkLogo), x - (w / 2), y - (h / 2)));
        System.out.println((x - (w / 2))+":"+( y - (h / 2)));
        if(modulename.equals(MODULE_NAME.INTAKE_MODULE))
        {
            coverDoc.add(new Paragraph(new Text("Intake Summary \n "+"-\n"+appName).setFontSize(28)).setTextAlignment(TextAlignment.CENTER).setFixedPosition(100,450,350));
        }
        else if(modulename.equals(MODULE_NAME.ARCHIVE_REQUIREMENTS_MODULE))
        {
            coverDoc.add(new Paragraph(new Text("Archive Requirements Summary \n"+"-\n"+appName).setFontSize(28)).setTextAlignment(TextAlignment.CENTER).setFixedPosition(100,450,350));
        }
        coverDoc.setFont(PdfFontFactory.createFont(StandardFontFamilies.HELVETICA));
        coverDoc.add(new Paragraph(new Text("Application Id : " + applicationId).setFontSize(8)));
        coverDoc.add(new Paragraph(new Text("Application Name : " + appName).setFontSize(8)));
        coverDoc.add(new Paragraph(new Text("Report Generated Date : " + new Date().toGMTString()).setFontSize(8)));
        //coverDoc.add(new Paragraph(new Text("This is a system generated Report").setFontSize(6)));
        coverDoc.close();
        return coverPagePath;
    }
    private void mergeAndWaterMark(String destFilePath, Map<String, waterMarkConditions> filesInfo) throws Exception {
        Set<String> filesToDelete = new HashSet<>();
        PdfWriter writer = null;
        Document destDoc = null;
        FileOutputStream fos=null;
        try {
//            writer = new PdfWriter(destFilePath);
            fos= new FileOutputStream(destFilePath);
            PdfWriter pdfWriter = new PdfWriter(fos);
            PdfDocument destReport = new PdfDocument(pdfWriter);
            destDoc = new Document(destReport);
            for (Map.Entry<String, waterMarkConditions> fiesToMergeDetails : filesInfo.entrySet()) {
                if (fiesToMergeDetails.getKey() != null) {
                    String filePath = addWaterMark(fiesToMergeDetails.getKey(), fiesToMergeDetails.getValue());
                    filesToDelete.add(filePath);
//                    PdfReader pdfReader = new PdfReader(filePath);
                    FileInputStream fis = new FileInputStream(filePath);
                    PdfReader pdfReader = new PdfReader(fis);
                    PdfDocument pdfDoc = new PdfDocument(pdfReader);
                    pdfDoc.copyPagesTo(1, pdfDoc.getNumberOfPages(), destReport);
                    // automatically call PdfReader close inside PdfDocument close methos
                    pdfDoc.close();
                    if(fis!=null)
                        fis.close();
                }
            }
        } finally{
            if(destDoc!=null) {
                destDoc.close();
            }
            if(fos!=null)
                fos.close();
        }
    }
    private String addWaterMark(String docPath, waterMarkConditions waterMarkConditions) throws Exception {
        String docPathTemp = docPath.substring(0, docPath.lastIndexOf(".pdf") - 1) + "_marked.pdf";
//        PdfReader pdfReader = new PdfReader(docPath);
        FileInputStream fis = new FileInputStream(docPath);
        PdfReader pdfReader = new PdfReader(fis);
//        PdfWriter pdfWriter = new PdfWriter(docPathTemp);
        FileOutputStream fos= new FileOutputStream(docPathTemp);
        PdfWriter pdfWriter = new PdfWriter(fos);
        PdfDocument pdfDoc = new PdfDocument(pdfReader,pdfWriter);
        Document doc = new Document(pdfDoc);
        PdfFont font = PdfFontFactory.createFont(StandardFontFamilies.COURIER);
        Paragraph titleText = new Paragraph(Objects.toString("App Name : "+waterMarkConditions.getAppName(), "")).setFont(font).setFontSize(6);
        Paragraph systemGenerated = new Paragraph("This is a system generated Report").setFont(font).setFontSize(6);
        Paragraph jobIdText = new Paragraph(Objects.toString("App Id : "+getAppId(), "")).setFont(font).setFontSize(6);
        ImageData img = ImageDataFactory.create(waterMarkLogo);
        float w = (float) (img.getWidth());
        float h = (float) (img.getHeight());
        PdfExtGState gs1 = new PdfExtGState();
        gs1.setFillOpacity(0.5f);
        PdfExtGState gs2 = new PdfExtGState();
        gs2.setFillOpacity(0.1f);
        PdfCanvas over;
        int numberOfPages = pdfDoc.getNumberOfPages();
        for (int i = 1; i <= numberOfPages; i++) {
            PdfPage pdfPage = pdfDoc.getPage(i);
            pdfPage.setIgnorePageRotationForContent(true);
            over = new PdfCanvas(pdfDoc.getPage(i));
            over.saveState();
            over.setExtGState(gs1);
            doc.showTextAligned(jobIdText, 10, 10, i, TextAlignment.LEFT, VerticalAlignment.BOTTOM, 0);
            doc.showTextAligned(titleText, 10, 20, i, TextAlignment.LEFT, VerticalAlignment.BOTTOM, 0);
            doc.showTextAligned(systemGenerated, pdfPage.getPageSize().getWidth() - 10, 10, i, TextAlignment.RIGHT, VerticalAlignment.BOTTOM, 0);
            if (waterMarkConditions.isShowLogo()) {
                over.setExtGState(gs2);
                over.addImageWithTransformationMatrix(img, w, 0, 0, h, pdfPage.getPageSize().getWidth() - 10 - w, 25, false);
            }
//            if(docPath.equals("htmlContent.pdf"))
//              doc.showTextAligned(new Paragraph(String.format("page %s of %s", i-1, numberOfPages-1)),
//                      pdfPage.getPageSize().getWidth() - 298, 10, i, TextAlignment.CENTER, VerticalAlignment.BOTTOM, 0);
            over.restoreState();
        }
        if(doc!=null) {
            doc.close();
        }
        if(pdfReader!=null){
            pdfReader.close();
        }
        if(pdfWriter!=null){
            pdfWriter.close();
        }
        if(fis!=null)
            fis.close();
        if(fos!=null)
            fos.close();
        return docPathTemp;
    }
    protected void manipulatePdf(String srcPath,String dest) throws Exception {
        PdfDocument pdfDoc = new PdfDocument(new PdfReader(srcPath), new PdfWriter(dest));
        Document doc = new Document(pdfDoc);
        int numberOfPages = pdfDoc.getNumberOfPages();
        for (int i = 1; i <= numberOfPages; i++) {
            // Write aligned text to the specified by parameters point
            if(i!=1) {
                PdfPage pdfPage = pdfDoc.getPage(i);
                pdfPage.setIgnorePageRotationForContent(true);
                System.out.println(pdfPage.getPageSize().getWidth());
                doc.showTextAligned(new Paragraph(String.format("page %s of %s", i-1, numberOfPages-1)),
                    pdfPage.getPageSize().getWidth() - 298, 10, i, TextAlignment.CENTER, VerticalAlignment.BOTTOM, 0);
            }
        }
        doc.close();
    }
    private void addEmptyLines(Document doc, int n) {
        for (int i = 0; i < n; i++)
            doc.add(new Paragraph(new Text("\n")));
    }
}