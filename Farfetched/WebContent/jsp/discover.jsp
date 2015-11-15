<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">


<meta property="og:title" content="Discover ambience"/>
<meta property="og:type" content="article"/>
<meta property="og:image" content="http://farfetchd-official.com/images/index/carousel/carousel2.jpg"/>
<meta property="og:url" content="http://www.farfetchd-official.com/discover"/>
<meta property="og:description" content="Discover ambience, from Indian bands of old and new. "/>

<title>Discover Post-rock</title>

<link type='text/css' rel="stylesheet" href="css/global.css">

<link rel="stylesheet" href="css/hover.css">

<link rel="stylesheet" href="css/ImageTransform.css">

<link rel="stylesheet" type="text/css"
	href="prettyPhoto/css/prettyPhoto.css">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<script src="prettyPhoto/js/jquery.prettyPhoto.js"></script>

<style type="text/css">
</style>

<script type="text/javascript">
	$(document)
			.ready(
					function() {

						//prettyPhoto lightbox JQuery
						$("a[rel^='prettyPhoto']").prettyPhoto({
							theme : 'light_rounded', /* light_rounded / dark_rounded / light_square / dark_square / facebook */
							social_tools : false,
							deeplinking: false
						});

						$('.discover-gallery div')
								.on(
										'click',
										function() {

											var mushroomlake_cloud = '<iframe width="100%" height="200" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/176844447&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>';
											var aswekeepsearching_cloud = '';
											var band = $(this).attr('id');
											$('.tear-effect').show();
											$('.tear-effect-inverted').show();
											$('#' + band + '-desc').siblings()
													.hide();
											$('#' + band + '-desc').show();
											$('html,body')
													.animate(
															{
																scrollTop : $(
																		'.discover-body-dark')
																		.offset().top
															}, 600);

											$('.' + band + '-soundcloud-song')
													.replaceWith(
															chooseBand(band));
										});

						function chooseBand(band) {
							if (band === 'mushroomlake') {
								return '<iframe width="100%" height="200" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/176844447&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>';
							} else if (band === 'aswekeepsearching') {
								return '<iframe width="100%" height="200" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/134007981&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>';
							} else if (band == 'untilwelast') {
								return '<iframe width="100%" height="200" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/153567981&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>';
							} else if (band == 'ioish') {
								$('.ioish-soundcloud-song:first')
										.replaceWith(
												'<iframe width="100%" height="200" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/113509578&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>');
								return '<iframe width="100%" height="200" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/57022989&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>';
							} else if(band == 'stuckinnovember') {
								return '<iframe width="100%" height="200" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/152640951&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>';
							} else if(band == 'sulkstation') {
								return '<iframe width="100%" height="200" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/38251966&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>';
							} else if(band == 'frameframe') {
								return '<iframe width="100%" height="200" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/114522013&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>';
							} else if(band == 'pangea') {
								return '<iframe width="100%" height="200" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/27254577&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>';
							} else if(band == 'pmoc') {
								return '<iframe width="100%" height="200" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/73517242&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>';
							} else if(band == 'eternaltwilight') {
								return '<iframe width="100%" height="200" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/179558545&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>';
							} else if(band == 'sbtyr') {
								return '<iframe width="100%" height="200" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/167634346&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>';
							} else if(band == 'amutualquestion') {
								return '<iframe width="100%" height="200" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/102808380&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>';
							} else if(band == 'zokova') {
								return '<iframe width="100%" height="200" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/118973192&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>';
							} else if (band == 'twistedperspective') {
								$('.twistedperspective-soundcloud-song:first')
								.replaceWith(
										'<iframe width="100%" height="200" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/135276507&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>');
								return '<iframe width="100%" height="200" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/221291500&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>';
							} else if(band == 'celestialteapot') {
								return '<iframe width="100%" height="200" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/178292372&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>';
							} 
						}

					});

	var scrollToEl
</script>

</head>

