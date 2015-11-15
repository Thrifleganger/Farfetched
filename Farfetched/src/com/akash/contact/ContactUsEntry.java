/**
 * 
 */
package com.akash.contact;

import java.io.IOException;
import java.util.Date;

import com.akash.mail.EmailHelper;
import com.akash.util.JDBCHelper;

/**
 * @author NEX53KF
 *
 */
public class ContactUsEntry {
	
	private String name;
	private String email;
	private String number;
	private String description;
	private String returnString;
	
	public String execute() throws IOException{
		
		String currentTime = new Date().toString();
		JDBCHelper jdbcHelper = new JDBCHelper();
		EmailHelper emailHelper = new EmailHelper();
		boolean isEmailSent = false;
		
		description = description.replace("'", "''");
		
		System.out.println("Corrected description: "+description);
		
		
		if(null == number){
			number="0";
		}
		
		int affectedRows = jdbcHelper.insertContactDetails(name,email,number,description,currentTime);
		
		if(!(affectedRows == 0)){			
			isEmailSent = emailHelper.contactUsInternalMail(name,email,number,description);
			
			if(isEmailSent){
				returnString = "Hey, thanks for contacting us. Please await our reply.";
			}else{
				returnString = "Something went wrong! Please try again or contact us directly at thegoodfolk@farfetchd-official.com";
			}
		}else{
			returnString = "Something went wrong! Please try again or contact us directly at thegoodfolk@farfetchd-official.com";
			System.out.println("failure");
		}
			
		return "success";
	}
	
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getReturnString() {
		return returnString;
	}

	public void setReturnString(String returnString) {
		this.returnString = returnString;
	}

}
