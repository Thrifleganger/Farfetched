
<script>

$(document).ready(function(){ 
	
	$( ".datepicker" ).datepicker({
		dateFormat: "yy-mm-dd"
	});
	
	$("textarea").jqte();
	
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
	
	/* Filter Dropdown event handlers */
	$(document).on('click mouseover','#filter-by-category, #filter-dropdown',function(){
		$('#filter-dropdown').show();
	});
	$(document).on('click mouseout','#filter-by-category, #filter-dropdown',function(){
		$('#filter-dropdown').hide();
	});
	$('#filter-dropdown li').click(function(){
		$('#filter-by-category').html($(this).html());
	});
	
	
	var globalCounter = 1;
	var blog_counter;
	var videoLinkCounter = 1;
	var audioLinkCounter = 1;
	
	/*$.ajax({
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
		
	});*/
	
	$('#populate').click(function(){
		
		$.ajax({
			url:'/Farfetched/ajaxAction',
			data: 'method=populateText',
			success: function (data) {
				$('.populateContent').html("Populated bitches!");	
			}	
		});	
		
	});
	
	$('.event-section-collapsable-div').click(function(){		
		var $this = $(this);
		$this.siblings('div.event-section').toggle();
		$this.find('.rotate-arrow').toggleClass('rotate-arrow-on-click');		
	});
	
	$('.media-section-collapsable-div').click(function(){
		var $this = $(this);
		$this.siblings('div.media-section').toggle();
		$this.find('.rotate-arrow').toggleClass('rotate-arrow-on-click');
		
		var spinner = $this.siblings('div.media-section').find('.cssload-loader');
		
		$('a[href*="soundcloud.com"]').each(function(){
			spinner.show();
			var $link = $(this);
		  	$.getJSON('http://soundcloud.com/oembed?format=js&url=' + $link.attr('href') + '&iframe=true&callback=?', function(response){
				var soundcloudFrame = response.html.replace(/(height=")\d*(")/,'height="300"');
		    	$link.replaceWith(soundcloudFrame);
		    	spinner.hide();
		  });
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
<a id="populate">Populate</a>

<br>
<div class="populateContent"></div>

<div class="container">

	<div class="row">
	    <div class="col-md-10"></div>
	    <div class="col-md-2" style="position:fixed;right:4%">
		    <div style="height:100px; background-color: rgba(255,255,255,.4);width: 100%; border-radius: 10px">
		    	<p>Create a new post</p>
		    	<p>This is a public blog, where anyone can submit their entry - be it an event or an article, explore the power of a public driven blog. Why not create yours today!</p>
		    	<p><a>Learn More</a></p>
		    	<div class="red-btn">Create</div> 
		    </div>
		    <div style="height: 100px; background-color: black;width: 100%; "></div>
	    </div>
  	</div>

	<div class="row">
		<div class="col-md-10">
			<div id="blog-search-box">
				<div class="black-btn" id="blog-search-button">Search database</div>
				<span id="blog-search-input-span">
					<input type="text" id="blog-search-input" placeholder="Quick Search..." ng-model="searchKeyword">
				</span>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-md-10">
			<div id="filter-box">
  				<span id="filter-by">Filter by </span>
  				<span id="filter-items">
  					<span class="blog-filter sort-filter" id="filter-by-date" ng-click="blogFilterRefresh($event);">Date</span>
  					<span class="blog-filter sort-filter" id="filter-by-pop" ng-click="blogFilterRefresh($event);">Popularity</span>
  					<span class="blog-filter category-filter" id="filter-by-category">All</span> 
  					<span class="createBlog">Create a blog</span>
  					<div id="filter-dropdown"> 
						<ul id="filter-list">
					    	<li ng-click="blogFilterRefresh($event);">All</li>
					    	<li ng-click="blogFilterRefresh($event);">Event</li>
					    	<li ng-click="blogFilterRefresh($event);">Article</li>
					    	<li ng-click="blogFilterRefresh($event);">Showcase</li>
					    	<li ng-click="blogFilterRefresh($event);">Review</li>
					    </ul>
					</div>
  				</span>
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
				<div id="6" class="blog-item" data-id="blog1">
					<div class="blog-cover-image">
						<div class="blog-cover-popup" style="">
							<div class="like-button">
								<img src="images/blog/unliked.png" class="hvr-grow" ng-click="likeButtonPressed($event)"/>
							</div>
							<div class="like-count">{{serverResponse.blog1.favCount}}</div>
						</div>
						<img src="retrieveImageStream/1" class="image-link image-link1">
						<div class="blog-cover-title blog-cover-title1">Storm Festival, headlined by Storm Corrosion</div>
					</div> 
					<div class="collapsed-blog-content">
						<div class="row">
							<div class="col-md-12">
								<h2 class="blog-heading"><a href="#1/storm-festival-headlined">Storm Festival, headlined by Storm Corrosion </a></h2>
								<p style="float: left;">Submitted by Akash Murthy on 20th December, 2015</p> <p style="float:right">Catagory: Event</p>
 									<br>
 									<hr>
								<div class="blog-description">If you are considering this, then you are making a valuable contribution to the rather broke and homeless musicians of Farfetch'd. Yes, we have physical copies of The Alchemist for sale, and no, we don't have too many copies left. If you want to get your hands on one of these eloquently elegant, matt-finished, fire breathing, 6 face digipacks...well, you can. Although not all the aforementioned adjectives hold true, its a small amount of money to pay for an independent band's merchandise. But there is a catch: Alright, since you're still here after reading through a whole lot of garbage, we assume you are genuinely interested. Here's how this is going to work. Please fill out the form below and click on Submit. You will receive an auto-generated email from our side explaining the due process and the account details, to whom you need to pay. Once we receive the funds, which will generally take one working day for NEFT transactions, we will process, package and ship it out to you, along with a formal acknowledgement of the payment reciept. Sound fair? </div>
								
								<div class="sub-collapsable-div event-section-collapsable-div">
									<img class="rotate-arrow" src="images/blog/eject.png" width="45px">Event Details
								</div>
								
								<div class="event-section">
									<div class="event-details row">
										<div class="col-md-5">
											<table>
												<tr>
													<td><b>Date:</b></td>
													<td>23rd December</td>
												</tr>
												<tr>
													<td><b>Time:</b></td>
													<td>5:00 PM</td>
												</tr>
												<tr>
													<td><b>Venue:</b></td>
													<td>Bangalore</td>
												</tr>
												<tr>
													<td><b>Cover:</b></td>
													<td>Free</td>
												</tr>
											</table>
										</div>
										<div class="red-btn" style="float: left;">RSVP</div>
										<div>
											<div class="black-btn" style="float: left; margin-left: 20px;">Remind me</div>
											<div style='height: 100px; width: 300px; border-radius: 10px; position: absolute; top: 120px; left: 180px; background: white; display:none;'>
												<input type="text">
											</div>
										</div>
									</div>					                    
								</div>	
								
								<div class="sub-collapsable-div media-section-collapsable-div">
									<img class="rotate-arrow" src="images/blog/eject.png" width="45px">Media
								</div>														
																	
								<div class="media-section">
									<div class="cssload-loader">
										<div class="cssload-inner cssload-one"></div>
										<div class="cssload-inner cssload-two"></div>
										<div class="cssload-inner cssload-three"></div>
									</div>
									
									<div class="link-entry">
										<a href="https://soundcloud.com/lighting-lanterns/lighting-lanterns-wake-up-free-download"></a>
									</div>
									<div class="link-entry">
										<a href="https://soundcloud.com/thrifleganger/sets/southern-skies-motel"></a>
									</div>
								</div>
								
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	
		<div ng-repeat="blog in serverResponse | reverse | filter: searchKeyword" ng-include="getIncludeFile()" repeat-end-directive>
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
				<div class="more-items-to-display" ng-click="getAdditionalDetails()">
					<p>Click for more items</p>
				</div>
			</div>
		</div>
	</div>
	
</div>