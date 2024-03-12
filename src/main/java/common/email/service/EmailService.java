package common.email.service;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.text.MessageFormat;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.jasypt.encryption.pbe.config.EnvironmentStringPBEConfig;

import common.bean.Mailbean;
import common.constant.EMAIL_SERVICE_CONSTANT;

public class EmailService {
	static String mailPwd=null;
	static Properties properties = new Properties();

	public Properties loadProperties() throws IOException {
		InputStream fileInput = null;
		try {
			String workingDir = System.getProperty("catalina.base") + File.separator
					+ EMAIL_SERVICE_CONSTANT.D3SIXTY_CONF;
			File configFile = new File(workingDir, "mail.properties");
			if (configFile.exists()) {
				properties.load(new FileReader(configFile));
			} else {
				fileInput = EmailApprovalService.class.getResourceAsStream(EMAIL_SERVICE_CONSTANT.MAIL_PROPS);
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

	public boolean sendApprovalEmail(String username, String uEmail, String approval_Link, String mail_content, String subject,Object[] replaceValues) throws MessagingException, IOException {
		loadProperties();
		Mailbean mbn = new Mailbean();
		StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor();
		EnvironmentStringPBEConfig config = new EnvironmentStringPBEConfig();
		config.setPassword("Decom3Sixty");                        // we HAVE TO set a password
		config.setAlgorithm("PBEWITHHMACSHA512AndAES_256");
		encryptor.setConfig(config);
		encryptor.setKeyObtentionIterations(1000);
		mailPwd=properties.getProperty("EMAIL.PASSWORD");	
		if(mailPwd.startsWith("ENC("))
		{
			String separator =")";
			String s=mailPwd.substring(4);
			int sepPos = s.lastIndexOf(separator);
			String lc=s.substring(0,sepPos);
			mailPwd=encryptor.decrypt(lc);
		}
		
		Session session = Session.getInstance(properties, new javax.mail.Authenticator() {


			protected PasswordAuthentication getPasswordAuthentication() {

				return new PasswordAuthentication(properties.getProperty("EMAIL.TOOL"), mailPwd);

			}

		});

		session.setDebug(true);

		MimeMessage message = new MimeMessage(session);

		message.setFrom(new InternetAddress(properties.getProperty("EMAIL.TOOL")));

		message.addRecipient(Message.RecipientType.TO, new InternetAddress(uEmail, uEmail));

		message.setSubject(subject);

		message.setContent(MessageFormat.format(mail_content, replaceValues),"text/html");

		return sendemail(message, mbn);
	}

	public static boolean sendemail(MimeMessage message,Mailbean mbn) {
		try {

			properties.setProperty("mail.smtp.host", properties.getProperty("EMAIL.SERVER"));
			properties.setProperty("mail.smtp.port", properties.getProperty("EMAIL.PORT"));
			properties.put("mail.debug", properties.getProperty("SMTP_DEBUG"));
			properties.put("mail.smtp.starttls.enable", properties.getProperty("SMTP_STARTTLS"));
			properties.put("mail.smtp.auth",properties.getProperty("SMTP_AUTH"));
			Transport.send(message);
			System.out.println("sending...");
			System.out.println("Sent message successfully....");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			Mailbean.setSmtpException(e);
			return false;
		}
	}

	private static Mailbean getMailProps() {
		Mailbean mbn = new Mailbean();
		mbn.setSmtpPwd(properties.getProperty("EMAIL.PASSWORD"));
		mbn.setSmtpFrom(properties.getProperty("EMAIL.TOOL"));
		mbn.setSmtpPort(properties.getProperty("EMAIL.PORT"));
		mbn.setSmtpServer(properties.getProperty("EMAIL.SERVER"));
		mbn.setSMTP_AUTH(properties.getProperty("SMTP_AUTH"));
		mbn.setSMTP_DEBUG(properties.getProperty("SMTP_DEBUG"));
		mbn.setSMTP_STARTTLS(properties.getProperty("SMTP_STARTTLS"));

		return mbn;
	}

}
