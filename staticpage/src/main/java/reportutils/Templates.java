package reportutils;


import net.sf.dynamicreports.report.builder.HyperLinkBuilder;
import net.sf.dynamicreports.report.builder.ReportTemplateBuilder;
import net.sf.dynamicreports.report.builder.component.ComponentBuilder;
import net.sf.dynamicreports.report.builder.style.FontBuilder;
import net.sf.dynamicreports.report.builder.style.StyleBuilder;
import net.sf.dynamicreports.report.builder.tableofcontents.TableOfContentsCustomizerBuilder;
import net.sf.dynamicreports.report.constant.HorizontalImageAlignment;
import net.sf.dynamicreports.report.constant.HorizontalTextAlignment;
import net.sf.dynamicreports.report.constant.VerticalTextAlignment;

import java.awt.*;
import java.util.Date;
import java.util.Locale;

import static net.sf.dynamicreports.report.builder.DynamicReports.*;

//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;


public class Templates {
    //private static Logger logger = LoggerFactory.getLogger(Templates.class);
    public static final StyleBuilder rootStyle;
    public static final StyleBuilder boldStyle;
    public static final StyleBuilder italicStyle;
    public static final StyleBuilder boldCenteredStyle;
    public static final StyleBuilder bold12CenteredStyle;
    public static final StyleBuilder bold18CenteredStyle;
    public static final StyleBuilder bold22CenteredStyle;
    public static final StyleBuilder boldLeftStyle;
    public static final StyleBuilder columnStyle;
    public static final StyleBuilder columnTitleStyle;
    public static final StyleBuilder groupStyle;
    public static final StyleBuilder subtotalStyle;

    public static final ReportTemplateBuilder reportTemplate;
    public static final ComponentBuilder<?, ?> dynamicReportsComponent;
    public static ComponentBuilder<?, ?> footerComponent;
    public static FontBuilder fontBuilder = null;


    static {
        rootStyle = stl.style().setPadding(2);
        boldStyle = stl.style(rootStyle).bold();
        italicStyle = stl.style(rootStyle).italic();
        boldCenteredStyle = stl.style(boldStyle)
                .setTextAlignment(HorizontalTextAlignment.CENTER, VerticalTextAlignment.MIDDLE);
        bold12CenteredStyle = stl.style(boldCenteredStyle)
                .setFontSize(12);
        bold18CenteredStyle = stl.style(boldCenteredStyle)
                .setFontSize(18);
        bold22CenteredStyle = stl.style(boldCenteredStyle)
                .setFontSize(22);
        boldLeftStyle = stl.style(boldStyle)
                .setTextAlignment(HorizontalTextAlignment.LEFT, VerticalTextAlignment.MIDDLE);
        columnStyle = stl.style(rootStyle).setVerticalTextAlignment(VerticalTextAlignment.MIDDLE);
        columnTitleStyle = stl.style(columnStyle)
                .setBorder(stl.pen1Point())
                .setHorizontalTextAlignment(HorizontalTextAlignment.CENTER)
                .setBackgroundColor(Color.decode("#596e83")).setForegroundColor(Color.WHITE)
                .setBold(true);
        groupStyle = stl.style(boldStyle)
                .setHorizontalTextAlignment(HorizontalTextAlignment.LEFT);
        subtotalStyle = stl.style(boldStyle)
                .setTopBorder(stl.pen1Point());

        StyleBuilder crosstabGroupStyle = stl.style(columnTitleStyle);
        StyleBuilder crosstabGroupTotalStyle = stl.style(columnTitleStyle)
                .setBackgroundColor(new Color(170, 170, 170));
        StyleBuilder crosstabGrandTotalStyle = stl.style(columnTitleStyle)
                .setBackgroundColor(new Color(140, 140, 140));
        StyleBuilder crosstabCellStyle = stl.style(columnStyle)
                .setBorder(stl.pen1Point());

        TableOfContentsCustomizerBuilder tableOfContentsCustomizer = tableOfContentsCustomizer()
                .setHeadingStyle(0, stl.style(rootStyle).bold());

        reportTemplate = template()
                .setDefaultFont(stl.font().setFontName("SansSerif").setFontSize(8))
                .setLocale(Locale.ENGLISH)
                .setColumnStyle(stl.style(rootStyle).setVerticalTextAlignment(VerticalTextAlignment.MIDDLE).setBorder(stl.penThin()))
                .setColumnTitleStyle(columnTitleStyle.setPadding(10))
                .setGroupStyle(groupStyle)
                .setGroupTitleStyle(groupStyle)
                .setSubtotalStyle(subtotalStyle)
                .highlightDetailEvenRows()
                .crosstabHighlightEvenRows()
                .setCrosstabGroupStyle(crosstabGroupStyle)
                .setCrosstabGroupTotalStyle(crosstabGroupTotalStyle)
                .setCrosstabGrandTotalStyle(crosstabGrandTotalStyle)
                .setCrosstabCellStyle(crosstabCellStyle)
                .setTableOfContentsCustomizer(tableOfContentsCustomizer);


        HyperLinkBuilder link = hyperLink("https://www.platform3solutions.com/");
        dynamicReportsComponent =
                cmp.horizontalList(
                        cmp.verticalList(
                                cmp.text("Platform 3 Solutions").setHorizontalTextAlignment(HorizontalTextAlignment.LEFT),
                                cmp.text("https://www.platform3solutions.com/").setHyperLink(link))).setFixedWidth(300);

        footerComponent = cmp.horizontalList(
                cmp.text(new Date()).setHorizontalTextAlignment(HorizontalTextAlignment.LEFT).setStyle(
                        stl.style(boldLeftStyle).setTopBorder(stl.pen1Point())),
                cmp.pageXofY().setHorizontalTextAlignment(HorizontalTextAlignment.RIGHT)
                        .setStyle(stl.style(boldCenteredStyle).setTopBorder(stl.pen1Point())));
        footerComponent = cmp.pageXofY()
                .setStyle(
                        stl.style(boldCenteredStyle)
                                .setTopBorder(stl.pen1Point()));

    }

