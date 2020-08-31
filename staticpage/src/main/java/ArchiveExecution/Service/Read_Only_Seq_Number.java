package ArchiveExecution.Service;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;

public class Read_Only_Seq_Number {
    public static JsonObject Read_Seq_Number(String selected_project_id)
    {
        String projectname="";
        JsonObject infoJson = new JsonObject();
        //JsonArray jsonArray = new JsonArray();
        ArrayList<Integer> read_only = new ArrayList<Integer>();
        try {
            DBconnection dBconnection = new DBconnection();
            Connection conn = (Connection) dBconnection.getConnection();

            Statement st=conn.createStatement();
            String query7 = "select * from AppEmphazize_ProjectDetails where id = " + selected_project_id;
            Statement st7 = conn.createStatement();
            ResultSet rs7 = st7.executeQuery(query7);
            if(rs7.next())
            {
                projectname=rs7.getString("projectname");
            }

            String query1="select * from archiveexecution_details where projects='"+projectname+"' order by seq_num;";
            Statement st1 = conn.createStatement();
            ResultSet rs1 = st1.executeQuery(query1);
            ArrayList<Integer> seq_number=new ArrayList<Integer>();
            ArrayList<Integer> level_number=new ArrayList<Integer>();

            while (rs1.next())
            {
                seq_number.add(rs1.getInt(1));
                level_number.add(rs1.getInt(2));
            }
            for(int i = 0; i<seq_number.size(); i++)
            {
                if(ToFindParentSeqNum(seq_number,level_number,(i+1)))
                {
                    read_only.add(i);
                }
            }
            for (int i=0;i<read_only.size();i++){
                infoJson.addProperty("projects"+read_only.get(i),(read_only.get(i)));
            }
            //jsonArray.add(infoJson);
        }

        catch(Exception e)
        {
            System.out.println("Exception...."+ e);
            e.printStackTrace();
        }
        return infoJson;
    }

    public static boolean ToFindParentSeqNum(ArrayList<Integer> Seq_number, ArrayList<Integer> level_number, int current_seq_number)
    {
        int current_level=level_number.get(current_seq_number-1);
        int max_seq_number= Collections.max(Seq_number);
        boolean check=false;
        if(current_seq_number<max_seq_number) {
            int nextseqnumber_level = level_number.get(current_seq_number);
            if(nextseqnumber_level>current_level)
            {
                check=true;
            }
        }
        return check;
    }
}
