package common.resource;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Properties;

import common.constant.COMMON_CONSTANTS;
import common.constant.EMAIL_SERVICE_CONSTANT;
import common.email.service.EmailApprovalService;

public class resourceUtils {
	
    private String path =  null;
	public resourceUtils(String path) {
		this.path = path;
	}
	
	
	public Properties loadProperties() throws IOException {
		Properties properties = new Properties();
		InputStream fileInput = null;
		try {
			String workingDir = System.getProperty(COMMON_CONSTANTS.CATALINA_BASE) + File.separator
					+ COMMON_CONSTANTS.D3SIXTY_CONF;
			File configFile = new File(workingDir, COMMON_CONSTANTS.FILE_UPLOAD_PROPS);
			if (configFile.exists()) {
				properties.load(new FileReader(configFile));
			} else {
				fileInput = EmailApprovalService.class.getResourceAsStream(path);
				properties.load(fileInput);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fileInput != null) {
				fileInput.close();
			}
		}

		return properties;
	}
	}