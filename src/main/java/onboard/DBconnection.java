package onboard;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.jasypt.encryption.pbe.config.EnvironmentStringPBEConfig;

import common.constant.COMMON_CONSTANTS;

public class DBconnection {
	private Connection connection;

	public DBconnection() throws ClassNotFoundException, SQLException {

		StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor();
		EnvironmentStringPBEConfig config = new EnvironmentStringPBEConfig();
		config.setPassword("Decom3Sixty"); // we HAVE TO set a password
		config.setAlgorithm("PBEWITHHMACSHA512AndAES_256");
		encryptor.setConfig(config);
		encryptor.setKeyObtentionIterations(1000);
		String decPw = null;
		InputStream resourceStream = null;
		try {
			Properties prop = new Properties();
			String workingDir = System.getProperty(COMMON_CONSTANTS.CATALINA_BASE) + File.separator
					+ COMMON_CONSTANTS.D3SIXTY_CONF;
			File configFile = new File(workingDir, COMMON_CONSTANTS.CONFIG_PROPS);
			if (configFile.exists()) {
				prop.load(new FileReader(configFile));
			} else {
				// Load from resources folder using class loader
				resourceStream = getClass().getClassLoader().getResourceAsStream(COMMON_CONSTANTS.CONFIG_PROPS);
				if (resourceStream != null) {
					prop.load(new InputStreamReader(resourceStream));
				} else {
					throw new IOException("Configuration.properties file not found.");
				}
			}

			Class.forName(prop.getProperty(COMMON_CONSTANTS.DB_DRIVER));

			String dbcPw = prop.getProperty(COMMON_CONSTANTS.DB_PWD);

			if (dbcPw.startsWith(COMMON_CONSTANTS.ENC_PREFIX)) {
				String separator = COMMON_CONSTANTS.CLOSER;
				String s = dbcPw.substring(4);
				int sepPos = s.lastIndexOf(separator);
				String lc = s.substring(0, sepPos);
				decPw = encryptor.decrypt(lc);
			}
			if (!dbcPw.startsWith(COMMON_CONSTANTS.ENC_PREFIX)) {
				decPw = dbcPw;

			}
			this.connection = DriverManager.getConnection(
					prop.getProperty(COMMON_CONSTANTS.JDBCURL) + prop.getProperty(COMMON_CONSTANTS.DB_NAME),
					prop.getProperty(COMMON_CONSTANTS.DB_UNAME), decPw);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (resourceStream != null) {
					resourceStream.close();
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	public DBconnection(boolean create_db_Flag) throws ClassNotFoundException, SQLException {
		StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor();
		EnvironmentStringPBEConfig config = new EnvironmentStringPBEConfig();
		config.setPassword("Decom3Sixty"); // we HAVE TO set a password
		config.setAlgorithm("PBEWITHHMACSHA512AndAES_256");
		encryptor.setConfig(config);
		encryptor.setKeyObtentionIterations(1000);
		String decPw = null;
		InputStream resourceStream = null;
		try {
			Properties prop = new Properties();
			String workingDir = System.getProperty(COMMON_CONSTANTS.CATALINA_BASE) + File.separator
					+ COMMON_CONSTANTS.D3SIXTY_CONF;
			File configFile = new File(workingDir, COMMON_CONSTANTS.CONFIG_PROPS);
			if (configFile.exists()) {
				prop.load(new FileReader(configFile));
			} else {
				// Load from resources folder using class loader
				resourceStream = getClass().getClassLoader().getResourceAsStream(COMMON_CONSTANTS.CONFIG_PROPS);
				if (resourceStream != null) {
					prop.load(new InputStreamReader(resourceStream));
				} else {
					throw new IOException("Configuration.properties file not found.");
				}
			}
			Class.forName(prop.getProperty(COMMON_CONSTANTS.DB_DRIVER));

			String dbcPw = prop.getProperty(COMMON_CONSTANTS.DB_PWD);

			if (dbcPw.startsWith(COMMON_CONSTANTS.ENC_PREFIX)) {
				String separator = COMMON_CONSTANTS.CLOSER;
				String s = dbcPw.substring(4);
				int sepPos = s.lastIndexOf(separator);
				String lc = s.substring(0, sepPos);
				decPw = encryptor.decrypt(lc);
			}
			if (!dbcPw.startsWith(COMMON_CONSTANTS.ENC_PREFIX)) {
				decPw = dbcPw;

			}
			this.connection = DriverManager.getConnection(prop.getProperty(COMMON_CONSTANTS.JDBCURL),
					prop.getProperty(COMMON_CONSTANTS.DB_UNAME), decPw);

		}

		catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (resourceStream != null) {
					resourceStream.close();
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	public Connection getConnection() {
		return this.connection;
	}

	protected void finalize() throws Throwable {
		System.out.println("Db connection closed.");
		this.connection.close();
	}
}