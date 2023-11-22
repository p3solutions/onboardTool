package finance_module_service;

public class financeTemplateInfo {
	int seq_no;
	String label_name,column_name,options,type,mandatory,value;
	
	public financeTemplateInfo(int seq_no, String label_name, String column_name, String type, String mandatory, String value) {
		
				this.seq_no= seq_no;
				
				this.label_name = label_name;
				this.column_name = column_name;
				this.type = type;
				this.mandatory = mandatory;
				this.type = type;

				this.value = value;		
	}

}
