<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String admin_code = (String)request.getAttribute("admin_code");
if(admin_code == null){
%>
	{"result" : "실패"}
<%}else{%>
	{"result" : "성공"}
<%}%>