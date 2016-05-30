<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/header.css" media="all" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>

<div class="wrap">
	<ul id="nav">
		<li><a href="<%=request.getContextPath()%>/#">홈</a></li>
		<li><a href="#">도움말</a>
				
		<li><a href="#">메시지</a>
			<ul>
				<li><a href="#">메시지</a></li>
				<li><a href="#">알림</a></li>
			</ul>			
		</li>
		<li><a href="<%=request.getContextPath()%>/joinus/login.do">로그인</a>
			<ul>
				<li><a href="<%=request.getContextPath()%>/joinus/join.do">회원가입</a></li>
				<li><a href="<%=request.getContextPath()%>/mypage/mypage.do">내 여행</a></li>
				<li><a href="<%=request.getContextPath()%>/#">프로필 수정</a></li>
				<li><a href="<%=request.getContextPath()%>/#">로그아웃</a></li>
			</ul>
		</li>
	</ul>
</div>

<script type="text/javascript">
$(document).ready(function() {	
	$('#nav li').hover(function() {
		$('ul', this).slideDown(200);
		$(this).children('a:first').addClass("hov");
	}, function() {
		$('ul', this).slideUp(100);
		$(this).children('a:first').removeClass("hov");		
	});
});
</script>

