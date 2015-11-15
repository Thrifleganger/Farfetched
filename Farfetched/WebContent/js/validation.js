function buyNowValidation(){

	var ischecked = document.getElementById("buynow-album-check").checked;
	
	var isValid = true;
	
	var fieldList = ["fname","lname","email","contact","street","locality","city","state","pincode","quantity"];
	var numberOfFields = fieldList.length;
	
	for(var i=0; i<numberOfFields;i++){
		if(!buyNowFocusOutValidation("buynow-"+fieldList[i])){
			isValid = false;
		}
	}
	
	if(!ischecked){
		isValid = false;
	}
	
	if(isValid && ischecked){
		if(confirm("Are you sure you want to confirm this order? You will recieve a mail shortly.")){
			isValid = true;
		}
		else{
			isValid = false;
		}
	}
	return isValid;
}

function buyNowFocusOutValidation(fieldName){
	
	var email = new RegExp(/^[+a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i);
	var contact = new RegExp(/^\d+$/);
	var pincode = new RegExp(/^\d{6}$/);
	var quantity = new RegExp(/^[1-9]$/);
		
	var value = $('#'+fieldName).val(); 
	
	var isValid = true;
	
	if(!(value == '')){
		
		if(fieldName == "buynow-email"){
			if(email.test(value))
				$("#"+fieldName).removeClass("input-invalid");
			else{
				$("#"+fieldName).addClass("input-invalid");
				isValid = false;
			}
		}
		else if(fieldName == "buynow-contact"){
			if(contact.test(value))
				$("#"+fieldName).removeClass("input-invalid");
			else{
				$("#"+fieldName).addClass("input-invalid");
				isValid = false;
			}
		}
		else if(fieldName == "buynow-pincode"){
			if(pincode.test(value))
				$("#"+fieldName).removeClass("input-invalid");
			else{
				$("#"+fieldName).addClass("input-invalid");
				isValid = false;
			}
		}
		else if(fieldName == "buynow-quantity"){
			if(quantity.test(value))
				$("#"+fieldName).removeClass("input-invalid");
			else{
				$("#"+fieldName).addClass("input-invalid");
				isValid = false;
			}
		}
		else{
			$("#"+fieldName).removeClass("input-invalid");
		}
	}
	else{
		$("#"+fieldName).addClass("input-invalid");
		isValid = false;
	}
	
	return isValid;
}


function contactFormValidation(){
	var isValid = true;
		
	var fieldList = ["name","email","description"];
	var numberOfFields = fieldList.length;
	
	for(var i=0; i<numberOfFields;i++){
		if(!contactFormSubmitValidation("contact-"+fieldList[i])){
			isValid = false;
		}
	}
	
	if(isValid){
		if(confirm("Are you sure you want send this message?")){
			isValid = true;
		}
		else{
			isValid = false;
		}
	}
	return isValid;
}

function contactFormSubmitValidation(fieldName){
	var email = new RegExp(/^[+a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i);
	var value = $('#'+fieldName).val(); 
	
	var isValid = true;
	
	if(!(value == '')){
		
		if(fieldName == "contact-email"){
			if(email.test(value))
				$("#"+fieldName).removeClass("input-invalid");
			else{
				$("#"+fieldName).addClass("input-invalid");
				isValid = false;
			}
		}
		else{
			$("#"+fieldName).removeClass("input-invalid");
		}
	}
	else{
		$("#"+fieldName).addClass("input-invalid");
		isValid = false;
	}
	
	return isValid;
}

function subscriptionEmailValidation(){
	var email = new RegExp(/^[+a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i);	
	var value = $("#subscription-email #email").val();
	var $this = $("#subscription-email #email");
	var isValid = true;
	
	if(!(value == '')){
		if(email.test(value))
			$this.removeClass("input-invalid");
		else{
			$this.addClass("input-invalid");
			isValid = false;
		}
	}else{
		$this.addClass("input-invalid");
		isValid = false;
	}
	return isValid;
}


function bookUsFormValidation(){
	var isValid = true;
		
	var fieldList = ["name","email","number","description"];
	var numberOfFields = fieldList.length;
	
	for(var i=0; i<numberOfFields;i++){
		if(!bookUsFormSubmitValidation("bookus-"+fieldList[i])){
			isValid = false;
		}
	}
	
	if(isValid){
		if(confirm("Are you sure you want send this message?")){
			isValid = true;
		}
		else{
			isValid = false;
		}
	}
	return isValid;
}

function bookUsFormSubmitValidation(fieldName){
	var email = new RegExp(/^[+a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i);
	var contact = new RegExp(/^\d+$/);
	var value = $('#'+fieldName).val(); 
	
	var isValid = true;
	
	if(!(value == '')){
		
		if(fieldName == "bookus-email"){
			if(email.test(value)){
				$("#"+fieldName).removeClass("input-invalid");	
			}else{
				$("#bookus-email").addClass("input-invalid");
				isValid = false;
			}
		}
		
		if(fieldName == "bookus-number"){
			if(contact.test(value))
				$("#"+fieldName).removeClass("input-invalid");
			else{
				$("#"+fieldName).addClass("input-invalid");
				isValid = false;
			}
		}
		
		else{
			$("#"+fieldName).removeClass("input-invalid");
		}
	}
	else{
		$("#"+fieldName).addClass("input-invalid");
		isValid = false;
	}
	
	return isValid;
}


$(document).ready(function(){
	
	//Product Buy now form
	$("#album-purchase").find("input[id*='buynow-']").focusin(function(){
		var $this = $(this);
		$("#"+$this.attr('id')).addClass("input-onfocus");
		$("#"+$this.attr('id')).removeClass("input-invalid");
	});
	$("#album-purchase").find("input[id*='buynow-']").focusout(function(){
		var $this = $(this);
		$("#"+$this.attr('id')).removeClass("input-onfocus");
		buyNowFocusOutValidation($this.attr('id'));
	});
	
	//Email subscription form
	$(".subscription-email #email").focusin(function(){
		var $this = $(this);
		$($this).addClass("input-onfocus");
		$($this).removeClass("input-invalid");
	});
	$(".subscription-email #email").focusout(function(){
		var $this = $(this);
		$($this).removeClass("input-onfocus");
	});
	
	//Contact us form
	$("#contact-us-form").find("input[id*='contact-']").focusin(function(){
		var $this = $(this);
		$("#"+$this.attr('id')).addClass("input-onfocus");
		$("#"+$this.attr('id')).removeClass("input-invalid");
	});
	$("#contact-us-form").find("input[id*='contact-']").focusout(function(){
		var $this = $(this);
		$("#"+$this.attr('id')).removeClass("input-onfocus");
	});
	$("#contact-us-form textarea").focusin(function(){
		var $this = $(this);
		$("#"+$this.attr('id')).addClass("input-onfocus");
		$("#"+$this.attr('id')).removeClass("input-invalid");
	});
	$("#contact-us-form textarea").focusout(function(){
		var $this = $(this);
		$("#"+$this.attr('id')).removeClass("input-onfocus");
	});
	
	//Book us form
	$("#book-us-form").find("input[id*='bookus-']").focusin(function(){
		var $this = $(this);
		$("#"+$this.attr('id')).addClass("input-onfocus");
		$("#"+$this.attr('id')).removeClass("input-invalid");
	});
	$("#book-us-form").find("input[id*='bookus-']").focusout(function(){
		var $this = $(this);
		$("#"+$this.attr('id')).removeClass("input-onfocus");
	});
	$("#book-us-form textarea").focusin(function(){
		var $this = $(this);
		$("#"+$this.attr('id')).addClass("input-onfocus");
		$("#"+$this.attr('id')).removeClass("input-invalid");
	});
	$("#book-us-form textarea").focusout(function(){
		var $this = $(this);
		$("#"+$this.attr('id')).removeClass("input-onfocus");
	});
});


