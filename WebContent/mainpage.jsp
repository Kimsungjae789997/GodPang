
<%@page import="com.google.gson.Gson"%>
<%@page import="shop.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>갓팡!</title>

<!-- 
[홈페이지 구성요소]
- header(화면 최상단): 웹 사이트 로고, 로그인, 회원가입, 사이트맵, 언어 선택
                      우리홈페이지에서는 header안에 nav를 묶어놓음
- nav(header밑): 문서의 navigation , 메뉴 , 리스트와 링크(ul , li, a )​
                      우리홈페이지는 로고, 검색창, 로그인,장바구니 들어감
- aside(화면 좌측, 우측) : 본문 글과 연관성 없는 내용 (배너 광고, 위젯등)
- section(본문) : 문서에서 관련 있는 내용을 묶음
- article(추가 본문) : 독립적인 내용, 뉴스 기사나 블로그 내용 
- footer(화면 맨하단) : 사이트 회사 정보들(주소, 연락처, 저작권)


[로직설명]
- header 안에 nav를 포함해놓음
- nav를 통째로 묶어서 div씌운것 : css주기 위함 
                     (<div class="wrapper" style="display: flex;">)
 -->
 
<!-- mypath 설정 -->
<script type="text/javascript"> mypath = "<%=request.getContextPath()%>"; </script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mainpage.css" type="text/css" />
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.serializejson.min.js"></script>

 
<%
	// 제목, 수정, 삭제, 등록 이벤트  - 댓글 등록
	// session값 꺼내기
	MemberVO vo = (MemberVO) session.getAttribute("loginMember");	// 자바객체
	
	// 자바객체 mvo를 jsondata로 변환할거에요
	
	// mvo = mem_id, mem_pass, mem_name
	String mvojson = null;
	
	// json데이터로 변환할 라이브러리 
	Gson gson = new Gson();
	
	// mvo 자바 객체를 json형식으로 변환 - 직렬화(전송가능한 형태로 바꾸는것)
	
	// 로그인 성공시 자바객체 mvo를 json데이터로 바꿔라
	if(vo != null) mvojson = gson.toJson(vo);
	
	/* mvoinsert = {
			"mem_id" : "a001",
			"mem_name" : "김은대",
			"mem_pass" : "1234"
	} */
	
%>
 
<script type="text/javascript">

user = <%=mvojson %>;
admin = <%=mvojson %>;

mypath = "<%=request.getContextPath()%>";

$(function() {
	
	gthis = this;
	
	/* // 각 이미지 호버 이벤트 처리
	$('.ad_ul ul li img').hover(
	        function() {
	            // 호버된 이미지의 투명도를 변경하여 보이도록 함
	            $(this).css('opacity', '1');
	        },
	        function() {
	            // 호버가 해제된 경우 다시 기본 투명도로 변경
	            $(this).css('opacity', '0.5');
	        }
    ); */
    // 각 이미지 호버 이벤트 처리
    $('.ad_ul .ad_li img').hover(
        function() {
            // 호버된 이미지의 부모 요소(ad_li)의 다음 형제 요소(ad_inner)의 자식 요소(ad_img1)의 이미지를 보이도록 함
            $(this).closest('.ad_li').siblings('.ad_inner').find('.ad_img1 img').css('display', 'block').css('position', 'absolute').css('z-index', '3');
        },
        function() {
            // 호버가 해제된 경우 다시 숨김 처리
            $(this).closest('.ad_li').siblings('.ad_inner').find('.ad_img1 img').css('display', 'none');
        }
    );
	// '검색' 버튼 클릭시
	/* $(".submit_btn").on('click',function() {
		$.mainSearch();
   
 	 }) */
 	 
/*  	 // 상품 카테고리 선택
 	 $(".submit_btn").on('click',function() {
		$.mainSearch();
   
 	 }) */
 	 
 	 
 	 // 검색 '단어입력창' 입력시 클릭시
 	 /* $(".lprod_category").on('keyup',function() {
		gthis = this;
		$.search_suggestion();
   
 	 }) */
 	 
	/* // '검색' 버튼 클릭시
	$(document).on('submit_button', 'click', function() {
		gthis = this;
		$.mainSearch();
	}) */
	
	
  
})

