package onboard;
 
import java.io.BufferedReader;
 
import java.io.File;
import java.io.InputStream;
import java.io.FileInputStream;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
 
 
 
public class DBconnection{
 
private Connection connection;
public  DBconnection() throws ClassNotFoundException, SQLException{
try {
             
              ClassLoader loader = Thread.currentThread().getContextClassLoader();
Properties prop = new Properties();
String workingDir = System.getProperty("user.dir");
//File file = new File("Configuration.properties");
 
//String path= file.getAbsolutePath();
//System.out.println("Path : "+path);
//System.out.println("the new working directory");
//System.out.println(workingDir);
                   //FileReader reader = new FileReader("Configuration.properties");
InputStream resourceStream = (InputStream) loader.getResourceAsStream("Configuration.properties");
 
                   prop.load(resourceStream);
                 //  System.out.println("HIIIIIIIIIIIIII"+prop.getProperty("URL"));
                   Class.forName(prop.getProperty("DRIVER"));
                   this.connection= DriverManager.getConnection(prop.getProperty("URL")+prop.getProperty("DATABASENAME"),prop.getProperty("USERNAME"),prop.getProperty("PASSWORD"));
} catch (Exception e) {
System.out.println(e.getMessage());
}
 
}
public Connection getConnection(){
return this.connection;
}
}