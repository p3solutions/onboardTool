package onboard;
import java.sql.* ;  // for standard JDBC programs
import java.math.* ;
public class Application_dashboard_pie_chart
{
    public String Applicationpercentage(String[] app,String selprj) throws ClassNotFoundException, SQLException
    {
        String resperc="";
        DBconnection d = new DBconnection();
        Connection con = (Connection) d.getConnection();
        Statement st_distinct = con.createStatement();
        try
        {
            String detail="";
            for(int perci=0;perci<app.length;perci++)
            {

                String q3 = "select seq_num from ArchiveExecution_Details where projects='"+selprj+"' and name='" + app[perci] + "'";
                Statement stt = con.createStatement();
                ResultSet rst = stt.executeQuery(q3);
                if (rst.next())
                {
                    detail = rst.getString(1);
                }

                System.out.println("details "+detail);
                String q1 = "select * from ArchiveExecution_Details where projects='"+selprj+"' and seq_num>" + detail + " and seq_num<"+(detail + 70)+" and level=3";
                Statement stp = con.createStatement();
                ResultSet rsp = stp.executeQuery(q1);
                int l = -1;
                while (rsp.next()) {
                    l++;
                    if (rsp.getString(15).equals("100") || Integer.parseInt(rsp.getString(15)) >= 100)
                    {
                        continue;
                    }
                    else {
                        resperc+=rsp.getString(15)+"%,"+rsp.getString(3)+"_";
                        System.out.println("resperc---------------"+rsp.getString(15));
                        break;
                    }
                }
            }
        }
        catch(Exception e)
        {
            System.out.println();
        }

        return resperc;
    }
    public String currentmain_task(String[] app,String selprj) throws ClassNotFoundException, SQLException
    {
        DBconnection d = new DBconnection();
        Connection con = (Connection) d.getConnection();
        Statement st_distinct = con.createStatement();
        System.out.println("applications length-------------"+app.length);
        int al=app.length;
        int indexref=al*62;
        int index=22;
        String res="";
        while(index<22+indexref)
        {
            //System.out.println("index--------"+index);;
            String query1="select * from archiveexecution_details where level=3 and projects='"+selprj+"' and seq_num>"+index+" and seq_num<"+(index+62)+" and pln_srt_date!='' and pln_end_date!='' and act_srt_date!='' and act_end_date=''";
            Statement st1 = con.createStatement();
            ResultSet rs1 = st1.executeQuery(query1);
            while(rs1.next())
            {
                res+="<li>"+rs1.getString("name")+"</li>";
                //System.out.println("NAME "+rs1.getString("name")+" PROGRESSBAR "+rs1.getString("progressbar"));
            }
            res+="_";
            index+=62;
        }
        return res;
    }
    public String current_subtask(String[] app,String selprj,String[] main_task) throws ClassNotFoundException, SQLException
    {
        String subtask="";
        DBconnection d = new DBconnection();
        Connection con = (Connection) d.getConnection();
        Statement st_distinct = con.createStatement();
        int al=app.length;
        int indexref=al*62;
        int index=22;
        String res="";
        while(index<22+indexref)
        {
            //System.out.println("index--------"+index);
            String query1="Select * from archiveexecution_details where level=4 and projects='"+selprj+"' and seq_num>"+index+" and seq_num<"+ (index+62) +" and progressbar!=0 and progressbar<100;";
            Statement st1 = con.createStatement();
            ResultSet rs1 = st1.executeQuery(query1);
            while(rs1.next())
            {
                res+="<li>"+rs1.getString("name")+"</li>";
                //System.out.println("NAME "+rs1.getString("name")+" PROGRESSBAR "+rs1.getString("progressbar"));
            }
            res+="_";
            index+=62;
        }
        return res;
    }
    public String popupcontent(String selectedapp,String sub_app_perc0,String sub_app_perc1,String currentproject,String project_stat,String progbar1,String startdate,String enddate)
    {
        String popup_content="<table><thead><tr><th>Name</th><th>Value</th></tr></thead><tbody><tr><td><b>Application Name:</b></td><td>"+selectedapp+"</td></tr><tr><td><b>Application Percentage:</b></td><td>"+sub_app_perc0+"</td></tr><tr><td><b>Application State:</b></td><td>"+sub_app_perc1+"</td></tr><tr><td><b>Project Name:</b></td><td>"+currentproject+"</td></tr><tr><td><b>Project State:</b></td><td>"+project_stat+"</td></tr><tr><td><b>Project Percentage:</b></td><td>"+progbar1+"%</td></tr><tr><td><b>Start Date:</b></td><td>"+startdate+"</td></tr><tr><td><b>End Date:</b></td><td>"+enddate+"</td></tr></tbody></table>";
        return popup_content;
    }
    public String applications(String Projets,String selprj,String uname) throws SQLException, ClassNotFoundException
    {
        DBconnection d = new DBconnection();
        Connection conn = (Connection) d.getConnection();
        Statement st_distinct = conn.createStatement();
        String apps="";
        String query8;
        //Set of applications while in admin login 'if' part execute
        if(Projets.equals("all"))
        {
            query8="select appname from AppEmphazize_ApplicationInfo where prjname='"+selprj+"';";
            Statement st8 = conn.createStatement();
            ResultSet rs8 = st8.executeQuery(query8);
            while(rs8.next())
            {
                apps+=rs8.getString(1)+",";
            }
        }
        //set of applications under the selected project for user login
        else
        {
            query8="select application from admin_userdetails where uname='"+uname+"';";
            Statement st8 = conn.createStatement();
            ResultSet rs8 = st8.executeQuery(query8);
            String app3="";
            while(rs8.next())
            {

                app3=rs8.getString("application")+",";
            }
            String[] sapp=app3.substring(0,app3.length()-1).split(",");
            for(int var=0;var<sapp.length;var++)
            {
                String[] word1=sapp[var].split("-");
                if(word1[0].equals(selprj))
                {
                    apps+=word1[1]+",";
                }
            }
        }

        return apps;
    }
    public String progressbar_and_state(String selprj) throws SQLException, ClassNotFoundException
    {
        DBconnection d = new DBconnection();
        Connection conn = (Connection) d.getConnection();
        Statement st_distinct = conn.createStatement();
        String query12="select * from archiveexecution_details where level=1 and projects='"+selprj+"'";
        Statement st12 = conn.createStatement();
        ResultSet rs12= st12.executeQuery(query12);
        String stats="";
        String stats1="";
        int progbar=0;
        String cstartdate="";
        String cenddate="";
        String pstartdate="";
        String penddate="";
        String strtdate="";
        String endate="";
        while(rs12.next())
        {
            int progressbar=Integer.parseInt(rs12.getString("progressbar"));
            if(progressbar<100)
            {
                progbar=progressbar;
                stats1=rs12.getString("name");
                if(!stats1.equals("Ideation and Initiate"))
                {
                    pstartdate=strtdate;
                    penddate=endate;
                }
                cstartdate=rs12.getString("act_srt_date");
                cenddate=rs12.getString("act_end_date");
                System.out.println("pstart date------------penddate----------"+pstartdate+penddate);
                System.out.println("cstartdate---------"+cstartdate+"cenddate--------------"+cenddate);
                break;
            }
            stats=rs12.getString("name");
            strtdate=rs12.getString("act_srt_date");
            endate=rs12.getString("act_end_date");
            System.out.println("actsrtdate-------------enddate------------"+strtdate+endate);
        }
        if(cenddate.equals(""))
        {
            cenddate="Not Available";
        }
        String result=progbar+","+stats1+","+cstartdate+","+cenddate;
        System.out.println("result--------"+result);
        return result;
    }
    public String completedmain_task(String[] app,String selprj) throws ClassNotFoundException, SQLException
    {
        DBconnection d = new DBconnection();
        Connection con = (Connection) d.getConnection();
        Statement st_distinct = con.createStatement();
        System.out.println("applications length-------------"+app.length);
        int al=app.length;
        int indexref=al*62;
        int index=22;
        String res="";
        while(index<22+indexref)
        {
            //System.out.println("index--------"+index);;
            String query1="select * from archiveexecution_details where level=3 and projects='"+selprj+"' and seq_num>"+index+" and seq_num<"+(index+62)+" and pln_srt_date!='' and pln_end_date!='' and act_srt_date!='' and act_end_date!=''";
            Statement st1 = con.createStatement();
            ResultSet rs1 = st1.executeQuery(query1);
            while(rs1.next())
            {
                res+="<li>"+rs1.getString("name")+"</li>";
                //System.out.println("NAME "+rs1.getString("name")+" PROGRESSBAR "+rs1.getString("progressbar"));
            }
            res+="_";
            index+=62;
        }
        return res;
    }
    public String percentage_conversion(String applications,String selprj) throws ClassNotFoundException, SQLException
    {
        System.out.println("applications---->"+applications);
        String ans1="";
        String[] applications1=applications.substring(0,applications.length()-1).split(",");
        String application_percent="";
        DBconnection d = new DBconnection();
        Connection con = (Connection) d.getConnection();
        Statement st_distinct = con.createStatement();
        int[] perc=new int[applications1.length];
        float[] array=new float[applications1.length];
        float sum=0;
        float sum1;

        for(int i=0;i<applications1.length;i++)
        {
            int percent=0;
            String query1="select progressbar from archiveexecution_details where projects='"+selprj+"'and name='"+applications1[i]+"'";
            Statement st1 = con.createStatement();
            ResultSet rs1 = st1.executeQuery(query1);
            if(rs1.next())
            {
                perc[i]=Integer.parseInt(rs1.getString("progressbar"));
                System.out.println("perc---------->"+perc[i]);
                sum+=perc[i];
            }
        }
    /*for(int j=0;j<perc.length;j++)
    {
       perc[j]=Integer.parseInt(stringarr[j]);
    }
    */
        //System.out.println("sample");
        System.out.println("sum------ "+sum);
        sum1=sum/100;
        System.out.println("sum1------- "+sum1);
        for(int l=0;l<perc.length;l++)
        {
            array[l]=perc[l]/sum1;
            System.out.println("array[l] "+array[l]);
        }
        for(int ans=0;ans<perc.length;ans++)
        {
            ans1+=array[ans]+",";
        }
        System.out.println("ans1 "+ans1);
        return ans1;
    }
}