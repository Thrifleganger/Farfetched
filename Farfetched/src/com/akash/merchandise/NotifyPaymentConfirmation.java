/**
 * 
 */
package com.akash.merchandise;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.akash.mail.EmailHelper;
import com.akash.util.Cipher;
import com.akash.util.JDBCHelper;

/**
 * @author Thrifleganger
 *
 */
public class NotifyPaymentConfirmation {
	
	private String returnString = null;

	public String execute(){
		HttpServletRequest request = ServletActionContext.getRequest();
		EmailHelper emailHelper = new EmailHelper();
		Cipher cipher = new Cipher();
			
		String encryptedText = request.getQueryString();
		System.out.println("encrypted: "+encryptedText);
		String decryptedText = cipher.decrypt(encryptedText);
		System.out.println("decrypted: "+decryptedText);
		
		String orderId = decryptedText.substring(decryptedText.indexOf('=')+1).trim();
		System.out.println("Notification of payment confirmation or orderId: "+orderId);
		
		boolean status = emailHelper.notifyPaymentConfirmationInternalMail(orderId);
		
		if(!status){
			returnString = "An error occured while notifying. Please try again";
		}
		else{
			returnString = "Thank you for notifying payment. We'll get back to you on it.";
		}
		
		return "success";
	}

	public String getReturnString() {
		return returnString;
	}

	public void setReturnString(String returnString) {
		this.returnString = returnString;
	}

}
