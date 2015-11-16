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
public class CancelOrder {

	private String returnString = null;

	public String execute(){
		HttpServletRequest request = ServletActionContext.getRequest();
		JDBCHelper jdbcHelper = new JDBCHelper();
		EmailHelper emailHelper = new EmailHelper();
		Cipher cipher = new Cipher();
			
		String encryptedText = request.getQueryString();
		System.out.println("encrypted: "+encryptedText);
		String decryptedText = cipher.decrypt(encryptedText);
		System.out.println("decrypted: "+decryptedText);
		
		String orderId = decryptedText.substring(decryptedText.indexOf('=')+1).trim();
		System.out.println("Cancellation of orderId: "+orderId);
		
		int affectedRows = jdbcHelper.changeOrderStatusToCancelled(orderId);
		if(affectedRows == 1){
		
			boolean status = emailHelper.cancelOrderInternalMail(orderId);
			
			if(!status){
				returnString = "An error occured while cancelling your order. Please try again";
			}
			else{
				returnString = "Your order has been cancelled. Care to tell us why ?";
			}
		}else{
			returnString = "An error occured while cancelling your order. Please try again";
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
