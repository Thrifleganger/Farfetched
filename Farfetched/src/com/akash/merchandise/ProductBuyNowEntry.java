/**
 * 
 */
package com.akash.merchandise;

import java.io.IOException;
import java.util.Date;

import com.akash.mail.EmailHelper;
import com.akash.util.JDBCHelper;


/**
 * @author NEX53KF
 *
 */
public class ProductBuyNowEntry {
	private String fname;
	private String lname;
	private String email;
	private String contact;
	private String street;
	private String locality;
	private String city;
	private String state;
	private String pincode;
	private String quantity;
	private String unitPrice;
	private String productName;
	private String productId;
	private String paymentConfirm;
	private String isShipped;
	private String orderStatus;
	private int totalPrice;
	private int orderId;
	
	private String returnString;
	
	
	public String execute() throws NumberFormatException, IOException{
		
		totalPrice = Integer.parseInt(quantity)*Integer.parseInt(unitPrice);
		paymentConfirm = "N";
		isShipped = "N";
		orderStatus = "P";
		
		EmailHelper emailHelper = new EmailHelper();
		
		JDBCHelper jdbcHelper = new JDBCHelper();
		orderId = jdbcHelper.getMaxOrderIdFromProductByNow();
		orderId++;
		String currentTime= new Date().toString();
		
		int affectedRows = jdbcHelper.placeOrder(orderId, Integer.parseInt(productId), productName,
				Integer.parseInt(quantity), Integer.parseInt(unitPrice), totalPrice, fname, lname, 
				email, contact,	street, locality, city, state, pincode, paymentConfirm, isShipped,
				orderStatus, currentTime);
		
		if(!(affectedRows == 0)){
			returnString = "Your order has been successfully placed. Please check your mail.";
			System.out.println("Place order successful for "+fname+" for product "+productName);
			
			emailHelper.productBuyNowMail(orderId, Integer.parseInt(productId), productName,
				Integer.parseInt(quantity), Integer.parseInt(unitPrice), totalPrice, fname, lname, 
				email, contact,	street, locality, city, state, pincode, paymentConfirm, isShipped,
				orderStatus, currentTime);
		}else{
			returnString = "Something went wrong! Please try again.";
			System.out.println("failure");
		}
		
		return "success";
		
	}
	
	
	
	
	
	
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getLocality() {
		return locality;
	}
	public void setLocality(String locality) {
		this.locality = locality;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPincode() {
		return pincode;
	}
	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(String unitPrice) {
		this.unitPrice = unitPrice;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getPaymentConfirm() {
		return paymentConfirm;
	}
	public void setPaymentConfirm(String paymentConfirm) {
		this.paymentConfirm = paymentConfirm;
	}
	public String getIsShipped() {
		return isShipped;
	}
	public void setIsShipped(String isShipped) {
		this.isShipped = isShipped;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}






	public String getReturnString() {
		return returnString;
	}






	public void setReturnString(String returnString) {
		this.returnString = returnString;
	}
	
}
