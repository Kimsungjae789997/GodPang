<%@page import="shop.vo.MembershipVO"%>
<%@page import="member.service.MemberServiceImpl"%>
<%@page import="member.service.IMemberService"%>
<%@page import="shop.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
 <link rel ="shortcut icon" href="#">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/mainpage.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <!-- 모달창 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- form -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<style>

#header *{
	/* overflow: hidden; */
}
*{
	/* overflow: auto; */
}

#sports_prod_list {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}


.sports_ul {
	display: flex;
}

.sports_ul li {
	margin-right: 35px;
}

.sports_div_class1 {
	display: inline-grid;
	position: absolute;
	top: 150px;
	left: 220px;
	width: 76%;
}
#sports_id_div1{
	
    margin-bottom: 13px;
	

}
마이페이지 카테고리 크기 조정
.sports_d1 {
	display: inline-block;
	margin: 60px; /* 필요에 따라 여백 조정 */
}

.category_list {
    border: 2px solid #ccc; /* 선의 두께를 조정합니다 */
    border-radius: 0; /* 선을 둥글게 만듭니다 */
    padding: 10px; /* 내부 여백을 추가합니다 */
    width: 200px; /* 가로 길이를 200px로 설정합니다 */
    height: 800px; /* 세로 길이를 800px로 설정합니다 */
    background-color: #f8f8f8; /* 더 연한 회색으로 배경색을 설정합니다 */
}
.sports_div_class1 {
    margin-left: 20px; /* 왼쪽 여백 추가 */
}

section {
        display: flex;
        justify-content: center; /* 가로 정렬 */
        align-items: center; /* 세로 정렬을 화면 중앙에 유지 */
        height: 50vh; /* 화면의 반만큼 섹션의 높이 설정 */
        margin-top: -50vh; /* 섹션을 더 위로 이동 */
        margin-right: 20px; /* 오른쪽으로 이동 */
}
        
.delivery img {
	display: inline-grid;
    position: absolute;
    top: 400px;
}

