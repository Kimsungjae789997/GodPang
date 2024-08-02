<%@page import="shop.vo.ProdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/prod_detail.css" type="text/css" />
<script src="./admin_js/jquery-3.7.1.min.js"></script>
<script src="./prod_detail.js"></script>
</head>
<body>
<%	
	
	ProdVO vo = (ProdVO) request.getAttribute("vo");
	int cnt = (int)request.getAttribute("cnt");
	int reviewcnt = (int)request.getAttribute("reviewcnt");
%>
<header>
	  <h2 style="text-align: center;"><%=vo.getProd_name() %></h2>
</header>
<script type="text/javascript">
	mypath =  "<%= request.getContextPath() %>";
	prod_id = "<%=vo.getProd_id()%>";

	$(function() {
		// 상품 수량 + 상품 금액 계산
		 $("#myNumberInput").on("input", function() {
		 	var quantity = $("#myNumberInput").val();
		 	var pricePerItem = <%= vo.getProd_price() %>; // 상품 가격을 JSP에서 가져와서 변수에 저장합니다.
		 	var totalPrice = quantity * pricePerItem;
		    
			// 계산된 총 결제 금액을 화면에 업데이트합니다.
			$("#clacPrice").text(totalPrice + "원");
		 });
		  // 구매하기 
		 $('#btns2').on('click', function() {
			    var quantity = $("#myNumberInput").val();
			    var pricePerItem = <%= vo.getProd_price() %>;
			    var totalPrice = quantity * pricePerItem;
				var prod_id = <%= vo.getProd_id() %>;
			    // 데이터를 URL 파라미터로 추가하여 페이지 이동합니다.
			    location.href = "<%= request.getContextPath()%>/cartProd.do?quantity=${quantity}&totalPrice=${totalPrice}&prod_id=${prod_id}";
			});
		  
	});

	
</script>



<div class="wrapper" style="display: flex;">
	<section class="product_view">
	    <div class="img">
	        <img src="./images/prod/<%=vo.getLprod_gu() %>/<%=vo.getProd_img()%>" alt="">
	    </div>
	    <table>
	        <colgroup>
	            <col style="width: 150px;">
	            <col>
	        </colgroup>
	        <tbody>
	            <tr>
	                <th>리뷰갯수</th>
	                <td ><a href="#" id="review_count"> <%=reviewcnt%> </a></td>
	            </tr>
	            <tr>
	                <th>판매가</th>
	                <td class="price"><%=vo.getProd_price() %></td>
	            </tr>
	            <tr>
	                <th>상품 등록일</th>
	                <td class="addDate"><%=vo.getProd_insdate() %></td>
	            </tr>
	            <tr>
	                <th>구매수량</th>
	                <td>
	                    <div class="length">
	                        <input id="myNumberInput" type="number" min="0" max="<%=cnt %>" value="1">
	                    </div>
	                </td>
	            </tr>
	            <tr>
	                <th>배송비</th>
	                <td>무료배송</td>
	            </tr>
	             <tr>
	                <th>결제금액</th>
	                <td class="total"><b>총 선택상품가격 :</b> <br><span id="clacPrice"><%=vo.getProd_price()%> 원  </span> </td>
	            </tr>
				<tr>
				    <th><button id="btns1" style="width: 100px; height: 40px;">장바구니</button></th>
				    <td><button id="btns2" style="width: 100px; height: 40px;">구매하기</button></td>
				</tr>
	        </tbody>
	    </table>
	</section>
</div>

<footer>

</footer>

</body>
</html>
<%@include file="./prod_detail_center.jsp" %>