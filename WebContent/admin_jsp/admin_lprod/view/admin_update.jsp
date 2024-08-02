<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int cnt = (int)request.getAttribute("cnt");

	if(cnt>0){
%>
	{
		"res" : "수정성공"
	}
	<%}else{%>
	{
		"res" : "수정실패"
	}
	<%}%>