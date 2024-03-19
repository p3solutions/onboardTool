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
import java.util.Arrays;
import java.util.Comparator;

@WebServlet("/ConsoleCaptureFilter")
public class ConsoleCaptureFilter implements Filter {
	private PrintStream printStream;
	private String logDirectory;
	private String logFileName;
	private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	private long LOG_FILE_SIZE = 10 * 1024 * 1024;
	private long LOG_FILE_MAX_DAYS = daysToMillis(10);
	private long LOG_FOLDER_MAX_SIZE = 1 * 1024 * 1024 * 1024; // To be read from configuration.properties
	private boolean logEnabled;

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
				resourceStream = getClass().getClassLoader().getResourceAsStream(COMMON_CONSTANTS.CONFIG_PROPS);
				if (resourceStream != null) {
					prop.load(new InputStreamReader(resourceStream));
				} else {
					throw new ServletException("Configuration.properties file not found.");
				}
			}
			String logEnabledStr = prop.getProperty(COMMON_CONSTANTS.LOG_ENABLED);
			logEnabled = logEnabledStr != null && Boolean.parseBoolean(logEnabledStr);
			if (logEnabled) {
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
				String logFolderMaxSize = prop.getProperty(COMMON_CONSTANTS.LOG_FOLDER_MAX_SIZE);
				if (logFolderMaxSize != null) {
					LOG_FOLDER_MAX_SIZE = parseLogFolderSize(prop.getProperty(COMMON_CONSTANTS.LOG_FOLDER_MAX_SIZE));
				}

				createLogDirectory();
				updateLogFile();
				initOutputStream();
			} else {
				System.out.println("Logging is disabled in configuration.");
			}
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
		if (!logEnabled) {
			return;
		}

		Date currentDate = new Date();
		String currentDateString = dateFormat.format(currentDate);
		deleteOldLogFiles();
		int nextIndex = getNextIndex();
		logFileName = COMMON_CONSTANTS.D3SIXTYLOG_PREFIX + currentDateString + COMMON_CONSTANTS.DIVIDER + nextIndex
				+ COMMON_CONSTANTS.LOG_FILE;
	}

	private int getNextIndex() {
		File logsFolder = new File(logDirectory);
		File[] files = logsFolder.listFiles();
		int highestIndex = 0;
		if (files != null) {
			for (File file : files) {
				String fileName = file.getName();
				if (fileName.startsWith(COMMON_CONSTANTS.D3SIXTYLOG_PREFIX)) {
					String indexStr = fileName.substring(fileName.lastIndexOf('-') + 1, fileName.lastIndexOf('.'));
					int index = Integer.parseInt(indexStr);
					if (index > highestIndex) {
						highestIndex = index;
					}
				}
			}
		}
		return highestIndex + 1;
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
		if (!logEnabled) {
			return false;
		}
		File file = new File(filePath);
		return file.exists() && file.length() >= LOG_FILE_SIZE;
	}

	public void appendToLogFile(String text) {
		if (!logEnabled) {
			return;
		}
		rotateLogFile();
		if (printStream != null) {
			printStream.println(text);
		}
	}

	private void rotateLogFile() {
		if (!logEnabled) {
			return;
		}

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
		if (!logEnabled) {
			return false;
		}
		return isDateChanged() || fileExistsAndExceedsSize(logDirectory + File.separator + logFileName)
				|| isLogFolderSizeExceeded();
	}

	private boolean isDateChanged() {
		if (!logEnabled) {
			return false;
		}
		Date currentDate = new Date();
		String currentDateString = dateFormat.format(currentDate);
		return !logFileName.contains(currentDateString);
	}

	private void deleteOldLogFiles() {
		if (!logEnabled) {
			return;
		}
		File logsFolder = new File(logDirectory);
		File[] files = logsFolder.listFiles();
		if (files != null) {
			// Sort files by last modified time (oldest first)
			Arrays.sort(files, Comparator.comparingLong(File::lastModified));

			long totalSize = 0;
			for (File file : files) {
				if (isOldFile(file) || isLogFolderSizeExceeded()) {
					totalSize += file.length();
					deleteFile(file);
				}
			}
		}
	}

	private boolean isOldFile(File file) {
		if (!logEnabled) {
			return false;
		}
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

	private long parseFileSize(String fileSizeStr) {
		fileSizeStr = fileSizeStr.toUpperCase();
		if (fileSizeStr.endsWith("MB")) {
			return Long.parseLong(fileSizeStr.substring(0, fileSizeStr.length() - 2)) * 1024 * 1024;
		} else if (fileSizeStr.endsWith("KB")) {
			return Long.parseLong(fileSizeStr.substring(0, fileSizeStr.length() - 2)) * 1024;
		} else {
			throw new IllegalArgumentException("Invalid file size format in Configuration.properties");
		}
	}

	private long daysToMillis(long days) {
		return days * 24 * 60 * 60 * 1000;
	}

	private boolean isLogFolderSizeExceeded() {
		if (!logEnabled) {
			return false;
		}
		long totalSize = getLogFolderSize();
		return totalSize > LOG_FOLDER_MAX_SIZE;
	}

	private long getLogFolderSize() {
		if (!logEnabled) {
			return 0;
		}
		long totalSize = 0;
		try {
			Path logFolderPath = Paths.get(logDirectory);
			if (Files.exists(logFolderPath)) {
				totalSize = Files.walk(logFolderPath).filter(Files::isRegularFile)
						.mapToLong(file -> file.toFile().length()).sum();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return totalSize;
	}

	private long parseLogFolderSize(String folderSizeStr) {
		folderSizeStr = folderSizeStr.toUpperCase();
		if (folderSizeStr.endsWith("GB")) {
			return Long.parseLong(folderSizeStr.substring(0, folderSizeStr.length() - 2)) * 1024 * 1024 * 1024;
		} else if (folderSizeStr.endsWith("MB")) {
			return Long.parseLong(folderSizeStr.substring(0, folderSizeStr.length() - 2)) * 1024 * 1024;
		} else if (folderSizeStr.endsWith("KB")) {
			return Long.parseLong(folderSizeStr.substring(0, folderSizeStr.length() - 2)) * 1024;
		} else {
			throw new IllegalArgumentException("Invalid folder size format in Configuration.properties");
		}
	}
}
