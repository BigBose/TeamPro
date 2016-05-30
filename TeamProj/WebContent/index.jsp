<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="WEB-INF/views/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="css/index.css"/>
<title>Insert title here</title>
</head>
<body>	
	<section class="content">
		<article class="search">
			<input type="search" name="" value=""/>
		</article>
		
		<article class="container">
			<article class="menu">
				<ul>
					<li>test</li>
					<li>test</li>
					<li>test</li>
				</ul>
			</article>	
			
			<article class="box">
				<div>
					<%for(int i=0; i<9; i++){ %>
						<div> test </div>
					<%} %>
				</div>
			</article>
					
		</article>
	</section>
</body>
</html> 