</script>

</head>
<body>

<!-- 화면 상단 - 상품 카테고리 -->
<header id="header">
	<nav class="wrapper" style="display: flex;">
		<div class="lprod_container" style="background-image: url( "images/bg-house.png" );">
			<img class="lprod_img" src="images/mainpage/00.카테고리.JPG" alt="카테고리">
			<div class="lprod_ul">
				<ul>
					<!-- 전체 빠짐 -->
					<li id="lprod_fasion">
						<a href="<%=request.getContextPath()%>/prod_category/fashion.jsp" target="ifr" >
							<img src="./images/mainpage/01.카테고리_패션의류잡화.JPG" alt="패션의류/잡화">패션의류/잡화
						</a>
					</li>
					<li id="lprod_fasion">
						<a href="<%=request.getContextPath()%>/prod_category/beauty.jsp" target="ifr">
							<img src="images/mainpage/02.카테고리_뷰티.JPG" alt="뷰티">뷰티
						</a>
					</li>
					<li>
						<a href="<%=request.getContextPath()%>/prod_category/baby.jsp" target="ifr">
							<img src="images/mainpage/03.카테고리_출산유아동.JPG" alt="출산">출산/유아동
						</a>
					</li>
					<li>
						<a href="<%=request.getContextPath()%>/prod_category/food.jsp" target="ifr">
							<img src="images/mainpage/04.카테고리_식품.JPG" alt="식품">식품
						</a>
					</li>
					<li>
						<a href="<%=request.getContextPath()%>/prod_category/kitchen.jsp" target="ifr">
							<img src="images/mainpage/05.카테고리_주방용품.JPG" alt="주방용품">주방용품
						</a>
					</li>
					<li>
						<a href="<%=request.getContextPath()%>/prod_category/life.jsp" target="ifr">
							<img src="images/mainpage/06.카테고리_생활용품.JPG"  alt="생활용품">생활용품
						</a>
					</li>
					<li>
						<a href="<%=request.getContextPath()%>/prod_category/interior.jsp" target="ifr">
							<img src="images/mainpage/07.카테고리_홈인테리어.JPG" alt="홈인테리어">홈인테리어
						</a>
					</li>
					<li>
						<a href="<%=request.getContextPath()%>/prod_category/digital.jsp" target="ifr">
							<img src="images/mainpage/08.카테고리_가전디지털.JPG" alt="가전디지털">가전디지털
						</a>
					</li>
					<li>
						<a href="<%=request.getContextPath()%>/prod_category/sports.jsp" target="ifr">
							<img src="images/mainpage/09.카테고리_스포츠레저.JPG" alt="스포츠레저">스포츠레저
						</a>
					</li>
				</ul>
			</div>
		</div>

		<div class="div_container">
			<!-- 갓팡 로고(클릭시 메인페이지로 이동) -->
			<div class="category_logo_search_container">
				<div class="logo">
					<a href="<%=request.getContextPath()%>/mainpage.jsp" title="Godpang - 내가 잘사는 이유">
						<img src="images/mainpage/00.갓팡아이콘.jpg" width="240" height="60"	alt="갓팡로고">
					</a> 
				</div>
				<!-- 검색창의 왼쪽 카테고리 클릭할수 있는 부분 -->
				<div class="selectBox search_item">
					<select id="lprod_category" name="lprod" class="select">
						<!-- <option disabled selected>전체</option> -->
						<option value="all">전체</option>
						<option value="fashion">패션의류/잡화</option>
						<option value="beauty">뷰티</option>
						<option value="baby">출산/유아동</option>
						<option value="food">식품</option>
						<option value="kitchen">주방용품</option>
						<option value="life">생활용품</option>
						<option value="interior">홈인테리어</option>
						<option value="digital">가전디지털</option>
						<option value="sports">스포츠/레저</option>
					</select>
				</div>
				<!-- 검색창 -->
				<div class="search_wrapper">
					<div class="mid_wrapper">
						<!-- 검색창 -->
						<input type="text" id="search_prod" class="search_input" autocomplete="off" placeholder="찾고 싶은 상품을 검색해보세요!">
						<!-- 검색버튼 -->
						<input type="button" id="submit_btn" class="submit_button" value="검색">
					</div>
					<!-- 추천창 -->
					<div id="suggestion_box" class="invisible">
						<div id="suggested_items"></div>
					</div>
				</div>
			</div>
			
			<div class="loginCart_container">
				<div class="main_login">
					<a href="<%= request.getContextPath() %>/login/Login.jsp" title="로그인 하기">
						<img src="images/mainpage/00.마이페이지.JPG" width="60" height="55" alt="로그인"><br>&nbsp;로그인
					</a>
				</div>
				<div class="main_cart">
					<a href="<%= request.getContextPath() %>/cart.jsp" title="장바구니 가기"> 
						<img src="images/mainpage/00.장바구니3.JPG" width="70" height="55" alt="장바구니"><br>장바구니
					</a>
				</div>
			</div>
		</div>
	</nav>
