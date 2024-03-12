package logger;

import File_Utility.FileUtils;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.PrintStream;

public class System {
    static FileOutputStream fout;

    static {
        String fileName = "D:\\Clement Fixes\\onboardTool\\d360-server.log";
        try {
            fout = new FileOutputStream(fileName, true);
        } catch (FileNotFoundException e) {
            System.out.println("Creating new file");
            FileUtils.createFile(fileName);
            try {
                fout = new FileOutputStream(fileName, true);
            } catch (FileNotFoundException ex) {
                throw new RuntimeException(ex);
            }
        }
    }

    public static PrintStream out = new PrintStream(fout);
    public static PrintStream err = new PrintStream(fout);

    public System() throws FileNotFoundException {
    }
    public static void gc(){
        java.lang.System.gc();
    }
    public static String getProperty(String property){
        return java.lang.System.getProperty(property);
    }

    public static InputStream in = java.lang.System.in;
}
