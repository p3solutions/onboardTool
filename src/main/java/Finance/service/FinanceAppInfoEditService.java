package Finance.service;

import onboard.DBconnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class FinanceAppInfoEditService {
    DBconnection dBconnection;
    Connection con;
    public String Id = null;
    public int seqNum ;
    public String labelName = null;
    public FinanceAppInfoEditService(String Id, int seqNum, String labelName) throws ClassNotFoundException, SQLException {
        dBconnection = new DBconnection();
        con = (Connection) dBconnection.getConnection();
        this.Id = Id;
        this.seqNum = seqNum;
        this.labelName = labelName;
    }

    public boolean Edit()
    {
        boolean StatusFlag = false;
        try
        {
            String UpdateQuery = "update finance_info set label_name = ? where Id=? and seq_no=?";
            PreparedStatement prestmt = con.prepareStatement(UpdateQuery);
            prestmt.setString(1,labelName);
            prestmt.setString(2,Id);
            prestmt.setInt(3,seqNum);
            prestmt.execute();
            prestmt.close();
            StatusFlag =true;
        }
        catch(Exception e)
        {
            StatusFlag = false;
            e.printStackTrace();
        }
        return StatusFlag;
    }

    public boolean checkDuplicateLabelName()
    {
        boolean StatusFlag = true;
        try
        {
            String selectQuery = "select * from finance_info where Id=? and label_name=?";
            PreparedStatement st = con.prepareStatement(selectQuery);
            st.setString(1, Id);
            st.setString(2, labelName);
            ResultSet rs = st.executeQuery();
            if(rs.next())
                StatusFlag =false;
            st.close();
            rs.close();
        }
        catch(Exception e)
        {
            StatusFlag = false;
            e.printStackTrace();
        }
        return StatusFlag;
    }
    public String getPreviousLabelName()
    {
        String previousLabelName ="";
        try
        {
            String selectQuery = "select * from finance_info where Id=? and seq_no=?";
            PreparedStatement st = con.prepareStatement(selectQuery);
            st.setString(1, Id);
            st.setInt(2, seqNum);
            ResultSet rs = st.executeQuery();
            if(rs.next())
                previousLabelName = rs.getString("label_name");
            rs.close();
            st.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return previousLabelName;
    }

    protected void finalize() throws Throwable {
        con.close();
        System.out.println("dbconnection closed");
    }
}