</header>

<!-- 메인광고 -->
<div class="section_container">
<!-- 메인 카테고리 광고 -->
	<div class="ad_container" class="ad_container_class">
		<div class="ad_inner">
		    <div class="ad_img1">
		    	<a href="<%=request.getContextPath()%>/prod_category/food.jsp"> 
		    	<img src="images/mainpage/ad_01_뷰티.jpg" width="1920" height="450" alt="...">
		    	</a>
		    </div>
		    <div class="ad_img2">
		    	<a href="<%=request.getContextPath()%>/prod_category/food.jsp"> 
		     	<img src="images/mainpage/ad_02_생활용품.jpg" 	style="display: none;" width="1920" height="450" alt="...">
		     	</a>
		    </div>
		    <div class="ad_img3">
		    	<a href="<%=request.getContextPath()%>/prod_category/food.jsp"> 
		    	<img src="images/mainpage/ad_03_뷰티.jpg" style="display: none;" width="1920" height="450" alt="...">
		    	</a>
		    </div>
		    <div class="ad_img4">
		    	<a href="<%=request.getContextPath()%>/prod_category/food.jsp"> 
		    	<img src="images/mainpage/ad_04_식품.jpg" style="display: none;" width="1920" height="450" alt="...">
		    	</a>
		    </div>
		    <div class="ad_img5">
		    	<a href="<%=request.getContextPath()%>/prod_category/food.jsp"> 
		    	<img src="images/mainpage/ad_05_식품.jpg" style="display: none;" width="1920" height="450" alt="...">
		    	</a>
		    </div>
		    <div class="ad_img6">
		    	<a href="<%=request.getContextPath()%>/food.jsp"> 
		    	<img src="images/mainpage/ad_06_쿠폰.jpg" style="display: none;" width="1920" height="450" alt="...">
		    	</a>
		    </div>
		</div>
		<div class="ad_ul">
			<ul>
				<li class="ad_li1">
					<a href="#"> 
						<img alt="패션의류/잡화" src="images/mainpage/ad_01_뷰티_il용.jpg" width="180" height="60">
					</a>
				</li>
				<li class="ad_li2">
					<a href="/beauty.jsp"> 
						<img alt="뷰티" src="images/mainpage/ad_02_생활용품_li용.jpg" width="180" height="60">
					</a>
				</li>
				<li class="ad_li3">
					<a href="/baby.jsp"> 
						<img alt="출산유아동" src="images/mainpage/ad_03_뷰티_li용.jpg" width="180" height="60">
					</a>
				</li>
				<li class="ad_li4">
					<a href="<%=request.getContextPath()%>/food.jsp"> 
						<img alt="식품" src="images/mainpage/ad_04_식품_li용.jpg" width="180" height="60">
					</a>
				</li>
				<li class="ad_li5">
					<a href="<%=request.getContextPath()%>/kitchen.jsp"> 
						<img alt="주방용품" src="images/mainpage/ad_05_식품_li용.jpg" width="180" height="60">
					</a>
				</li>
				<li class="ad_li6">
					<a href="<%=request.getContextPath()%>/life.jsp"> 
						<img alt="생활용품" src="images/mainpage/ad_06_쿠폰_li용.jpg" width="180" height="60">
					</a>
				</li>
			</ul>
		</div>
	</div>
