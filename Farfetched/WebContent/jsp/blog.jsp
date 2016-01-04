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

<link rel="stylesheet" href="js/jQueryTE/jquery-te-1.4.0.css">

<link rel="stylesheet" href="css/hover.css">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- jQuery CSS UI library -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- jQuery UI library -->
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<!--  jQuery Cookie JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<!-- Angular JS CDN Link -->
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.0-rc.0/angular.min.js"></script>
<!-- Angular Route Dependency -->
<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.1/angular-route.min.js"></script>

<!-- jQuery Text Editor -->
<script src="js/jQueryTE/jquery-te-1.4.0.min.js"></script>

<script src="js/validation.js"></script>
<script src="js/jquery.ptTimeSelect.js"></script>

<script src="js/angularApp.js"></script>


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
	
	<div ng-view></div>
	
	<jsp:include page="footer.jsp"></jsp:include>

</body>

<!--  Script for setting blog likes cookie -->
<script>

$(document).ready(function(){
	if(!$.cookie('blogLikes')){
		$.cookie('blogLikes', '', { expires: 365, path: '/' });
	} else{
		var likes = $.cookie('blogLikes').split(',');
		$.each(likes,function(index,like){
			if(like != ''){
				$('#'+like+' .like-button img').attr("src","images/blog/liked.png");
				$('#'+like+' .like-button img').addClass("liked");
			}
		});
		
	}
});

</script>

</html>