.line{
	color: black;
}
</style>
<script type="text/javascript">
$(function(){
	
	$('#membershipInsert').on('click',function(){
		
		$('#paymethod').modal('show');
			
	})
	
	
	$(document).on('click','#membershipDelete',function(){
		$('#paymethod').modal('hide');
		$('#membershipDelete2').modal('show');
	})
	
	
	$(document).on('click','#maintainMembership',function(){
		$('#membershipDelete2').modal('hide');
		
	})
	
	$(document).on('click', '#delete', function() {
	    window.location.href = "<%=request.getContextPath()%>/deleteMembership.do";
	});
	
	
	
	
	// == 수정
	
	$(document).on('click','#payUpdate',function(){

		$('#paymethod').modal('hide');
		
		 $('#myModal').modal('show');
		
	})
	
	
	$(document).on('click','#bank',function(){
		
		$('#myModal').modal('hide');
		$('#bank_insert').modal('show');
		
	})
	
	
	
	
	// 은행명, 은행계좌번호 둘다 적어야 등록이 가능하게 만듬
	var idval = $('#bank_name');
	$('#aisi').change(function(){
	    var myTag = $(this).val(); // Get the selected value directly
	    idval.val(myTag);
	})
	
	
	
    function checkInputs() {
        var bankName = $('#bank_name').val().trim();
        var accountNumber = $('#account').val().trim();
        // 계좌번호와 은행명이 모두 입력되었을 때 버튼을 활성화하고, 그렇지 않으면 비활성화 
        if (bankName !== '' && accountNumber !== '') {
            $('#registerBtn').prop('disabled', false);
        } else {
            $('#registerBtn').prop('disabled', true);
        }
    }

    // 계좌번호 입력 시 입력값 체크
    $('#account').on('input', function() {
        checkInputs();
    });

    // 은행명 선택 시 입력값 체크
    $('#aisi').on('change', function() {
        checkInputs();
    });
	
	
	
	
})
</script>
</head>
<body>
	<div id="containor" class="total_div">
		<header id="header">
			<nav>
				<!-- <div class="search_container"> -->
				<!-- </div> -->

				<div class="search_container">
					<!-- 갓팡 로고(클릭시 메인페이지로 이동) -->
					<a href="../mainpage.jsp" class="pad" title="Godpang - 내가 잘사는 이유">
						<img src="<%=request.getContextPath()%>/images/login/godpang.png" width="240" height="60"
						alt="갓팡로고">
					</a>

					<!-- 쿠팡 마이페이지 이미지를 넣는 부분 -->

					<!-- 검색단어 입력창 + 검색버튼 -->
					<a class="pad"> <input type="text" class="search_input"
						placeholder="찾고 싶은 상품을 검색해보세요!"></a> <a href="./search.jsp"
						class="pad"><button>검색</button></a>

					<!-- 로그인, 장바구니 -->
					<a href="./login.jsp" class="pad" title="로그인 하기"> <img
						src="<%=request.getContextPath()%>/images/mainpage/00.로그인.JPG" width="80" height="65"
						alt="로그인"><br>&nbsp;&nbsp;로그인
					</a> <a href="./cart.jsp" class="pad" title="장바구니 가기"> <img
						src="<%=request.getContextPath()%>/images/mainpage/00.장바구니3.JPG" width="80" height="65"
						alt="장바구니"><br>&nbsp;장바구니
					</a>
				</div>
			</nav>
		</header>
	</div>

	<!-- 마이페이지 카테고리 -->
	<!-- div로 전체를 감싸기 -->

	<!-- 좌측 마이페이지 카테고리 -->
	<div class="category_list">

		<aside id="left" style="flex: 1;">
			<!-- style="display: flex; -->
			<ul style="padding-top: 20px; padding-bottom: 20px;">
				<!-- 각 섹션 위아래로 공백 추가 -->
				<li><strong style="margin-bottom: 10px;">My 쇼핑</strong></li>
				<!-- <br> -->
				<li id="mypage_cartlist"><a href="#"
					style="margin-bottom: 5px;">주문목록</a></li>
			</ul>
			<hr style="margin-top: 20px; margin-bottom: 20px;">
			<!-- 첫 번째 섹션과 두 번째 섹션 사이에 경계선 추가 -->

			<ul style="padding-top: 20px; padding-bottom: 20px;">
				<!-- 각 섹션 위아래로 공백 추가 -->
				<li><strong style="margin-bottom: 10px;">My 혜택</strong></li>
				<br>
				<li id="mypage_membership"><a href="#"
					style="margin-bottom: 5px;">슈프림 멤버쉽 관리</a></li>
			</ul>
			<hr style="margin-top: 20px; margin-bottom: 20px;">
			<!-- 두 번째 섹션과 세 번째 섹션 사이에 경계선 추가 -->

			<ul style="padding-top: 20px; padding-bottom: 20px;">
				<!-- 각 섹션 위아래로 공백 추가 -->
				<li><strong style="margin-bottom: 10px;">My 활동</strong></li>
				<br>
				<li id="mypage_review"><a href="#" style="margin-bottom: 5px;">리뷰관리</a></li>
			</ul>
			<hr style="margin-top: 20px; margin-bottom: 20px;">
			<!-- 두 번째 섹션과 세 번째 섹션 사이에 경계선 추가 -->

			<ul style="padding-top: 20px; padding-bottom: 20px;">
				<!-- 각 섹션 위아래로 공백 추가 -->
				<li><strong style="margin-bottom: 10px;">My 정보</strong></li>
				<br>
				<li id="mypage_person"><a href="#" style="margin-bottom: 5px;">개인정보확인/수정</a></li>
				<li id="mypage_pay"><a href="#" style="margin-bottom: 5px;">결제수단관리</a></li>
				<li id="mypage_address"><a href="#" style="margin-bottom: 5px;">배송지
						관리</a></li>
			</ul>
		</aside>
	</div>


	<div class="sports_div_class1">

		
		<div style="text-align: center;">
   			 <img src="<%=request.getContextPath()%>/images/login/wow이미지.jpg" width="150px" height="100px" style="display: inline-block;">
		</div>
			<h1 align="center">슈프림 멤버십 관리</h1>
			<div align="right">
			<button id="membershipInsert" style= "color: black; font-weight: bold; border: 1px solid black; background-color: white; width: 100pt;">결제수단관리</button>
			</div>
			<hr class="line">
			
			<br><br>
		<div style="text-align: center;">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	<img alt="" src="<%=request.getContextPath()%>/images/login/슈프림.png" width="80%;" >
		</div>
		
		</div>
	
	
	
	
<!-- 처음 모달 -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">GodPang<span style="color: skyblue;"> Pay </span>- 결제수단 선택</h4>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
       <p style="font-weight: bold; text-align: center;font-size: 20pt;">멤버십은 언제든 해지 가능합니다.</p>
       <br><br>
       <div style="border: 1px solid #BDBDBD; background-color: #EAEAEA">
       		<div>
       			<button id="bank" style="background-color:white; margin: 20px auto; width: 100%; height: 50pt; font-weight: bold;"><img  width="50px;" height="50px;" src="<%=request.getContextPath()%>/images/login/delesign-bank.png">은행계좌 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img  width="50px;" height="50px;" src="<%=request.getContextPath()%>/images/login/pngwing.com (1).png"></button>
       		</div>
       		<br><br>
       		<div>
       			<button id="creditcard" style="background-color:white; margin: 20px auto;   width: 100%; height: 50pt; font-weight: bold;"><img  width="50px;" height="50px;" src="<%=request.getContextPath()%>/images/login/delesign-bank.png">신용/체크카드 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img  width="50px;" height="50px;" src="<%=request.getContextPath()%>/images/login/pngwing.com (1).png"></button>
       		</div>
       </div>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal" style="border-color : white; background-color: skyblue;">닫기</button>
      </div>


    </div>
  </div>
