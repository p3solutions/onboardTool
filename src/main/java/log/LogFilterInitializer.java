package log;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

@WebFilter("/*")
public class LogFilterInitializer implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialize the ConsoleCaptureFilter
        ConsoleRedirector.getFilterInstance().init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        // Continue the filter chain
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Destroy the ConsoleCaptureFilter
        ConsoleRedirector.getFilterInstance().destroy();
    }
}
