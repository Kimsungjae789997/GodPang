<%@page import="shop.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%
// 	MemberVO vo = (MemberVO)session.getAttribute("loginMember");

%>

<title>쿠팡 주문 결제</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
  <h1 class="text-center my-5">쿠팡 주문 결제 </h1>
      <hr>
      <br>
  <div class="row">
    <div class="col-md-6">
      <h4>구매자 정보</h4>
      <form>
        <div class="form-group">
          <label for="buyerName">이름</label>
          <input type="text" class="form-control" id="buyerName"  placeholder="구매자 이름">
        </div>
        <div class="form-group">
          <label for="buyerEmail">이메일</label>
          <input type="email" class="form-control" id="buyerEmail" placeholder="구매자 이메일">
        </div>
        <div class="form-group">
          <label for="buyerPhone">전화번호</label>
          <input type="text" class="form-control" id="buyerPhone" placeholder="구매자 전화번호">
        </div>
      </form>
    </div>
    <div class="col-md-6">
      <h4>받는 사람 정보</h4>
      <form>
        <div class="form-group">
          <label for="recipientName">이름</label>
          <input type="text" class="form-control" id="recipientName" value="이름" placeholder="받는 사람 이름">
        </div>
        <div class="form-group">
          <label for="recipientAddress">배송지</label>
          <input type="text" class="form-control" id="recipientAddress" value="배송지" placeholder="받는 사람 주소">
        </div>
        <div class="form-group">
          <label for="recipientPhone">전화번호</label>
          <input type="text" class="form-control" id="recipientPhone" value="전화번호" placeholder="받는 사람 전화번호">
        </div>
      </form>
    </div>
  </div>
  <hr>
  <br>
  <div class="row mt-5">
    <div class="col-md-12">
      <h4>배송 상품 목록</h4>
      <table class="table">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">상품명</th>
            <th scope="col">가격</th>
            <th scope="col">수량</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th scope="row">1</th>
            <td>상품 1</td>
            <td>₩10,000</td>
            <td>1</td>
          </tr>
          <tr>
            <th scope="row">2</th>
            <td>상품 2</td>
            <td>₩20,000</td>
            <td>1</td>
          </tr>
          <!-- 추가 상품 목록은 여기에 추가할 수 있습니다. -->
        </tbody>
      </table>
    </div>
  </div>
  <button type="button" class="btn btn-primary">카카오페이 결제</button>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

