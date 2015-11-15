<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<style>
.cse .gsc-control-cse, .gsc-control-cse {
    padding: 0em;
    width: auto;
}

.gsc-control-cse {
    background-color: rgba(0, 0, 0, 0);
    border-color: rgba(0, 0, 0, 0);
    font-family: Arial,sans-serif;
}

.gsc-control-cse .gsc-search-box{
	display: none;
}
</style>

<script>
	$(document).ready(
			function() {

				$(".contact-lightbox-dark").hide();
				$(".contact-lightbox-bright").hide();

				$(".bookus-lightbox-dark").hide();
				$(".bookus-lightbox-bright").hide();

				//For Contact Lightbox
				$(".contactus").click(function() {
					$(".bookus-lightbox-dark").hide();
					$(".bookus-lightbox-bright").hide();

					$(".contact-lightbox-dark").show();
					$(".contact-lightbox-bright").show();
				});

				$(".contact-lightbox-dark").click(function() {
					$(".contact-lightbox-bright").hide(600);
					$(".contact-lightbox-dark").hide(600);
				});

				//For Booking lightbox
				$(".bookus").click(function() {
					$(".contact-lightbox-dark").hide();
					$(".contact-lightbox-bright").hide();

					$(".bookus-lightbox-dark").show();
					$(".bookus-lightbox-bright").show();
				});

				$(".bookus-lightbox-dark").click(function() {
					$(".bookus-lightbox-bright").hide(600);
					$(".bookus-lightbox-dark").hide(600);
				});

				var path = '${pageContext.request.requestURI}';
				var navElements = [ "home", "gallery", "discover", "contactus",
						"bookus" ];

				for ( var count = 0; count < navElements.length; count++) {
					var pattern = new RegExp(navElements[count], "g");
					if (pattern.test(path)) {
						$('.navbar-nav #' + navElements[count]).addClass(
								"active");
						$('.navbar-nav #' + navElements[count]).siblings()
								.removeClass("active");
					}
				}

				if (/index/i.test(path)) {
					$('.navbar-nav #home').addClass("active");
					$('.navbar-nav #home').siblings().removeClass("active");
				}

			});
</script>

<script>
	var scrollToElement = function(el) {

		var path = window.location.href;

		var domain = path.substring(0, path.lastIndexOf("/"));

		if (!(/index/i.test(path))) {
			window.location = domain + '/index' + el;
		}
		var speed = 600;
		$('html,body').animate({
			scrollTop : $(el).offset().top
		}, speed);
	}
</script>

<style>
@media ( min-width : 979px) {
	ul.nav li.dropdown:hover>ul.dropdown-menu {
		display: block;
	}
}

.form-control {
	max-width: 180px;
}
</style>

