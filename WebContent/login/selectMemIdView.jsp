<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String userid = (String)request.getAttribute("userid");
	if(userid==null){
		
%>
	{"userid":"없는계정입니다"}
<%
	}else{
%>
	{"userid":"<%=userid%>"}
<%
	}
%>