package Finance;

import onboard.DBconnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class FinanceAppTemplateService {

    DBconnection dBconnection;
    Connection con;
    public String Id = null;

    public FinanceAppTemplateService(String Id) throws ClassNotFoundException, SQLException {

        dBconnection = new DBconnection();
        con = (Connection) dBconnection.getConnection();
        this.Id = Id;
    }

    public void financeAppTemplate() throws SQLException {
        PreparedStatement financestamt=null;
        ResultSet rs_finance=null;
        try {
            String financeAppInfo = "select * from finance_Template_Details";
            financestamt = con.prepareStatement(financeAppInfo);
            rs_finance = financestamt.executeQuery();

            if(!rs_finance.next())
            {
                FinanceTemplateInfo finance[] = new FinanceTemplateInfo[15];
                finance[0] = new FinanceTemplateInfo(1,"","Application Name", "financeappname", "Text box","Yes", "");
                finance[1] = new FinanceTemplateInfo(2,"","Project Number", "projnum", "Text box", "No", "");
                finance[2] = new FinanceTemplateInfo(3,"","Phase", "phase", "Text box", "No", "");
                finance[3] = new FinanceTemplateInfo(4,",Yes,No","Software and Licensing", "softlicense", "Dropdown", "Yes", "");
                finance[4] = new FinanceTemplateInfo(5,"","Software and Licensing(cost Saving) ($)", "softlicensecost", "Text box", "Yes", "");
                finance[5] = new FinanceTemplateInfo(6,"","Contract end date", "contractDate", "Datepicker", "Yes", "");
                finance[6] = new FinanceTemplateInfo(7,"","Contract end date -comments", "contractDateComment", "Text box", "Yes", "");
                finance[7] = new FinanceTemplateInfo(8,"","Scope of infrastructure", "scopeinfra", "Text box", "Yes", "");
                finance[8] = new FinanceTemplateInfo(9,"","Infrastructure Cost Savings ($)", "infrastructurecostsavings", "Text box", "Yes", "");
                finance[9] = new FinanceTemplateInfo(10,"","Cost Avoidance ($)", "costavoidance", "Text box", "Yes", "");
                finance[10] = new FinanceTemplateInfo(11,"","Cost of Archive ($)", "costarchive", "Text box", "Yes", "");
                finance[11] = new FinanceTemplateInfo(12,"","Total CBA ($)", "cba", "Text box", "Yes", "");
                finance[12] = new FinanceTemplateInfo(13,",Yes,No","Funding approved?", "fundapprove", "Dropdown", "Yes", "");
                finance[13] = new FinanceTemplateInfo(14,"","Funding Type", "fundtype", "Text box", "Yes", "");
                finance[14] = new FinanceTemplateInfo(15,"","Status", "status", "Text box", "Yes", "");
                 for (int index = 0; index<finance.length; index++)
                {
                    String finance_InsertQuery = "insert into finance_Template_Details (seq_no, options, label_name, column_name, type, mandatory, value)"
                            + "value(?, ?, ?, ?, ?, ?, ?)";

                    PreparedStatement financestmt = con.prepareStatement(finance_InsertQuery);
                    financestmt.setInt(1, finance[index].seq_num);
                    financestmt.setString(2, finance[index].options);
                    financestmt.setString(3, finance[index].label);
                    financestmt.setString(4, finance[index].column);
                    financestmt.setString(5, finance[index].type);
                    financestmt.setString(6, finance[index].mandatory);
                    financestmt.setString(7, finance[index].value);
                    financestmt.execute();
                }
            }

        }
        catch(Exception e) {
            e.printStackTrace();
        }
        finally
        {
            financestamt.close();
            rs_finance.close();
        }

    }
    protected void finalize() throws Throwable {
        con.close();
        System.out.println("DB connection closed");
    }

}
