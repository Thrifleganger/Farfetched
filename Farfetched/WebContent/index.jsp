<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="description" content="Besides being a flagship interface for Farfetch'd, the website hosts a multitude of tools for ambient music discovery.">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="google-site-verification" content="CADDG3WdKisvZbksAj22vMCiA-dlOlSiysZdljEinfk" />

<link rel="author" href="https://plus.google.com/u/0/b/114086344010413660045/"/>
<link rel="publisher" href="https://plus.google.com/u/0/b/114086344010413660045/"/>
<link rel="shortcut icon" type="image/x-icon" href="images/loader/favicon.ico">


<meta property="og:title" content="Welcome to Farfetch'd, post-rock extraordinaire"/>
<meta property="og:type" content="article"/>
<meta property="og:image" content="http://farfetchd-official.com/images/index/carousel/carousel1.jpg"/>
<meta property="og:url" content="http://www.farfetchd-official.com"/>
<meta property="og:description" content="Besides being a flagship interface for Farfetch'd, this website hosts a multitude of tools for ambient music discovery. Give it a try!"/>


<title>Welcome to Farfetch'd, post-rock extraordinaire.</title>

<link rel="stylesheet" href="css/global.css">

<link rel="stylesheet" href="css/hover.css">

<link rel="stylesheet" href="css/ImageTransform.css">

<link rel="stylesheet" type="text/css" href="slick/slick.css">

<link rel="stylesheet" type="text/css" href="slick/slick-theme.css">

<link rel="stylesheet" type="text/css" href="prettyPhoto/css/prettyPhoto.css">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<script src="slick/slick.js"></script>

<script src="prettyPhoto/js/jquery.prettyPhoto.js"></script>

<script src="https://maps.googleapis.com/maps/api/js"></script>

<script src="http://w.soundcloud.com/player/api.js"></script>

<script src="js/validation.js"></script>



	<% 
		Cookie cookie = null;
		Cookie[] cookies = null;
		boolean exists = false;
		// Get an array of Cookies associated with this domain
		cookies = request.getCookies();
		if( cookies != null ){
		   for (int i = 0; i < cookies.length; i++){
		      cookie = cookies[i];
		      if((cookie.getName( )).compareTo("Farfetchd_first_visit") == 0){
		    	  exists = true;
		      }
		   }
		}
		
		if(!exists){
			cookie = new Cookie("Farfetchd_first_visit","yes");
			response.addCookie(cookie); 
		}
	%>


<script type="text/javascript">



$(document).ready(function(){
	
	
/* 	$('#myCarousel').carousel({
	       interval: 3000
	   }).on('slide', function (e) {
		   alert("wow");
	       var xx = $(this);
	       setTimeout(function() {
	           xx.find('.active').animate({left: "-700px"},3000);
	       } , 0);
	   }); */
    var content = [
        "Initializing awesomeness...",
        "Please wait, this may take a while.",
        "Almost there...",
        "You seriously need to reconsider your internet plan."
    ];
    var msgPtr = 0;

    function change() {
        var newMsg = content[msgPtr];
        $("#changeText").html(newMsg);
        msgPtr++;  msgPtr = (msgPtr % content.length);
    }
	
    change();
    setInterval(change, 10000); 
	   
	   
   	$('#myCarousel').carousel({
	    pause: "false"
	});
   
	$(".navbar").hide();
	$(".album-download").hide();
	$(".lightbox-dark").hide();
	$(".lightbox-bright").hide();
	
	$(".album-custom-buttons .download").click(function() {
		$(".album-download").toggle(600);
	});
	
	$(".album-custom-buttons .buynow").click(function() {
		$(".lightbox-dark").show();
		$(".lightbox-bright").show();
	});
	
	$(".lightbox-dark").click(function() {
		$(".lightbox-bright").hide(600);
		$(".lightbox-dark").hide(600);
	});
	
    var aspectRatio = 1.948;
    var percentage = 300;
    var moveX = -650;
    var setHeight = 500;
    
    function CarouselWidth() {

        var windowsize = $(window).width();
      //  alert("Window size: "+windowsize);
        var height = windowsize/aspectRatio;
      //  alert("Height: "+height.toFixed());
        percentage = (setHeight*100)/height;
      //  alert("Percentage: "+percentage.toFixed());
        moveX = -(((percentage/100)*windowsize)-windowsize);
      //  alert("moveX: "+moveX.toFixed());   
      	window.title = moveX;
        
        $("#myCarousel .carousel-inner img").css("width",percentage+"%");
    }
    	
	
	if(matchMedia){
		var mq = window.matchMedia( "(max-width: 960px)" );
		mq.addListener(ScrollbarChange);
		mq.addListener(CarouselSwipe);
		mq.addListener(CarouselWidth);
		if(mq.matches){		
			CarouselWidth();
			$(window).resize(CarouselWidth);
		}
		ScrollbarChange(mq);
		CarouselSwipe(mq);
	}
	
	
	function CarouselSwipe(mq){
		if(mq.matches){
			$("#myCarousel").bind('slide.bs.carousel', function () {
				
				var $next = $(this).find('.active').next();
				if ($next.length) {
				    $next.animate({left: moveX},4000,"linear");
				}
				else {
				    $(".carousel-inner .item:first").animate({left: moveX},4000,"linear");
				}
				$next.siblings().animate({left: "0px"},0);
			}); 
		}
		else{
			$("#myCarousel").unbind();
			$(".carousel-inner .item").animate({left: "0px"},0);		
		}
	}
	
	function ScrollbarChange(mq){
		
		if(mq.matches){
			$(".navbar").show();
			$('.initial-fixed-header').hide();
		}
		else{
			$('.initial-fixed-header').show();
			$(".navbar").hide();
		}	
		
		$(window).scroll(function() {
			if(mq.matches){
				$(".navbar").show();
				$('.initial-fixed-header').hide();
			}
			else{
				if ($(document).scrollTop() > 600){  
					$('.navbar').show(100);
					$('.initial-fixed-header').hide(400);
				    
					
				}
				else{
				    
				    $('.initial-fixed-header').show(400);
				    $('.navbar').hide(400);
				}
			}
		});
		
	}
	
	//Soundcloud widget control
	var widget = SC.Widget(document.getElementById('soundcloud_widget'));
    widget.bind(SC.Widget.Events.READY, function() {
    	widget.bind(SC.Widget.Events.PLAY, function () {
            // get information about currently playing sound
            widget.getCurrentSound(function (currentSound) {
               $(".soundcloud-button-bay .soundcloud-song-title").html(currentSound.title);
            });
        });
    });
    $('.soundcloud-toggle-button').click(function() {
      widget.toggle();
    });
    
    $('.soundcloud-next-button').click(function() {
        widget.next();
      });
    
    $('.soundcloud-previous-button').click(function() {
        widget.prev();
      });
	
    $('[data-toggle="tooltip"]').tooltip(); 
    
	//Slick Carousel JQuery
	$('.video-carousel').slick({
		  dots: true,
		  speed: 500,
		  centerMode: true,
		  infinite: true,
		  centerPadding: '60px',
		  slidesToShow: 3,
		  responsive: [
		    {
		      breakpoint: 1024,
		      settings: {
		    	  centerMode: true,
		          centerPadding: '40px',
		        slidesToShow: 3,
		        slidesToScroll: 1,
		      }
		    },
		    {
		      breakpoint: 600,
		      settings: {
		    	  centerMode: true,
		          centerPadding: '40px',
		        slidesToShow: 2,
		        slidesToScroll: 1
		      }
		    },
		    {
		      breakpoint: 480,
		      settings: {
		    	  centerMode: true,
		          centerPadding: '40px',
		        slidesToShow: 1,
		        slidesToScroll: 1
		      }
		    }
		  ]
		});
	
	//prettyPhoto lightbox JQuery
	$("a[rel^='prettyPhoto']").prettyPhoto({
		theme: 'light_rounded', /* light_rounded / dark_rounded / light_square / dark_square / facebook */
		social_tools: false,
		deeplinking: false
	});
	
	
	
});


