<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/mainpage.css" type="text/css" />
<script type="text/javascript"></script>
<script src="./admin_js/jquery-3.7.1.min.js"></script>
<script src="../baby/baby.js"></script>
</head>


<script type="text/javascript">
	
	
	$(function() {
		
	var mypath = "<%=request.getContextPath()%>";
	
	
		// 상품 카테고리별 상품 조회(ex) 카테고리 ->> 출산유아동 누르면 젤 처음 출력되는 화면 = "갓팡랭킹순"
		$('#rankbabyProd').on('click', function(){
			let totaldata = $(this).val();
			
			$.ajax({
				url: `${mypath}/prodList.do`,
				type: 'post',
				data: {lprod_gu : totaldata},
				success: function(res){
					let rcode = "";
					$.each(res, function(i,v){
						rcode += `<dl class="baby_d1">
										<div class="prod_detail_id" style="display:none">${v.prod_id}</div>
										<dt class="baby_dt1">
											<img src="../../images/prod/P003/${v.prod_img}" width="300" height="300" alt="${v.prod_name}">
										</dt>
										<dd class="baby_dd1">
											<div class="baby_div">
												<h5>${v.prod_price}원 </h5>
												<hr style="width:30%;">
												<h3>${v.prod_name}</h3><br>
											</div>
										</dd>
									</dl>`;
						
					} );
					$('.baby_prod1').html(rcode);
					
				},
				error: function(){
					alert("상태 : " + xhr.status);
				},
				dataType: 'json'
			});
			
		});
		
		
		
		
	
		// 출산유아동 카테고리 상품 낮은 가격순 출력
		$('#lowbabyProd').on('click', function(){
			
			let totaldata = $(this).val();
			
			$.ajax({
				url: `${mypath}/lowProd.do`,
				type: 'post',
				data: {lprod_gu : totaldata},
				
				 success: function(res){
		          	let rcode  = "";
					$.each(res, function(i,v){
						rcode += `<dl class="baby_d1">
										<div class="prod_detail_id" style="display:none">${v.prod_id}</div>
										<dt class="baby_dt1">
											<img src="../../images/prod/P003/${v.prod_img}" width="300" height="300" alt="${v.prod_name}">
										</dt>
										<dd class="baby_dd1">
											<div class="baby_div">
												<h5>${v.prod_price}원 </h5>
												<hr style="width:30%;">
												<h3>${v.prod_name}</h3><br>
											</div>
										</dd>
									</dl>`;
						
					} );
					
					$('.baby_prod1').html(rcode);
		        },
				error: function(xhr){
					alert("상태 : " + xhr.status);
				},
				dataType: 'json'
			});
		});
		
		
		// 출산유아동 카테고리 상품 높은 가격순 출력
		$('#highbabyProd').on('click', function(){
			
			let totaldata = $(this).val();
			
			$.ajax({
				url: `${mypath}/highProd.do`,
				type: 'post',
				data: {lprod_gu : totaldata},
				
				success: function(res){
		          	let rcode  = "";
					$.each(res, function(i,v){
						rcode += `<dl class="baby_d1">
										<div class="prod_detail_id" style="display:none">${v.prod_id}</div>
										<dt class="baby_dt1">
											<img src="../../images/prod/P003/${v.prod_img}" width="300" height="300" alt="${v.prod_name}">
										</dt>
										<dd class="baby_dd1">
											<div class="baby_div">
												<h5>${v.prod_price}원 </h5>
												<hr style="width:30%;">
												<h3>${v.prod_name}</h3><br>
											</div>
										</dd>
									</dl>`;
						
					});
					
					$('.baby_prod1').html(rcode);
		        },
		        error: function(xhr){
					alert("상태 : " + xhr.status);
				},
				dataType: 'json'
			});
		});
		
	});


</script>

<style>
#header * {
	overflow: hidden;
}

* {
	overflow: auto;
}

#baby_prod_list {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}

.baby_ul {
	display: flex;
}

.baby_ul li {
	margin-right: 35px;
}

.baby_div_class1 {
	display: inline-grid;
	position: absolute;
	top: 270px;
	left: 220px;
	width: 76%;
}

#baby_id_div1 {
	margin-bottom: 13px;
}

.baby_d1 {
	display: inline-block;
	margin: 13px; /* 필요에 따라 여백 조정 */
}

.baby_div_class2 {
	margin-left: 13%;
	margin-bottom: 30px;
	display: contents;
}

.baby_h3 {
	margin-bottom: 30px;
}

#lprod_hover {
	display: inline-flex;
	flex-direction: column;
}

.baby_dt1 img {
	-webkit-transform: scale(1);
	transform: scale(1);
	-webkit-transition: .5s ease-in-out;
	transition: .5s ease-in-out;
}

/*  .baby_dt1:hover img{  */
/*  -webkit-transform: scale(1.3);  */
/*  	transform: scale(1.3);  */
/*  } */

/* dl:hover{ */
/* 	box-shadow: 0 10px 35px rgba(0, 0, 0, 0.05), 0 6px 6px rgba(0, 0, 0, 0.1); */
/* } */
.baby_prod1 {
	text-align: center;
}
</style>

<body>
	<div id="containor" class="total_div">
		<!-- 화면 상단 - 상품 카테고리 -->
