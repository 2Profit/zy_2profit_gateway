package com.zy.profit.gateway.util;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * 发送邮件
 * @author Administrator
 *
 */
public class MailUtils {

	private static Session session;

	private static StringBuilder sb = new StringBuilder();
	
	private static final String SUBJECT = "至盈网--邮箱身份验证";
	
	private static final DateFormat DATE_FORMAT = new SimpleDateFormat("yyyy年MM月dd日");
	
	static {
		Properties props = new Properties();
		// 设置发送邮件的邮件服务器的属性（这里使用网易的smtp服务器）
		props.put("mail.smtp.host", SystemConfig.getMailSmtp());
		// 需要经过授权，也就是有户名和密码的校验，这样才能通过验证（一定要有这一条）
		props.put("mail.smtp.auth", "true");
		
		// 用刚刚设置好的props对象构建一个session
		session = Session.getDefaultInstance(props);
		// 有了这句便可以在发送邮件的过程中在console处显示过程信息，供调试使
		// 用（你可以在控制台（console)上看到发送邮件的过程）
//		session.setDebug(true);
		
		//读取邮件模板文件
		LineNumberReader lineNumberReader = null;
		try {
			String path = SystemConfig.getWebRoot() + SystemConfig.getMailContentUrl();
			lineNumberReader = new LineNumberReader(new BufferedReader(new InputStreamReader(new FileInputStream(path), "utf-8")));
			String lineString; 
            while ((lineString = lineNumberReader.readLine()) != null) {
            	sb.append(lineString);
            }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(lineNumberReader != null){
				try {
					lineNumberReader.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	/**
	 * 发送邮件
	 * @param to
	 * @param code
	 */
	public static boolean send(String to, String code){
		String content = sb.toString();
		content = content.replace("${code}", code);
		content = content.replace("${vaildTime}", SystemConfig.getMailVaildTime());
		Date currentDate = new Date();
		content = content.replace("${date}", DATE_FORMAT.format(currentDate));
		
		return send(to, content, SUBJECT);
	}
	
	public static boolean send(String to, String content, String subject){
		MimeMessage message = new MimeMessage(session);
		Transport transport = null;
		try {
			// 加载发件人地址
			message.setFrom(new InternetAddress(SystemConfig.getMailUser()));
			// 加载收件人地址
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			// 加载标题
			message.setSubject(subject);
			
			message.setSentDate(new Date());
			
			message.setContent(content, "text/html;charset=utf-8");
			
			// 向multipart对象中添加邮件的各个部分内容，包括文本内容和附件
//			Multipart multipart = new MimeMultipart();
//
//			// 设置邮件的文本内容
//			BodyPart contentPart = new MimeBodyPart();
//			contentPart.setText(content);
//			multipart.addBodyPart(contentPart);

			// 添加附件
			// BodyPart messageBodyPart = new MimeBodyPart();
			// DataSource source = new FileDataSource(affix);
			// 添加附件的内容
			// messageBodyPart.setDataHandler(new DataHandler(source));
			// 添加附件的标题
			// 这里很重要，通过下面的Base64编码的转换可以保证你的中文附件标题名在发送时不会变成乱码
			// sun.misc.BASE64Encoder enc = new sun.misc.BASE64Encoder();
			// messageBodyPart.setFileName("=?GBK?B?"+
			// enc.encode(affixName.getBytes()) + "?=");
			// multipart.addBodyPart(messageBodyPart);

			// 将multipart对象放到message中
//			message.setContent(multipart);
			// 保存邮件
//			message.saveChanges();
			
			// 发送邮件
			transport = session.getTransport("smtp");
			// 连接服务器的邮箱
			transport.connect(SystemConfig.getMailSmtp(), SystemConfig.getMailUser(), SystemConfig.getMailPwd());
			// 把邮件发送出去
			transport.sendMessage(message, message.getAllRecipients());
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			if(transport != null){
				try {
					transport.close();
				} catch (MessagingException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
}
