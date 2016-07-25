package com.mail.logic;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Component;

@Component("sendMail")
public class SendMail {
	
	
	
	public void send(String subject,String content,String toEmail){
		this.sendHtmlMail("royaldeer", subject, content,toEmail);
	}
	
	/**
	 * 发送HTML
	 * @param website
	 * @param subject
	 * @param content
	 * @throws Exception 
	 * @throws AddressException 
	 */
	public void sendHtmlMail(String website,String subject,String content,String toEmail) {
		
		try {
			Properties javaMailProperties = new Properties();
			javaMailProperties.setProperty("mail.transport.protocol", "smtp");
			javaMailProperties.setProperty("mail.smtp.host", Mail.valueOf(website).getHost());
			javaMailProperties.setProperty("mail.smtp.auth", "true");
			javaMailProperties.setProperty("mail.smtp.starttls.enable",  "true");
			javaMailProperties.setProperty("mail.debug",  "false");
			
			Authenticator authenticator = new Authenticator() {
				@Override
				public PasswordAuthentication getPasswordAuthentication(){
					return new PasswordAuthentication(Mail.valueOf(website).getUserName(), Mail.valueOf(website).getPassword());
				}
			};
			Session session = Session.getInstance(javaMailProperties, authenticator);
			
			
			MimeMessage message = new MimeMessage(session);//由邮件会话新建一个消息对象  
			message.setFrom(new InternetAddress(Mail.valueOf(website).getUserName()));//设置发件人的地址  
			//设置收件人,并设置其接收类型为TO  
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
			message.setRecipient(Message.RecipientType.CC, new InternetAddress(Mail.valueOf(website).getTo()));
			message.setSubject(subject);//设置标题  
			
			//设置信件内容  
			//message.setText(mailContent); //发送 纯文本 邮件 todo  
			message.setContent(content, "text/html;charset=utf-8"); //发送HTML邮件，内容样式比较丰富 
			
			message.setSentDate(new Date());//设置发信时间  
			message.saveChanges();//存储邮件信息  
			
			//发送邮件  
			Transport transport = session.getTransport();  
			transport.connect(Mail.valueOf(website).getUserName(), Mail.valueOf(website).getPassword());  
			transport.sendMessage(message, message.getAllRecipients());//发送邮件,其中第二个参数是所有已设好的收件人地址  
			transport.close();  
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		
	}

	
	public static void main(String[] args) throws AddressException, Exception{
		SendMail sendMail = new SendMail();
		StringBuffer demo = new StringBuffer();  
        demo.append("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">")  
        .append("<html>")  
        .append("<head>")  
        .append("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">")  
        .append("<title>测试邮件</title>")  
        .append("<style type=\"text/css\">")  
        .append(".test{font-family:\"Microsoft Yahei\";font-size: 18px;color: red;}")  
        .append("</style>")  
        .append("</head>")  
        .append("<body>")  
        .append("<span class=\"test\">大家好，这里是测试Demo</span>")  
        .append("</body>")  
        .append("</html>");  
		sendMail.sendHtmlMail("royaldeer","royaldeer", demo.toString(),"");
	}
}
