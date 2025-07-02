package com.shop.util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailUtil {
	public static void sendEmail(String toEmail,String subject,String messageText)
	{
		final String fromEmail="kushwahakoshal2002@gmail.com";
		final String password="ybshelgaqfbkmsgu";
		
		Properties prop=new Properties();
		
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", "587");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.starttls.enable", "true");
		
		Authenticator auth=new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(fromEmail,password);
			}
		};
		
		Session session=Session.getInstance(prop,auth);
		try {
			MimeMessage msg=new MimeMessage(session);
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
			msg.setSubject(subject);
			msg.setText(messageText);
			
			Transport.send(msg);
			
			System.out.println("Email sent Succesfully to "+ toEmail);
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			 System.out.println("Email sending failed.");
			
		}
	}
}
