<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String res = (String)request.getAttribute("res");

	if(res == null){
%>
	{
		"flag" : "사용가능"
	}
<%}else { %>
	{
		"flag" : "사용불가능"
	}	
<%
	}
%>