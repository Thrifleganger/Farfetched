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
	
	$('#populate').click(function(){
		
		$.ajax({
			url:'/Farfetched/ajaxAction',
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
				<div class="col-md-10">
					<div class="blog-item">
						<div class="blog-cover-image">
							<img src="images/Humming_Tree/1.jpg">
							<div class="blog-cover-title">This is a test!!
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	

</body>
</html>