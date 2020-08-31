package bean;
import java.util.*;

public class ProjectComplexity {
	public String appName;
	public String complexity;
	public String est;
	public int priority;
	public String ptext;

	public ProjectComplexity(String appName, String complexity, String est, int priority, String ptext) {
		super();
		this.appName = appName;
		this.complexity = complexity;
		this.est = est;
		this.priority = priority;
		this.ptext = ptext;
	}

	public String getAppName() {
		return appName;
	}

	public void setAppName(String appName) {
		this.appName = appName;
	}

	public String getComplexity() {
		return complexity;
	}

	public void setComplexity(String complexity) {
		this.complexity = complexity;
	}

	public String getEst() {
		return est;
	}

	public void setEst(String est) {
		this.est = est;
	}

	public int getPriority() {
		return priority;
	}

	public void setPriority(int priority) {
		this.priority = priority;
	}

	public String getPtext() {
		return ptext;
	}

	public void setPtext(String ptext) {
		this.ptext = ptext;
	}
}
