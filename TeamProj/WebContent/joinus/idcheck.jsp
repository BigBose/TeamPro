<%@page import="com.team.sharemap.vo.Members"%>
<%@page import="com.team.sharemap.dao.MembersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%
	String id = request.getParameter("id");
	System.out.println(id);
	MembersDAO dao= new MembersDAO();
	Members m = dao.getMember(id);
	
	if(m==null){
		out.write("yes");
	}else{
		out.write("no");
	}
%>  
