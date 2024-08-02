<%@page import="shop.vo.PayVO"%>
<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// controller에서 저장한 데이터 꺼내기
List<PayVO> list = (List<PayVO>)request.getAttribute("asd");
int sp = (Integer)request.getAttribute("startp");
int ep = (Integer)request.getAttribute("endp");
int tp = (Integer)request.getAttribute("totalp");

// Gson 라이브러리를 이용하여 json데이터를 생성
// Gson : Google에서 제공하는 API

JsonObject obj = new JsonObject();
obj.addProperty("sp", sp);
obj.addProperty("ep", ep);
obj.addProperty("tp", tp);


// List를 json배열로 생성
// Gson gson = new Gson();
Gson gson = new GsonBuilder().setPrettyPrinting().create();
JsonElement ele= gson.toJsonTree(list);

obj.add("datas", ele);

out.print(obj);
out.flush();
%>