</div>

<!-- 쇼츠 -->
<div class="shorts-container">
    <div class="short-wrapper">
        <div class="short">
            <iframe src="<%=request.getContextPath()%>/videos/밤양갱=사랑 으로 바꿔서 들어보면 슬픔.mp4" frameborder="0" allowfullscreen></iframe>
        </div>
    </div>
    <div class="short-wrapper">
        <div class="short">
            <iframe src="<%=request.getContextPath()%>/videos/삶의 질 향상되는 꿀템 추천! #쇼츠 #제품리뷰 #상품리뷰 #꿀템추천.mp4" frameborder="0" allowfullscreen></iframe>
        </div>
    </div>
    <div class="short-wrapper">
        <div class="short">
            <iframe src="<%=request.getContextPath()%>/videos/세상에서 가장 작은 휴대폰.mp4" frameborder="0" allowfullscreen></iframe>
        </div>
    </div>
    <div class="short-wrapper">
        <div class="short">
            <iframe src="<%=request.getContextPath()%>/videos/밤양갱=사랑 으로 바꿔서 들어보면 슬픔.mp4" frameborder="0" allowfullscreen></iframe>
        </div>
    </div>
</div>

<!-- 상품 카테고리별 기획전 -->
<section>
	<div id="categoryBestUnit">
		<div class="category-best-unit kitchen" id="categoryBest_kitchen">
			<dl class="category-best" data-recommendation="">
				<dt class="title">
					<img width="114" src="<%=request.getContextPath()%>/images/mainpage/best05.best_title_kitchen.png" alt="주방용품">
					<a href="<%=request.getContextPath()%>/prod_category/kitchen.jsp" target="_blank" class="category-best-link">
					<span class="go-category">바로가기 &gt;</span>
					</a>
				</dt>
				
				<dd class="promotion">
					<ul class="promotion-list">
						<li>
							<a href="<%=request.getContextPath()%>/prod_category/kitchen.jsp" class="promotion-link category-best-link" target="_blank"> 
							<img src="<%=request.getContextPath()%>/images/prod/P005/밀폐용기세트.jpg" alt="" width="320" height="400"> 
							<span class="name">시스테마 다용도 밀폐용기 9종 세트</span>    
							<span class="prod-type discounted-price">즉시할인가</span>  
							<span class="price"> <strong>33,000</strong>원    </span>   
							</a>
						</li>  
					</ul>
				</dd>
				
				<dd class="best-product-list">
					<ul class="prod-list">
						<li class=" category-best__ad-badge" data-vendor-item-id="83938597519" style="display: list-item;">
							<a href="<%=request.getContextPath()%>/prod_category/kitchen.jsp" class="promotion-link category-best-link" target="_blank"> 
							<img src="<%=request.getContextPath()%>/images/prod/P005/식기건조대.jpg" alt="" width="160" height="160"> 
							<span class="name">키친아트 식기건조대</span>    
							<span class="prod-type discounted-price">즉시할인가</span>  
							<span class="price"> <strong>30,000</strong>원    </span>   
							</a>
						</li>
						<li class=" category-best__ad-badge" data-vendor-item-id="83938597519" style="display: list-item;">
							<a href="<%=request.getContextPath()%>/prod_category/kitchen.jsp" class="promotion-link category-best-link" target="_blank"> 
							<img src="<%=request.getContextPath()%>/images/prod/P005/식기건조대.jpg" alt="" width="160" height="160"> 
							<span class="name">덴티노스 화이트 와인잔 세트</span>    
							<span class="prod-type discounted-price">즉시할인가</span>  
							<span class="price"> <strong>33,000</strong>원    </span>   
							</a>
						</li>
						<li class=" category-best__ad-badge" data-vendor-item-id="83938597519" style="display: list-item;">
							<a href="<%=request.getContextPath()%>/prod_category/kitchen.jsp" class="promotion-link category-best-link" target="_blank"> 
							<img src="<%=request.getContextPath()%>/images/prod/P005/와인잔세트.jpg" alt="" width="160" height="160"> 
							<span class="name">시스테마 다용도 밀폐용기 9종 세트</span>    
							<span class="prod-type discounted-price">즉시할인가</span>  
							<span class="price"> <strong>42,000</strong>원    </span>   
							</a>
						</li>
						<li class=" category-best__ad-badge" data-vendor-item-id="83938597519" style="display: list-item;">
							<a href="<%=request.getContextPath()%>/prod_category/kitchen.jsp" class="promotion-link category-best-link" target="_blank"> 
							<img src="<%=request.getContextPath()%>/images/prod/P005/샐러드스피너.jpg" alt="" width="160" height="160"> 
							<span class="name">유어스 샐러드 스피너</span>    
							<span class="prod-type discounted-price">즉시할인가</span>  
							<span class="price"> <strong>30,000</strong>원    </span>   
							</a>
						</li>
						<li class=" category-best__ad-badge" data-vendor-item-id="83938597519" style="display: list-item;">
							<a href="<%=request.getContextPath()%>/prod_category/kitchen.jsp" class="promotion-link category-best-link" target="_blank"> 
							<img src="<%=request.getContextPath()%>/images/prod/P005/자이언트식기건조대.jpg" alt="" width="160" height="160"> 
							<span class="name">코시나 올스텐 자이언트 식기건조대</span>    
							<span class="prod-type discounted-price">즉시할인가</span>  
							<span class="price"> <strong>35,000</strong>원    </span>   
							</a>
						</li>
						<li class=" category-best__ad-badge" data-vendor-item-id="83938597519" style="display: list-item;">
							<a href="<%=request.getContextPath()%>/prod_category/kitchen.jsp" class="promotion-link category-best-link" target="_blank"> 
							<img src="<%=request.getContextPath()%>/images/prod/P005/칼세트6종.jpg" alt="" width="160" height="160"> 
							<span class="name">알텐바흐 칼세트 6종</span>    
							<span class="prod-type discounted-price">즉시할인가</span>  
							<span class="price"> <strong>45,000</strong>원    </span>   
							</a>
						</li>
					</ul>
				</dd>
			</dl>  
		</div>
	</div>
