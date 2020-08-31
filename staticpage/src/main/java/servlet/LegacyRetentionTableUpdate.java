package servlet;

public class LegacyRetentionTableUpdate {
    public int seq_num;
    public String ProjectName;
    public String ApplicationName;
    public String options;
    public String LabelName;
    public String ColumnName;
    public String Type;
    public String Mandatory;
    public String value;
    public LegacyRetentionTableUpdate(int seq_num,String ProjectName,String ApplicationName,String options,String LabelName,String ColumnName,String Type,String Mandatory,String value)
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
}
