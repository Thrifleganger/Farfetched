<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta property="og:title" content="Welcome to Farfetch'd, post-rock extraordinaire"/>
<meta property="og:type" content="article"/>
<meta property="og:image" content="http://farfetchd-official.com/images/index/carousel/carousel1.jpg"/>
<meta property="og:url" content="http://www.farfetchd-official.com"/>
<meta property="og:description" content="Besides being a flagship interface for Farfetch'd, this website hosts a multitude of tools for ambient music discovery. Give it a try!"/>

<title>Gallery - Farfetch'd</title>

<link type='text/css' rel="stylesheet" href="css/global.css">

<link rel="stylesheet" href="css/hover.css">

<link rel="stylesheet" href="css/ImageTransform.css">

<link rel="stylesheet" type="text/css" href="prettyPhoto/css/prettyPhoto.css">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<script src="prettyPhoto/js/jquery.prettyPhoto.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	

	
	$('.gallery-images').hide();
	
	//prettyPhoto lightbox JQuery
	$("a[rel^='prettyPhoto']").prettyPhoto({
		theme: 'light_rounded', /* light_rounded / dark_rounded / light_square / dark_square / facebook */
		social_tools: false,
		deeplinking: false
	});
	$('.gallery-covers').click(function() {
				
		if($(this).hasClass("gallery-covers-onclick"))
	    	$(this).removeClass("gallery-covers-onclick",{duration:500});
		else
			$(this).addClass("gallery-covers-onclick",{duration:500});
		
		if($(this).children(".gallery-covers-image").hasClass("gallery-covers-onclick"))
			$(this).children(".gallery-covers-image").removeClass("gallery-covers-onclick",{duration:500});
		else
			$(this).children(".gallery-covers-image").addClass("gallery-covers-onclick",{duration:500});
		
		if($(this).children("#venue").hasClass("fixed-venue")){
			$(this).children("#venue").removeClass("fixed-venue");
			$(this).children("#venue").addClass("venue");
		}
		else{
			$(this).children("#venue").removeClass("venue");
			$(this).children("#venue").addClass("fixed-venue");
		}
		$(this).siblings(".gallery-images").toggle(1000); 
	});
	
});

</script>

<script>
		// Wait for window load
		$(window).load(function() {
			// Animate loader off screen
			$("#loader").hide(500);
		});
	</script>	


