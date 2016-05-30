
<%@page import="com.team.sharemap.util.CookieSearch"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<%@ include file="../header.jsp"%>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<title>index</title>
		<link href="login.css" type="text/css" rel="stylesheet" />
	</head>	
	<body>
		<div id="main">
			<div class="top-wrapper clear">
				<div id="content">
					<h2>로그인</h2>
					<h3 class="hidden">방문페이지 로그</h3>
					<ul id="breadscrumb" class="block_hlist clear">
						<li>
							HOME
						</li>
						<li>
							회원가입
						</li>
						<li>
							로그인
						</li>
					</ul>
					<h3 class="hidden">회원가입 폼</h3>
					<div id="join-form" class="join-form margin-large" >
							<ul>
							<c:if test="${!empty error}">
								
									<li>${error}</li>
								
							</c:if>	
							</ul>					
						<form action="login.do" method="post">  
						   <fieldset>
                                <legend class="hidden">로그인 폼</legend>
                                <h3><img src="images/txtTitle.png" /></h3>
                                <ul id="loginBox">
                                  <li>
                                  <c:if test="${!empty cookieMid}">
                                  
                                    <li><label for="uid">아이디</label><input name="id" value="${cookieMid}" class="text" /></li>
                                   </c:if>
                                  
                                   <c:if test="${empty cookieMid}">
                                    <li><label for="uid">아이디</label><input name="id" class="text" /></li>
                                   
                                   </c:if>
                                  </li>
                                  <li>
                                   <c:if test="${!empty cookieMid}">
                                   	     <%-- <%if(cookiePwd!=null && !cookiePwd.equals("")){ %> --%> 
                                   		 <li><label for="pwd">비밀번호</label><input type="password" name="pwd" vlaue ="${cookiePwd} class="text" /></li>
                                   </c:if>
                                   <c:if test="${empty cookieMid}">
                                    <%-- <%}else{ %> --%>
                                    <li><label for="pwd">비밀번호</label><input type="password" name="pwd" class="text" /></li>
                                    <%-- <%} %> --%>
                                   </c:if>
                                  </li>
                                </ul>
                                
                                <p><input type="submit" id="btnLogin" value="" /></p>
                                
                                <ul id="loginOption">
                                	<li>
                                	<c:if test="${!empty cookieMid}">
                                	<%-- <%if(cookieMid !=null && !cookieMid.equals("")) {%> --%>
                                		<input type="checkbox" name="checkBoxMid" checked="checked"/>자동로그인
                                	</c:if>
                                	<c:if test="${empty cookieMid}">	
                                	<%-- <%}else{%> --%>
                                		<input type="checkbox" name="checkBoxMid" />자동로그인
                                	<%-- <%} %> --%>
                                	</c:if>	
                                	</li>
                                    <li><span>아이디 또는 비밀번호를 분실하셨나요?</span><a href=""><img alt="ID/PWD 찾기" src="images/btnFind.png" /></a></li>
                                    <li><span>아이디가 없으신 분은 회원가입을 해주세요.</span><a href="join.do"><img alt="회원가입"  src="images/btnJoin.png" /></a></li>
                                </ul>
                                
                            </fieldset>
						</form>
					</div>
					
				</div>
				
			</div>
		</div>
		
	</body>
</html>