</script>

<script>

$(window).load(function() {
	// Animate loader off screen
	
	$(".black-loader").hide(500);
	var mq = window.matchMedia( "(max-width: 500px)" );
	if(mq.matches){
		$(".carousel-inner .item:first").animate({left: window.title},3000,"linear");
	}
	
	$(".returnNotification").css("display","block");
	$(".returnNotification:empty").hide();
	setTimeout(function() {
	  $(".returnNotification").fadeOut();
	}, 10000);
	
});

var scrollToElement = function(el){
    var speed = 600;
    $('html,body').animate({
        scrollTop: $(el).offset().top
    }, speed);
}
</script>


<!-- <script>
  function initialize() {
    var mapCanvas = document.getElementById('map-canvas');
    var mapOptions = {
      center: new google.maps.LatLng(12.9667, 77.5667),
      zoom: 11,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    var map = new google.maps.Map(mapCanvas, mapOptions)
  }
  google.maps.event.addDomListener(window, 'load', initialize);
</script> -->


<script>

	var latitude = "12.9539974";
	var longitude = "77.6309395";
	var address="";
	function initialize() {
		var myLatlng = new google.maps.LatLng(latitude,longitude);
        var mapCanvas = document.getElementById('map-canvas');
        var mapOptions = {
          center: myLatlng,
          zoom: 16,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        var map = new google.maps.Map(mapCanvas, mapOptions);
        var infowindow = new google.maps.InfoWindow({
            content: address,
            size: new google.maps.Size(150, 50)
        });
        var marker = new google.maps.Marker({
            position: myLatlng,
            map: map       
        });
        google.maps.event.addListener(marker, 'click', function() {
            infowindow.open(map,marker);
        });              
    }
	
	function initializeStart() {
		var myLatlng = new google.maps.LatLng('12.9647875','77.6000405');
        var mapCanvas = document.getElementById('map-canvas');
        var mapOptions = {
          center: myLatlng,
          zoom: 12,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        var map = new google.maps.Map(mapCanvas, mapOptions);
    }
    google.maps.event.addDomListener(window, 'load', initializeStart);

</script>
<s:head theme="simple" />

</head>
<body class="body">
	<div class="black-loader">
		<div class="crow-animation">
			<img src="images/loader/crow_animation6.gif" id="crow-loader">
		</div>
		<div id="changeText"></div>
		<div class="loader-animation">
			<img src="images/loader/giphy.gif" id="loadingbar-loader">
		</div>
	</div>
	
	<div class="initial-fixed-header">
		<p class="customfont image-F" style="font-size: 5em; text-shadow: 1px 1px #000000;">F</p>
		<p class="customfont image-rest" style="font-size: 10em; text-shadow: 1px 1px #000000;">arfetch'd</p>
		
		<div class="social-logo-bay">
			<a href="https://www.facebook.com/farfetchdind"><img src="images/social_buttons/facebook_header_logo.png" width="48px"></a>
			<a href="https://soundcloud.com/thrifleganger"><img src="images/social_buttons/soundcloud_header_logo.png" width="48px"></a>
			<a href="http://farfetchd-official.bandcamp.com/"><img src="images/social_buttons/bandcamp_header_logo.png" width="48px"></a>
			<a href="https://www.youtube.com/user/lmlSeviLNataSlml"><img src="images/social_buttons/youtube_header_logo.png" width="48px"></a>
		</div>
	</div>

	<div class="returnNotification">${returnString}</div>
		
	<!-- Facebook Page Plugin Script -->
	<div id="fb-root"></div>
	<script>(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.3";
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));</script>
	<!-- End of Facebook Page Plugin Script -->
	
	
	
	<jsp:include page="jsp/header.jsp"></jsp:include>

	<div class="soundcloud-button-bay">
		<img class="soundcloud-toggle-button hvr-grow-shadow" src="./images/index/togglebutton.png" data-toggle="tooltip" title="Start/Stop track">
		<div class="extra-options">
			<img class="soundcloud-next-button hvr-grow-shadow" src="./images/index/nextbutton.png" data-toggle="tooltip" title="Next track">	
			<img class="soundcloud-previous-button hvr-grow-shadow" src="./images/index/previousbutton.png" data-toggle="tooltip" title="Previous track">
		</div>
		<p class="soundcloud-song-title"></p>
	</div>

	<div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
        <li data-target="#myCarousel" data-slide-to="4"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img class="first-slide" src="./images/index/carousel/carousel1.jpg" alt="First slide">
        </div>
        <div class="item">
          <img class="second-slide" src="./images/index/carousel/carousel2.jpg" alt="Second slide">
        </div>
        <div class="item">
          <img class="third-slide" src="./images/index/carousel/carousel3.jpg" alt="Third slide">
        </div>
        <div class="item">
          <img class="fourth-slide" src="./images/index/carousel/carousel4.jpg" alt="Fourth slide">
        </div>
        <div class="item">
          <img class="fifth-slide" src="./images/index/carousel/carousel5.jpg" alt="Fifth slide">
          <!-- <div style="position:absolute; right:20%;top:20%;">
          	<iframe width="100%" height="166" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/114879268&amp;color=0066cc&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false"></iframe>
          </div> -->
        </div>
      </div>
      
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
      <a href="javascript:void(0);" onclick="scrollToElement('#album-content');">
      	<img class="scroll-below hvr-grow" src="./images/index/carousel/scrollbelow.png">
      </a>
    </div><!-- /.carousel -->
	
	
	<div class="main-content-area">
		<div class="container">
			<div class="album-content" id="album-content">
				<div class="row">
					<div class="col-md-7">
						
						<div class="row">
							<div class="col-md-5 thumbnail farfetched_album_art hvr-grow" >
  								<img src="images/index/Album_back.jpg" alt="Farfetch'd - The Alchemist" width="100%" height="400px">
							</div>
							<div class="col-md-5"">
								<p class="customfont" style="font-size: 8em;">Farfetch'd</p><hr style="position:relative; top:-30px;" />
								<p class="album-description"><span class="first-letter">T</span>he Alchemist is a 7 track debut album from the post rock band Farfetch'd. Recorded and produced at home, 
								it has a simple blend of progressive guitar melodies and ambient shoegaze touches to get luscious sounds that soothes and inspires simultaneously.
								
								</p>
							</div>							
						</div>
						<div class="album_gallery_thumnail">
							<div class="row">
								<div class="col-md-3">
									<div class="hover_thumbnail"><a href="images/index/Album_release.jpg" rel="prettyPhoto[pp_gal]"><img src="images/index/Album_release.jpg" width="150px" height="100px" alt="Album picture 1" /></a>
									<span><img src="images/index/Album_release.jpg" width="600px" height="450px" alt="Album picture 1" /><br />Farfetch'd - The Alchemist, release poster</span></div>
								</div>
								<div class="col-md-3">
									<div class="hover_thumbnail"><a href="images/index/Album_pic1.JPG" rel="prettyPhoto[pp_gal]"><img src="images/index/Album_pic1.JPG" width="150px" height="100px" alt="Album picture 2" /></a>
									<span><img src="images/index/Album_pic1.JPG" width="600px" height="450px" alt="Album picture 2" /><br />Farfetch'd - The Alchemist, all views</span></div>
								</div>
								<div class="col-md-3">
									<div class="hover_thumbnail"><a href="images/index/Album_pic2.JPG" rel="prettyPhoto[pp_gal]"><img src="images/index/Album_pic2.JPG" width="150px" height="100px" alt="Album picture 3" /></a>
									<span><img src="images/index/Album_pic2.JPG" width="600px" height="450px" alt="Album picture 3" /><br />Farfetch'd - The Alchemist, all views</span></div>
								</div>						
							</div>
						</div>
						
						<div class="album-custom-buttons">
							<div class="row">
								<div class="black-btn download" data-toggle="tooltip" title="Absolutely Free!">Download &nbsp;&nbsp;<span class="glyphicon glyphicon-download-alt"></span></div>
            					<div class="black-btn buynow" data-toggle="tooltip" title="Its only Rs.150 !">Buy Now &nbsp;&nbsp;<span class="glyphicon glyphicon-music"></span></div>
							</div>
						</div>
						
					</div>
					<div class="col-md-5 farfetched_soundcloud">
						<div class="farfetched_soundcloud_div">
							<div style="box-shadow: 0px 2px 10px rgba(0,0,0,0.5);">
							<iframe id="soundcloud_widget" width="100%" height="450" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/playlists/1065490&amp;auto_play=true&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="semi-trans-container album-download">
						<p><span class="first-letter" style="color:black;">W</span>e believe online music should be free and accessible to people. What's the point in having a track dangling around in the expance of the internet and not in people's phones, iPods and car stereos, where it's heard the most.
						Thus, we give you The Alchemist, absolutely free to download, in the audio format of your choice. We only ask that you put them on to your media players, show them to your friends, and trip out on it!</p>
						<p>You've got 2 choice of downloads:</p>
						<hr/>
						<a href="<s:url action="downloadAction">
							<s:param name="downloadId">4</s:param>
						</s:url>"><h4>Direct Download</h4></a>
						<p>Choose this, if you want a hassle free download. It will automatically download a zipped file of the album from our server in the most widely used audio format: MP3 320kbps.
						<br/>
						<h4>Download from Bandcamp<a href="http://farfetchd-official.bandcamp.com/" target="_blank" style="position:relative;left:40px;"><img src="https://s1.bcbits.com/img/buttons/bandcamp_130x27_black.png"></a></h4>
						<p>Are you an audiophile? Are your needs different from the rest? Do you only jizz over lossless audio format? We've got a solution for that. Download the album from Farfetch'd Bandcamp page. 
						Once you reach the Bandcamp page, click on Buy Now, and enter 0 as the amount of money you want to pay. Also, choose this option of download if the above link is broken! 
						 
						
					</div>
				</div>
				
			</div>

			<div class="lightbox-dark"></div>
			
			<div class="lightbox-bright">
				<s:form name="album-purchase" id="album-purchase" onsubmit="return buyNowValidation()" action="productBuyNowEntry" method="post" theme="simple">
					<div class="textual-content">
						<p>If you are considering this, then you are making a valuable contribution to the rather broke and homeless musicians of Farfetch'd. 
						Yes, we have physical copies of The Alchemist for sale, and no, we don't have too many copies left. If you want to get your hands on one of these eloquently elegant, matt-finished, fire breathing, 6 face digipacks...well, you can.
						Although not all the aforementioned adjectives hold true, its a small amount of money to pay for an independent band's merchandise. But there is a catch:
						</p>
						<ul>
							<li>We are not an e-commerce marketplace to have our own net transaction API's enabled on this website, as we already mentioned, we are broke.
							So any transaction needs to happen externally, through net banking and NEFT transaction. And then there is the question of trust. Why should you trust us with your money?
							Well, we shall include our place of residence on the email we shall send, if you comply. So you know where to find us, you can sue us if we don't deliver. And hey, we know we mentioned that we are broke,
							 but we're not petty enough to steal your 150 rupees. Seriously. So go right ahead.</li>
							
							<li>International shipping is waaaay out of our league. So please attempt to buy this album, ONLY if you reside in India.
							</li>
						</ul>
						<p>Alright, since you're still here after reading through a whole lot of garbage, we assume you are genuinely interested. Here's how this is going to work. 
						Please fill out the form below and click on Submit. You will receive an auto-generated email from our side explaining the due process and the account details, to whom you need to pay. 
						Once we receive the funds, which will generally take one working day for NEFT transactions, we will process, package and ship it out to you, along with a formal acknowledgement of the payment reciept. Sound fair?
						</p>
						<br/>
						<hr width="80%" align="center" style="border-top: 1px solid black;">
						
						<table class="product-choose">
							<tr>
								<th>Product</th>
								<th>Description</th>
								<th>Quantity</th>
								<th>Unit Price</th>
							</tr>
							<tr class="product-item">
								<td><s:checkbox name="product-check" id="buynow-album-check" value="true" fieldValue="album"/>
									<img src="images/index/Album_front.jpg" width="100px" >						
								</td>								
								<td><p><b>Farfetch'd - The Alchemist</b></p><p> A full length 7 track, 6 face digipack</p></td>						
								<td><s:textfield id="buynow-quantity" name="quantity" value="1" size="5"/></td>					
								<td>Rs. 150</td>
							</tr>
							
						</table>
						
						<s:hidden name="productId" value="1" />
						<s:hidden name="productName" value="The Alchemist Full Length Album" />
						<s:hidden name="unitPrice" value="150" />
						
						
						<br><hr width="80%" align="center" style="border-top: 1px solid black;"><br>
						
						<div style="inline-block">
						<table class="table1" style="float:left">
							<tr>
								<td><span class="glyphicon glyphicon-user"></span></td>
								<td><s:textfield id="buynow-fname" name="fname" placeholder="First Name" /></td>
							</tr>
							<tr>
								<td><span class="glyphicon glyphicon-user"></span></td>
								<td><s:textfield id="buynow-lname" name="lname" placeholder="Last Name" /></td>
							</tr>
							<tr>
								<td><span class="glyphicon glyphicon-envelope"></span></td>
								<td><s:textfield id="buynow-email" name="email" placeholder="Email ID" /></td>
							</tr>
						</table>
						<table class="table2" style="float:left;">
							<tr>
								<td><span class="glyphicon glyphicon-phone-alt"></span></td>
								<td><s:textfield id="buynow-contact" name="contact" placeholder="Contact Number" /></td>
							</tr>											
							<tr>
								<td><span class="glyphicon glyphicon-screenshot"></span></td>
								<td><s:textfield id="buynow-street" name="street" placeholder="#, Street" /></td>
							</tr>	
							<tr>
								<td><span class="glyphicon glyphicon-road"></span></td>
								<td><s:textfield id="buynow-locality" name="locality" placeholder="Locality" /></td>
							</tr>
						</table>
						<table class="table3" style="float:left;">
							<tr>
								<td><span class="glyphicon glyphicon-map-marker"></span></td>
								<td><s:textfield id="buynow-city" name="city" placeholder="City" /></td>
							</tr>		
							<tr>
								<td><span class="glyphicon glyphicon-pushpin"></span></td>
								<td><s:textfield id="buynow-state" name="state" placeholder="State" /></td>
							</tr>	
							<tr>
								<td><span class="glyphicon glyphicon-qrcode"></span></td>
								<td><s:textfield id="buynow-pincode" name="pincode" placeholder="Pincode" /></td>
							</tr>
						</table>
						</div>
						<table class="table4">
							<tr>
								<td><s:submit class="red-btn" type="submit" name="submit" value="Submit" /></td>
							</tr>
						</table>
					</div>						
				</s:form>
			
			</div>
			
			
			

			<div class="youtube-video-area" id="video-gallery">
				<center><p class="customfont" style="font-size: 6em;">Video Gallery</p></center>
				<div class="row">
					<div class="col-md-1"><img src="images/index/arrow_left_grey.png" width="30px" style="float:right; position:relative; top:115px;"></div>
			    	<div class="col-md-10 video-carousel-container" >
				    	<div class="video-carousel">
				    		<div class="image-transform">
								<img src="images/index/Video_gallery/video7.jpg" width="250px" height="170px" alt="Farfetch'd - Volatile (Live @ The Big Pitcher)" />
								<div class="mask">
						              <a href="https://www.youtube.com/watch?v=QmQMByCM0UY" rel="prettyPhoto" title=""><img src="images/index/play_button_2.png" width="50%" style="position:relative;left:25%;"/></a>
						              <p style="vertical-align:middle;">Farfetch'd - The Alchemist (Live @ The Big Pitcher)</p>
						        </div>
							</div>
							<div class="image-transform">
								<img src="images/index/Video_gallery/video8.jpg" width="250px" height="170px" alt="Farfetch'd - The Alchemist (Live @ The Big Pitcher)" />
								<div class="mask">
						              <a href="https://www.youtube.com/watch?v=QmQMByCM0UY" rel="prettyPhoto" title=""><img src="images/index/play_button_2.png" width="50%" style="position:relative;left:25%;"/></a>
						              <p style="vertical-align:middle;">Farfetch'd - Volatile (Live @ The Big Pitcher)</p>
						        </div>
							</div>
				    		<div class="image-transform">
								<img src="images/index/Video_gallery/video1.jpg" width="250px" height="170px" alt="Southern Skies Motel - The Lunar Observatory (Playthrough)" />
								<div class="mask">
						              <a href="https://www.youtube.com/watch?v=HX3hyk6s_Sk" rel="prettyPhoto" title=""><img src="images/index/play_button_2.png" width="50%" style="position:relative;left:25%;"/></a>
						              <p style="vertical-align:middle;">Southern Skies Motel - The Lunar Observatory (Playthrough)</p>
						        </div>
							</div>
							<div class="image-transform">
								<img src="images/index/Video_gallery/video2.jpg" width="250px" height="170px" alt="The Allman Brothers Band - Blue Sky (Solo Cover)" />
								<div class="mask">
						              <a href="https://www.youtube.com/watch?v=4pTCtoOH0Dc" rel="prettyPhoto" title=""><img src="images/index/play_button_2.png" width="50%" style="position:relative;left:25%;"/></a>
						              <p style="vertical-align:middle;">The Allman Brothers Band - Blue Sky (Solo Cover)</p>
						        </div>
							</div>
							<div class="image-transform">
								<img src="images/index/Video_gallery/video3.jpg" width="250px" height="170px" alt="Farfetch'd Random Jam" />
								<div class="mask">
						              <a href="https://www.youtube.com/watch?v=2V6GfZwYlds" rel="prettyPhoto" title=""><img src="images/index/play_button_2.png" width="50%" style="position:relative;left:25%;"/></a>
						              <p style="vertical-align:middle;">Farfetch'd Random Jam on the song Volatile at Inner Space Studios</p>
						        </div>
							</div>
							<div class="image-transform">
								<img src="images/index/Video_gallery/video4.jpg" width="250px" height="170px" alt="Farfetch'd - Inert, Live @ Phoenix MarketCity." />
								<div class="mask">
						              <a href="https://www.youtube.com/watch?v=vZAV4zBQG58" rel="prettyPhoto" title=""><img src="images/index/play_button_2.png" width="50%" style="position:relative;left:25%;"/></a>
						              <p style="vertical-align:middle;">Farfetch'd - Inert, Live @ Phoenix MarketCity. Farfetch'd playing a 2 hour set at Phoenix MarketCity, Bangalore on May 5, 2014.</p>
						        </div>
							</div>
							<div class="image-transform">
								<img src="images/index/Video_gallery/video5.jpg" width="250px" height="170px" alt="Kaki King - Bari Improv's cover" />
								<div class="mask">
						              <a href="https://www.youtube.com/watch?v=L5JE1aUP01Q" rel="prettyPhoto" title=""><img src="images/index/play_button_2.png" width="50%" style="position:relative;left:25%;"/></a>
						              <p style="vertical-align:middle;">Kaki King - Bari Improv's cover from August Rush</p>
						        </div>
							</div>
							<div class="image-transform">
								<img src="images/index/Video_gallery/video6.jpg" width="250px" height="170px" alt="All India Fingerstyle Competition Entry" />
								<div class="mask">
						              <a href="https://www.youtube.com/watch?v=ErpWioYwndE" rel="prettyPhoto" title=""><img src="images/index/play_button_2.png" width="50%" style="position:relative;left:25%;"/></a>
						              <p style="vertical-align:middle;">All India Fingerstyle Competition Entry 2 - Akash Murthy</p>
						        </div>
							</div>
				    	</div>          
				    </div>
				    <div class="col-md-1"><img src="images/index/arrow_right_grey.png" width="30px" style="position:relative; top:115px; z-index:1;"></div>
				</div>
			</div>

			<div class="space-seperator"></div>
			<div class="row" id="gigs-section">
			<div class="plugin-map-content-area">
				
					<div class="col-md-5">
						<div class="facebook-page-plugin">
							<div style="box-shadow: 0px 2px 10px rgba(0,0,0,0.5);" class="fb-page" data-href="https://www.facebook.com/farfetchdind" data-width="450" data-hide-cover="false" data-show-facepile="true" data-show-posts="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/farfetchdind"><a href="https://www.facebook.com/farfetchdind">Farfetch&#039;d</a></blockquote></div></div>
						</div>
						<div class="subscription-email" id="subscription-email">
							<p>Subscribe to our mailing list</p>							
							<s:form onsubmit="return subscriptionEmailValidation()" action="userEmailSubscriptionEntry" method="post" theme="simple">
								<!-- <input type="text"  id="email" placeholder="peter.griffin@gmail.com">
								<input type="submit" id="submit" value="Subscribe!"> -->
								<s:textfield id="email" name="email" placeholder="peter.griffin@gmail.com" />
					            <s:submit id="submit" value="Subscribe!"/>
							</s:form>
						</div>						
					</div>
					<div class="col-md-1"></div>
					<div class="col-md-6 upcoming-events">
						<div id="map-canvas"></div>
						
						<div class="gig-tab-structure" >
							<ul class="nav nav-tabs">
							  <li class="active"><a href="#tab_a" data-toggle="tab">Previous Gigs</a></li>
							  <li><a href="#tab_b" data-toggle="tab">Upcoming Gigs</a></li>
							</ul>
							<div class="tab-content">
							        <div class="tab-pane fade active in" id="tab_a">
							            
							            <div class="panel-group" id="accordion">
							            
							            	<!--  Hard Rock Gig  -->
									        <div class="panel panel-default">
									            <div class="panel-heading" data-toggle="collapse" data-parent="#accordion" onclick="address='Hard Rock Cafe';latitude='12.9761018';longitude='77.6014841'; initialize();" href="#collapseSeven">
									                <h4 class="panel-title">
									                    <div>
									                    	<strong>Hard Rock Cafe (Hornbill prelims)</strong>
									                    	<div class="date-box" style="float: right;">
														    	<div class="day-element">Thur</div>
														    	<div class="date-element">October 15</div>
														    </div>	
									                    </div>									                  
									                </h4>
									            </div>
									            <div id="collapseSeven" class="panel-collapse collapse">
									                <div class="panel-body">
									                	<p><strong>Where:</strong> Hard Rock Cafe, St. Marks Road, Bangalore</p>
									                	<p><strong>When:</strong> 7PM - 15th October, 2015
									                	<p><strong>Who:</strong> <a href="https://www.facebook.com/farfetchdind" target="_blank">Farfetch'd</a>, <a href="https://www.facebook.com/greyshack" target="_blank">Grey Shack</a>, <a href="https://www.facebook.com/blackletters" target="_blank">Black Letters</a>, <a href="https://www.facebook.com/shepherdrock" target="_blank">Shepard</a>, <a href="https://www.facebook.com/peepaltreeofficial" target="_blank">Peepal Tree</a> 
									                	<p><strong>How much:</strong> Entry Rs100 + Rs 500 full cover
									                    <p>This is the South zone prelims of the Hornbill Internation Music Festival, an annual event that happens in Nagaland. The winner here gets an all expense paid visit to perform at the festival. We cannot wait to play at Hard Rock. Competition aside, it'll just be an absolute joy to play alongside the best of the southern bands in India.</p>
									                	<a href="https://www.facebook.com/events/1469807053326954/1473135612994098/" target="_blank"><div class="red-btn">RSVP Here!</div></a>
									                </div>
									            </div>
									        </div>
									        
							            
							            	<!--  Humming Tree Jamathon Gig  -->
									        <div class="panel panel-default">
									            <div class="panel-heading" data-toggle="collapse" data-parent="#accordion" onclick="address='The Humming Tree';latitude='12.970237';longitude='77.639132'; initialize();" href="#collapseSix">
									                <h4 class="panel-title">
									                    <div>
									                    	<strong>Farfetch'd Live @ The Humming Tree</strong>
									                    	<div class="date-box" style="float: right;">
														    	<div class="day-element">Tue</div>
														    	<div class="date-element">October 13</div>
														    </div>	
									                    </div>									                  
									                </h4>
									            </div>
									            <div id="collapseSix" class="panel-collapse collapse">
									                <div class="panel-body">
									                	<p><strong>Where:</strong> The Humming Tree, Old Airport Road, Bangalore</p>
									                	<p><strong>When:</strong> 8PM - 13th October, 2015
									                	<p><strong>Who:</strong> <a href="https://www.facebook.com/farfetchdind" target="_blank">Farfetch'd</a>, <a href="https://www.facebook.com/progressivejuice" target="_blank">Pineapple Express</a>, <a href="https://www.facebook.com/BRIMRIVERBRIDGE" target="_blank">Brim River Bride</a> 
									                	<p><strong>How much:</strong> Free
									                    <p>The Jamathon Tuesdays have been shifted to The Humming Tree, and the venue, like always, is a treat to play at! This is our 2nd edition at Jamathon. Come by and chill with us on the night, along with 2 very talented bands from the city.</p>
									                	<a href="https://www.facebook.com/events/955414927838672/" target="_blank"><div class="red-btn">RSVP Here!</div></a>
									                </div>
									            </div>
									        </div>

											<!--  BFlat Gig  -->
									        <div class="panel panel-default" >
									            <div class="panel-heading" data-toggle="collapse" data-parent="#accordion" onclick="address='BFlat';latitude='12.9688203';longitude='77.6409875'; initialize();" href="#collapseFive">
									                <h4 class="panel-title">
									                    <div>
									                    	<strong>Farfetch'd Live @ BFlat</strong>
									                    	<div class="date-box" style="float: right;">
														    	<div class="day-element">Sat</div>
														    	<div class="date-element">August 8</div>
														    </div>	
									                    </div>									                  
									                </h4>
									            </div>
									            <div id="collapseFive" class="panel-collapse collapse">
									                <div class="panel-body">
									                	<p><strong>Where:</strong> BFlat, 100 Feet Road, Indira Nagar</p>
									                	<p><strong>When:</strong> 9:30PM - 8th August, 2015
									                	<p><strong>Who:</strong> <a href="https://www.facebook.com/farfetchdind" target="_blank">Farfetch'd</a>, <a href="https:/www.facebook.com/aswekeepsearching" target="_blank">aswekeepsearching</a>, <a href="https://www.facebook.com/greymatterbangalore" target="_blank">Grey Matter</a>
									                	<p><strong>How much:</strong> Rs.500 (Rs 150 redeemable)
									                    <p>After quite a long break, we are in the spotlights again, this time with 2 amazing bands. Post rock gaints from Ahmedabad, aswekeepsearching are organizing this gig with Bflat, sponsered by Rolling Stones India, and are raising money for album #2. Grey Matter, a hard rock band from Bangalore are releasing their new EP on the same night. You don't want to miss this! </p>
									                	<a href="https://www.facebook.com/events/1466267487029203/" target="_blank"><div class="red-btn">RSVP Here!</div></a>
									                </div>
									            </div>
									        </div>
											
											<!--  Humming Tree Gig  -->
									        <div class="panel panel-default">
									            <div class="panel-heading" data-toggle="collapse" data-parent="#accordion" onclick="address='The Humming Tree';latitude='12.970237';longitude='77.639132'; initialize();" href="#collapseFour">
									                <h4 class="panel-title">
									                    <div>
									                    	<strong>Farfetch'd Live @ The Humming Tree</strong>
									                    	<div class="date-box" style="float: right;">
														    	<div class="day-element">Sat</div>
														    	<div class="date-element">May 23</div>
														    </div>	
									                    </div>									                  
									                </h4>
									            </div>
									            <div id="collapseFour" class="panel-collapse collapse">
									                <div class="panel-body">
									                	<p><strong>Where:</strong> The Humming Tree, Old Airport Road, Bangalore</p>
									                	<p><strong>When:</strong> 9:30PM - 23rd May, 2015
									                	<p><strong>Who:</strong> <a href="https://www.facebook.com/farfetchdind" target="_blank">Farfetch'd</a>, <a href="https://www.facebook.com/koniacnet" target="_blank">The Koniac Net</a>
									                	<p><strong>How much:</strong> Free
									                    <p>This is it! The motherload of all gigs. We finally get a shot at The Humming Tree. And better yet, we open for the much awaited Koniac Net, all the way from Mumbai. And better yet, its free! </p>
									                	<a href="https://www.facebook.com/events/1572870452973632/" target="_blank"><div class="red-btn">RSVP Here!</div></a>
									                </div>
									            </div>
									        </div>

											<!--  Big Pitcher Gig  -->
									        <div class="panel panel-default">
									            <div class="panel-heading" data-toggle="collapse" data-parent="#accordion" onclick="address='Big Pitcher';latitude='12.960181';longitude='77.646849'; initialize();" href="#collapseThree">
									                <h4 class="panel-title">
									                    <div>
									                    	<strong>Farfetch'd Live @ Big Pitcher</strong>
									                    	<div class="date-box" style="float: right;">
														    	<div class="day-element">Tue</div>
														    	<div class="date-element">May 19</div>
														    </div>	
									                    </div>									                  
									                </h4>
									            </div>
									            <div id="collapseThree" class="panel-collapse collapse">
									                <div class="panel-body">
									                	<p><strong>Where:</strong> Big Pitcher, Old Airport Road, Bangalore</p>
									                	<p><strong>When:</strong> 9PM - 19th May, 2015
									                	<p><strong>Who:</strong> <a href="https://www.facebook.com/farfetchdind" target="_blank">Farfetch'd</a>, <a href="https://www.facebook.com/thetroopersband" target="_blank">The Troopers</a>
									                	<p><strong>How much:</strong> Free
									                    <p>2 days after The Warehouse gig, we are invited to play a version of Jamathon at Big Pitcher by the same organizer who got us the previous gig, <a href="https://www.facebook.com/suman.chalamcharla" target="_blank">Suman</a>. We share the stage with The Troopers again, and this time, the gig would be recorded, so come by and cheer for the cameras. </p>
									                	<a href="https://www.facebook.com/events/863772243710450/" target="_blank"><div class="red-btn">RSVP Here!</div></a>
									                </div>
									            </div>
									        </div>
									        
											<!--  Warehouse Gig  -->
									        <div class="panel panel-default">
									            <div class="panel-heading" data-toggle="collapse" data-parent="#accordion" onclick="address='The Warehouse';latitude='12.975181';longitude='77.647054'; initialize();" href="#collapseOne">
									                <h4 class="panel-title">
									                    <div>
									                    	<strong>Farfetch'd Live @ The Warehouse</strong>
									                    	<div class="date-box" style="float: right;">
														    	<div class="day-element">Sat</div>
														    	<div class="date-element">May 16</div>
														    </div>	
									                    </div>									                  
									                </h4>
									            </div>
									            <div id="collapseOne" class="panel-collapse collapse">
									                <div class="panel-body">
									                	<p><strong>Where:</strong> The Warehouse, 80 Feet Road, Indra Nagar, Bangalore</p>
									                	<p><strong>When:</strong> 9PM - 16th May, 2015
									                	<p><strong>Who:</strong> <a href="https://www.facebook.com/farfetchdind" target="_blank">Farfetch'd</a>, <a href="https://www.facebook.com/thetroopersband" target="_blank">The Troopers</a>, <a href="https://www.facebook.com/anupacoustichiphop" target="_blank">Anup</a>
									                	<p><strong>How much:</strong> Free
									                    <p>We play live at The Warehouse for the first time. We play an extended set of an hour, along with a rock and roll band called The Troopers on 16th May, 2015. Entry is free.</p>
									                	<a href="https://www.facebook.com/events/1597170467167318/" target="_blank"><div class="red-btn">RSVP Here!</div></a>
									                </div>
									            </div>
									        </div>
									        
									        <!--  Opus Gig  -->
									        <div class="panel panel-default">
									            <div class="panel-heading" data-toggle="collapse" data-parent="#accordion" onclick="address='Opus';latitude='12.997156';longitude='77.585188'; initialize();" href="#collapseTwo">
									                <h4 class="panel-title">
									                    <div >
									                    	<strong>Farfetch'd Live @ Opus</strong>
									                    	<div class="date-box" style="float: right;">
														    	<div class="day-element">Thur</div>
														    	<div class="date-element">April 9</div>
														    </div>	
									                    </div>									                  
									                </h4>
									            </div>
									            <div id="collapseTwo" class="panel-collapse collapse">
									                <div class="panel-body">
									                    <p><strong>Where:</strong> Opus, Palace Cross Road, Palace Orchards, Bangalore</p>
									                	<p><strong>When:</strong> 9PM - 9th April, 2015
									                	<p><strong>Who:</strong> <a href="https://www.facebook.com/farfetchdind" target="_blank">Farfetch'd</a>, <a href="https://www.facebook.com/BrokenMembrane.theband" target="_blank">Broken Membrane</a>, <a href="">Traffic Blues</a>
									                	<p><strong>How much:</strong> Free
									                    <p>This is our first gig with the new line up. Exciting times! We play at Opus and share the stage with the friendly folks from Broken Membrane. This gig is part of <a href="https://www.facebook.com/sachin.vijayapuram" target="_blank">Sachin's</a> Thursday's Amplfied initiative of getting bands on stage every alternate Thursdays. We plan on playing a half an hour set.</p>
									                    <a href="https://www.facebook.com/events/764071107034210/" target="_blank"><div class="red-btn">RSVP Here!</div></a>
									                </div>
									            </div>
									        </div>
									        
									    </div> 
							        </div>
							        
							        <div class="tab-pane fade" id="tab_b">
							        
							        	<!-- <div class="panel-group" id="accordion">
							        	</div> -->	
									        									       
							            <p style="padding:50px;padding-bottom:10px;">Hey, we do not have any gigs lined. Check back in a while. If you are an event manager, hire us maybe?</p>
							            <div class="red-btn bookus" style="position:relative;left:40%;margin-bottom:30px;">Book Us</div>
							        </div>
							</div>
						</div>
						
					</div>						
				</div>			
			</div>
			
		</div>
	</div>
	
	<jsp:include page="jsp/footer.jsp"></jsp:include>
	
	<!-- Google Analytics -->
	<script>
	  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
	
	  ga('create', 'UA-64685188-1', 'auto');
	  ga('send', 'pageview');
	
	</script>
	
	
</body>
	

	<%
		if(!exists){
	%>
			<script type="text/javascript">
				$(".footer a").each(function(){
					if($(this).attr("href") != "javascript:void(0);")
						$(this).attr("target","_blank");					
				});
				
				$("#navbar a").each(function(){
					if($(this).attr("href") != "javascript:void(0);")
						$(this).attr("target","_blank");
				});
				
				$(".header a").prop("target","_blank");
			</script>
			
	<%
		}
		else{
	%>
			<script type="text/javascript">
				$(".farfetched_soundcloud_div iframe").attr("src","https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/playlists/1065490&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true")
			</script>
	<%
		}
	%>		

</html>