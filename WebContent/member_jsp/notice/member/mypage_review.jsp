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
<link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

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
.nav-tabs .nav-link {
	color: black;
	text-align: center;
}
.nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {

    text-align: center;
}
.tab_box { width: 100%; margin: 0 auto; }
.tab_menu { margin: 0; padding: 0; list-style: none; overflow: hidden; }
.tab_menu li { float: left; margin: 0 1px 0 0; padding: 10px 15px; background: #eee; color: #555; cursor: pointer; }
.tab_menu li.on { background: #000; color: #fff; }
.tab_cont { display: none; padding: 20px; border: 1px solid #000; color: #555; }
.tab_cont.on { display: inherit; }

    .styled-button {
        background-color: #5CD1E5; /* 배경색 */
        border: none; /* 테두리 없음 */
        color: white; /* 글자색 */
        padding: 10px 20px; /* 내부 여백 */
        text-align: center; /* 텍스트 가운데 정렬 */
        text-decoration: none; /* 밑줄 없음 */
        display: inline-block; /* 인라인 블록 요소로 표시 */
        font-size: 16px; /* 글꼴 크기 */
        margin-top: 25px; /* 위쪽 여백 */
        margin-right: 10px; /* 오른쪽 여백 */
        border-radius: 5px; /* 버튼 모서리 둥글게 */
        cursor: pointer; /* 커서 모양을 포인터로 변경 */
    }

    /* 버튼 호버 효과 */
    .styled-button:hover {
        background-color: #45a049; /* 호버시 배경색 변경 */
    }
</style>
<script type="text/javascript">
mypath =  '<%=request.getContextPath()%>';
$(document).ready(function(){
	
	$(".tab_menu > li").each(function(n) {
		$(this).on("click", function() {
			$(".tab_menu li").removeClass("on").eq(n).addClass("on");
			$(".tab_cont").removeClass("on").eq(n).addClass("on");
		});
	});
	

		
	// Ajax 요청 수정 필요
	$.ajax({
		url:'<%=request.getContextPath()%>/reviewList.do',
		type:'post',
		dataType:'json',
		success : function(result){
			
			code = `<div></div>`
			
			$.each(result.datas, function(i,v){
				 code += `<div class="tab_cont on">
								<div class="review-content">
									<div class="review-left">
									<img src='<%=request.getContextPath()%>/imageView.do?prod_id=${v.prod_id}' style="width: 100px; height: 100px;">
									<span style="font-weight: bold; font-size: 18px; color: #333;">상품명 :</span>
									<span style="font-size: 18px; color: #333;"> ${v.prod_name}</span>
									<span style="font-weight: bold;  font-size: 16px; color: #666;">상품내용 :</span>
									<span style="font-size: 16px; color: #666;"> ${v.prod_content}</span>
									<span style="font-weight: bold;  font-size: 16px; color: #666;">상품코드 :</span>
									<span id="prod_id" style="font-size: 16px; color: #666;">${v.prod_id}</span>
									
									
									<button id="review_insert" class="styled-button" style="float: right;">리뷰 작성하기</button>
									
									</div>
								</div>
							</div>`;
			});
				$('#boardList').html(code);
		},
		error : function(xhr){
			// Ajax 실패 시 처리 코드 작성
			alert("상태 : " + xhr.status);
		}
	});

	
	
	
	
	
	
	$(document).on('click','#reviewed',function(){
		event.stopPropagation()
		$.ajax({
			url:'<%=request.getContextPath()%>/reviewed_List.do',
			type:'post',
			dataType:'json',
			success : function(result){
				
				code = `<div></div>`
					
					$.each(result.datas, function(i,v){
						 code += `<div class="tab_cont on">
										<div class="review-content">
											<div class="review-left">
											<img src='<%=request.getContextPath()%>/imageView_review.do?prod_id=${v.prod_id}' style="width: 100px; height: 100px;">
											<span style="font-weight: bold; font-size: 18px; color: #333;">리뷰제목 :</span>
											<span style="font-size: 18px; color: #333;"> ${v.review_title}</span>
											<span style="font-weight: bold;  font-size: 16px; color: #666;">리뷰내용 :</span>
											<span style="font-size: 16px; color: #666;"> ${v.review_content}</span>
											
											<a href="<%=request.getContextPath()%>/deleteReview.do?review_no=${v.review_no}" id='review_delete' class="styled-button" style="float: right;">리뷰 삭제하기</a>
											</div>
										</div>
									</div>`;
					});
						$('#boardList').html(code);
						
				
			}
		})
		
	})
	
	
	$(document).on('click','#rr',function(){
		location.reload();
	})
	
	$(document).on('click','#review_insert',function(){
		
        var prod_id = $(this).closest('div').find('#prod_id').text();
        // 모달 창이 열릴 때 form 태그의 hidden 필드에 상품 코드 값을 설정합니다.
        $('#insertReview').find('input[name="prod_id"]').val(prod_id);
        // 모달 창을 엽니다.
        $('#insertReview').modal('show');
        
	})
	
	
	$(document).on('click','#review_update',function(){
		
		
	})
	
	
	
	$(document).on('click','#review_delete',function(){
		
		
	})
	
});
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


	<%
		session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("loginMember");
		
	
		IMemberService service = MemberServiceImpl.getService();
		String Mem_name = service.getMem_name(vo.getMem_id());
	%>


	<div class="sports_div_class1">

		
		<div class="sports_div_class2">
			<h1 align="center">리뷰 관리</h1>
			<div style="border: 1px solid gray; border-top-color: blue; padding: 20px;">
			
			
			<div style="display:flex;align-items: center;  border-right-color: gray;">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img width="100pt;" height="100pt;" style="margin-right: 10px;" alt="" src="<%=request.getContextPath()%>/images/login/마이페이지_리뷰.png">
			<p style="font-size: 20pt; font-weight: bold; margin-right: 10px;"><%=Mem_name %></p>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<img width="700pt;" alt="" src="<%=request.getContextPath()%>/images/login/review_img.png">
			</div>
			
			</div>
		</div>
		
		<br><br><br><br>
		
		
				<div class="tab_box">
						<ul class="tab_menu" style="margin-left: 25px;">
							<li id="rr" class="on" style="width: 48.5%;  text-align: center;">리뷰 작성</li>
							<li id="reviewed" class=""   style="width: 48.5%;  text-align: center;">작성한 리뷰</li>
						</ul>
						<div id="boardList"></div>




						<div class="tab_cont">
							<div class="review-content">
								<div class="review-left">
								
								</div>
								
								<div class="review-right">
								
								</div>
							</div>
						</div>
				</div>

		

	</div>
	















<!-- insertReview -->
<div class="modal" id="insertReview">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;리뷰 등록하기</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
       
				 <div class="container mt-3">

				  <form action="<%=request.getContextPath()%>/insertReview.do" method="post" enctype=multipart/form-data>
				    <div class="mb-3 mt-3">
					      <label for="review_title">리뷰제목:</label>
					      <input type="text" class="form-control" id="review_title" placeholder="Enter review_title" name="review_title">
				    </div>
				    <div class="mb-3">
					      <label for="review_content">리뷰내용:</label>
					      <input type=""text"" class="form-control" id="review_content" placeholder="Enter review_content" name="review_content">
				    </div>
					
					<div class="mb-3">
					      <label for="file">이미지 첨부:</label>
					      <input type="file" class="form-control" id="file" placeholder="Enter file" name="file">
				    </div>
				    <input type="hidden" name="prod_id" value="">
				    <button type="submit" class="btn btn-primary">리뷰 등록</button>
				  </form>
			</div>
       
       
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
      </div>

    </div>
  </div>
</div>
	
	
	
</body>
</html>