</section>
	<footer class="footer">
		<hr>
		<div class="foo_container">
	        <h1><a href="/" title="godpand">GODPANG</a></h1>
	        <div class="footer-content">
	            <address>
		                상호명 및 호스팅 서비스 제공 : 갓팡(주)<br>
		                대표이사 : 강한승,박대준<br>
		                서울시 송파구 송파대로 570 <br>
		                사업자 등록번호 : 120-88-00767 <br>
		                통신판매업신고 : 2017-서울송파-0680<br>
	                <a href="http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no=1208800767" target="_blank" class="licensee" title="사업자정  보 확인">사업자정보 확인 &gt;</a>
	            </address>
	            <div class="contact-info">
	                <a href="https://mc.coupang.com/ssr/desktop/contact/inquiry" class="call-center" title="365 고객센터">
	                    <strong>365고객센터</strong> | 전자금융거래분쟁처리담당<br>
	                    <em>1577-7011 (유료)</em>
	                   	 서울시 송파구 송파대로 570<br>
	                    <span class="contact-fax">email : help@godpang.com</span>
	                </a>
	            </div>
	            <p class="safe-service">
	                <strong>우리은행 채무지급보증 안내</strong><br>
	                <span>
	                 	 당사는 고객님이 현금 결제한 금액에 대해<br>우리은행과 채무지급보증 계약을 체결하여<br>안전거래를 보장하고 있습니다.<br>
	              </span>
	                <a href="javascript:;" id="serviceCheck" class="service-check" title="서비스 가입사실 확인">서비스 가입사실 확인 &gt;</a>
	            </p>
	        </div>
	    </div>	
	</footer>
		

		
</body>
</html>








