/**
 * 
 */
package com.akash.util;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

/**
 * @author NEX53KF
 *
 */
public class CancelEmailSubscription {
	
	private String returnString = null;

	public String execute(){
		HttpServletRequest request = ServletActionContext.getRequest();
		JDBCHelper jdbcHelper = new JDBCHelper();
		Cipher cipher = new Cipher();
			
		String encryptedText = request.getQueryString();
		System.out.println("encrypted: "+encryptedText);
		String decryptedText = cipher.decrypt(encryptedText);
		System.out.println("decrypted: "+decryptedText);
		
		String emailString = decryptedText.substring(decryptedText.indexOf('=')+1).trim();
		System.out.println("User email to be unsubscribed: "+emailString);
		
		int affectedRows = jdbcHelper.changeEmailSubscriptionStatusToNil(emailString);
		
		if(affectedRows != 1){
			returnString = "An error occured while unsubscribing. Please try again";
		}
		else{
			returnString = "You have been unsubscribed from our mailing list. Ciao!";
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
