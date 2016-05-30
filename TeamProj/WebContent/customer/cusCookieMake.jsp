<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Cookie coo;
	coo = new Cookie("customer","customerCookie");
	response.addCookie(coo);
	
	coo = new Cookie("customer2","customerCookie2");
	response.addCookie(coo);
	
	
%> 	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <a href=../cookieRead.jsp>root 쿠키 읽기 페이지로 가기</a>
     <a href=customer/cusCookieRead.jsp>customer 쿠키 읽기 페이지로 가기</a>
	 <a href=../joinus/joinCookieRead.jsp>joinus 쿠키 읽기 페이지로 가기</a>
</body>
</html>