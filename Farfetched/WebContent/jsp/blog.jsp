<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="angularApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>B</title>

<link rel="stylesheet" href="css/global.css">

<link rel="stylesheet" href="css/ImageTransform.css">

<link rel="stylesheet" href="css/jquery.ptTimeSelect.css">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- jQuery CSS UI library -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- jQuery UI library -->
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<!-- Angular JS CDN Link -->
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.0-rc.0/angular.min.js"></script>
<!-- Angular Route Dependency -->
<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.1/angular-route.min.js"></script>

<script src="js/validation.js"></script>
<script src="js/jquery.ptTimeSelect.js"></script>

<script>

$(document).ready(function(){ 
	
	$( ".datepicker" ).datepicker({
		dateFormat: "yy-mm-dd"
	});
	$('#blog-time').ptTimeSelect({
		zIndex: 100000,
	});
	
	$(".createBlog").click(function() {
		$(".blogEntry-lightbox-dark").show();
		$(".blogEntry-lightbox-bright").show();
	});

	$(".blogEntry-lightbox-dark").click(function() {
		$(".blogEntry-lightbox-bright").hide(600);
		$(".blogEntry-lightbox-dark").hide(600);
	});
	
	$('.more-items-to-display').hide();
	$('.no-items-to-display').hide();
	
	var globalCounter = 1;
	var blog_counter;
	var videoLinkCounter = 1;
	var audioLinkCounter = 1;
	
	$.ajax({
		url:'/Farfetched/ajaxAction',
		data: 'method=populateBlogEntriesOnPageLoad',
		success: function (jsonResponse) {
			alert(jsonResponse);
			
			$('.cssload-plus-loader').fadeOut();
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
		$('.image-link'+globalCounter).attr("src","retrieveImageStream/"+myJSONText[blog_counter].image);
		globalCounter++;
	}
	
	$('#addVideoLinkButton').click(function(){
		
		videoLinkCounter++;
		
		$('#addVideoLinkDivision').append('<tr>'+
			'<td>'+
				'<div class="black-btn addVideoLinkButton deleteVideoLinkButton">-'+					
				'</div>'+					
				'<span class="full-width"><input type="text" id="blog-video-'+videoLinkCounter+'" name="blog.video"'+
					'placeholder="Video link '+videoLinkCounter+'" data-toggle="tooltip" class="blog-video-link"'+
					'title="Add a link to a video. Youtube and Vimeo supported" value=""/></span>'+				
			'</td>'+
		'</tr>');	
	}); 
	
	$('#addVideoLinkDivision').on('click','.deleteVideoLinkButton',function(){
		videoLinkCounter--;
		if($(this).parent().parent().is(":last-child")){
			$(this).parent().parent().remove();
		} else if($(this).parent().parent().siblings().last().length){
			$(this).parent().parent().siblings().last().remove();
		}
	});
	
	$('#addAudioLinkButton').click(function(){
		
		audioLinkCounter++;
		
		$('#addAudioLinkDivision').append('<tr>'+
			'<td>'+
				'<div class="black-btn addAudioLinkButton deleteAudioLinkButton">-'+					
				'</div>'+
				'<span class="full-width"><input type="text" id="blog-audio-'+audioLinkCounter+'" name="blog.audio"'+
					'placeholder="Audio link '+audioLinkCounter+'" data-toggle="tooltip" class="blog-audio-link"'+
					'title="Add a link to a song. SoundCloud and Bandcamp supported" value=""/></span>'+									
			'</td>'+
		'</tr>');	
	}); 
	
	$('#addAudioLinkDivision').on('click','.deleteAudioLinkButton',function(){
		audioLinkCounter--;
		if($(this).parent().parent().is(":last-child")){
			$(this).parent().parent().remove();
		} else if($(this).parent().parent().siblings().last().length){
			$(this).parent().parent().siblings().last().remove();
		}
	});
	
	$('#uploadImageButton').click(function(){
		$('#imageBrowse').click();
	});
	
	$('#imageBrowse').on('change',function(){
		$('#blog-image').val($('#imageBrowse').val());
		
		var fd = new FormData();
		fd.append('fileUpload',$("#imageBrowse")[0].files[0])
		$.ajax({
			url:'/Farfetched/imageUploadValidation',
			type: "POST",
			cache: false,
			data: fd,
            enctype: 'multipart/form-data',
            processData: false,  
            contentType: false, 
			success: function (response) {
				
				if(response == "type"){
					
				}
			}
		}); 
		
	});
	
	$('#blog-type').on('change',function(){
		var type = $('#blog-type').val();
		$('#blogEntry-form').find('tr').not('.eternal,.'+type).fadeOut();  
		$('#blogEntry-form').find('tr.eternal,tr.'+type).fadeIn();
		/*$('#blogEntry-form').find('tr,tbody').not(".eternal,."+type).fadeOut(); */
	});
	
	$('.image-link').click(function(){
		var $this = $(this).parent().parent();
		$($this).toggleClass("autoHeight");
	});
});

</script> 

<script>

	var angularApp = angular.module('angularApp',[]);
	
	angularApp.controller('displayBlogController',function($scope,$http){
		
		$scope.firstName = 'Akash';
		
		$scope.getBlogDetails = function(){
		$http({
			method: 'POST',
			url:'/Farfetched/ajaxAction',
			params: { "method" : "populateBlogEntriesOnPageLoad" }
		}).then(function successCallback(response) {
			$scope.firstName = response.data;
			$scope.counter = 0;
			  }, function errorCallback(response) {
			    // called asynchronously if an error occurs
			    // or server returns response with an error status.
			  });
		
		};
		
		$scope.getIncludeFile = function() {
			return 'jsp/blogEntry.html';
		}
		
		$scope.getBlogDetails();
		
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
				action="blogEntrySubmission" enctype="multipart/form-data"
				method="post" theme="simple">
				<table>
					<tr class="eternal">
						<td><select id="blog-type" name="blog.type"
								data-toggle="tooltip" title="Select this first">
								<option value = "-1">Select your entry type</option>
								<option value = "event">Create an event</option>
								<option value = "article">Write an abstract article</option>
								<option value = "showcase">Showcase your music/video</option>
								<option value = "review">Review your favorite band/album</option>
							</select>
								
						</td>
					</tr>
					<tr class="eternal">
						<td><s:textfield id="blog-title" name="blog.title"
								placeholder="Title" data-toggle="tooltip" 
								title="Give it a catchy title" value=""/></td>
					</tr>
					<tr class="eternal"> 
						<td><s:textarea id="blog-description" name="blog.description"
								placeholder="Description..." data-toggle="tooltip" 
								title="Description"
								rows="6" cols="" value=""/>
						</td>
					</tr>
					<tr class="event">
						<td>
							<div class="row">
								<div class="col-md-3">
									<s:textfield id="blog-event-date" class="datepicker" name="blog.event_date"
										placeholder="Event date" data-toggle="tooltip"
										title="When is the event?" value=""/>
								</div>
								<div class="col-md-3">
									<s:textfield id="blog-time" name="blog.time"
										placeholder="Time" data-toggle="tooltip"
										title="Where time is it at?" value=""/>
								</div>
								<div class="col-md-3">
									<s:textfield id="blog-venue" name="blog.venue"
										placeholder="Venue" data-toggle="tooltip"
										title="Where is it happening?" value=""/>							
								</div>
								<div class="col-md-3">
									<s:textfield id="blog-cover" name="blog.cover"
										placeholder="Cover charge" data-toggle="tooltip"
										title="How much is it? Break it down if there is a cover and an entry charge" value=""/>
								
								</div>
							</div>
						</td>
					</tr>
					
					<tr class="event">
						<td><s:textfield id="blog-rsvp" name="blog.rsvp"
								placeholder="RSVP Link" data-toggle="tooltip"
								title="Link a Facebook event page here" value=""/></td>
					</tr>
					
					<tbody class="blog-media">
						<tr class="eternal">
							<td>
								<div class="red-btn addVideoLinkButton" id="addVideoLinkButton">+					
								</div>
								<span class="full-width"><s:textfield id="blog-video-1" name="blog.video"
									placeholder="Video link" data-toggle="tooltip" class="blog-video-link"
									title="Add a link to a video. Youtube and Vimeo supported" value=""/>
								</span>								
							</td>
						</tr>
						<tbody id="addVideoLinkDivision" class="eternal">
						</tbody>
						
						<tr class="eternal">
							<td>
								<div class="red-btn addAudioLinkButton" id="addAudioLinkButton">+					
								</div>
								<span class="full-width"><s:textfield id="blog-audio-1" name="blog.audio"
									placeholder="Audio link" data-toggle="tooltip" class="blog-audio-link"
									title="Add a link to a song. SoundCloud and BandCamp supported" value="" />
								</span>								
							</td>
						</tr>
						<tbody id="addAudioLinkDivision" class="eternal">
						</tbody>
						
						<tr class="eternal">
							<td>
								<s:actionerror/>
								<input type="file" id="imageBrowse" name="blog.image" style="display:none;"/>
								<div class="red-btn uploadImageButton" id="uploadImageButton">Upload Image					
								</div>
								<span class="full-width"><s:textfield id="blog-image"
									data-toggle="tooltip" class="blog-image"
									title="Upload an image" value="" readonly="true"/>
								</span>						
							</td>
						</tr>
					</tbody>
					
					<tbody class="blog-social" >
						<tr class="eternal">
							<td>
								<div class="row">
									<div class="col-md-6">
										<s:textfield id="blog-facebook" class="blog-facebook" name="blog.facebook"
											placeholder="Facebook Link" data-toggle="tooltip"
											title="Enter the band's or your facebook address" value=""/>
									</div>
									<div class="col-md-6">
										<s:textfield id="blog-soundcloud" name="blog.soundcloud"
											placeholder="Soundcloud Link" data-toggle="tooltip"
											title="Enter a Soundcloud page link" value=""/>
									</div>
								</div>
								<div class="row" style="margin-top: 20px;">
									<div class="col-md-6">
										<s:textfield id="blog-youtube" name="blog.youtube"
											placeholder="Youtube Link" data-toggle="tooltip"
											title="Enter a Youtube channel's link" value=""/>							
									</div>
									<div class="col-md-6">
										<s:textfield id="blog-twitter" name="blog.twitter"
											placeholder="Twitter Link" data-toggle="tooltip"
											title="Tag you Twitter account here" value=""/>								
									</div>							
								</div>
							</td>
						</tr>
					</tbody>
					
					

					
					<tr class="eternal">
						<td>
							<div class="row">
								<div class="col-md-12">							  
							    	<p id="blog-display-this">Display this information?</p>
							    	<div id="blog-display-checkbox"><input type="checkbox" name="blog.display_checkbox" checked style="height: 0"></div>
								</div>							
							</div>
							<div class="row">
								<div class="col-md-6">									
									<s:textfield id="blog-author-name" class="blog-author-name" name="blog.author_name"
										placeholder="Your name"	data-toggle="tooltip" value=""
										title="Enter your name. You can choose to hide this information and remain anonymous"/>
								</div>
								<div class="col-md-6">
									<s:textfield id="blog-author-email" name="blog.author_email"
										placeholder="Your email ID" data-toggle="tooltip" value=""
										title="Enter your email ID. We will be sending you data regarding how your post is doing" />
								</div>
							</div>							
						</td>
					</tr>
					
					
					<tr class="eternal">
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
	
	<div class="container" ng-controller="displayBlogController">
		<div class="row">
			<div class="col-md-10">
				<div class="filter-top">
					Filter by: <a class="filter-by-date">Date</a> <a class="filter-by-pop">Popularity</a> <a class="createBlog">Create a blog</a>
				</div>
			</div>
		</div>
		<div class="blog-item-container">	
		
			<div class="cssload-plus-loader">
			<div class="cssload-top">
				<div class="cssload-square">
					<div class="cssload-square">
						<div class="cssload-square">
							<div class="cssload-square">
								<div class="cssload-square"><div class="cssload-square">
			
								</div></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="cssload-bottom">
				<div class="cssload-square">
					<div class="cssload-square">
						<div class="cssload-square">
							<div class="cssload-square">
								<div class="cssload-square"><div class="cssload-square">
								</div></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="cssload-left">
				<div class="cssload-square">
					<div class="cssload-square">
						<div class="cssload-square">
							<div class="cssload-square">
								<div class="cssload-square"><div class="cssload-square">
								</div></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="cssload-right">
				<div class="cssload-square">
					<div class="cssload-square">
						<div class="cssload-square">
							<div class="cssload-square">
								<div class="cssload-square"><div class="cssload-square">
								</div></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
			
			<div style="" class="row">
				<div class="col-md-10">
					<div id="blog-item1" class="blog-item">
						<div class="blog-cover-image">
							<div class="blog-cover-popup" style="">
								<img src="blog/liked.png" />
							</div>
							<img src="retrieveImageStream/1000" class="image-link image-link1">
							<div class="blog-cover-title blog-cover-title1">Storm Festival, headlined by Storm Corrosion</div>
						</div> 
						<div class="collapsed-blog-content">
							<h3 class="blog-heading">Storm Festival, headlined by Storm Corrosion </h3>
							<div class="blog-description">If you are considering this, then you are making a valuable contribution to the rather broke and homeless musicians of Farfetch'd. Yes, we have physical copies of The Alchemist for sale, and no, we don't have too many copies left. If you want to get your hands on one of these eloquently elegant, matt-finished, fire breathing, 6 face digipacks...well, you can. Although not all the aforementioned adjectives hold true, its a small amount of money to pay for an independent band's merchandise. But there is a catch: Alright, since you're still here after reading through a whole lot of garbage, we assume you are genuinely interested. Here's how this is going to work. Please fill out the form below and click on Submit. You will receive an auto-generated email from our side explaining the due process and the account details, to whom you need to pay. Once we receive the funds, which will generally take one working day for NEFT transactions, we will process, package and ship it out to you, along with a formal acknowledgement of the payment reciept. Sound fair? </div>
							
						</div>
					</div>
				</div>
			</div>
			
			<div ng-repeat="(blogName, blog) in firstName" ng-include="getIncludeFile()">
			</div>
			
			
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