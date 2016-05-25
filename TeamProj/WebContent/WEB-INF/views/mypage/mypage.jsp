<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">

<link
	href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,300italic,700&subset=latin,cyrillic-ext,latin-ext,cyrillic'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/font-awesome/4.0.1/css/font-awesome.min.css">
<link rel="stylesheet" href="../css/jquery.multilevelpushmenu_red.css">
<link rel="stylesheet" href="../css/mypage.css">
<link rel="stylesheet" href="../css/addItinerary.css">

<!-- 맵 관련 스크립트 -->
<script type="text/javascript"
	src="http://maps.google.com/maps/api/js?sensor=true">
</script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBdfY8kH8_QMW9nUT1JXVtVY-9TL7LSSJw&callback=initMap">
</script>
<script type="text/javascript" src="../js/map.js"></script>

</head>
<body>
	<div id="pushobj">
		<div>
			<h1>my page</h1>
		</div>
		<div id="map" style="width: 600px; height: 400px; text-align: center;"></div>
	</div>

	<div id="menu">
		<nav>
			<h2>
				<i class="fa fa-reorder"></i>All Categories
			</h2>
			<ul>
				<li><a href="#"><i class="fa fa-laptop"></i>2016, 미국</a>
					<h2>
						<i class="fa fa-laptop"></i>2016년, 미국
					</h2>
					<ul>
						<li><a href="#">day1</a>
						<li><a href="#">day2</a>
						<li><a href="#">day3</a>
					</ul></li>
				<li><a href="#"><i class="fa fa-book"></i>test</a>
					<h2>
						<i class="fa fa-book"></i>test
					</h2>
					<ul>
						<li><a href="#">National Geographics</a></li>
						<li><a href="#">The Spectator</a></li>
						<li><a href="#">Rambler</a></li>
						<li><a href="#">Physics World</a></li>
						<li><a href="#">The New Scientist</a></li>
					</ul></li>
				<li><a href="#" class="btn-example"
               onclick="layer_open('layer2');return false;">여행 일정 추가</a></li>
			</ul>
		</nav>
	</div>

	<div class="layer">
		<div class="bg"></div>
		<div id="layer2" class="pop-layer">
			<div class="pop-container">
				<div class="pop-conts">
					<form action="#" method="post"> -->
						<h1>여행 일정 추가</h1>
						<input type="text" placeholder="예)2016년, 미국 여행" name="trip"
							value="" /></br>
						<input type="submit" value="추가" /> </br> 
					</form>
				</div>
			</div>
		</div>
	</div>
	
	
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="../js/jquery.multilevelpushmenu.min.js"></script>
	<script type="text/javascript" src="../js/category.js"></script>
</body>
</html>