</div>
	
	
	
	
	

	
	
	
<!-- 월회비 결제 수단-->
<div class="modal" id="paymethod">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;월회비 결제 수단</h4>
      </div>
      <div>
      <br><br>
      <h6 style="font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;결제 정보</h6>
      <ul>
      	<li>매월 선택하신 자동결제가 이루어집니다!</li>
      	<li>결제가 실패할 경우 다시 시도해 보세요!</li>
      	<li>결제가 실패할 경우 새로운 결제수단을 선택해주세요!</li>
      	<li>해당 월에 결제일에 맞는 날짜가 없다면 그달 마지막 날에 결제됩니다!</li>
      </ul>
      </div>

	<!-- 회원 세션가져오기 -->
	<%MemberVO vo = (MemberVO) session.getAttribute("loginMember");
		IMemberService service = MemberServiceImpl.getService();
	  MembershipVO membershipVo = service.getBank(vo.getMem_id());
	%>	


      <!-- Modal body -->
      <div class="modal-body"><br><br><br><br>
      <%if(membershipVo == null){ %>
        <p style="font-weight: bold; font-size:15pt; text-align: center;">-등록한 결제수단 방법이 없습니다.-</p>  <!-- 결제수단 등록하면 여기에 셀렉트해준다.  이 결제수단 선택x =>수정으로 한다.        -->

	 <%}else{ %>
	 	<div style="display: flex;     flex-direction: column; align-items: center;"> 
	 		 <p style="font-weight: bold; font-size: 15pt;">-현재 자동결제하는 계좌-</p>
      		<p style="font-weight: bold; font-size: 25pt;"><%=membershipVo.getMembership_bank_name() %></p>
      		<p style="font-weight: bold; font-size: 25pt;"><%=membershipVo.getMembership_bank_no() %></p>
      		<button id="payUpdate" style="height:30pt; font-weight: bold; border: 1px solid black;">이 결제수단 수정</button>
      <%} %>
        </div>
        	<br><br><br><br><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <button id="membershipDelete" type="button" class="btn btn-danger" data-bs-dismiss="modal" style="width: 300pt; background-color: white; border: 3px solid skyblue; color: #5CD1E5; font-weight: bold;">결제 해지</button>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
         <button type="button" class="btn btn-danger" data-bs-dismiss="modal" style="border-color : white; background-color: skyblue;">닫기</button>
      </div>

    </div>
  </div>
</div>	
	
	
	
	
	
	
	
	
	
<!-- The Modal -->
<div class="modal" id="bank_insert">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title" style="font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;은행 계좌 수정</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
		<div>
		<p style="font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;본인 명의의 계좌만 등록 가능합니다.</p>
		</div>
      <!-- Modal body -->
      <div class="modal-body">
      
      <!-- flex form-->  	
 <div class="container mt-3">
  <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;본인 계좌 확인</h2>
  <form action="<%=request.getContextPath()%>/mypageBankUpdate.do" method="post">
    <div class="mb-3 mt-3">
      <label for="bank_name">은행명 : 
      <select name='aisi' id="aisi">
      	<option value="카카오뱅크">카카오뱅크</option>
      	<option value="농협">농협</option>
      	<option value="신한">신한</option>
      	<option value="하나">하나</option>
      	<option value="새마을금고">새마을금고</option>
      	<option value="대구">대구</option>
      	<option value="국민">국민</option>
      	<option value="전북">전북</option>
      	<option value="기업">기업</option>
      	<option value="우리">우리</option>
      </select>
      </label>
      <input type="text" class="form-control" id="bank_name" placeholder="Enter bank_name" name="bank_name">
    </div>
    <div class="mb-3">
      <label for="account">계좌번호:</label>
      <input type="text" class="form-control" id="account" placeholder="Enter account" name="account">
    </div>

    <button type="submit" id="registerBtn" disabled class="btn btn-primary" style="width: 100%; font-weight:bold; color: black; background-color:#EAEAEA; border-color: white; ">수정하기</button>
  </form>
</div>
        <!--  -->	
        	
        	
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-bs-dismiss="modal" style="border-color : white; background-color: skyblue;">닫기</button>
      </div>

    </div>
  </div>
</div>
	
	
	
	
	
	
	
	<!--멤버십 해지 확인하기 -->
	
	<!-- The Modal -->
<div class="modal" id="membershipDelete2">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title" style="font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;슈프림 멤버십 해지</h4>
        
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        	<div>
        		<img width="450pt;" height="300pt;"  src="<%=request.getContextPath()%>/images/login/멤버십혜택.png">
        	</div>
        	<br>
        	<br>
        	<div  style="display: flex;  flex-direction: column;align-items: center;">
        		<p style="font-size: 15pt;">그래도 해지 하시겠어요?</p>
        		<br>
        		<button  id="maintainMembership" style=" padding:20pt; color: white; font-weight: bold; background-color:#4374D9; border: 1px solid white; ">내가 받고 있는 혜택 유지하기</button>
      			<br>
      			----------------------- 또는 -----------------------
      			<br>
      			<br>
      			
      			<button  id="delete" style=" padding:20pt; color: #4374D9; font-weight: bold; background-color:white; border: 1px solid #4374D9; ">내가 받고 있는 혜택 포기하기</button>
      		</div>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-bs-dismiss="modal" style="border-color : white; background-color: skyblue;">닫기</button>
      </div>

    </div>
  </div>
</div>
	
	
	
	
	
	
</body>
</html>
