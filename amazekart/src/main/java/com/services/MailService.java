package com.services;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.PasswordAuthentication;

public class MailService {
	
	public void sendMail(String recepient, String otp) throws Exception
	{
		Properties properties = new Properties();
		
		properties.put("mail.smtp.auth","true");
		properties.put("mail.smtp.starttls.enable","true");
		properties.put("mail.smtp.host","smtp.gmail.com");
		properties.put("mail.smtp.port","587");
		properties.put("mail.transport.protocol", "smtp");
		
		String email = "amazekart01@gmail.com";
		String password = "Gourparv@123";
		final String SMTP_USERNAME = "AKIA26525WCJLNWKC5PK";
		final String SMTP_PASSWORD = "BPu8slUABFGTMw1tfPnRr9uh9Z6rkDS3Nl6bXDS0gimp";
		final String HOST = "email-smtp.ap-south-1.amazonaws.com";
		final int PORT = 587;
		
		
		Session session = Session.getInstance(properties, new Authenticator() {
			
			@Override
			protected PasswordAuthentication getPasswordAuthentication()
			{
				return new PasswordAuthentication(email,password);
			}
		
		
		});
		Message message = prepareMessage(session, email, recepient, otp);
		Transport transport = session.getTransport();
		transport.connect(HOST,SMTP_USERNAME,SMTP_PASSWORD);
		transport.sendMessage(message,message.getAllRecipients());	
		//System.out.println("Message sent successfully...");	
	}
	private static Message prepareMessage(Session session, String email, String recepient, String otp) throws Exception
	{
		Message message = new MimeMessage(session);
		try
		{
			message.setFrom(new InternetAddress(email));
			message.setRecipient(Message.RecipientType.TO,new InternetAddress(recepient));
			message.setSubject("OTP to verify your account from Amazekart");
			//message.setText("Hey, \n Your OTP is "); // For Simple Message
			String html = "<h2>Dear User,</h2><h3>Your OTP for Amazekart account is:- </h3>"+ otp +"<br><br><h3>Thanks,<br>Amazekart</h3>"; // For HTML Message
			message.setContent(html,"text/html");
			
			return message;
		}
		catch(Exception e) {
			e.printStackTrace(); 
		}
		return message;
	}
}
