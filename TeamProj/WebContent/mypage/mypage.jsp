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
<script type="text/javascript"
	src="http://oss.maxcdn.com/libs/modernizr/2.6.2/modernizr.min.js"></script>

<!-- 맵 관련 스크립트 -->
<script type="text/javascript"
	src="http://maps.google.com/maps/api/js?sensor=true">
</script>

<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBdfY8kH8_QMW9nUT1JXVtVY-9TL7LSSJw&callback=initMap">
</script>
<script>
	window.onload = function() {
		var mymap = document.getElementById("map");
		var latlng = [ [ 37.570535, 126.983648 ], [ 37.569693, 126.983219 ],
				[ 37.570408, 126.981899 ], [ 37.570535, 126.983516 ],
				[ 37.569693, 126.985417 ] ];

		var gmap = new google.maps.Map(mymap, {
			zoom : 16,
			left : new google.maps.LatLng(latlng[0][0], latlng[0][1]),
			center : new google.maps.LatLng(latlng[0][0], latlng[0][1]),
			mapTypeId : google.maps.MapTypeId.ROADMAP
		});

		var marker, i;
		for (i = 0; i < latlng.length; i++) {
			marker = new google.maps.Marker({
				position : new google.maps.LatLng(latlng[i][0], latlng[i][1]),
				map : gmap,
			});
		}

		var directionsDisplay = new google.maps.DirectionsRenderer({
			map : gmap
		});

		var request = {
			destination : new google.maps.LatLng(latlng[0][0], latlng[0][1]),
			origin  :new google.maps.LatLng(latlng[3][0], latlng[3][1]),
			travelMode : google.maps.TravelMode.DRIVING
		};

		var directionsService = new google.maps.DirectionsService();
		directionsService.route(request, function(response, status) {
			if (status == google.maps.DirectionsStatus.OK) {
				// Display the route on the map.
				directionsDisplay.setDirections(response);
			}
		});
	};
</script>
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
				<li><a href="#">+ 여행 일정 추가</a></li>
			</ul>
		</nav>
	</div>

	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="../js/jquery.multilevelpushmenu.min.js"></script>
	<script type="text/javascript" src="../js/category.js"></script>
</body>
</html>
