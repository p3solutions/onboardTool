package log;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;

import org.apache.commons.lang3.StringUtils;

import common.constant.COMMON_CONSTANTS;

import java.io.*;
import java.nio.file.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

@WebServlet("/ConsoleCaptureFilter")
public class ConsoleCaptureFilter implements Filter {
	private PrintStream printStream;
	private String logDirectory;
	private String logFileName;
	private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	private long LOG_FILE_SIZE = 10 * 1024 * 1024;
	private long LOG_FILE_MAX_DAYS = daysToMillis(10);

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		try {
			Properties prop = new Properties();
			String workingDir = System.getProperty(COMMON_CONSTANTS.CATALINA_BASE) + File.separator
					+ COMMON_CONSTANTS.D3SIXTY_CONF;
			File configFile = new File(workingDir, COMMON_CONSTANTS.CONFIG_PROPS);
			InputStream resourceStream;

			if (configFile.exists()) {
				prop.load(new FileReader(configFile));
			} else {
				// Load from resources folder using class loader
				resourceStream = getClass().getClassLoader().getResourceAsStream(COMMON_CONSTANTS.CONFIG_PROPS);
				if (resourceStream != null) {
					prop.load(new InputStreamReader(resourceStream));
				} else {
					throw new ServletException("Configuration.properties file not found.");
				}
			}
			String logMaxSize = prop.getProperty(COMMON_CONSTANTS.LOG_FILE_SIZE);
			if (logMaxSize != null) {
				LOG_FILE_SIZE = parseFileSize(logMaxSize);
			}
			String logMaxDays = prop.getProperty(COMMON_CONSTANTS.LOG_FILE_MAX_DAYS);
			if (logMaxDays != null) {
				LOG_FILE_MAX_DAYS = daysToMillis(Long.parseLong(logMaxDays));
			}
			String logPath = prop.getProperty(COMMON_CONSTANTS.LOG_PATH);
			if (logPath != null) {

				logDirectory = defineLogDirectory(logPath);
			}
			if (logPath == null) {
				throw new ServletException("LOG_PATH property not found in Configuration.properties");
			}

			createLogDirectory();
			updateLogFile();
			initOutputStream();
		} catch (IOException | NullPointerException e) {
			throw new ServletException("Error initializing ConsoleCaptureFilter", e);
		}
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

	private String defineLogDirectory(String logPath) throws IOException {
		Path directoryPath = Paths.get(logPath);
		if (!Files.exists(directoryPath)) {
			logPath = System.getProperty(COMMON_CONSTANTS.CATALINA_BASE) + File.separator
					+ COMMON_CONSTANTS.D3SIXTY_LOGS;
		}
		return logPath;
	}

	private void createLogDirectory() throws IOException {
		Files.createDirectories(Paths.get(logDirectory));
	}

	private void updateLogFile() {
		Date currentDate = new Date();
		String currentDateString = dateFormat.format(currentDate);
		deleteOldLogFiles();
		logFileName = COMMON_CONSTANTS.D3SIXTYLOG_PREFIX + currentDateString + COMMON_CONSTANTS.LOG_FILE;
		int suffix = 1;
		while (fileExistsAndExceedsSize(logDirectory + File.separator + logFileName)) {
			logFileName = COMMON_CONSTANTS.D3SIXTYLOG_PREFIX + currentDateString + COMMON_CONSTANTS.DIVIDER + suffix
					+ COMMON_CONSTANTS.LOG_FILE;
			suffix++;
		}
	}

	private void initOutputStream() throws FileNotFoundException {
		OutputStream outputStream = new FileOutputStream(logDirectory + File.separator + logFileName, true);
		printStream = new PrintStream(outputStream);
	}

	private void closeOutputStream() {
		if (printStream != null) {
			printStream.close();
		}
	}

	private boolean fileExistsAndExceedsSize(String filePath) {
		File file = new File(filePath);
		return file.exists() && file.length() >= LOG_FILE_SIZE;
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
			try {
				initOutputStream();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
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
		return System.currentTimeMillis() - lastModified > LOG_FILE_MAX_DAYS;
	}

	private void deleteFile(File file) {
		try {
			Files.deleteIfExists(file.toPath());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private long parseFileSize(String fileSizeStr) throws ServletException {
		fileSizeStr = fileSizeStr.toUpperCase();
		if (fileSizeStr.endsWith("MB")) {
			return Long.parseLong(fileSizeStr.substring(0, fileSizeStr.length() - 2)) * 1024 * 1024;
		} else if (fileSizeStr.endsWith("KB")) {
			return Long.parseLong(fileSizeStr.substring(0, fileSizeStr.length() - 2)) * 1024;
		} else {
			throw new ServletException("Invalid file size format in Configuration.properties");
		}
	}

	private long daysToMillis(long days) {
		return days * 24 * 60 * 60 * 1000;
	}
}
