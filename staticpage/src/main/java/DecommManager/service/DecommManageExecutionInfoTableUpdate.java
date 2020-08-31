package DecommManager.service;

public class DecommManageExecutionInfoTableUpdate {
    public int seq_num;
    public String ProjectName;
    public String ApplicationName;
    public String options;
    public String LabelName;
    public String ColumnName;
    public String Type;
    public String Mandatory;
    public String value;
    //Below variables for Others Table
    public String prj_name;
    public String app_name;
    public String others;
    public String questions;
    public String type;
    public String others_value;
    public Integer level;
    public Integer sub_seq;
    //Below Variables for key mile stone table
    public int key_seq_num;
    public String key_prj_name;
    public String key_app_name;
    public String tab_name;
    public String tab_name_question;
    public String tab_name_value;


    public DecommManageExecutionInfoTableUpdate(int seq_num,String ProjectName,String ApplicationName,String options,String LabelName,String ColumnName,String Type,String Mandatory,String value)
    {
        this.seq_num=seq_num;
        this.ProjectName=ProjectName;
        this.ApplicationName=ApplicationName;
        this.options=options;
        this.LabelName=LabelName;
        this.ColumnName=ColumnName;
        this.Type=Type;
        this.Mandatory=Mandatory;
        this.value=value;
    }

    public DecommManageExecutionInfoTableUpdate(String prj_name, String app_name, String others, String questions, String type, String others_value, int level,int sub_seq){
        this.prj_name=prj_name;
        this.app_name=app_name;
        this.others=others;
        this.questions=questions;
        this.type=type;
        this.others_value=others_value;
        this.level=level;
        this.sub_seq=sub_seq;
    }

    public DecommManageExecutionInfoTableUpdate(int key_seq_num, String key_prj_name, String key_app_name, String tab_name, String tab_name_question, String tab_name_value){
        this.key_seq_num=key_seq_num;
        this.key_prj_name=key_prj_name;
        this.key_app_name=key_app_name;
        this.tab_name=tab_name;
        this.tab_name_question=tab_name_question;
        this.tab_name_value=tab_name_value;
    }
}