</head>
<body class="gallery-body">

	<jsp:include page="header.jsp"></jsp:include>	
	
	<div class="gallery-heading-enclosure"> 
		<p class="customfont">Gallery</p>
	</div>
	
	<div class="gallery-item">
		<div class="gallery-covers first">
			<img class="gallery-covers-image" src="images/gallery/Humming_Tree/cover.jpg" align="middle">
			<p class="customfont venue" id="venue">The Humming Tree</p>
			<p class="customfont date" id="date"></p>
		</div>
		
		<div class="gallery-images">
			<div class="container">
			
				<div class="row">
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Humming_Tree/1.jpg" rel="prettyPhoto[htree]">
							<img src="images/gallery/Humming_Tree/1.jpg" width="100%" alt="Humming Tree 1" /></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Humming_Tree/2.jpg" rel="prettyPhoto[htree]">
							<img src="images/gallery/Humming_Tree/2.jpg" width="100%" alt="Humming Tree 2" /></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Humming_Tree/3.jpg" rel="prettyPhoto[htree]">
							<img src="images/gallery/Humming_Tree/3.jpg" width="100%" alt="Humming Tree 3" /></a>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Humming_Tree/4.jpg" rel="prettyPhoto[htree]">
							<img src="images/gallery/Humming_Tree/4.jpg" width="100%" alt="Humming Tree 4" /></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Humming_Tree/5.jpg" rel="prettyPhoto[htree]">
							<img src="images/gallery/Humming_Tree/5.jpg" width="100%" alt="Humming Tree 5" /></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Humming_Tree/6.jpg" rel="prettyPhoto[htree]">
							<img src="images/gallery/Humming_Tree/6.jpg" width="100%" alt="Humming Tree 6" /></a>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Humming_Tree/7.jpg" rel="prettyPhoto[htree]">
							<img src="images/gallery/Humming_Tree/7.jpg" width="100%" alt="Humming Tree 7" /></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Humming_Tree/8.jpg" rel="prettyPhoto[htree]">
							<img src="images/gallery/Humming_Tree/8.jpg" width="100%" alt="Humming Tree 8" /></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Humming_Tree/9.jpg" rel="prettyPhoto[htree]">
							<img src="images/gallery/Humming_Tree/9.jpg" width="100%" alt="Humming Tree 9" /></a>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Humming_Tree/10.jpg" rel="prettyPhoto[htree]">
							<img src="images/gallery/Humming_Tree/10.jpg" width="100%" alt="Humming Tree 10" /></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Humming_Tree/11.jpg" rel="prettyPhoto[htree]">
							<img src="images/gallery/Humming_Tree/11.jpg" width="100%" alt="Humming Tree 11" /></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Humming_Tree/12.jpg" rel="prettyPhoto[htree]">
							<img src="images/gallery/Humming_Tree/12.jpg" width="100%" alt="Humming Tree 12" /></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="gallery-item">
		<div class="gallery-covers">
			<img class="gallery-covers-image" src="images/gallery/Big_Pitcher/cover.jpg" align="middle">
			<p class="customfont venue" id="venue">Big Pitcher</p>
			<p class="customfont date"></p>
		</div>
		
		<div class="gallery-images">
			<div class="container">
			
				<div class="row">
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Big_Pitcher/1.jpg" rel="prettyPhoto[bpitcher]">
							<img src="images/gallery/Big_Pitcher/1.jpg" width="100%" alt="Big Pitcher 1" /></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Big_Pitcher/2.jpg" rel="prettyPhoto[bpitcher]">
							<img src="images/gallery/Big_Pitcher/2.jpg" width="100%" alt="Big Pitcher 2" /></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Big_Pitcher/3.jpg" rel="prettyPhoto[bpitcher]">
							<img src="images/gallery/Big_Pitcher/3.jpg" width="100%" alt="Big Pitcher 3" /></a>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Big_Pitcher/4.jpg" rel="prettyPhoto[bpitcher]">
							<img src="images/gallery/Big_Pitcher/4.jpg" width="100%" alt="Big Pitcher 4" /></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Big_Pitcher/5.jpg" rel="prettyPhoto[bpitcher]">
							<img src="images/gallery/Big_Pitcher/5.jpg" width="100%" alt="Big Pitcher 5" /></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Big_Pitcher/6.jpg" rel="prettyPhoto[bpitcher]">
							<img src="images/gallery/Big_Pitcher/6.jpg" width="100%" alt="Big Pitcher 6" /></a>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Big_Pitcher/7.jpg" rel="prettyPhoto[bpitcher]">
							<img src="images/gallery/Big_Pitcher/7.jpg" width="100%" alt="Big Pitcher 7" /></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Big_Pitcher/8.jpg" rel="prettyPhoto[bpitcher]">
							<img src="images/gallery/Big_Pitcher/8.jpg" width="100%" alt="Big Pitcher 8" /></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Big_Pitcher/9.jpg" rel="prettyPhoto[bpitcher]">
							<img src="images/gallery/Big_Pitcher/9.jpg" width="100%" alt="Big Pitcher 9" /></a>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Big_Pitcher/10.jpg" rel="prettyPhoto[bpitcher]">
							<img src="images/gallery/Big_Pitcher/10.jpg" width="100%" alt="Big Pitcher 10" /></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Big_Pitcher/11.jpg" rel="prettyPhoto[bpitcher]">
							<img src="images/gallery/Big_Pitcher/11.jpg" width="100%" alt="Big Pitcher 11" /></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Big_Pitcher/12.jpg" rel="prettyPhoto[bpitcher]">
							<img src="images/gallery/Big_Pitcher/12.jpg" width="100%" alt="Big Pitcher 12" /></a>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Big_Pitcher/13.jpg" rel="prettyPhoto[bpitcher]">
							<img src="images/gallery/Big_Pitcher/13.jpg" width="100%" alt="Big Pitcher 13" /></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Big_Pitcher/14.jpg" rel="prettyPhoto[bpitcher]">
							<img src="images/gallery/Big_Pitcher/14.jpg" width="100%" alt="Big Pitcher 14" /></a>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	
	<div class="gallery-item">
		<div class="gallery-covers">
			<img class="gallery-covers-image" src="images/gallery/Bflat/cover.jpg" align="middle">
			<p class="customfont venue" id="venue">BFlat</p>
			<p class="customfont date"></p>
		</div>
		
		<div class="gallery-images">
			<div class="container">
			
				<div class="row">
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Bflat/1.jpg" rel="prettyPhoto[Bflat]">
							<img src="images/gallery/Bflat/1.jpg" width="100%" alt="BFlat 1" /></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Bflat/2.jpg" rel="prettyPhoto[Bflat]">
							<img src="images/gallery/Bflat/2.jpg" width="100%" alt="BFlat 2" /></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Bflat/3.jpg" rel="prettyPhoto[Bflat]">
							<img src="images/gallery/Bflat/3.jpg" width="100%" alt="BFlat 3" /></a>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Bflat/4.jpg" rel="prettyPhoto[Bflat]">
							<img src="images/gallery/Bflat/4.jpg" width="100%" alt="BFlat 4" /></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Bflat/5.jpg" rel="prettyPhoto[Bflat]">
							<img src="images/gallery/Bflat/5.jpg" width="100%" alt="BFlat 5" /></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Bflat/6.jpg" rel="prettyPhoto[Bflat]">
							<img src="images/gallery/Bflat/6.jpg" width="100%" alt="BFlat 6" /></a>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Bflat/7.jpg" rel="prettyPhoto[Bflat]">
							<img src="images/gallery/Bflat/7.jpg" width="100%" alt="BFlat 7" /></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Bflat/8.jpg" rel="prettyPhoto[Bflat]">
							<img src="images/gallery/Bflat/8.jpg" width="100%" alt="BFlat 8" /></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Bflat/9.jpg" rel="prettyPhoto[Bflat]">
							<img src="images/gallery/Bflat/9.jpg" width="100%" alt="BFlat 9" /></a>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Bflat/10.jpg" rel="prettyPhoto[Bflat]">
							<img src="images/gallery/Bflat/10.jpg" width="100%" alt="BFlat 10" /></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Bflat/11.jpg" rel="prettyPhoto[Bflat]">
							<img src="images/gallery/Bflat/11.jpg" width="100%" alt="BFlat 11" /></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Bflat/12.jpg" rel="prettyPhoto[Bflat]">
							<img src="images/gallery/Bflat/12.jpg" width="100%" alt="BFlat 12" /></a>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	
	<div class="gallery-item">
		<div class="gallery-covers">
			<img class="gallery-covers-image" src="images/gallery/Humming_Tree_2/cover.jpg" align="middle">
			<p class="customfont venue" id="venue">The Humming Tree</p>
			<p class="customfont date"></p>
		</div>
		
		<div class="gallery-images">
			<div class="container">
			
				<div class="row">
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Humming_Tree_2/1.jpg" rel="prettyPhoto[Humming_Tree_2]">
							<img src="images/gallery/Humming_Tree_2/1.jpg" width="100%" alt="Humming Tree 1" /></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Humming_Tree_2/2.jpg" rel="prettyPhoto[Humming_Tree_2]">
							<img src="images/gallery/Humming_Tree_2/2.jpg" width="100%" alt="Humming Tree 2" /></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Humming_Tree_2/3.jpg" rel="prettyPhoto[Humming_Tree_2]">
							<img src="images/gallery/Humming_Tree_2/3.jpg" width="100%" alt="Humming Tree 3" /></a>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Humming_Tree_2/4.jpg" rel="prettyPhoto[Humming_Tree_2]">
							<img src="images/gallery/Humming_Tree_2/4.jpg" width="100%" alt="Humming Tree 4" /></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Humming_Tree_2/5.jpg" rel="prettyPhoto[Humming_Tree_2]">
							<img src="images/gallery/Humming_Tree_2/5.jpg" width="100%" alt="Humming Tree 5" /></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Humming_Tree_2/6.jpg" rel="prettyPhoto[Humming_Tree_2]">
							<img src="images/gallery/Humming_Tree_2/6.jpg" width="100%" alt="Humming Tree 6" /></a>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Humming_Tree_2/7.jpg" rel="prettyPhoto[Humming_Tree_2]">
							<img src="images/gallery/Humming_Tree_2/7.jpg" width="100%" alt="Humming Tree 7" /></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Humming_Tree_2/8.jpg" rel="prettyPhoto[Humming_Tree_2]">
							<img src="images/gallery/Humming_Tree_2/8.jpg" width="100%" alt="Humming Tree 8" /></a>
						</div>
					</div>
				</div>
		
			</div>
		</div>
	</div>
	
	<div class="gallery-item">
		<div class="gallery-covers">
			<img class="gallery-covers-image" src="images/gallery/Hard_Rock/cover.jpg" align="middle">
			<p class="customfont venue" id="venue">Hard Rock Cafe</p>
			<p class="customfont date"></p>
		</div>
		
		<div class="gallery-images">
			<div class="container">
			
				<div class="row">
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Hard_Rock/1.jpg" rel="prettyPhoto[Hard_Rock]">
							<img src="images/gallery/Hard_Rock/1.jpg" width="100%" alt="Hard Rock Cafe 1" /></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Hard_Rock/2.jpg" rel="prettyPhoto[Hard_Rock]">
							<img src="images/gallery/Hard_Rock/2.jpg" width="100%" alt="Hard Rock Cafe 2" /></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Hard_Rock/3.jpg" rel="prettyPhoto[Hard_Rock]">
							<img src="images/gallery/Hard_Rock/3.jpg" width="100%" alt="Hard Rock Cafe 3" /></a>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Hard_Rock/4.jpg" rel="prettyPhoto[Hard_Rock]">
							<img src="images/gallery/Hard_Rock/4.jpg" width="100%" alt="Hard Rock Cafe 4" /></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Hard_Rock/5.jpg" rel="prettyPhoto[Hard_Rock]">
							<img src="images/gallery/Hard_Rock/5.jpg" width="100%" alt="Hard Rock Cafe 5" /></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Hard_Rock/6.jpg" rel="prettyPhoto[Hard_Rock]">
							<img src="images/gallery/Hard_Rock/6.jpg" width="100%" alt="Hard Rock Cafe 6" /></a>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Hard_Rock/7.jpg" rel="prettyPhoto[Hard_Rock]">
							<img src="images/gallery/Hard_Rock/7.jpg" width="100%" alt="Hard Rock Cafe 7" /></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Hard_Rock/8.jpg" rel="prettyPhoto[Hard_Rock]">
							<img src="images/gallery/Hard_Rock/8.jpg" width="100%" alt="Hard Rock Cafe 8" /></a>
						</div>
					</div>
				</div>	
								
			</div>
		</div>
	</div>
	
	<div class="gallery-item">
		<div class="gallery-covers">
			<img class="gallery-covers-image" src="images/gallery/Tilt/cover.jpg" align="middle">
			<p class="customfont venue" id="venue">Tilt Studios</p>
			<p class="customfont date"></p>
		</div>
		
		<div class="gallery-images">
			<div class="container">
			
				<div class="row">
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Tilt/1.jpg" rel="prettyPhoto[tilt]">
							<img src="images/gallery/Tilt/1.jpg" width="100%" alt="Tilt Studio 1" /></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Tilt/2.jpg" rel="prettyPhoto[tilt]">
							<img src="images/gallery/Tilt/2.jpg" width="100%" alt="Tilt Studio 2" /></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Tilt/3.jpg" rel="prettyPhoto[tilt]">
							<img src="images/gallery/Tilt/3.jpg" width="100%" alt="Tilt Studio 3" /></a>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Tilt/4.jpg" rel="prettyPhoto[tilt]">
							<img src="images/gallery/Tilt/4.jpg" width="100%" alt="Tilt Studio 4" /></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="hover_thumbnail"><a href="images/gallery/Tilt/5.jpg" rel="prettyPhoto[tilt]">
							<img src="images/gallery/Tilt/5.jpg" width="100%" alt="Tilt Studio 5" /></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<p class="photo-credits" style="color:white; font-size: 1.3em; margin: 20px;">The credits for all the amazing phototgraphs go out to <a>Sharath Vasistha</a>. Give him a shout out if you want to hire his services.</p>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>