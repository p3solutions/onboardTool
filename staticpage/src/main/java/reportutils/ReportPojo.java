package reportutils;

public class ReportPojo
{
    public ReportPojo(String name, String value, boolean isHeading,boolean isSubHeading) {
        this.name = name;
        this.value = value;
        this.isHeading = isHeading;
        this.isSubHeading = isSubHeading;
    }

    private String name;
    private String value;
    private boolean isHeading;
    private boolean isSubHeading;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public boolean isHeading() {
        return isHeading;
    }

    public void setHeading(boolean heading) {
        isHeading = heading;
    }

    public boolean isSubHeading() {
        return isSubHeading;
    }

    public void setSubHeading(boolean subHeading) {
        isSubHeading = subHeading;
    }
}
