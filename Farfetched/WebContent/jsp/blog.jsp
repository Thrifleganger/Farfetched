<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>B</title>

<link rel="stylesheet" href="css/global.css">

<link rel="stylesheet" href="css/ImageTransform.css">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<script src="js/validation.js"></script>

<script>

$(document).ready(function(){ 
	
	
	$(".createBlog").click(function() {
		$(".blogEntry-lightbox-dark").show();
		$(".blogEntry-lightbox-bright").show();
	});

	$(".blogEntry-lightbox-dark").click(function() {
		$(".blogEntry-lightbox-bright").hide(600);
		$(".blogEntry-lightbox-dark").hide(600);
	});
	
	var globalCounter = 1;
	var blog_counter;
	
	$.ajax({
		url:'/Farfetched/ajaxAction',
		data: 'method=populateBlogEntriesOnPageLoad',
		success: function (jsonResponse) {
			alert(jsonResponse);
			
			var myJSONText= jQuery.parseJSON(jsonResponse.replace(/(\/\*|\*\/)/g, ''));				
			var counter;
			var isEmpty = false;
			
			for(counter=1; counter <= 5; counter++){
				
				blog_counter = "blog"+globalCounter;
				
				if(typeof myJSONText[blog_counter] === 'undefined'){
					isEmpty = true;
				    $('.no-items-to-display').fadeIn();
				} else{
					createHTMLforBlogEntry(myJSONText);
				}
				
				if(!isEmpty){
					$('.more-items-to-display').fadeIn();
				}
			}
		}
	});
	
	$('.more-items-to-display').click(function(){
		
		$.ajax({
			url:'/Farfetched/ajaxAction',
			data: 'method=fetchMoreBlogEntries&globalCounter='+globalCounter+'&sortBy=default',
			success: function (jsonResponse) {
				alert(jsonResponse);
				
				var myJSONText= jQuery.parseJSON(jsonResponse.replace(/(\/\*|\*\/)/g, ''));				
				var counter;
				var isEmpty = false;
				
				for(counter=1; counter <= 5; counter++){
					
					blog_counter = "blog"+globalCounter;
					
					if(typeof myJSONText[blog_counter] === 'undefined'){
						isEmpty = true;
					    $('.no-items-to-display').fadeIn();
					    $('.more-items-to-display').fadeOut();
					} else{
						createHTMLforBlogEntry(myJSONText);
					}
					
					if(!isEmpty){
						$('.more-items-to-display').fadeIn();
						$('.no-items-to-display').fadeOut();
					}
				}
			}	
		});	
		
	});
	
	$('#populate').click(function(){
		
		$.ajax({
			url:'/Farfetched/ajaxAction',
			data: 'method=populateText',
			success: function (data) {
				$('.populateContent').html("Populated bitches!");	
			}	
		});	
		
	});
	
	function createHTMLforBlogEntry(myJSONText){
		
		$('.blog-item-container').append(
			'<div class="row" style="height:300px;">'+
				'<div class="col-md-10">'+
					'<div class="blog-item" id="blog-item'+globalCounter+'">'+
						'<div class="blog-cover-image">'+
							'<img class="image-link image-link'+globalCounter+'" src="">'+
							'<div class="blog-cover-title blog-cover-title'+globalCounter+'"></div>'+
						'</div>'+
					'</div>'+
				'</div>'+
			'</div>'
		);
		
		
		$('.blog-cover-title'+globalCounter).html(myJSONText[blog_counter].title);
		$('.image-link'+globalCounter).attr("src",myJSONText[blog_counter].image);
		globalCounter++;
	}
	
});

</script> 

</head>
<body class="discover-body-green">

	<jsp:include page="header.jsp"></jsp:include>
	
	<!--  Adding blog entry overlay -->
	<div class="blogEntry-lightbox-dark"></div>

	<div class="blogEntry-lightbox-bright">
		<div class="textual-content">
			<p class="customfont">Create your blog!</p>
			<p>Create a new blog entry and share it with your friends. Be it an event, a review or an article about some album that you've heard
			about, or your own, you can create it here.</p>

			<s:form name="blogEntry-form" id="blogEntry-form"
				action="contactUsEntry"
				method="post" theme="simple">
				<table>
					<tr>
						<td><select id="blog-type" name="blog-type"
								data-toggle="tooltip" title="Select this first">
								<option value = "-1">Select your entry type</option>
								<option value = "event">Create an event</option>
								<option value = "article">Write an abstract article</option>
								<option value = "showcase">Showcase your music/video</option>
								<option value = "review">Review your favorite band/album</option>
							</select>
								
						</td>
					</tr>
					<tr>
						<td><s:textfield id="blog-title" name="blog-title"
								placeholder="Title" data-toggle="tooltip"
								title="Give it a catchy title" /></td>
					</tr>
					<tr>
						<td><s:textarea id="blog-description" name="blog-description"
								placeholder="Description..."
								rows="6" cols="" />
						</td>
					</tr>
					<tr>
						<td><s:textfield id="blog-event-date" name="blog-event-date"
								placeholder="Event date" data-toggle="tooltip"
								title="When is the event?" /></td>
					</tr>
					<tr>
						<td><s:textfield id="blog-venue" name="blog-venue"
								placeholder="Venue" data-toggle="tooltip"
								title="Where is it happening?" /></td>
					</tr>
					<tr>
						<td><s:textfield id="blog-time" name="blog-time"
								placeholder="Time" data-toggle="tooltip"
								title="Where time is it at?" /></td>
					</tr>
					<tr>
						<td><s:textfield id="blog-cover" name="blog-cover"
								placeholder="Cover charge" data-toggle="tooltip"
								title="How much is it? Break it down if there is a cover and an entry charge" /></td>
					</tr>
					<tr>
						<td><s:textfield id="blog-rsvp" name="blog-rsvp"
								placeholder="RSVP Link" data-toggle="tooltip"
								title="Link a Facebook event page here" /></td>
					</tr>
					<tr>
						<td><s:textfield id="blog-rsvp" name="blog-rsvp"
								placeholder="RSVP Link" data-toggle="tooltip"
								title="Link a Facebook event page here" /></td>
					</tr>
					<tr>
						<td><s:textfield id="blog-rsvp" name="blog-rsvp"
								placeholder="RSVP Link" data-toggle="tooltip"
								title="Link a Facebook event page here" /></td>
					</tr>
					<tr>
						<td>
							<input type="file"/>
							<input type="text" name="blog-rsvp"
								placeholder="RSVP Link" data-toggle="tooltip"
								title="Link a Facebook event page here" />
						
						</td>
					</tr>
					<tr>
						<td><s:submit class="red-btn" id="submit" name="submit"
								value="Submit" /></td>
					</tr>
				</table>
			</s:form>
		</div>
	</div>
	
	<div class="clearfix-blog"></div>
	
	<h2> </h2>
	
	<a id="populate">Populate</a>
	
	<br>
	<div class="populateContent"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-10">
				<div class="filter-top">
					Filter by: <a class="filter-by-date">Date</a> <a class="filter-by-pop">Popularity</a> <a class="createBlog">Create a blog</a>
				</div>
			</div>
		</div>
		<div class="blog-item-container">	
			
		</div>
		
		<div class="blog-item-misc-container">
			<div class="row">
				<div class="col-md-10">
					<div class="no-items-to-display">
						<p>There are no more entries to show</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-10">
					<div class="more-items-to-display">
						<p>Click for more items</p>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>