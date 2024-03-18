package log;

import javax.servlet.*;
import java.io.*;
import java.nio.file.*;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ConsoleCaptureFilter implements Filter {
	private PrintStream printStream;
	private static final String logDirectory=System.getProperty("catalina.base")+File.separator+"D3Sixty-logs";
	private String logFileName;
	private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	private static final long MAX_FILE_SIZE = 2 * 1024;
	private static final long MAX_AGE = 1 * 24 * 60 * 60 * 1000;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {		
		createLogDirectory();
		updateLogFile();
		initOutputStream();
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		closeOutputStream();
	}

	private void createLogDirectory() {
		try {
			Files.createDirectories(Paths.get(logDirectory));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void updateLogFile() {
		Date currentDate = new Date();
		String currentDateString = dateFormat.format(currentDate);
		deleteOldLogFiles();
		logFileName = "D3Sixty_" + currentDateString + ".log";
		int suffix = 1;
		while (fileExistsAndExceedsSize(logDirectory + File.separator + logFileName)) {
			logFileName = "D3Sixty_" + currentDateString + "_" + suffix + ".log";
			suffix++;
		}
	}

	private void initOutputStream() {
		try {
			OutputStream outputStream = new FileOutputStream(logDirectory + File.separator + logFileName, true);
			printStream = new PrintStream(outputStream);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}

	private void closeOutputStream() {
		if (printStream != null) {
			printStream.close();
		}
	}

	private boolean fileExistsAndExceedsSize(String filePath) {
		File file = new File(filePath);
		return file.exists() && file.length() >= MAX_FILE_SIZE;
	}

	public void appendToLogFile(String text) {
		rotateLogFile();
		if (printStream != null) {
			printStream.println(text);
		}
	}

	private void rotateLogFile() {
		if (isRotationNeeded()) {
			closeOutputStream();
			updateLogFile();
			initOutputStream();
		}
	}

	private boolean isRotationNeeded() {
		return isDateChanged() || fileExistsAndExceedsSize(logDirectory + File.separator + logFileName);
	}

	private boolean isDateChanged() {
		Date currentDate = new Date();
		String currentDateString = dateFormat.format(currentDate);
		return !logFileName.contains(currentDateString);
	}

	private void deleteOldLogFiles() {
		File logsFolder = new File(logDirectory);
		File[] files = logsFolder.listFiles();
		if (files != null) {
			for (File file : files) {
				if (isOldFile(file)) {
					deleteFile(file);
				}
			}
		}
	}

	private boolean isOldFile(File file) {
		long lastModified = file.lastModified();
		return System.currentTimeMillis() - lastModified > MAX_AGE;
	}

	private void deleteFile(File file) {
		try {
			Files.deleteIfExists(file.toPath());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}