    public static ComponentBuilder<?, ?> createFooterComponent(String rptGenDate)
            throws IllegalAccessException, InstantiationException {
        System.out.println("Date : " + rptGenDate);
        ComponentBuilder<?, ?> lcFooterComponent = cmp.horizontalList(
                cmp.text(rptGenDate).setHorizontalTextAlignment(HorizontalTextAlignment.LEFT).setStyle(
                        stl.style(boldLeftStyle).setTopBorder(stl.pen1Point())),
                cmp.pageXofY().setHorizontalTextAlignment(HorizontalTextAlignment.RIGHT)
                        .setStyle(stl.style(boldCenteredStyle).setTopBorder(stl.pen1Point())));

        return lcFooterComponent;
    }

    public static ComponentBuilder<?, ?> createTitleComponent(String realpath) throws IllegalAccessException, InstantiationException {

        String strmwLogoImg = "E:\\office project\\onboarding_tool\\src\\main\\webapp\\images\\logo1.png";
        //String strmwLogoImg = "C:\\Program Files (x86)\\Apache Software Foundation\\Tomcat 7.0\\webapps\\Decomm_Manager\\images\\logo1.png";


        return cmp.horizontalList()
                .add(
                        //cmp.image(Templates.class.getResource("/mw_images/logo-sample.png")).setFixedDimension(60,60),
                        cmp.centerVertical(
                                cmp.image("Platform 3 Solutions").setFixedDimension(120, 30)
                        ),
                        cmp.image(strmwLogoImg).setFixedDimension(60, 60).setFixedHeight(100).setFixedWidth(100).setHorizontalImageAlignment(HorizontalImageAlignment.LEFT))
                .newRow()
                .addProperty("net.sf.jasperreports.export.xls.auto.fit.column", "true")
                .addProperty("PRINT_KEEP_FULL_TEXT", "true")
                .add(cmp.line().setStyle(stl.style().setBackgroundColor(Color.decode("#d9d9d9")).setForegroundColor(Color.decode("#d9d9d9"))))
                .newRow();
    }
}