</head>
<body>



	<!-- Facebook Like Script -->
	<div id="fb-root"></div>
	<script>
		(function(d, s, id) {
					var js, fjs = d.getElementsByTagName(s)[0];
					if (d.getElementById(id))
						return;
					js = d.createElement(s);
					js.id = id;
					js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.3";
					fjs.parentNode.insertBefore(js, fjs);
				}(document, 'script', 'facebook-jssdk'));
	</script>
	<!-- End of Facebook Like Script -->



	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index"><p class="customfont"
					style="font-size: 3em;">Farfetch'd</p></a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li class="active dropdown"><a href="index"
					class="dropdown-toggle" role="button">Home</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="javascript:void(0);"
							onclick="scrollToElement('#album-content');">The Alchemist</a></li>
						<li><a href="javascript:void(0);"
							onclick="scrollToElement('#video-gallery');">Videos</a></li>
						<li><a href="javascript:void(0);"
							onclick="scrollToElement('#gigs-section');">Upcoming gigs</a></li>
					</ul></li>
				<li class="divider"></li>
				<li id="discover"><a href="discover">Discover</a></li>
				<li id="gallery"><a href="gallery">Gallery</a></li>
				<li id="contactus"><a href="javascript:void(0);"
					class="contactus">Contact Us</a></li>
				<li id="bookus"><a href="javascript:void(0);" class="bookus">Book
						Us</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li>
					<div class="fb-like"
						data-href="https://www.facebook.com/farfetchdind"
						data-layout="button_count" data-action="like"
						data-show-faces="true" data-share="false"></div>
				</li>
				<li>
					<form class="navbar-form" id="cse-search-box" target="_blank">
						<input name="cx" type="hidden"
							value="006410266361401141530:mojjygsx7z4" /> <input name="ie"
							type="hidden" value="UTF-8" /> <input type="text" name="q"
							class="form-control" placeholder="Search">
						<button type="submit" class="btn btn-default" name="sa">
							<i class="glyphicon glyphicon-search"></i>
						</button>
					</form>
				</li>
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
	</nav>

	<div class="contact-lightbox-dark" style="display: none;"></div>

	<div class="contact-lightbox-bright" style="display: none;">
		<div class="textual-content">
			<p class="customfont">Contact Us</p>
			<p>Do you want to book the band? Or report a bug? Do you want to
				complain about how over-compressed the mix is, or discuss the
				possiblities of our drummer being gay? Do you want to just say
				'Hey!', or spread hate mail cos you've smoked your youth away and
				feel unaccomplished? Or do you just want to preach about Our Savior
				and Lord Jesus? Whatever you're catch maybe, we'd love to hear from
				you. So don't be shy, drop us a mail and we'll get back to you!</p>

			<s:form name="contact-us-form" id="contact-us-form"
				onsubmit="return contactFormValidation()" action="contactUsEntry"
				method="post" theme="simple">
				<table>
					<tr>
						<td><s:textfield id="contact-name" name="name"
								placeholder="Peter Griffin" data-toggle="tooltip"
								title="Your name" /></td>
					</tr>
					<tr>
						<td><s:textfield id="contact-email" name="email"
								placeholder="peter.griffin@gmail.com" data-toggle="tooltip"
								title="Your email ID" /></td>
					</tr>
					<tr>
						<td><s:textfield id="contact-number" name="number"
								placeholder="9645128008" data-toggle="tooltip"
								title="Your phone number (optional)" /></td>
					</tr>
					<tr>
						<td><s:textarea id="contact-description" name="description"
								placeholder="Everybody knows that the bird is the word..."
								rows="6" cols="" data-toggle="tooltip" title="Your thang.." />
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

	<div class="bookus-lightbox-dark" style="display: none;"></div>

	<div class="bookus-lightbox-bright" style="display: none;">
		<div class="textual-content">
			<p class="customfont">Book Us</p>
			<h3>Why Should you hire us?</h3>
			<hr width="80%" align="center" style="border-top: 1px solid black;">
			<ul>
				<li>We play a mix of ambient space rock which fills and livens
					up the entire venue. Seriously, give us a try.</li>
				<li>We have an hour's set list and constantly expanding.</li>
				<li>We are a 3 peice band, and we aren't expensive to hire.</li>
				<li>We need minimal stage gear. We bring our own in-ear
					monitoring systems, live-looping station and audio interface.</li>
				<li>We are well behaved, on time and are insusceptible to
					drunken endevours.</li>
			</ul>
			<hr width="80%" align="center" style="border-top: 1px solid black;">
			<p>Go ahead and download the following content, which includes
				the band's info, pictures, and a brief technical rider.</p>
			
			 <s:url id="fileDownload" namespace="/jsp" action="download"></s:url>
			
			<div class="container button-container">
				<a href="<s:url action="downloadAction">
							<s:param name="downloadId">1</s:param>
						</s:url>"><div class="red-btn">Presskit documentation</div></a>

				<a href="<s:url action="downloadAction">
							<s:param name="downloadId">2</s:param>
						</s:url>"><div class="red-btn">Promotion pictures</div></a>

				<a href="<s:url action="downloadAction">
							<s:param name="downloadId">3</s:param>
						</s:url>"><div class="red-btn">Technical Rider</div></a>
			</div>


			<s:form name="book-us-form" id="book-us-form"
				onsubmit="return bookUsFormValidation()" action="bookUsEntry"
				method="post" theme="simple">
				<table>
					<tr>
						<td><s:textfield id="bookus-name" name="name"
								placeholder="Woodstock" data-toggle="tooltip"
								title="The venue you represent" /></td>
					</tr>
					<tr>
						<td><s:textfield id="bookus-email" name="email"
								placeholder="chester.gigginton@gmail.com" data-toggle="tooltip"
								title="Your email ID" /></td>
					</tr>
					<tr>
						<td><s:textfield id="bookus-number" name="number"
								placeholder="9645128008" data-toggle="tooltip"
								title="Your phone number" /></td>
					</tr>
					<tr>
						<td><s:textarea id="bookus-description" name="description"
								placeholder="Hey, I can't believe we haven't hired you already..."
								rows="6" cols="" data-toggle="tooltip"
								title="Leave us a message" /></td>
					</tr>
					<tr>
						<td><s:submit class="red-btn" id="submit" name="submit"
								value="Submit" /></td>
					</tr>
				</table>
			</s:form>

			<p class="customfont">Or</p>
			<h3>Contact us directly, below</h3>
			<hr width="80%" align="center" style="border-top: 1px solid black;">
			<div class="container">
				<div class="row">
					<div class="col-md-3">
						<p>
							<b>Akash Murthy</b>
						</p>
						<p>akash@farfetchd-official.com</p>
						<p>+91-9663831831</p>
					</div>
					<div class="col-md-3"></div>

				</div>
			</div>

		</div>
	</div>


	<div>
				<script>
				  (function() {
				    var cx = '006410266361401141530:mojjygsx7z4';
				    var gcse = document.createElement('script');
				    gcse.type = 'text/javascript';
				    gcse.async = true;
				    gcse.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') +
				        '//cse.google.com/cse.js?cx=' + cx;
				    var s = document.getElementsByTagName('script')[0];
				    s.parentNode.insertBefore(gcse, s);
				  })();
				</script>
				<gcse:search></gcse:search>
			</div>


</body>
</html>