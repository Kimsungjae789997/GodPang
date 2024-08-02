
<%@page import="shop.vo.ProdVO"%>
<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// controller에서 저장한 데이터 꺼내기
List<ProdVO> list = (List<ProdVO>)request.getAttribute("list");


// Gson 라이브러리를 이용하여 json데이터를 생성
// Gson : Google에서 제공하는 API

JsonObject obj = new JsonObject();

// List를 json배열로 생성
// Gson gson = new Gson();
Gson gson = new GsonBuilder().setPrettyPrinting().create();
JsonElement ele= gson.toJsonTree(list);

obj.add("datas", ele);

out.print(obj);
out.flush();
%>