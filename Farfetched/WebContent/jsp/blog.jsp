<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>B</title>

<link rel="stylesheet" href="css/global.css">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<script>

$(document).ready(function(){ 
	
	$.ajax({
		url:'/Farfetched/ajaxAction',
		data: 'method=populateBlogEntriesOnPageLoad',
		success: function (jsonResponse) {
			alert(jsonResponse);
			
			var myJSONText= jQuery.parseJSON(jsonResponse.replace(/(\/\*|\*\/)/g, ''));				
			var counter;
			var blog_counter;
			
			for(counter=1; counter < 5; counter++){
				
				blog_counter = "blog"+counter;
				alert("counter: "+counter);
				
				$('.blog-item-container').append(
					'<div class="row" style="height:300px;">'+
						'<div class="col-md-10">'+
							'<div id="blog-item'+counter+'"><div class="blog-cover-image">'+
								'<img class="image-link'+counter+'" src="">'+
								'<div class="blog-cover-title'+counter+'">This is a test!!</div>'+
							'</div>'+
						'</div>'+
					'</div>'
				);
				
				$('.blog-cover-title'+counter).html(myJSONText[blog_counter].title);
				$('.image-link'+counter).attr("src",myJSONText[blog_counter].image);
				
			}
			
			
			
			
			
			
			
			/* $.each(jsonResponse, function(index, value) {
               alert(index);
               alert(value);
               $.each(value, function(index1, value1) {
                   alert(index1);
                   alert(value1);
                   
            	});   
        	});    */
		}
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
	
});

</script> 

</head>
<body class="discover-body-green">

	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="clearfix-blog"></div>
	
	<h2> </h2>
	
	<a id="populate">Populate</a>
	
	<br>
	<div class="populateContent"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-10">
				<div class="filter-top">
					Filter by: <a class="filter-by-date">Date</a> <a class="filter-by-pop">Popularity</a>
				</div>
			</div>
		</div>
		<div class="blog-item-container">
			<div class="row">
				<div class="col-md-5">
					<div class="blog-item">
						<div class="blog-cover-image">
							<img src="images/Humming_Tree/1.jpg" class="image-link">
							<div class="blog-cover-title">This is a test!!
							</div>
						</div>
					</div>
				</div>
			</div>

		<!-- <div class="row"><div class="col-md-10"><div id="blog-item1"><div class="blog-cover-image"><img src="images/Humming_Tree/1.jpg" class="image-link1"><div class="blog-cover-title1">This is test 1</div></div></div></div></div><div class="row"><div class="col-md-10"><div id="blog-item2"><div class="blog-cover-image"><img src="images/Humming_Tree/2.jpg" class="image-link2"><div class="blog-cover-title2">This is test2</div></div></div></div></div><div class="row"><div class="col-md-10"><div id="blog-item3"><div class="blog-cover-image"><img src="images/Humming_Tree/1.jpg" class="image-link3"><div class="blog-cover-title3">This is test 3 bitches</div></div></div></div></div><div class="row"><div class="col-md-10"><div id="blog-item4"><div class="blog-cover-image"><img src="images/Humming_Tree/3.jpg" class="image-link4"><div class="blog-cover-title4">This is test 4</div></div></div></div></div></div> -->
	</div>
	

</body>
</html>