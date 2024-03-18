package log;

import java.io.PrintStream;

public class ConsoleRedirector {

    private static final ConsoleCaptureFilter filter = new ConsoleCaptureFilter();

    static {
        // Redirect standard output stream
        System.setOut(new PrintStream(System.out) {
            @Override
            public void println(String x) {
                filter.appendToLogFile(x);
                super.println(x);
            }
        });

        // Redirect standard error stream
        System.setErr(new PrintStream(System.err) {
            @Override
            public void println(String x) {
                filter.appendToLogFile(x);
                super.println(x);
            }
        });
    }

    public static ConsoleCaptureFilter getFilterInstance() {
        return filter;
    }
}
