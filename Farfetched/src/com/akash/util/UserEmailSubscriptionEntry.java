/**
 * 
 */
package com.akash.util;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import java.sql.*;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

import com.akash.mail.EmailHelper;
/**
 * @author NEX53KF
 *
 */
public class UserEmailSubscriptionEntry {

	private String email = null;
	private String returnString = null;
	private boolean isEmailSent = false;
	
	
	public String execute() throws SQLException, UnsupportedEncodingException{
		HttpServletRequest request = ServletActionContext.getRequest();
		
		EmailHelper emailHelper = new EmailHelper();		
		JDBCHelper jdbcHelper = new JDBCHelper();
		
		String toencrypt = "userid=2";
		Cipher cipher = new Cipher();
		
		
		
		System.out.println("Plain text: "+toencrypt);
		System.out.println("Cipher text: "+cipher.encrypt(toencrypt));
		System.out.println("Decipher text: "+cipher.decrypt(cipher.encrypt(toencrypt)));
		
		String url = "http://localhost:8080/Farfetched/userEmailSubscriptionEntry.action?ARsXGw8IWFU=";
		
		String substr = url.substring(url.indexOf('?')+1);
		System.out.println("Substring : "+substr);
		substr = url.substring(url.indexOf('?',0));
		System.out.println("Substring : "+substr);
		substr = url.substring(url.indexOf('?',2));
		System.out.println("Substring : "+substr);
		
		if(!email.isEmpty()){
			if(!jdbcHelper.emailSubscriptionUserExists(email)){
				int userId = jdbcHelper.getMaxUserIdFromEmailScubscription();
				if(userId!=0){
					userId++;
					int affectedRows = jdbcHelper.insertEmailId(userId,email);
					if(affectedRows!=0){
						returnString = "You have successfully subscribed to our mailing list!";
						try {
							isEmailSent = emailHelper.emailSubscriptionInternalMail(email);
							if(!isEmailSent){
								emailHelper.errorMessageInternalMail(email);
							}
						} catch (IOException e) {
							e.printStackTrace();
							System.out.println("Email sending failed.");
							emailHelper.errorMessageInternalMail(email,e.getMessage());
						}
					}
					else{
						returnString = "An error occured. Please try again.";
					}
					
				}
				else{
					returnString = "An error occured. Please try again.";
				}
			}
			else{
				if(jdbcHelper.isUnsubscribed(email)){
					int affectedRows = jdbcHelper.changeSubscriptionStatus(email);
					if(affectedRows!=0){
						returnString = "<p class='succes-notification'>You have successfully re-subscribed to our mailing list!</p>";
						try {
							isEmailSent = emailHelper.emailSubscriptionInternalMail(email);
							if(!isEmailSent){
								emailHelper.errorMessageInternalMail(email);
							}
						} catch (IOException e) {
							e.printStackTrace();
							System.out.println("Email sending failed.");
							emailHelper.errorMessageInternalMail(email,e.getMessage());
						}
					}
					else{
						returnString = "An error occured. Please try again.";
					}
				}
				else{
					returnString = "You have already been subscribed to our mailing list!";
				}
			}
		}
			
		return "success";
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getReturnString() {
		return returnString;
	}

	public void setReturnString(String returnString) {
		this.returnString = returnString;
	}

}
