<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
<link rel="stylesheet" href="../../css/mainpage.css" type="text/css" />
</head>
<script src="../../admin_js/jquery-3.7.1.min.js"></script>
<script src="../sports/sports.js"></script>
<script src="../../admin_js/jquery.serializejson.min.js"></script>
	
	
<script type="text/javascript">
$(function() {
	mypath = "<%=request.getContextPath()%>";
	$.getLprodList();
	
})
</script>

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

</style>

<body>
	<div id="containor" class="total_div">
		<header id="header">
			<nav>
				<!-- <div class="search_container"> -->
				<!-- </div> -->

				<div class="search_container">
					<!-- 갓팡 로고(클릭시 메인페이지로 이동) -->
					<a href="../mainpage.jsp" class="pad" title="Godpang - 내가 잘사는 이유">
						<img src="../../images/login/godpang.png" width="240" height="60"
						alt="갓팡로고">
					</a>

					<!-- 쿠팡 마이페이지 이미지를 넣는 부분 -->

					<!-- 검색단어 입력창 + 검색버튼 -->
					<a class="pad"> <input type="text" class="search_input"
						placeholder="찾고 싶은 상품을 검색해보세요!"></a> <a href="./search.jsp"
						class="pad"><button>검색</button></a>

					<!-- 로그인, 장바구니 -->
					<a href="./login.jsp" class="pad" title="로그인 하기"> <img
						src="../../images/mainpage/00.로그인.JPG" width="80" height="65"
						alt="로그인"><br>&nbsp;&nbsp;로그인
					</a> <a href="./cart.jsp" class="pad" title="장바구니 가기"> <img
						src="../../images/mainpage/00.장바구니.JPG" width="80" height="65"
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

	<!-- 주문목록 시작 -->
	<div class="sports_div_class1">

		<!-- 검색창 추가 -->
		<div class="sports_div_class2">
			<h2>주문목록</h2>
			<div id="search_div"
				style="display: flex; align-items: center; margin-bottom: 10px;">
				<input type="text" id="search_input"
					placeholder="주문한 상품을 검색할 수 있어요!"
					style="flex: 1; height: 40px; width: 300px; padding: 5px; margin-right: 5px;">
				<button id="search_button"
					style="height: 45px; padding: 5px 15px; border: 1px solid #ccc; background-color: #fff;">검색</button>
				<span style="margin-left: 5px;"></span>
			</div>

			<!-- 검색창의 기간들     ex) 최근6개월 -->
			<div class="sports_div_class3">
				<div class="sports_div_sports4">
					<div id="sports_id_div1">
						<ul class="sports_ul"
							style="margin: 0; padding: 0; list-style: none; display: flex;">
							<li class="sports_selected" style="margin-right: 10px;">
								<button class="rounded_button"
									style="padding: 10px 15px; border-radius: 20px; border: 1px solid #ccc; background-color: #fff;">최근
									6개월</button>
							</li>
							<li class="sports_selected" style="margin-right: 10px;">
								<button class="rounded_button"
									style="padding: 10px 15px; border-radius: 20px; border: 1px solid #ccc; background-color: #fff;">2024</button>
							</li>
							<li class="sports_selected" style="margin-right: 10px;">
								<button class="rounded_button"
									style="padding: 10px 15px; border-radius: 20px; border: 1px solid #ccc; background-color: #fff;">2023</button>
							</li>
							<li class="sports_selected" style="margin-right: 10px;">
								<button class="rounded_button"
									style="padding: 10px 15px; border-radius: 20px; border: 1px solid #ccc; background-color: #fff;">2022</button>
							</li>
							<li class="sports_selected" style="margin-right: 10px;">
								<button class="rounded_button"
									style="padding: 10px 15px; border-radius: 20px; border: 1px solid #ccc; background-color: #fff;">2021</button>
							</li>
							<li class="sports_selected" style="margin-right: 10px;">
								<button class="rounded_button"
									style="padding: 10px 15px; border-radius: 20px; border: 1px solid #ccc; background-color: #fff;">2020</button>
							</li>
							<li class="sports_selected">






								<button class="rounded_button"
									style="padding: 10px 15px; border-radius: 20px; border: 1px solid #ccc; background-color: #fff;">2019</button>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="sports_prod_list">
		<section>
			<!-- 주문 목록 표시 부분 -->
		</section>
	</div>

	<div style="flex: 1;">
		<div class="delivery">
			<section>
				<img src="배송중.PNG" alt="배송 중 이미지" width="800px" height="900px">
			</section>
		</div>

	</div>

	<script>

// 주체별 이벤트 설정 해야함
// 1. 멤버쉽 회원
// 2. 일반 회원

$(function() {
	
	/* 주문록목창의 검색창 > 기간선택시 파란으로 변경 이벤트 */
	click1 = (rounded_button) => {
	    // 버튼 클릭 시 파란색으로 변경하는 이벤트 핸들러 추가
	    var buttons = document.querySelectorAll('.rounded_button');
	    buttons.forEach(function(button) {
	        button.addEventListener('click', function() {
	            this.style.backgroundColor = '#007bff'; // 파란색으로 변경
	            // 다른 버튼의 스타일 초기화
	            buttons.forEach(function(otherButton) {
	                if (otherButton !== button) {
	                    otherButton.style.backgroundColor = '#fff'; // 흰색으로 변경
	                }
	            });
	        });
	    }); 
	} // .rounded_button 이벤트 끝
	
	
	// '개인정보 확인/수정' 클릭시 이벤트
	$(document).on('click', '#mypage_person', function() {
		
		 // 1. '멤버쉽 관리' 화면 띄우기
		 $.ajax({
		        url: 'MypagePerson.do',
		        type: 'GET',
		        success: function(response) {
		           //성공
		            $('body').html(response);
		        }, 
		    });
		});

</script>
	</div>
		</body>
		
<footer>
	<img src="쿠팡마이페이지.PNG" alt="쿠팡 마이페이지" style="width: 230px;">
</footer>

</html>
