<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Cookie[] coos = request.getCookies();
	if(coos!=null){
		for(Cookie coo : coos){
		out.write("key : "+coo.getName()+"</br>");
		out.write("value : "+URLDecoder.decode(coo.getValue(),"UTF-8")+"</br>");
		}
	}else{
		out.write("전달된 쿠키가 없습니다.");
	}
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <a href=cusCookieMake.jsp>customer 쿠키 작성 페이지로 가기</a>
     <!-- <a href=customer/cusCookieRead.jsp>customer 쿠키 읽기 페이지로 가기</a>
	 <a href=joinus/joinCookieRead.jsp>joinus 쿠키 읽기 페이지로 가기</a> -->
</body>
</html>