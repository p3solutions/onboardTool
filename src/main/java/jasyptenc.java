import java.util.Scanner;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.jasypt.encryption.pbe.config.EnvironmentStringPBEConfig;
import org.jasypt.salt.FixedSaltGenerator;
import logger.System;
public class jasyptenc {
    public static void main(String args[]) {
      StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor();
      EnvironmentStringPBEConfig config = new EnvironmentStringPBEConfig();
      config.setPassword("Decom3Sixty");                        // we HAVE TO set a password
      config.setAlgorithm("PBEWITHHMACSHA512AndAES_256");
      encryptor.setConfig(config);
      encryptor.setKeyObtentionIterations(1000);
      Scanner input=new Scanner(System.in);
      System.out.println("Enter a Text to Encrypt & Decrypt : ");
      String myText=input.nextLine();
      String encryptedText = encryptor.encrypt(myText);
      System.out.println("Encrypted Text : "+encryptedText);
      String decrypt_text=encryptor.decrypt(encryptedText);
      System.out.println("Decrypted Text : "+decrypt_text);
      
    }
}