<header id="header">
	<nav class="wrapper" style="display: flex;">
		<div class="lprod_hover" style="background-image: url( "images/bg-house.png" );">
			<img class="lprod_img" src="images/mainpage/00.카테고리.JPG" width="150" height="160.5" alt="카테고리">
			<div class="lprod_ul">
				<ul>
					<!-- 전체 빠짐 -->
					<li>
						<a href="fashion.jsp" target="ifr" >
							<img src="./images/mainpage/01.카테고리_패션의류잡화.JPG" width="50" height="45" alt="패션의류/잡화">패션의류/잡화
						</a>
					</li>
					<li>
						<a href="beauty.jsp" target="ifr">
							<img src="images/mainpage/02.카테고리_뷰티.JPG" width="50" height="45" alt="뷰티">뷰티
						</a>
					</li>
					<li>
						<a href="baby.jsp" target="ifr">
							<img src="images/mainpage/03.카테고리_출산유아동.JPG" width="50" height="45"	alt="출산">출산/유아동
						</a>
					</li>
					<li>
						<a href="food.jsp" target="ifr">
							<img src="images/mainpage/04.카테고리_식품.JPG" width="50" height="45" alt="식품">식품
						</a>
					</li>
					<li>
						<a href="kitchen.jsp" target="ifr">
							<img src="images/mainpage/05.카테고리_주방용품.JPG" width="50" height="45" alt="주방용품">주방용품
						</a>
					</li>
					<li>
						<a href="life.jsp" target="ifr">
							<img src="images/mainpage/06.카테고리_생활용품.JPG" width="50" height="45" alt="생활용품">생활용품
						</a>
					</li>
					<li>
						<a href="life.jsp" target="ifr">
							<img src="images/mainpage/07.카테고리_홈인테리어.JPG" width="50" height="45" alt="홈인테리어">홈인테리어
						</a>
					</li>
					<li>
						<a href="digital.jsp" target="ifr">
							<img src="images/mainpage/08.카테고리_가전디지털.JPG" width="50" height="45" alt="가전디지털">가전디지털
						</a>
					</li>
					<li>
						<a href="sports.jsp" target="ifr">
							<img src="images/mainpage/09.카테고리_스포츠레저.JPG" width="50" height="45" alt="스포츠레저">스포츠레저
						</a>
					</li>
				</ul>
			</div>
		</div>

		<!-- 갓팡 로고(클릭시 메인페이지로 이동) -->
		<div class="div_container">
			<div class="pad_container">
				<div class="logo">
					<a href="./mainpage.jsp" title="Godpang - 내가 잘사는 이유">
						<img src="images/mainpage/00.갓팡아이콘.jpg" width="240" height="60"	alt="갓팡로고">
					</a> 
				</div>
				<!-- 검색창의 왼쪽 카테고리 클릭할수 있는 부분 -->
				<div class="selectBox search_item">
					<select name="lprod" class="select">
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
				<!-- 검색단어 입력창 + 감섹버튼 -->
				<div class="search">
					<input type="text" class="search_input"	placeholder="찾고 싶은 상품을 검색해보세요!">
					<a href="./search.jsp"><button>검색</button></a>
				</div>
			</div>
			
			<div class="pad2_container">
				<div class="main_login">
					<a href="../login/LoginMember.jsp" title="로그인 하기"> 
						<img src="images/mainpage/00.로그인.JPG" width="60" height="55" alt="로그인"><br>&nbsp;로그인
					</a> 
				</div>
				<div class="main_cart">
					<a href="./cart.jsp" title="장바구니 가기"> 
						<img src="images/mainpage/00.장바구니.JPG" width="70" height="55" alt="장바구니"><br>장바구니
					</a>
				</div>
			</div>
		</div>
	</nav>
</header>

		<div id="lprod_hover" style="disply: flex;">
			<a href="#" title="카테고리 보기"><img
				src="../../images/mainpage/00.카테고리.JPG" width="150" height="160.5"
				alt="카테고리"></a>

			<aside id="left">
				<ul>
					<!-- 전체 빠짐 -->

				</ul>
			</aside>

		</div>

		<div class="baby_div_class1">
			<div class="baby_div_class2">
				<h2 class="baby_h3">출산/유아동</h2>
				<div class="baby_div_class3">
					<div class="baby_div_baby4">
						<div id="baby_id_div1">
							<ul class="baby_ul">
								<li class="baby_selected"><input type="radio"
									id=rankbabyProd name="baby" value="P003"> <label>갓팡랭킹순</label>
								</li>

								<li class="baby_selected"><input type="radio"
									id=lowbabyProd name="baby" value="P003"> <label>낮은가격순</label>
								</li>

								<li class="baby_selected"><input type="radio"
									id=highbabyProd name="baby" value="P003"> <label>높은가격순</label>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>


			<!-- 여기 위는 '스포츠/레저' -->
			<!-- 여기 아래는 상품 리스트 -->
			<div id="baby_prod_list">
				<section>
					<ul id="baby_list">
						<!-- = <li class="baby-product" -->
						<li class="baby_prod1"><a class="baby_a1" href="#"></a></li>

						<li class="baby_prod2"><a class="baby_a2" href="#"></a></li>


					</ul>
				</section>

			</div>
		</div>


	</div>
	<!-- 맨 처음 컨테이너div -->
</body>
</html>