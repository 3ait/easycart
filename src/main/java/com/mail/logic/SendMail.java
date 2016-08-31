package com.mail.logic;

import java.io.File;
import java.util.Date;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

import org.springframework.stereotype.Component;

@Component("sendMail")
public class SendMail {
	
	
	/**
	 * 发送HTML
	 * @param website
	 * @param subject
	 * @param content
	 * @throws Exception 
	 * @throws AddressException 
	 */
	public boolean send(MailProperty mailProperty, String subject,String content) {
		
		boolean ret = true;
		try {
			Properties javaMailProperties = new Properties();
			javaMailProperties.setProperty("mail.transport.protocol", "smtp");
			javaMailProperties.setProperty("mail.smtp.host", mailProperty.getHost());
			javaMailProperties.setProperty("mail.smtp.auth", "true");
			javaMailProperties.setProperty("mail.smtp.starttls.enable",  "true");
			javaMailProperties.setProperty("mail.debug",  mailProperty.getDebug());
			
			Authenticator authenticator = new Authenticator() {
				@Override
				public PasswordAuthentication getPasswordAuthentication(){
					return new PasswordAuthentication(mailProperty.getEmail(), mailProperty.getPassword());
				}
			};
			Session session = Session.getInstance(javaMailProperties, authenticator);
			
			
			MimeMessage message = new MimeMessage(session);//由邮件会话新建一个消息对象  
			message.setFrom(new InternetAddress(mailProperty.getEmail()));//设置发件人的地址  
			//设置收件人,并设置其接收类型为TO  
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(mailProperty.getTo()));
			if(!"".equals(mailProperty.getCc().trim()) && mailProperty.getCc()!=null){
				message.setRecipient(Message.RecipientType.CC, new InternetAddress(mailProperty.getCc()));
			}
			message.setSubject(subject);//设置标题  
			
			//设置信件内容  
			message.setContent(content, "text/html;charset=utf-8"); //发送HTML邮件，内容样式比较丰富 
			
			message.setSentDate(new Date());//设置发信时间  
			message.saveChanges();//存储邮件信息  
			
			//发送邮件  
			Transport transport = session.getTransport();  
			transport.connect(mailProperty.getEmail(), mailProperty.getPassword());  
			transport.sendMessage(message, message.getAllRecipients());//发送邮件,其中第二个参数是所有已设好的收件人地址  
			transport.close();  
		} catch (Exception e) {
			System.err.println(e.getMessage());
			ret = false;
		}
		return ret;
	}

	
	/**
	 * 发送HTML带附件
	 * @param website
	 * @param subject
	 * @param content
	 * @throws Exception 
	 * @throws AddressException 
	 */
	public boolean send(MailProperty mailProperty, String subject,String content,File attachment) {
		boolean ret = true;
		try {
			Properties javaMailProperties = new Properties();
			javaMailProperties.setProperty("mail.transport.protocol", "smtp");
			javaMailProperties.setProperty("mail.smtp.host", mailProperty.getHost());
			javaMailProperties.setProperty("mail.smtp.auth", "true");
			javaMailProperties.setProperty("mail.smtp.starttls.enable",  "true");
			javaMailProperties.setProperty("mail.debug",  mailProperty.getDebug());
			
			Authenticator authenticator = new Authenticator() {
				@Override
				public PasswordAuthentication getPasswordAuthentication(){
					return new PasswordAuthentication(mailProperty.getEmail(), mailProperty.getPassword());
				}
			};
			Session session = Session.getInstance(javaMailProperties, authenticator);
			
			
			MimeMessage message = new MimeMessage(session);//由邮件会话新建一个消息对象  
			message.setFrom(new InternetAddress(mailProperty.getEmail()));//设置发件人的地址  
			//设置收件人,并设置其接收类型为TO  
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(mailProperty.getTo()));
			if(!"".equals(mailProperty.getCc().trim()) && mailProperty.getCc()!=null){
				message.setRecipient(Message.RecipientType.CC, new InternetAddress(mailProperty.getCc()));
			}
			message.setSubject(subject);//设置标题  
			
			/// 向multipart对象中添加邮件的各个部分内容，包括文本内容和附件
            Multipart multipart = new MimeMultipart();
            
            // 添加邮件正文
            BodyPart contentPart = new MimeBodyPart();
            contentPart.setContent(content, "text/html;charset=UTF-8");
            multipart.addBodyPart(contentPart);
            
            // 添加附件的内容
            if (attachment != null) {
                BodyPart attachmentBodyPart = new MimeBodyPart();
                DataSource source = new FileDataSource(attachment);
                attachmentBodyPart.setDataHandler(new DataHandler(source));
                
                // 网上流传的解决文件名乱码的方法，其实用MimeUtility.encodeWord就可以很方便的搞定
                // 这里很重要，通过下面的Base64编码的转换可以保证你的中文附件标题名在发送时不会变成乱码
                //sun.misc.BASE64Encoder enc = new sun.misc.BASE64Encoder();
                //messageBodyPart.setFileName("=?GBK?B?" + enc.encode(attachment.getName().getBytes()) + "?=");
                //MimeUtility.encodeWord可以避免文件名乱码
                attachmentBodyPart.setFileName(MimeUtility.encodeWord(attachment.getName()));
                multipart.addBodyPart(attachmentBodyPart);
            }
            
            // 将multipart对象放到message中
            message.setContent(multipart);
			
			message.setSentDate(new Date());//设置发信时间  
			message.saveChanges();//存储邮件信息  
			
			//发送邮件  
			Transport transport = session.getTransport();  
			transport.connect(mailProperty.getEmail(), mailProperty.getPassword());  
			transport.sendMessage(message, message.getAllRecipients());//发送邮件,其中第二个参数是所有已设好的收件人地址  
			transport.close();  
		} catch (Exception e) {
			System.err.println(e.getMessage());
			ret = false;
			
		}
		return ret;
	}
	
	public static void main(String[] args) throws AddressException, Exception{
		SendMail sendMail = new SendMail();
		MailProperty mailProperty = new MailProperty();
		mailProperty.setEmail("");
		mailProperty.setPassword("");
		mailProperty.setDebug("true");
		mailProperty.setHost("");
		mailProperty.setTo("yaolyaol@sina.com");
		mailProperty.setCc("");
		sendMail.send(mailProperty, "subject", "content");
		
		
	}
}
