<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int cnt = (int)request.getAttribute("cnt");

%> 

	{"cnt": <%= cnt %> }