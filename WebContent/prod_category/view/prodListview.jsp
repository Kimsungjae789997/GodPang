<%@page import="com.google.gson.Gson"%>
<%@page import="shop.vo.ProdVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	List<ProdVO> list = (List<ProdVO>)request.getAttribute("list");
	
	Gson gson = new Gson();
	   
	String result = gson.toJson(list);
	
	
	out.print(result);
	
	out.flush();
	
%>
