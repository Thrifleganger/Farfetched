/**
 * 
 */
package com.akash.mail;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Date;
import java.util.Properties;
import java.util.regex.Pattern;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.xml.ws.Service;

import org.apache.struts2.ServletActionContext;

import com.akash.util.Cipher;
import com.mysql.jdbc.NotUpdatable;

/**
 * @author Thrifleganger
 *
 */
public class EmailHelper {

	private String FROM_ADDRESS = "notification@farfetchd-official.com";
	private String FROM_NAME = "Farfetch'd Notification";
	private String TO_ADDRESS = null;
	private String CC_ADDRESS = "thegoodfolk@farfetchd-official.com";
	
	private Properties props = new Properties();
	private Session session = null;
	private boolean status = false;
	
	public EmailHelper(){

		props.put("mail.smtp.host", "smtp.zoho.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
 
		session = Session.getDefaultInstance(props,
			new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("notification@farfetchd-official.com","tuffy6543");
				}
			});
	}
 
	public boolean emailSubscriptionInternalMail(String to_address) throws IOException{
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			Cipher cipher = new Cipher();
			String unsubscribeLink = null;
			
			if(request.getRequestURL().toString().contains("localhost")){
				unsubscribeLink = request.getScheme().concat("://").concat(request.getServerName()).concat(":"+request.getServerPort()).concat(request.getContextPath()).concat("/cancelEmailSubscription.action?").concat(cipher.encrypt("email="+to_address));
				System.out.println("Unsubscribe link: "+unsubscribeLink);
			}else{
				unsubscribeLink = request.getScheme().concat("://").concat(request.getServerName()).concat("/cancelEmailSubscription?").concat(cipher.encrypt("email="+to_address));
				System.out.println("Unsubscribe link: "+unsubscribeLink);
			}
			
			String emailSubscriptionMessageText = EmailHelper.class.getResource("emailSubscriptionMessageText.txt").getPath().toString();
			System.out.println("Resource path: "+emailSubscriptionMessageText);
			TO_ADDRESS = to_address;
			String subject = "You have been successfully registered to the Farfetch'd Mailing List";
	        
			String body_generic = readFile(emailSubscriptionMessageText);
			
			String body = body_generic.replaceAll(Pattern.quote("${unsubscribeLink}"), unsubscribeLink);
			
			System.out.println("Rendered body: \n"+body);
			
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(FROM_ADDRESS,FROM_NAME));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(TO_ADDRESS));
			message.setRecipients(Message.RecipientType.CC,
					InternetAddress.parse(CC_ADDRESS));
			message.setSubject(subject);
			message.setContent(body,"text/html");
 
			Transport.send(message);
			status = true;
			System.out.println("Sent email to "+TO_ADDRESS);
 
		} catch (MessagingException e) {
			System.out.println("failed to send email.");
			status = false;
		} catch(Exception e){
			System.out.println("Failed to send email.");
			System.out.println(e.getMessage());
			status = false;
		}
		return status;

	}
	
	public void errorMessageInternalMail(String to_address, String errorMessage) throws UnsupportedEncodingException{
		
		try {
			TO_ADDRESS = to_address;
			String subject = "Error Sending Email Subscription Mail";
	        
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(FROM_ADDRESS,FROM_NAME));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(CC_ADDRESS));
			message.setSubject(subject);
			message.setText("Error sending Subscription alert email to "+to_address+"." +
					"\n\nError message: "+errorMessage);
 
			Transport.send(message);
			System.out.println("Sent email to "+CC_ADDRESS);
 
		} catch (MessagingException e) {
			System.out.println("failed to send email.");
			e.printStackTrace();
		} catch(Exception e){
			System.out.println("Failed to send email.");
			System.out.println(e.getMessage());
			status = false;
		}
		
	}
	
	public void errorMessageInternalMail(String to_address) throws UnsupportedEncodingException{
		
		try {
			TO_ADDRESS = to_address;
			String subject = "Error Sending Email Subscription Mail";
	        
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(FROM_ADDRESS,FROM_NAME));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(CC_ADDRESS));
			message.setSubject(subject);
			message.setText("Error sending Subscription alert email to "+to_address);
 
			Transport.send(message);
			status = true;
			System.out.println("Sent email to "+CC_ADDRESS);
 
		} catch (MessagingException e) {
			System.out.println("failed to send email.");
			status = false;
			e.printStackTrace(); 
		} catch(Exception e){
			System.out.println("Failed to send email.");
			System.out.println(e.getMessage());
			status = false;
		}
		
	}
	
	String readFile(String fileName) throws IOException {
	    BufferedReader br = new BufferedReader(new FileReader(fileName));
	    try {
	        StringBuilder sb = new StringBuilder();
	        String line = br.readLine();

	        while (line != null) {
	            sb.append(line);
	            sb.append("\n");
	            line = br.readLine();
	        }
	        return sb.toString();
	    } finally {
	        br.close();
	    }
	}
	
	
	public boolean productBuyNowMail(int orderId, int productId, String productName, int quantity, int unitPrice,
			int totalPrice,	String fname, String lname, String email, String contact, String street, 
			String locality, String city, String state, String pincode, String paymentConfirm, String isShipped,
			String orderStatus, String currentTime) throws IOException{
		
		status = false;
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			Cipher cipher = new Cipher();
			String notifyPayment = null;
			String cancelOrder = null;
			String contextPath = null;
			
			if(request.getRequestURL().toString().contains("localhost")){
				contextPath = request.getScheme().concat("://").concat(request.getServerName()).concat(":"+request.getServerPort()).concat(request.getContextPath());
				notifyPayment = contextPath.concat("/notifyPaymentConfirmation.action?").concat(cipher.encrypt("orderId="+orderId));
				cancelOrder = contextPath.concat("/cancelOrder.action?").concat(cipher.encrypt("orderId="+orderId));
				System.out.println("Notify Payment link: "+notifyPayment);
				System.out.println("Cancel order link: "+cancelOrder);
			}else{
				contextPath = request.getScheme().concat("://").concat(request.getServerName());
				notifyPayment = contextPath.concat("/notifyPaymentConfirmation.action?").concat(cipher.encrypt("orderId="+orderId));
				cancelOrder = contextPath.concat("/cancelOrder.action?").concat(cipher.encrypt("orderId="+orderId));
				System.out.println("Notify Payment link: "+notifyPayment);
				System.out.println("Cancel order link: "+cancelOrder);
			}
			
			
			String productBuyNowMessageText = EmailHelper.class.getResource("productBuyNowMessageText.txt").getPath().toString();
			System.out.println("Resource path: "+productBuyNowMessageText);
			TO_ADDRESS = email;
			String subject = "Your order has been created.";
	         
			String body_generic = readFile(productBuyNowMessageText);
			
			String body = body_generic.replaceAll(Pattern.quote("${fname}"), fname);
			body = body.replaceAll(Pattern.quote("${lname}"), lname);
			body = body.replaceAll(Pattern.quote("${street}"), street);
			body = body.replaceAll(Pattern.quote("${locality}"), locality);
			body = body.replaceAll(Pattern.quote("${city}"), city);
			body = body.replaceAll(Pattern.quote("${state}"), state);
			body = body.replaceAll(Pattern.quote("${pincode}"), pincode);
			body = body.replaceAll(Pattern.quote("${contact}"), contact);
			body = body.replaceAll(Pattern.quote("${quantity}"), Integer.toString(quantity));
			body = body.replace(Pattern.quote("${unitPrice}"), Integer.toString(unitPrice));
			body = body.replaceAll(Pattern.quote("${totalPrice}"), Integer.toString(totalPrice));
			body = body.replaceAll(Pattern.quote("${orderId}"), Integer.toString(orderId));
			body = body.replaceAll(Pattern.quote("${paymentConfirmation}"), notifyPayment);
			body = body.replaceAll(Pattern.quote("${cancelOrder}"), cancelOrder);
			
			System.out.println("Rendered body: \n"+body);
			
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(FROM_ADDRESS,FROM_NAME));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(TO_ADDRESS));
			message.setRecipients(Message.RecipientType.CC,
					InternetAddress.parse(CC_ADDRESS));
			message.setSubject(subject);
			message.setContent(body,"text/html");
 
			Transport.send(message);
			status = true;
			System.out.println("Sent product buy now email to "+TO_ADDRESS);
 
		} catch (MessagingException e) {
			System.out.println("Failed to send email.");
			System.out.println(e.getMessage());
			status = false;
		} catch(Exception e){
			System.out.println("Failed to send email.");
			System.out.println(e.getMessage());
			status = false;
		}
		return status;
	}
	
	public boolean notifyPaymentConfirmationInternalMail(String orderId){
		
		status = false;
		try {
			TO_ADDRESS = CC_ADDRESS;
			CC_ADDRESS = "akash@farfetchd-official.com";
			
			String currentTime= new Date().toString();
			
			String subject = "Payment confirmation";

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(FROM_ADDRESS,FROM_NAME));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(TO_ADDRESS));
			message.setRecipients(Message.RecipientType.CC,
					InternetAddress.parse(CC_ADDRESS));
			message.setSubject(subject);
			message.setText("Payment Confirmation notification on orderId="+orderId+" at "+currentTime);
 
			Transport.send(message);
			status = true;
			System.out.println("Payment notification email delivered to "+TO_ADDRESS);
 
		} catch (MessagingException e) {
			System.out.println("Failed to send email.");
			System.out.println(e.getMessage());
			status = false;
		} catch(Exception e){
			System.out.println("Failed to send email.");
			System.out.println(e.getMessage());
			status = false;
		}
		return status;
		
	}
	
	
	public boolean cancelOrderInternalMail(String orderId){
		
		status = false;
		try {
			TO_ADDRESS = CC_ADDRESS;
			CC_ADDRESS = "akash@farfetchd-official.com";
			
			String currentTime= new Date().toString();
			
			String subject = "Order cancelled";

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(FROM_ADDRESS,FROM_NAME));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(TO_ADDRESS));
			message.setRecipients(Message.RecipientType.CC,
					InternetAddress.parse(CC_ADDRESS));
			message.setSubject(subject);
			message.setText("Order has been cancelled for orderId="+orderId+" at "+currentTime);
 
			Transport.send(message);
			status = true;
			System.out.println("Cancel order email delivered to "+TO_ADDRESS);
 
		} catch (MessagingException e) {
			System.out.println("Failed to send email.");
			System.out.println(e.getMessage());
			status = false;
		} catch(Exception e){
			System.out.println("Failed to send email.");
			System.out.println(e.getMessage());
			status = false;
		}
		return status;
		
	}
	
	public boolean contactUsInternalMail(String name, String email, String number, String description) throws IOException{
		
		status = false;
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			
			String contactUsInternalMessageText = EmailHelper.class.getResource("contactUsInternalMessageText.txt").getPath().toString();
			System.out.println("Resource path: "+contactUsInternalMessageText);
			TO_ADDRESS = CC_ADDRESS;
			CC_ADDRESS = "akash@farfetchd-official.com";
			
			String currentTime= new Date().toString();
			
			String subject = "Recieved new email from "+email;
	        
			String body_generic = readFile(contactUsInternalMessageText);
			
			String body = body_generic.replaceAll(Pattern.quote("${name}"), name);
			body = body.replaceAll(Pattern.quote("${email}"), email);
			body = body.replaceAll(Pattern.quote("${number}"), number);
			body = body.replaceAll(Pattern.quote("${description}"), description);
			body = body.replaceAll(Pattern.quote("${currentTime}"), currentTime);
			
			System.out.println("Rendered body: \n"+body);
			
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(FROM_ADDRESS,FROM_NAME));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(TO_ADDRESS));
			message.setRecipients(Message.RecipientType.CC,
					InternetAddress.parse(CC_ADDRESS));
			message.setSubject(subject);
			message.setContent(body,"text/html");
 
			Transport.send(message);
			status = true;
			System.out.println("Contact details email delivered to "+TO_ADDRESS);
 
		} catch (MessagingException e) {
			System.out.println("Failed to send email.");
			System.out.println(e.getMessage());
			status = false;
		} catch(Exception e){
			System.out.println("Failed to send email.");
			System.out.println(e.getMessage());
			status = false;
		}
		return status;
	}
	
	public boolean bookUsInternalMail(String name, String email, String number, String description) throws IOException{
		
		status = false;
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			
			String bookUsInternalMessageText = EmailHelper.class.getResource("contactUsInternalMessageText.txt").getPath().toString();
			System.out.println("Resource path: "+bookUsInternalMessageText);
			TO_ADDRESS = CC_ADDRESS;
			CC_ADDRESS = "akash@farfetchd-official.com";
			
			String currentTime= new Date().toString();
			
			String subject = "Booking Alert!! Recieved new email from "+email;
	        
			String body_generic = readFile(bookUsInternalMessageText);
			
			String body = body_generic.replaceAll(Pattern.quote("${name}"), name);
			body = body.replaceAll(Pattern.quote("${email}"), email);
			body = body.replaceAll(Pattern.quote("${number}"), number);
			body = body.replaceAll(Pattern.quote("${description}"), description);
			body = body.replaceAll(Pattern.quote("${currentTime}"), currentTime);
			
			System.out.println("Rendered body: \n"+body);
			
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(FROM_ADDRESS,FROM_NAME));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(TO_ADDRESS));
			message.setRecipients(Message.RecipientType.CC,
					InternetAddress.parse(CC_ADDRESS));
			message.setSubject(subject);
			message.setContent(body,"text/html");
 
			Transport.send(message);
			status = true;
			System.out.println("Contact details email delivered to "+TO_ADDRESS);
 
		} catch (MessagingException e) {
			System.out.println("Failed to send email.");
			System.out.println(e.getMessage());
			status = false;
		} catch(Exception e){
			System.out.println("Failed to send email.");
			System.out.println(e.getMessage());
			status = false;
		}
		return status;
	}
}
 