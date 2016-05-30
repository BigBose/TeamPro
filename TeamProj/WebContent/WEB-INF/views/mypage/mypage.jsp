<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">

<!-- css -->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,300italic,700&subset=latin,cyrillic-ext,latin-ext,cyrillic'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/font-awesome/4.0.1/css/font-awesome.min.css">
<link rel="stylesheet" href="../css/jquery.multilevelpushmenu_red.css">
<link rel="stylesheet" href="../css/addItinerary.css">
<link rel="stylesheet" href="../css/mypage.css">
<%@ include file="../header.jsp"%>
<!-- 맵 관련 스크립트 -->
<script type="text/javascript"
	src="http://maps.google.com/maps/api/js?sensor=true">
	
</script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBdfY8kH8_QMW9nUT1JXVtVY-9TL7LSSJw&callback=initMap">
	
</script>
<script type="text/javascript" src="../js/map.js"></script>
<!-- 메뉴/카테고리 관련 스크립트 -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="../js/jquery.multilevelpushmenu.min.js"></script>
<script type="text/javascript" src="../js/category.js"></script>
</head>
<body>
	<div class="mypage_body">
		<!-- 카테고리 -->
		<div id="menu">
			<nav>
				<h2>
					<i class="fa fa-reorder"></i>여행
				</h2>
				<ul>
					<c:forEach items="${itemList}" var="item">
						<li><a>${item.cname}</a>
							<h2>${item.cname}</h2>
							<ul>
								<li><a href="#">day1</a></li>
								<li><a href="#">day2</a></li>
								<li><a href="#">day3</a></li>
								<li><a href="#">+ 추가</a></li>
								<li><a href="#">- 삭제</a></li>
							</ul></li>
					</c:forEach>
					<li><a href="#" class="btn-example"
						onclick="layer_open('layer2');return false;"> + 일정 추가</a></li>
				</ul>
			</nav>
		</div>

		<!-- 본문 -->
		<div id="pushobj">
			<br><h3>My trips</h3>
			<div id="map_box">
				<div id="map"
					style="width: 100%; height: 500px;"></div>
			</div>
		</div>

		<!-- 여행 일정 추가 : 클릭시 보임  -->
		<div class="layer">
			<div class="bg"></div>
			<div id="layer2" class="pop-layer">
				<div class="pop-container">
					<div class="pop-conts">
						<form action="mypage.do" method="post">
							<h1>여행 일정 추가</h1>
							<input type="text" name="cname" placeholder="예)미국 여행" name="trip"
								value="" /><br> <input type="submit" value="추가" />
						</form>
					</div>
				</div>
			</div>
		</div>
		
		
	</div>
</body>
</html>