<body class="discover-body">
	<div class="discover-body-green">

		<jsp:include page="header.jsp"></jsp:include>

		<div class="discover-gallery container">

			<p class="customfont">Farfetch'd and all his friends</p>
			<div id="mushroomlake"
				style="background-color: black; width: 450px; height: 500px; float: left;">
				<img src="images/discover/mushroom2.jpg" alt="Mushroom Lake"
					width="100%" height="100%">
				<p>Mushroom Lake</p>
			</div>

			<div id="aswekeepsearching"
				style="background-color: black; width: 330px; height: 250px; float: left;">
				<img src="images/discover/aswekeepsearching.jpg"
					alt="As We Keep Searching" width="100%">
				<p>As We Keep Searching</p>
			</div>

			<div id="untilwelast"
				style="background-color: black; width: 330px; height: 250px; float: left;">
				<img src="images/discover/untilwelast1.jpg" alt="Until We Last"
					width="100%">
				<p>Until We Last</p>
			</div>

			<div id="ioish"
				style="background-color: black; width: 670px; height: 240px; float: left;">
				<img src="images/discover/ioish.png" alt="Ioish" width="100%"
					style="position: relative; top: -220px">
				<p>Ioish</p>
			</div>

			<div id="stuckinnovember"
				style="background-color: black; width: 300px; height: 450px; float: left;">
				<img src="images/discover/stuckinnovember.jpg"
					alt="Stuck In November" width="100%">
				<p>Stuck In November</p>
			</div>

			<div id="sulkstation"
				style="background-color: black; width: 200px; height: 150px; float: left;">
				<img src="images/discover/sulkstation1.jpg" alt="Sulk Station"
					width="100%">
				<p>Sulk Station</p>
			</div>

			<div id="frameframe"
				style="background-color: black; width: 200px; height: 150px; float: left;">
				<img src="images/discover/frame.jpg" alt="Frame/Frame" width="100%">
				<p>Frame / Frame</p>
			</div>

			<div id="loungepiranha"
				style="background-color: black; width: 200px; height: 150px; float: left;">
				<img src="images/discover/loungepiranha2.jpg" alt="Lounge Piranha"
					width="100%">
				<p>Lounge Piranha</p>
			</div>

			<div id="pangea"
				style="background-color: black; width: 190px; height: 150px; float: left;">
				<img src="images/discover/pangea.jpg" alt="Pangea" width="100%">
				<p>Pangea</p>
			</div>

			<div id="pmoc"
				style="background-color: black; width: 820px; height: 290px; float: left;">
				<img src="images/discover/pmoc3.jpg"
					alt="Pinnochio's Moment of Clarity" width="105%"
					style="position: relative; top: -180px; left: -5px">
				<p>Pinnochio's Moment of Clarity</p>
			</div>

			<div id="sbtyr"
				style="background-color: black; width: 500px; height: 500px; float: right;">
				<img src="images/discover/spacebehind2.jpg"
					alt="Space Behind The Yellow Room" width="100%">
				<p>Space Behind The Yellow Room</p>
			</div>

			<div id="siawh"
				style="background-color: black; width: 310px; height: 245px; float: right;">
				<img src="images/discover/spaceisallwehave.jpg"
					alt="Space Is All We Have" width="100%">
				<p>Space Is All We Have</p>
			</div>

			<div id="eternaltwilight"
				style="background-color: black; width: 300px; height: 245px; float: right;">
				<img src="images/discover/eternaltwilight.jpg"
					alt="Eternal Twilight" width="100%">
				<p>Eternal Twilight</p>
			</div>

			<div id="comarossi"
				style="background-color: black; width: 310px; height: 245px; float: right;">
				<img src="images/discover/comarossi.jpg" alt="Coma Rossi"
					width="100%">
				<p>Coma Rossi</p>
			</div>

			<div id="amutualquestion"
				style="background-color: black; width: 300px; height: 245px; float: right;">
				<img src="images/discover/amutualquestion1.jpg"
					alt="A Mutual Question" width="100%">
				<p>A Mutual Question</p>
			</div>
			
			<div style="background-color: black; width: 370px; height: 245px; float:left " id="zokova">
				<img width="100%" src="images/discover/zokova.jpg" alt="Zokova" style="position:relative;top:-120px;">
				<p>Zokova</p>
			</div>
			
 			<div style="background-color: black; width: 370px; height: 245px; float:left" id="twistedperspective">
				<img width="100%" src="images/discover/twistedperspective.jpg" alt="Twisted Perspective">
				<p>Twisted Perspective</p>
			</div>
			
  			<div style="background-color: black; width: 370px; height: 245px;float:left; " id="celestialteapot">
				<img width="100%" src="images/discover/celestialteapot.jpg" alt="Celestial Teapot">
				<p>Celestial Teapot</p> 
			</div>
			
			<div id="asleepinarifle" style="background-color: black; width: 300px; height: 300px;float:left; ">
				<img width="100%" alt="Asleep In A Rifle" src="images/discover/asleepinarifle.jpg">
				<p>Asleep In A Rifle</p> 
			</div>
  
  			<div id="mindmap" style="background-color: black; width: 510px; height: 300px;float:left; ">
				<img width="100%" alt="Mind Map" src="images/discover/mindmap.jpg">
				<p>Mind Map</p> 
			</div>
  
  			<div id="ssm" style="background-color: black; width: 300px; height: 300px;float:left; ">
				<img width="100%" alt="Southern Skies Motel" src="images/discover/ssm.jpg">
				<p>Southern Skies Motel</p> 
			</div>
			
		</div>

		<div class="discover-description container">
			<span class="description">
				<p class="heading">Discover the finest ambient bands from India.</p>

				<p>Inside the confines of nomenclature, comes division and
					segregation, hopelessly tormenting the have's from the have not's.
					When you break away that barrier, you find yourself amidst a parade
					of bands, wonderfully different from each other, sharing one, among
					other things, in common, ambience. Ambience so rich and fluid you
					can breath it in, cut it with a knife, lick it even!</p>

				<p>We, with our limited scope and knowledge, have compiled a
					list of ambient bands in India, ranging from post-rock, electro,
					math, funk, progressive, metal. Are you bent towards some
					semblance? In the mood for some timid aberration? Start from the
					top. Discover something new today.</p>

				<p>
					Have we overlooked you? Are you an Indian band that deserves to be
					on this list? Write to us <a href="javascript:void(0)" class="contactus">here</a>.
				</p>
			</span>
		</div>

	</div>

	<div class="discover-body-dark">
		<img class="tear-effect" src="images/discover/Green paper tear.png"
			width="100%">

		<div class="container">
			<div id="mushroomlake-desc" class="band-description"
				style="display: none;">
				<div class="row">
					<div class="col-md-6">
						<p class="heading">Mushroom Lake</p>
						<p class="genre">Post-rock/ Psychedelic</p>
						<p class="location">Thrissur, Kerala</p>
						<p class="lineup">
							<strong>Line up:</strong>
						<ul>
							<li>Jitin Paul David - Guitars</li>
							<li>Raju KP -Guitars/voices</li>
							<li>Pious Guit - Keys/Bass</li>
							<li>Abishek Amanath - Drums</li>
						</ul>
						</p>
						<p class="description">Mushroom Lake compose instrumental
							music with a heavy leaning towards post- rock mixed in a potion
							made of influences from psychedelic, alternative and other
							experimental genres. The core of the band's music is based on an
							idea of vocal-less rhythms which build up the mood slowly and
							enable listeners to travel along with the grooves over sustained
							period of time.</p>
					</div>

					<div class="col-md-5">

						<div style="margin-bottom: 30px;">
							<div class="mushroomlake-soundcloud-song"></div>
						</div>
						<div class="image-social-bay">
							<div class="image-transform">
								<img src="images/discover/video_thumbnails/mushroomlake1.jpg"
									width="100%" id="video1" alt="Mushroom Lake - Acid Rain (Live)" />
								<div class="mask">
									<a href="https://www.youtube.com/watch?v=HX3hyk6s_Sk"
										rel="prettyPhoto" title=""><img
										src="images/index/play_button_2.png" width="50%"
										style="position: relative;" /></a>
									<p style="vertical-align: middle;">Mushroom Lake - Acid Rain
										(Live)</p>
								</div>
							</div>
	
							<div class="image-transform">
								<img src="images/discover/video_thumbnails/mushroomlake2.jpg"
									width="100%" id="video2"
									alt="Mushroom Lake - Rorschach (Part I & III - Live))" />
								<div class="mask">
									<a href="https://www.youtube.com/watch?v=HX3hyk6s_Sk"
										rel="prettyPhoto" title=""><img
										src="images/index/play_button_2.png" width="50%"
										style="position: relative;" /></a>
									<p style="vertical-align: middle;">Mushroom Lake - Rorschach
										(Part I & III - Live)</p>
								</div>
							</div>
	
							<div class="social-media-buttons">
								<a href="https://www.facebook.com/MushroomLake" target="_blank">
									<img class="hvr-hang"
									src="images/social_buttons/facebook_button_black.png">
								</a> <a href="https://soundcloud.com/mushroom-lake" target="_blank">
									<img class="hvr-hang"
									src="images/social_buttons/soundcloud_button_black.png"
									style="width: 80px;">
								</a> <a href="https://www.youtube.com/user/mushroomlaketheband"
									target="_blank"> <img class="hvr-hang"
									src="images/social_buttons/youtube_button_black.png">
								</a> <a href="https://mushroomlake.bandcamp.com/releases"
									target="_blank"> <img class="hvr-hang"
									src="images/social_buttons/bandcamp_button_black.png">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div id="aswekeepsearching-desc" class="band-description"
				style="display: none;">
				<div class="row">
					<div class="col-md-6">
						<p class="heading">As We Keep Searching</p>
						<p class="genre">Post-Rock/ Experimental</p>
						<p class="location">Ahmedabad, Gujarat</p>
						<p class="lineup">
							<strong>Line up:</strong>
						<ul>
							<li>Uddipan Sarmah - Guitars</li>
							<li>Shawn Gurung -Guitars/Keys</li>
							<li>Bob Alex - Bass</li>
							<li>Gautam Deb - Drums</li>
						</ul>
						</p>
						<p class="description">As We Keep Searching is a
							post-rock/ambient band expressing emotions, life experiences and
							feelings in the form of instrumental music with some vocals. An
							amalgamation of electronic, ambient and post-rock styles, their
							work has been difficult to pin down from the very beginning. As
							We Keep Searching's EP, Growing Suspicions, is best experienced
							from start to finish. It's music is served up in many movements,
							taking the oscillating melody of the opening segment and doing
							wonderful, unexpected things with it.</p>
					</div>

					<div class="col-md-5">

						<div style="margin-bottom: 30px;">
							<div class="aswekeepsearching-soundcloud-song"></div>
						</div>
						
						<div class="image-social-bay">
							<div class="image-transform">
								<img
									src="images/discover/video_thumbnails/aswekeepsearching1.jpg"
									width="100%" id="video1" alt="Mushroom Lake - Acid Rain (Live)" />
								<div class="mask">
									<a href="https://www.youtube.com/watch?v=kjxhKCGwiCQ"
										rel="prettyPhoto" title=""><img
										src="images/index/play_button_2.png" width="50%"
										style="position: relative;" /></a>
									<p style="vertical-align: middle;">As We keep Searching -
										The Tattva</p>
								</div>
							</div>
	
							<div class="image-transform">
								<img
									src="images/discover/video_thumbnails/aswekeepsearching2.jpg"
									width="100%" id="video2"
									alt="Mushroom Lake - Rorschach (Part I & III - Live))" />
								<div class="mask">
									<a href="https://www.youtube.com/watch?v=gRc48N5GMkk"
										rel="prettyPhoto" title=""><img
										src="images/index/play_button_2.png" width="50%"
										style="position: relative;" /></a>
									<p style="vertical-align: middle;">As We Keep Searching Live
										@ The High Spirits Cafe</p>
								</div>
							</div>
	
							<div class="social-media-buttons">
								<a href="https://www.facebook.com/aswekeepsearching"
									target="_blank"> <img class="hvr-hang"
									src="images/social_buttons/facebook_button_black.png">
								</a> <a href="http://www.soundcloud.com/aswekeepsearching"
									target="_blank"> <img class="hvr-hang"
									src="images/social_buttons/soundcloud_button_black.png"
									style="width: 80px;">
								</a> <a href="https://www.youtube.com/user/aswekeepsearching"
									target="_blank"> <img class="hvr-hang"
									src="images/social_buttons/youtube_button_black.png">
								</a> <a href="http://aswekeepsearching.bandcamp.com/" target="_blank">
									<img class="hvr-hang"
									src="images/social_buttons/bandcamp_button_black.png">
								</a>
							</div>
						</div>
						
					</div>
				</div>
			</div>


			<div id="untilwelast-desc" class="band-description"
				style="display: none;">
				<div class="row">
					<div class="col-md-6">
						<p class="heading">Until We Last</p>
						<p class="genre">Post-rock / Ambient / Electronica</p>
						<p class="location">Bangalore, Karnataka</p>
						<p class="lineup">
							<strong>Line up:</strong>
						<ul>
							<li>Ketan Bahirat - Guitars</li>
							<li>Chaithanya Jade - Guitars</li>
							<li>Paul Dharamraj - Bass</li>
							<li>Ralston D'souza - Drums</li>
						</ul>
						</p>
						<p class="description">Until We Last combines live
							instruments, atmospheric elements and a vast variety of different
							forms of music. The band typically composes guitar based
							instrumental pieces that feature very melodic bass lines and
							heavy use of effects. Their music is influenced by nature and the
							world in general. The band's sound is defined by many as
							something different and that it could lead to a much bigger fan
							base for the genre in India.</p>
					</div>

					<div class="col-md-5">

						<div style="margin-bottom: 30px;">
							<div class="untilwelast-soundcloud-song"></div>
						</div>
						
						<div class="image-social-bay">
							<div class="image-transform">
								<img src="images/discover/video_thumbnails/untilwelast1.jpg"
									width="100%" id="video1" alt="Mushroom Lake - Acid Rain (Live)" />
								<div class="mask">
									<a href="https://www.youtube.com/watch?v=3etuYDoi_BM"
										rel="prettyPhoto" title=""><img
										src="images/index/play_button_2.png" width="50%"
										style="position: relative;" /></a>
									<p style="vertical-align: middle;">Until We Last -
										Earthgazing Live @ blueFROG</p>
								</div>
							</div>
	
							<div class="image-transform">
								<img src="images/discover/video_thumbnails/untilwelast2.jpg"
									width="100%" id="video2"
									alt="Mushroom Lake - Rorschach (Part I & III - Live))" />
								<div class="mask">
									<a href="https://www.youtube.com/watch?v=78olouN6Qdo"
										rel="prettyPhoto" title=""><img
										src="images/index/play_button_2.png" width="50%"
										style="position: relative;" /></a>
									<p style="vertical-align: middle;">Until We Last - Creation
										[Live in the Jam Room]</p>
								</div>
							</div>
	
							<div class="social-media-buttons">
								<a href="https://www.facebook.com/untilwelast" target="_blank">
									<img class="hvr-hang"
									src="images/social_buttons/facebook_button_black.png">
								</a> <a href="https://soundcloud.com/mushroom-lake" target="_blank">
									<img class="hvr-hang"
									src="images/social_buttons/soundcloud_button_black.png"
									style="width: 80px;">
								</a> <a href="https://www.youtube.com/user/untilwelast"
									target="_blank"> <img class="hvr-hang"
									src="images/social_buttons/youtube_button_black.png">
								</a> <a href="https://untilwelast.bandcamp.com/releases"
									target="_blank"> <img class="hvr-hang"
									src="images/social_buttons/bandcamp_button_black.png">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div id="ioish-desc" class="band-description" style="display: none;">
				<div class="row">
					<div class="col-md-6">
						<p class="heading">Ioish</p>
						<p class="genre">World / Post-rock</p>
						<p class="location">New Delhi</p>
						<p class="lineup">
							<strong>Line up:</strong>
						<ul>
							<li>Vaibhav Bhutani- Guitars/FX</li>
							<li>Abhinav Chaudhary- Bass/FX</li>
							<li>Anshull Lall- Drums</li>
						</ul>
						</p>
						<p class="description"></p>
					</div>

					<div class="col-md-5">

						<div style="margin-bottom: 30px;">
							<div class="ioish-soundcloud-song"></div>
							<div style="margin-bottom: 30px;"></div>
							<div class="ioish-soundcloud-song"></div>
						</div>
						
						<div class="image-social-bay">
							<div class="social-media-buttons">
								<a href="https://www.facebook.com/ioishh" target="_blank"> <img
									class="hvr-hang"
									src="images/social_buttons/facebook_button_black.png">
								</a> <a href="https://soundcloud.com/vaibhav_bhutani" target="_blank">
									<img class="hvr-hang"
									src="images/social_buttons/soundcloud_button_black.png"
									style="width: 80px;">
								</a> <a href="http://ioish.bandcamp.com/" target="_blank"> <img
									class="hvr-hang"
									src="images/social_buttons/bandcamp_button_black.png">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div id="stuckinnovember-desc" class="band-description"
				style="display: none;">
				<div class="row">
					<div class="col-md-6">
						<p class="heading">Stuck In November</p>
						<p class="genre">Math-rock</p>
						<p class="location">Bangalore, Karnataka</p>
						<p class="lineup">
							<strong>Line up:</strong>
						<ul>
							<li>Nihal Anand - Guitars</li>
							<li>Kushal Joseph -Guitars</li>
							<li>Nihaal Joseph - Bass</li>
							<li>Mayur Nanda - Drums</li>
						</ul>
						</p>
						<p class="description">Stuck In November were previously a post-rock outfit, who shifted to a 
						more niche math-rock. They still retain a lot of ambience while playing progressive and higly 
						structured music. Infact, they are one of the first Indian bands to play music complicated 
						enough to be called math rock. They came out with their EP called "The Sky Is Watching", which 
						can be streamed on SoundCloud. More varied music projects from the band include Nihal's 
						<a href="https://deadstar777.bandcamp.com/" target="_blank" >DeadStar</a> and 
						Mayur's <a href="https://soundcloud.com/6flyingwhales" target="_blank">Six Flying Whales.</a></p>
					</div>

					<div class="col-md-5">

						<div style="margin-bottom: 30px;">
							<div class="stuckinnovember-soundcloud-song"></div>
						</div>
						<div class="image-social-bay">
							<div class="image-transform">
								<img src="images/discover/video_thumbnails/stuckinnovember1.jpg"
									width="100%" id="video1" alt="Stuck in November - Polyrhythmic Synth Jazz Simulation" />
								<div class="mask">
									<a href="https://www.youtube.com/watch?v=ZhUVVCni6cE&feature=youtu.be"
										rel="prettyPhoto" title=""><img
										src="images/index/play_button_2.png" width="50%"
										style="position: relative;" /></a>
									<p style="vertical-align: middle;">Stuck in November - Polyrhythmic Synth Jazz Simulation</p>
								</div>
							</div>
	
							<div class="image-transform">
								<img src="images/discover/video_thumbnails/stuckinnovember2.jpg"
									width="100%" id="video2"
									alt="Stuck in November - Full Power" />
								<div class="mask">
									<a href="https://www.youtube.com/watch?v=7K2bWHsi_z0&feature=youtu.be"
										rel="prettyPhoto" title=""><img
										src="images/index/play_button_2.png" width="50%"
										style="position: relative;" /></a>
									<p style="vertical-align: middle;">Stuck in November - Full Power</p>
								</div>
							</div>
	
							<div class="social-media-buttons">
								<a href="https://www.facebook.com/stuckinnovember" target="_blank">
									<img class="hvr-hang"
									src="images/social_buttons/facebook_button_black.png">
								</a> <a href="https://soundcloud.com/stuckinnovember" target="_blank">
									<img class="hvr-hang"
									src="images/social_buttons/soundcloud_button_black.png"
									style="width: 80px;">
								</a> <a href="https://www.youtube.com/channel/UCfM-ymLswPzdl88d3Zv5bOg"
									target="_blank"> <img class="hvr-hang"
									src="images/social_buttons/youtube_button_black.png">
								</a> <a href="http://stuckinnovember.bandcamp.com/"
									target="_blank"> <img class="hvr-hang"
									src="images/social_buttons/bandcamp_button_black.png">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div id="sulkstation-desc" class="band-description"
				style="display: none;">
				<div class="row">
					<div class="col-md-6">
						<p class="heading">Sulk Station</p>
						<p class="genre">Electro / Trip-hop</p>
						<p class="location">Bangalore / Kathmandu</p>
						<p class="lineup">
							<strong>Line up:</strong>
						<ul>
							<li>Tanvi Rao - Vocals</li>
							<li>Rahul Giri - Laptop/Controllers</li>
						</ul>
						</p>
						<p class="description">Sulk Station is an electronic/trip-hop duo from Bangalore 
						formed by Tanvi Rao and Rahul Giri in 2009. Their music is driven by Tanvi Rao's 
						sultry vocals wrapped in a haze of atmospherics, minimal beats and homegrown synth 
						sounds. Their songs are a mix of contemporary electronic music genres with traces 
						of Indian classical music. Their debut album "Till you Appear" managed to accumulate 
						praise from listeners, bloggers, critics and musicians alike. The album also earned 
						them a slot at the World Event Young Artist festival held in Nottingham, UK.</p>
					</div>

					<div class="col-md-5">

						<div style="margin-bottom: 30px;">
							<div class="sulkstation-soundcloud-song"></div>
						</div>
						<div class="image-social-bay">
							<div class="image-transform">
								<img src="images/discover/video_thumbnails/sulkstation1.jpg"
									width="100%" id="video1" alt="Sulk Station - Bindya (Balcony TV)" />
								<div class="mask">
									<a href="https://www.youtube.com/watch?v=bFLK5QVQazQ"
										rel="prettyPhoto" title=""><img
										src="images/index/play_button_2.png" width="50%"
										style="position: relative;" /></a>
									<p style="vertical-align: middle;">Sulk Station - Bindya (Balcony TV)</p>
								</div>
							</div>
	
							<div class="image-transform">
								<img src="images/discover/video_thumbnails/sulkstation2.jpg"
									width="100%" id="video2"
									alt="The Music Project: Sulk Station" />
								<div class="mask">
									<a href="https://www.youtube.com/watch?v=p8WYKh4fxMQ"
										rel="prettyPhoto" title=""><img
										src="images/index/play_button_2.png" width="50%"
										style="position: relative;" /></a>
									<p style="vertical-align: middle;">The Music Project: Sulk Station</p>
								</div>
							</div>
	
							<div class="social-media-buttons">
								<a href="https://www.facebook.com/sulkstation" target="_blank">
									<img class="hvr-hang"
									src="images/social_buttons/facebook_button_black.png">
								</a> <a href="http://soundcloud.com/sulkstation" target="_blank">
									<img class="hvr-hang"
									src="images/social_buttons/soundcloud_button_black.png"
									style="width: 80px;">
								</a> <a href="http://www.youtube.com/sulkstation"
									target="_blank"> <img class="hvr-hang"
									src="images/social_buttons/youtube_button_black.png">
								</a> <a href="https://sulkstation.bandcamp.com/"
									target="_blank"> <img class="hvr-hang"
									src="images/social_buttons/bandcamp_button_black.png">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div id="frameframe-desc" class="band-description"
				style="display: none;">
				<div class="row">
					<div class="col-md-6">
						<p class="heading">Frame/Frame</p>
						<p class="genre">Electronic / Glitch</p>
						<p class="location">New Delhi</p>
						<p class="lineup">
							<strong>Line up:</strong>
						<ul>
							<li>Nikhil Kaul - Everything</li>
						</ul>
						</p>
						<p class="description">Nikhil Kaul aka Frame/Frame has combined genres in his debut EP "Swimmers", 
						producing a sound that is glitchy, bass heavy and unique. The EP relies heavily on a mix of 
						trip-hop, bass music and post-rock, in a compelling package.</p>
					</div>

					<div class="col-md-5">

						<div style="margin-bottom: 30px;">
							<div class="frameframe-soundcloud-song"></div>
						</div>
						<div class="image-social-bay">
							<div class="image-transform">
								<img src="images/discover/video_thumbnails/frameframe1.jpg"
									width="100%" id="video1" alt="Frame/Frame - Pastels" />
								<div class="mask">
									<a href="https://www.youtube.com/watch?v=4Z8fiuZeZHY"
										rel="prettyPhoto" title=""><img
										src="images/index/play_button_2.png" width="50%"
										style="position: relative;" /></a>
									<p style="vertical-align: middle;">Frame/Frame - Pastels</p>
								</div>
							</div>
	
							<div class="image-transform">
								<img src="images/discover/video_thumbnails/frameframe2.jpg"
									width="100%" id="video2"
									alt="Frame/Frame feat. Madboy - Hard Boiled Wonderland" />
								<div class="mask">
									<a href="https://www.youtube.com/watch?v=AeeM3zOb5sY"
										rel="prettyPhoto" title=""><img
										src="images/index/play_button_2.png" width="50%"
										style="position: relative;" /></a>
									<p style="vertical-align: middle;">Frame/Frame feat. Madboy - Hard Boiled Wonderland</p>
								</div>
							</div>
	
							<div class="social-media-buttons">
								<a href="https://www.facebook.com/framebyframeofficial" target="_blank">
									<img class="hvr-hang"
									src="images/social_buttons/facebook_button_black.png">
								</a> <a href="http://www.soundcloud.com/framebyframe" target="_blank">
									<img class="hvr-hang"
									src="images/social_buttons/soundcloud_button_black.png"
									style="width: 80px;">
								</a> <a href="http://www.youtube.com/framebyframemusic"
									target="_blank"> <img class="hvr-hang"
									src="images/social_buttons/youtube_button_black.png">
								</a> <a href="https://framebyframeofficial.bandcamp.com/"
									target="_blank"> <img class="hvr-hang"
									src="images/social_buttons/bandcamp_button_black.png">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div id="loungepiranha-desc" class="band-description"
				style="display: none;">
				<div class="row">
					<div class="col-md-6">
						<p class="heading">Lounge Piranha</p>
						<p class="genre">Alternative /Post-rock</p>
						<p class="location">Bangalore, Karnataka</p>
						<p class="lineup">
							<strong>Line up:</strong>
						<ul>
							<li>Kamal Singh - Guitars / Vocals</li>
							<li>Shalini Mohan - Bass</li>
							<li>Abhijeet Tambe - Guitars / Vocals</li>
							<li>Pervez Rajan - Didgeridoo / Percussion / Flute</li>
							<li>George Mathen - Drums</li>
						</ul>
						</p>
						<p class="description">Lounge Piranha is a Alternative / Post-Rock band from Bangalore, 
						formed in 2005, one of the earliest post-rock bands in the city. Ambient soundscapes 
						combined with guitar distortion are layered on top of a tight rhythm section consisting 
						of drums and bass. The focus is on song-writing and sound textures. A typical concert would 
						consist of an almost exclusively original set which includes several of their own songs, 
						arresting visual effects, and some ethereal jams with guest artists varying from didgeridoo 
						players to djembe players and even a couple of unexpected covers.</p>
					</div>

					<div class="col-md-5">

						<div style="margin-bottom: 30px;">
							<div class="frameframe-soundcloud-song"></div>
						</div>
						<div class="image-social-bay">
							<div class="image-transform">
								<img src="images/discover/video_thumbnails/frameframe1.jpg"
									width="100%" id="video1" alt="Lounge Piranha - Ebb" />
								<div class="mask">
									<a href="https://www.youtube.com/watch?v=ZZXuSOdn0ts"
										rel="prettyPhoto" title=""><img
										src="images/index/play_button_2.png" width="50%"
										style="position: relative;" /></a>
									<p style="vertical-align: middle;">Lounge Piranha - Ebb</p>
								</div>
							</div>
	
							<div class="image-transform">
								<img src="images/discover/video_thumbnails/loungepiranha2.jpg"
									width="100%" id="video2"
									alt="Lounge Piranha - Gun Song" />
								<div class="mask">
									<a href="https://www.youtube.com/watch?v=8Qn8-i1C-RQ"
										rel="prettyPhoto" title=""><img
										src="images/index/play_button_2.png" width="50%"
										style="position: relative;" /></a>
									<p style="vertical-align: middle;">Lounge Piranha - Gun Song</p>
								</div>
							</div>
	
							<div class="social-media-buttons">
								<a href="https://www.facebook.com/loungepiranha" target="_blank">
									<img class="hvr-hang"
									src="images/social_buttons/facebook_button_black.png">
								</a> 
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div id="pangea-desc" class="band-description"
				style="display: none;">
				<div class="row">
					<div class="col-md-6">
						<p class="heading">Pangea</p>
						<p class="genre">Prog metal / Drone</p>
						<p class="location">Mumbai, Maharashtra</p>
						<p class="lineup">
							<strong>Line up:</strong>
						<ul>
							<li>Akshay Rajpurohit - Guitars / Synth</li>
							<li>Shadaab Kadri - Guitars / Synth</li>
							<li>Kuber Sharma - Guitars</li>
							<li>Krishna Jhaveri - Bass</li>
							<li>Jai Row Kavi - Drums</li>
						</ul>
						</p>
						<p class="description">Pangea is a Progressive Metal band from Mumbai, formed in 2007. 
						It originally started as 'Orion J9 Foundation' which was the studio project started by Akshay. 
						They have been making music trying to combine different and weird genres together. 
						They don't like to be termed as a Project with any one specific Genre. According to them, 
						they make sit-on-your-couch-and-blaze music.</p>
					</div>

					<div class="col-md-5">


						<div class="image-social-bay">
							<div class="image-transform">
								<img src="images/discover/video_thumbnails/pangea1.jpg"
									width="100%" id="video1" alt="Pangea - The Life of Epson Printer (Live at blueFrog)" />
								<div class="mask">
									<a href="https://www.youtube.com/watch?v=nXDe1SNbxGI"
										rel="prettyPhoto" title=""><img
										src="images/index/play_button_2.png" width="50%"
										style="position: relative;" /></a>
									<p style="vertical-align: middle;">Pangea - The Life of Epson Printer (Live at blueFrog)</p>
								</div>
							</div>
	
							<div class="image-transform">
								<img src="images/discover/video_thumbnails/pangea2.jpg"
									width="100%" id="video2"
									alt="Pangea - Every Photo Doesn't Have a Ghost (Live)" />
								<div class="mask">
									<a href="https://www.youtube.com/watch?v=KTgksk7vIU4"
										rel="prettyPhoto" title=""><img
										src="images/index/play_button_2.png" width="50%"
										style="position: relative;" /></a>
									<p style="vertical-align: middle;">Pangea - Every Photo Doesn't Have a Ghost (Live)</p>
								</div>
							</div>
	
							<div class="social-media-buttons">
								<a href="https://www.facebook.com/pangeaindia" target="_blank">
									<img class="hvr-hang"
									src="images/social_buttons/facebook_button_black.png">
								</a> <a href="https://soundcloud.com/pangeaindia" target="_blank">
									<img class="hvr-hang"
									src="images/social_buttons/soundcloud_button_black.png"
									style="width: 80px;">
								</a> <a href="https://www.youtube.com/user/pangeaindia"
									target="_blank"> <img class="hvr-hang"
									src="images/social_buttons/youtube_button_black.png">
								</a> <a href="http://pangeaindia.bandcamp.com/"
									target="_blank"> <img class="hvr-hang"
									src="images/social_buttons/bandcamp_button_black.png">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div id="pmoc-desc" class="band-description"
				style="display: none;">
				<div class="row">
					<div class="col-md-6">
						<p class="heading">Pinnochio's Moment of Clarity</p>
						<p class="genre">Progressive / Post-rock</p>
						<p class="location">Pune / Delhi</p>
						<p class="lineup">
							<strong>Line up:</strong>
						<ul>
							<li>Aditya Virmani - Production / Vocals</li>
							<li>Shashank Chandak - Vocals</li>
							<li>Shaurya Sharma - Guitars / Bass</li>
							<li>Gautam Deb - Drums</li>
						</ul>
						</p>
						<p class="description">Pinnochio's Moment of Clarity is an Experimental Rock band from Pune/Delhi, 
						formed in January 2013. Pinnochio's Moment of Clarity is by far the most interesting name for a 
						band you will come across. True to its name, the band'ss music is not less interesting either. 
						They blend digital and analog music to take you to a different dimension. 
						Currently the band is working on their debut album titled "Entropy".</p>
					</div>

					<div class="col-md-5">

						<div style="margin-bottom: 30px;">
							<div class="pmoc-soundcloud-song"></div>
						</div>
						<div class="image-social-bay">
							<div class="image-transform">
								<img src="images/discover/video_thumbnails/pmoc1.jpg"
									width="100%" id="video1" alt="Pinnochio's Moment of Clarity - Sleep is the Answer (Live)" />
								<div class="mask">
									<a href="https://www.youtube.com/watch?v=34I16Freea0"
										rel="prettyPhoto" title=""><img
										src="images/index/play_button_2.png" width="50%"
										style="position: relative;" /></a>
									<p style="vertical-align: middle;">Pinnochio's Moment of Clarity - Sleep is the Answer (Live)</p>
								</div>
							</div>
	
							<div class="image-transform">
								<img src="images/discover/video_thumbnails/pmoc2.jpg"
									width="100%" id="video2"
									alt="Pinnochio's Moment of Clarity - Eat My Head (BalconyTV)" />
								<div class="mask">
									<a href="https://www.youtube.com/watch?v=b26aeTINyho"
										rel="prettyPhoto" title=""><img
										src="images/index/play_button_2.png" width="50%"
										style="position: relative;" /></a>
									<p style="vertical-align: middle;">Pinnochio's Moment of Clarity - Eat My Head (BalconyTV)</p>
								</div>
							</div>
	
							<div class="social-media-buttons">
								<a href="https://www.facebook.com/Pinnochiomusic" target="_blank">
									<img class="hvr-hang"
									src="images/social_buttons/facebook_button_black.png">
								</a> <a href="http://soundcloud.com/pmoc" target="_blank">
									<img class="hvr-hang"
									src="images/social_buttons/soundcloud_button_black.png"
									style="width: 80px;">
								</a> <a href="https://www.youtube.com/channel/UC0w3HBYdUSDhTqrip4Awi9g"
									target="_blank"> <img class="hvr-hang"
									src="images/social_buttons/youtube_button_black.png">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div id="eternaltwilight-desc" class="band-description"
				style="display: none;">
				<div class="row">
					<div class="col-md-6">
						<p class="heading">The Eternal Twilight</p>
						<p class="genre">Shoegaze / Minimal</p>
						<p class="location">Earth!</p>
						<p class="lineup">
							<strong>Line up:</strong>
						<ul>
							<li>Noor - Atmosphere/Soundscapes</li>
							<li>Abbas - Piano/Drums</li>
							<li>Quinn Montoya - Guitars</li>
							<li>Christian Erfurt - Textures/Soundscapes</li>
						</ul>
						</p>
						<p class="description">The Eternal Twilight started as a duo project. Noor is based in Mumbai, 
						India while Abbas is based in Rawalpindi, Pakistan. Two more members, Christian Erfurt(Germany) 
						and Quinn Montoya(USA) joined the project. Thus making The Eternal Twilight a multi national project.
 						TET plays music heavily inspired by Ambient, Post-Rock, Shoegaze and Drone etc. They have many 
 						albums under their belt, the most recent being "Dronescape"</p>
					</div>

					<div class="col-md-5">
						<div style="margin-bottom: 30px;">
							<div class="eternaltwilight-soundcloud-song"></div>
						</div>

						<div class="image-social-bay">
							<div class="image-transform">
								<img src="images/discover/video_thumbnails/eternaltwilight1.jpg"
									width="100%" id="video1" alt="The Eternal Twilight & The Sound of Rescue - Under the Starlit Sky" />
								<div class="mask">
									<a href="https://www.youtube.com/watch?v=jtkhZA2jirU"
										rel="prettyPhoto" title=""><img
										src="images/index/play_button_2.png" width="50%"
										style="position: relative;" /></a>
									<p style="vertical-align: middle;">The Eternal Twilight & The Sound of Rescue - Under the Starlit Sky</p>
								</div>
							</div>
	
							<div class="image-transform">
								<img src="images/discover/video_thumbnails/eternaltwilight2.jpg"
									width="100%" id="video2"
									alt="The Eternal Twilight - A Year of You" />
								<div class="mask">
									<a href="https://www.youtube.com/watch?v=VOBt6VngRi8"
										rel="prettyPhoto" title=""><img
										src="images/index/play_button_2.png" width="50%"
										style="position: relative;" /></a>
									<p style="vertical-align: middle;">The Eternal Twilight - A Year of You</p>
								</div>
							</div>
	
							<div class="social-media-buttons">
								<a href="https://www.facebook.com/theternaltwilight" target="_blank">
									<img class="hvr-hang"
									src="images/social_buttons/facebook_button_black.png">
								</a> <a href="https://soundcloud.com/theternaltwilight" target="_blank">
									<img class="hvr-hang"
									src="images/social_buttons/soundcloud_button_black.png"
									style="width: 80px;">
								</a> <a href="https://www.youtube.com/user/dsbm223"
									target="_blank"> <img class="hvr-hang"
									src="images/social_buttons/youtube_button_black.png">
								</a> <a href="https://theternaltwilight.bandcamp.com/"
									target="_blank"> <img class="hvr-hang"
									src="images/social_buttons/bandcamp_button_black.png">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div id="amutualquestion-desc" class="band-description"
				style="display: none;">
				<div class="row">
					<div class="col-md-6">
						<p class="heading">A Mutual Question</p>
						<p class="genre">Post Rock / Instrumental</p>
						<p class="location">Mumbai, Maharashtra</p>
						<p class="lineup">
							<strong>Line up:</strong>
						<ul>
							<li>Siddharth Chopra - Guitarist/Composer/Softsynths/Production</li>
							<li>Proteesh Ravi - Vocals/Guitars</li>
							<li>Homi Rustumji - Bass</li>
							<li>Aviraj Kumar - Drums</li>
						</ul>
						</p>
						<p class="description">A Mutual Question are a Post-Rock/Instrumental Rock band from Mumbai. They 
						create music with powerful and engaging passages, lush soundscapes and melodic interludes that 
						combine to create a distinctive sound. The band are out with 2 EP's. 'Eyes Everywhere' is a mixture of 
						electronic and progressive passages which are very well balanced. 'Strangeloop' is just a magical space rock EP which  </p>
					</div>

					<div class="col-md-5">
						<div style="margin-bottom: 30px;">
							<div class="amutualquestion-soundcloud-song"></div>
						</div>

						<div class="image-social-bay">
							<div class="image-transform">
								<img src="images/discover/video_thumbnails/eternaltwilight1.jpg"
									width="100%" id="video1" alt="The Eternal Twilight & The Sound of Rescue - Under the Starlit Sky" />
								<div class="mask">
									<a href="https://www.youtube.com/watch?v=jtkhZA2jirU"
										rel="prettyPhoto" title=""><img
										src="images/index/play_button_2.png" width="50%"
										style="position: relative;" /></a>
									<p style="vertical-align: middle;">The Eternal Twilight & The Sound of Rescue - Under the Starlit Sky</p>
								</div>
							</div>
	
							<div class="image-transform">
								<img src="images/discover/video_thumbnails/eternaltwilight2.jpg"
									width="100%" id="video2"
									alt="The Eternal Twilight - A Year of You" />
								<div class="mask">
									<a href="https://www.youtube.com/watch?v=VOBt6VngRi8"
										rel="prettyPhoto" title=""><img
										src="images/index/play_button_2.png" width="50%"
										style="position: relative;" /></a>
									<p style="vertical-align: middle;">The Eternal Twilight - A Year of You</p>
								</div>
							</div>
	
							<div class="social-media-buttons">
								<a href="https://www.facebook.com/theternaltwilight" target="_blank">
									<img class="hvr-hang"
									src="images/social_buttons/facebook_button_black.png">
								</a> <a href="https://soundcloud.com/theternaltwilight" target="_blank">
									<img class="hvr-hang"
									src="images/social_buttons/soundcloud_button_black.png"
									style="width: 80px;">
								</a> <a href="https://www.youtube.com/user/dsbm223"
									target="_blank"> <img class="hvr-hang"
									src="images/social_buttons/youtube_button_black.png">
								</a> <a href="https://theternaltwilight.bandcamp.com/"
									target="_blank"> <img class="hvr-hang"
									src="images/social_buttons/bandcamp_button_black.png">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div id="siawh-desc" class="band-description"
				style="display: none;">
				<div class="row">
					<div class="col-md-6">
						<p class="heading">Space Is All We Have</p>
						<p class="genre">Space / Alternative / Ambient Rock</p>
						<p class="location">Bangalore, Karnataka</p>
						<p class="lineup">
							<strong>Line up:</strong>
						<ul>
							<li>Krishna Sujith - Guitars</li>
							<li>Robert Romario - Vocals</li>
							<li>Akshay Akki - Drums</li>
							<li>Akshat Kavidayal - Bass</li>
							<li>Yogendra Hariprasad - Keys</li>
						</ul>
					
						</p>
						<p class="description">Space Is All We Have, haven't put up any new material with their recent line up change. 
						With the new lineup, they are a completely different league of musicians with mad songwriting and next to perfect 
						live sound. They don't play very often, but you should catch them when they do.</p>
					</div>

					<div class="col-md-5">
						
						<div class="image-social-bay">
							<div class="image-transform">
								<img src="images/discover/video_thumbnails/siawh1.jpg"
									width="100%" id="video1" alt="The Eternal Twilight & The Sound of Rescue - Under the Starlit Sky" />
								<div class="mask">
									<a href="https://www.youtube.com/watch?v=Aqwci0zApRs"
										rel="prettyPhoto" title=""><img
										src="images/index/play_button_2.png" width="50%"
										style="position: relative;" /></a>
									<p style="vertical-align: middle;">Space Is All We Have (Live at BMSC)</p>
								</div>
							</div>
	
							
							<div class="social-media-buttons">
								<a href="https://www.facebook.com/pages/Space-is-all-we-have/546173425403332" target="_blank">
									<img class="hvr-hang"
									src="images/social_buttons/facebook_button_black.png">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div id="sbtyr-desc" class="band-description"
				style="display: none;">
				<div class="row">
					<div class="col-md-6">
						<p class="heading">Space Behind The Yellow Room</p>
						<p class="genre">Post-rock / Space-rock</p>
						<p class="location">Bangalore, Karnataka</p>
						<p class="lineup">
							<strong>Line up:</strong>
						<ul>
							<li>Shoumik Biswas - Drums/Vocals/Samples</li>
							<li>Devasheesh Sharma - Guitar/Ambience</li>
							<li>Nihar Apte - Guitar/Awkwardness</li>
							<li>Eshaan Sood - Bass</li>
						</ul>
						
						</p>
						<p class="description">Space Behind the Yellow Room is a Space Rock/Post Rock/Post Metal band 
						based in Bangalore. The band comprises Shoumik Biswas on Drums/Vocals, Devasheesh Sharma on Guitar, 
						Nihar Apte on Guitar/Vocals and Eshaan Sood on Bass. They are a largely instrumental band, with 
						minimal vocals. They have an album out called "Conversations that Determine a Life", out for free 
						stream on Soundcloud. Recently, the band went international by performing at Music Matters Live 
						at Singapore.</p>
					</div>

					<div class="col-md-5">
						<div style="margin-bottom: 30px;">
							<div class="sbtyr-soundcloud-song"></div>
						</div>

						<div class="image-social-bay">
							<div class="image-transform">
								<img src="images/discover/video_thumbnails/sbtyr1.jpg"
									width="100%" id="video1" alt="Space Behind the Yellow Room (Live @ The High Spirits Cafe)" />
								<div class="mask">
									<a href="https://www.youtube.com/watch?v=Vgfo0E9n8Ow"
										rel="prettyPhoto" title=""><img
										src="images/index/play_button_2.png" width="50%"
										style="position: relative;" /></a>
									<p style="vertical-align: middle;">Space Behind the Yellow Room (Live @ The High Spirits Cafe)</p>
								</div>
							</div>
	
							<div class="image-transform">
								<img src="images/discover/video_thumbnails/sbtyr2.jpg"
									width="100%" id="video2"
									alt="Pepsi Unbox - Space Behind The Yellow Room -The Full Episode" />
								<div class="mask">
									<a href="https://www.youtube.com/watch?v=9UFicWA61vM"
										rel="prettyPhoto" title=""><img
										src="images/index/play_button_2.png" width="50%"
										style="position: relative;" /></a>
									<p style="vertical-align: middle;">Pepsi Unbox - Space Behind The Yellow Room -The Full Episode</p>
								</div>
							</div>
	
							<div class="social-media-buttons">
								<a href="https://www.facebook.com/spacebehindtheyellowroom" target="_blank">
									<img class="hvr-hang"
									src="images/social_buttons/facebook_button_black.png">
								</a> <a href="https://soundcloud.com/spacebehindtheyellowroom" target="_blank">
									<img class="hvr-hang"
									src="images/social_buttons/soundcloud_button_black.png"
									style="width: 80px;">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div id="zokova-desc" class="band-description"
				style="display: none;">
				<div class="row">
					<div class="col-md-6">
						<p class="heading">Zokova</p>
						<p class="genre">Post-rock / Experimental Rock</p>
						<p class="location">New Delhi</p>
						<p class="lineup">
							<strong>Line up:</strong>
						<ul>
							<li>Ritwik De - Guitars, Keyboards, Effects</li>
							<li>Amar Pandey - Bass Guitar, Keyboards</li>
							<li>Suyash Gabriel - Drums, Percussion, Effects</li>
						</ul>		
						</p>

						<p class="description">Zokova was conceptualized by Ritwik De in 2008. Zokova is a post rock 
						project and has 10 interlinked songs, which are primarily instrumental. The songs highlight 
						and reflect on the various emotions which we face every day but neglect. They have a more 
						interesting description on what their songs conceptualize, you can go over to their page and 
						check it out. Zokova are in the midst of recording their new full length.</p>
					</div>

					<div class="col-md-5">
						<div style="margin-bottom: 30px;">
							<div class="zokova-soundcloud-song"></div>
						</div>

						<div class="image-social-bay">
							<div class="image-transform">
								<img src="images/discover/video_thumbnails/zokova1.jpg"
									width="100%" id="video1" alt="Zokova live at Indian Habitat Centre" />
								<div class="mask">
									<a href="https://www.youtube.com/watch?v=0yszvNww7DU"
										rel="prettyPhoto" title=""><img
										src="images/index/play_button_2.png" width="50%"
										style="position: relative;" /></a>
									<p style="vertical-align: middle;">Zokova live at Indian Habitat Centre</p>
								</div>
							</div>
				
	
							<div class="social-media-buttons">
								<a href="https://www.facebook.com/zokovanaice" target="_blank">
									<img class="hvr-hang"
									src="images/social_buttons/facebook_button_black.png">
								</a> <a href="https://soundcloud.com/zokova" target="_blank">
									<img class="hvr-hang"
									src="images/social_buttons/soundcloud_button_black.png"
									style="width: 80px;">
								</a> <a href="https://www.youtube.com/channel/UCz_AMQozj50p4mdi9EpvrsA"
									target="_blank"> <img class="hvr-hang"
									src="images/social_buttons/youtube_button_black.png">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			
			<div id="twistedperspective-desc" class="band-description"
				style="display: none;">
				<div class="row">
					<div class="col-md-6">
						<p class="heading">Twisted Perspective</p>
						<p class="genre">Soundscapes / Ambient</p>
						<p class="location">Roorkee, Uttarakhand</p>
						<p class="lineup">
							<strong>Line up:</strong>
						<ul>
							<li>Aditya Sharma - Everything</li>
						</ul>
						</p>
						<p class="description">Twisted Perspective is the ambient brain child of Aditya Sharma, who constantly 
						cooks up surreal and evolving drones and soundscapes that wash over you. Heavily influenced by Chicane, 
						Hammock, Sigur Ros and The American Dollar, he describes it as a "project dedicated to nature and 
						everyone around the world to those people caring for the beauty and landscapes. Landscapes of heart 
						or simply of earth... Mountains, Flowers Lightness and Darkness..". With 3 soulful albums done and dusted, he seeks
						to expand into the domain of electronica and chillout.</p>
					</div>

					<div class="col-md-5">
						<div style="margin-bottom: 30px;">
							<div class="twistedperspective-soundcloud-song"></div>
							<div style="margin-bottom: 30px;"></div>
							<div class="twistedperspective-soundcloud-song"></div>
						</div>

						<div class="image-social-bay">
	
							<div class="social-media-buttons">
								<a href="https://www.facebook.com/yourtwistedperspective" target="_blank">
									<img class="hvr-hang"
									src="images/social_buttons/facebook_button_black.png">
								</a> <a href="https://soundcloud.com/twistedperspective" target="_blank">
									<img class="hvr-hang"
									src="images/social_buttons/soundcloud_button_black.png"
									style="width: 80px;">
								</a> <a href="https://aditya.bandcamp.com/"
									target="_blank"> <img class="hvr-hang"
									src="images/social_buttons/bandcamp_button_black.png">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div id="celestialteapot-desc" class="band-description"
				style="display: none;">
				<div class="row">
					<div class="col-md-6">
						<p class="heading">Celestial Teapot</p>
						<p class="genre">Instrumental Rock</p>
						<p class="location">Pune, Maharashtra</p>
						<p class="lineup">
							<strong>Line up:</strong>
						<ul>
							<li>Kartikeya Dixit - Guitars</li>
							<li>Nishant Karve - Guitars</li>
							<li>Tushar Verma - Bass</li>
							<li>Ashwin Naidu - Drums</li>
						</ul>		
						</p>

						<p class="description">Zokova was conceptualized by Ritwik De in 2008. Zokova is a post rock 
						project and has 10 interlinked songs, which are primarily instrumental. The songs highlight 
						and reflect on the various emotions which we face every day but neglect. They have a more 
						interesting description on what their songs conceptualize, you can go over to their page and 
						check it out. Zokova are in the midst of recording their new full length.</p>
					</div>

					<div class="col-md-5">
						<div style="margin-bottom: 30px;">
							<div class="celestialteapot-soundcloud-song"></div>
						</div>

						<div class="image-social-bay">
							<div class="image-transform">
								<img src="images/discover/video_thumbnails/celestialteapot1.jpg"
									width="100%" id="video1" alt="Celestial Teapot - Nacreous (Live at blue FROG Pune)" />
								<div class="mask">
									<a href="https://www.youtube.com/watch?v=ws6bNhCHUS4"
										rel="prettyPhoto" title=""><img
										src="images/index/play_button_2.png" width="50%"
										style="position: relative;" /></a>
									<p style="vertical-align: middle;">Celestial Teapot - Nacreous (Live at blue FROG Pune)</p>
								</div>
							</div>
				
	
							<div class="social-media-buttons">
								<a href="https://www.facebook.com/celestialteapotindia" target="_blank">
									<img class="hvr-hang"
									src="images/social_buttons/facebook_button_black.png">
								</a> <a href="https://soundcloud.com/celestialteapotindia" target="_blank">
									<img class="hvr-hang"
									src="images/social_buttons/soundcloud_button_black.png"
									style="width: 80px;">
								</a> <a href="https://www.youtube.com/channel/UCgqaQ2LJghZNOXWYIWvTZUw"
									target="_blank"> <img class="hvr-hang"
									src="images/social_buttons/youtube_button_black.png">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div id="mindmap-desc" class="band-description"
				style="display: none;">
				<div class="row">
					<div class="col-md-6">
						<p class="heading">Mind Map</p>
						<p class="genre">Experimental Psybient</p>
						<p class="location">Bangalore, Karnataka</p>
						<p class="lineup">
							<strong>Line up:</strong>
						<ul>						
							<li>Bankim Chandra - Lead Guitars</li>
							<li>Abhijith A Bhat - Didgeridoo</li>
							<li>Avinash - Bass Guitar</li>
							<li>Shreyas Sel - Drums & Percussions</li>
							<li>Preetham - Synth & Vocal</li>
							<li>Kiran Singh - Art work & Guitars</li>
						</ul>		
						</p>

						<p class="description">Zokova was conceptualized by Ritwik De in 2008. Zokova is a post rock 
						project and has 10 interlinked songs, which are primarily instrumental. The songs highlight 
						and reflect on the various emotions which we face every day but neglect. They have a more 
						interesting description on what their songs conceptualize, you can go over to their page and 
						check it out. Zokova are in the midst of recording their new full length.</p>
					</div>

					<div class="col-md-5">
						<div style="margin-bottom: 30px;">
							<div class="celestialteapot-soundcloud-song"></div>
						</div>

						<div class="image-social-bay">
							<div class="image-transform">
								<img src="images/discover/video_thumbnails/celestialteapot1.jpg"
									width="100%" id="video1" alt="Celestial Teapot - Nacreous (Live at blue FROG Pune)" />
								<div class="mask">
									<a href="https://www.youtube.com/watch?v=ws6bNhCHUS4"
										rel="prettyPhoto" title=""><img
										src="images/index/play_button_2.png" width="50%"
										style="position: relative;" /></a>
									<p style="vertical-align: middle;">Celestial Teapot - Nacreous (Live at blue FROG Pune)</p>
								</div>
							</div>
				
	
							<div class="social-media-buttons">
								<a href="https://www.facebook.com/celestialteapotindia" target="_blank">
									<img class="hvr-hang"
									src="images/social_buttons/facebook_button_black.png">
								</a> <a href="https://soundcloud.com/celestialteapotindia" target="_blank">
									<img class="hvr-hang"
									src="images/social_buttons/soundcloud_button_black.png"
									style="width: 80px;">
								</a> <a href="https://www.youtube.com/channel/UCgqaQ2LJghZNOXWYIWvTZUw"
									target="_blank"> <img class="hvr-hang"
									src="images/social_buttons/youtube_button_black.png">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			

		</div>
		<img class="tear-effect-inverted"
			src="images/discover/Green paper tear.png" width="100%">
	</div>

	<div class="discover-footer">
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
	
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
</html>