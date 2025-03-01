<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="true"%>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mainpage.css" type="text/css" />
<script src="<%=request.getContextPath() %>/admin_js/jquery-3.7.1.min.js"></script>
<script src="<%=request.getContextPath() %>/prod_category/sports.js"></script>
<script src="<%=request.getContextPath() %>/admin_js/jquery.serializejson.min.js"></script>


<script type="text/javascript">
	
	
	$(function() {
		
	var mypath = "<%=request.getContextPath()%>";
	
	
	
    // 페이지가 로드될 때 상품들을 띄우는 코드
	$(document).ready(function() {
	    $.ajax({
	        url: `${mypath}/prodFirstView.do`,
	        type: 'get',
	        success: function(res) {
	            let rcode = "";
	            $.each(res, function(i, v) {
	                rcode += `<dl class="sports_d1">
	                            <div class="prod_detail_id" style="display:none">${v.prod_id}</div>
	                            <dt class="sports_dt1">
	                                <img src="../../images/prod/P009/${v.prod_img}" width="300" height="300" alt="${v.prod_name}">
	                            </dt>
	                            <dd class="sports_dd1">
	                                <div class="sports_div">
	                                    <h5>${v.prod_price}원 </h5>
	                                    <hr style="width:30%;">
	                                    <h3>${v.prod_name}</h3><br>
	                                </div>
	                            </dd>
	                        </dl>`;
	            });
	            $('.sports_prod1').html(rcode);
	        },
	        error: function() {
	            alert("상태 : " + xhr.status);
	        },
	        dataType: 'json'
	    });
	});	
	
	
	
		
	
		// 상품 카테고리별 상품 조회(ex) 카테고리 ->> 스포츠레저 누르면 젤 처음 출력되는 화면 = "갓팡랭킹순"
		$('#rankSportsProd').on('click', function(){
			let totaldata = $(this).val();
			
			$.ajax({
				url: `${mypath}/prodList.do`,
				type: 'post',
				data: {lprod_gu : totaldata},
				success: function(res){
					let rcode = "";
					$.each(res, function(i,v){
						rcode += `<dl class="sports_d1">
										<div class="prod_detail_id" style="display:none">${v.prod_id}</div>
										<dt class="sports_dt1">
											<img src="../../images/prod/P009/${v.prod_img}" width="300" height="300" alt="${v.prod_name}">
										</dt>
										<dd class="sports_dd1">
											<div class="sports_div">
												<h5>${v.prod_price}원 </h5>
												<hr style="width:30%;">
												<h3>${v.prod_name}</h3><br>
											</div>
										</dd>
									</dl>`;
						
					} );
					$('.sports_prod1').html(rcode);
					
				},
				error: function(){
					alert("상태 : " + xhr.status);
				},
				dataType: 'json'
			});
			
		});
		
		
		
		
	
		// 스포츠 카테고리 상품 낮은 가격순 출력
		$('#lowSportsProd').on('click', function(){
			
			let totaldata = $(this).val();
			
			$.ajax({
				url: `${mypath}/lowProd.do`,
				type: 'post',
				data: {lprod_gu : totaldata},
				
				 success: function(res){
		          	let rcode  = "";
					$.each(res, function(i,v){
						rcode += `<dl class="sports_d1">
										<div class="prod_detail_id" style="display:none">${v.prod_id}</div>
										<dt class="sports_dt1">
											<img src="../../images/prod/P009/${v.prod_img}" width="300" height="300" alt="${v.prod_name}">
										</dt>
										<dd class="sports_dd1">
											<div class="sports_div">
												<h5>${v.prod_price}원 </h5>
												<hr style="width:30%;">
												<h3>${v.prod_name}</h3><br>
											</div>
										</dd>
									</dl>`;
						
					} );
					
					$('.sports_prod1').html(rcode);
		        },
				error: function(xhr){
					alert("상태 : " + xhr.status);
				},
				dataType: 'json'
			});
		});
		
		
		// 스포츠 카테고리 상품 높은 가격순 출력
		$('#highSportsProd').on('click', function(){
			
			let totaldata = $(this).val();
			
			$.ajax({
				url: `${mypath}/highProd.do`,
				type: 'post',
				data: {lprod_gu : totaldata},
				
				success: function(res){
		          	let rcode  = "";
					$.each(res, function(i,v){
						rcode += `<dl class="sports_d1">
										<div class="prod_detail_id" style="display:none">${v.prod_id}</div>
										<dt class="sports_dt1">
											<img src="../../images/prod/P009/${v.prod_img}" width="300" height="300" alt="${v.prod_name}">
										</dt>
										<dd class="sports_dd1">
											<div class="sports_div">
												<h5>${v.prod_price}원 </h5>
												<hr style="width:30%;">
												<h3>${v.prod_name}</h3><br>
											</div>
										</dd>
									</dl>`;
						
					});
					
					$('.sports_prod1').html(rcode);
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
	top: 270px;
	left: 220px;
	width: 76%;
}

#sports_id_div1 {
	margin-bottom: 13px;
}

.sports_d1 {
	display: inline-block;
	margin: 13px; /* 필요에 따라 여백 조정 */
}

.sports_div_class2 {
	margin-left: 13%;
	margin-bottom: 30px;
	display: contents;
}

.sports_h3 {
	margin-bottom: 30px;
}

#lprod_hover {
	display: inline-flex;
	flex-direction: column;
}

.sports_dt1 img {
	-webkit-transform: scale(1);
	transform: scale(1);
	-webkit-transition: .5s ease-in-out;
	transition: .5s ease-in-out;
}

/*  .sports_dt1:hover img{  */
/*  -webkit-transform: scale(1.3);  */
/*  	transform: scale(1.3);  */
/*  } */

/* dl:hover{ */
/* 	box-shadow: 0 10px 35px rgba(0, 0, 0, 0.05), 0 6px 6px rgba(0, 0, 0, 0.1); */
/* } */
.sports_prod1 {
	text-align: center;
}
</style>

</head>
<body>
	<div id="containor" class="total_div">
		<header id="header">
			<nav>
				<!-- <div class="search_container"> -->
				<!-- </div> -->

				<div class="search_container">
					<!-- 갓팡 로고(클릭시 메인페이지로 이동) -->
					<a href="<%= request.getContextPath() %>/mainpage.jsp" class="pad" title="Godpang - 내가 잘사는 이유">
						<img src="<%= request.getContextPath() %>/images/login/godpang.png" width="240" height="60"
						alt="갓팡로고">
					</a> <a class="pad"> <!-- 검색창의 왼쪽 카테고리 클릭할수 있는 부분 -->
						<div class="selectBox search_item">
							<select id="lprod" name="lprod" class="select">
								<!-- <option disabled selected>전체</option> -->
								<option class="lprod" value="all">전체</option>
								<option class="lprod" value="fashion">패션의류/잡화</option>
								<option class="lprod" value="beauty">뷰티</option>
								<option class="lprod" value="baby">출산/유아동</option>
								<option class="lprod" value="food">식품</option>
								<option class="lprod" value="kitchen">주방용품</option>
								<option class="lprod" value="life">생활용품</option>
								<option class="lprod" value="interior">홈인테리어</option>
								<option class="lprod" value="digital">가전디지털</option>
								<option class="lprod" value="sports">스포츠/레저</option>
							</select>
						</div>
					</a>
					<!-- 검색단어 입력창 + 감섹버튼 -->
					<a class="pad"> <input type="text" class="search_input"
						placeholder="찾고 싶은 상품을 검색해보세요!"></a> <a href="<%= request.getContextPath() %>/search.jsp"
						class="pad"><button>검색</button></a>

					<!-- 로그인, 장바구니 -->
					<a href="<%= request.getContextPath() %>/login.jsp" class="pad" title="로그인 하기"> <img
						src="<%= request.getContextPath() %>/images/mainpage/00.로그인.JPG" width="80" height="65"
						alt="로그인"><br>&nbsp;&nbsp;로그인
					</a> <a href="<%= request.getContextPath() %>/cart.jsp" class="pad" title="장바구니 가기"> <img
						src="<%= request.getContextPath() %>/images/mainpage/00.장바구니.JPG" width="80" height="65"
						alt="장바구니"><br>&nbsp;장바구니
					</a>
				</div>
			</nav>
		</header>

		<div id="lprod_hover" style="disply: flex;">
			<a href="#" title="카테고리 보기"><img
				src="<%= request.getContextPath() %>/images/mainpage/00.카테고리.JPG" width="150" height="160.5"
				alt="카테고리"></a>

			<aside id="left">
				<ul>
					<!-- 전체 빠짐 -->

				</ul>
			</aside>

		</div>

		<div class="sports_div_class1">
			<div class="sports_div_class2">
				<h2 class="sports_h3">스포츠레저</h2>
				<div class="sports_div_class3">
					<div class="sports_div_sports4">
						<div id="sports_id_div1">
							<ul class="sports_ul">
								<li class="sports_selected"><input type="radio"
									id=rankSportsProd name="sports" value="P009"> <label>갓팡랭킹순</label>
								</li>

								<li class="sports_selected"><input type="radio"
									id=lowSportsProd name="sports" value="P009"> <label>낮은가격순</label>
								</li>

								<li class="sports_selected"><input type="radio"
									id=highSportsProd name="sports" value="P009"> <label>높은가격순</label>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>


			<!-- 여기 위는 '스포츠/레저' -->
			<!-- 여기 아래는 상품 리스트 -->
			<div id="sports_prod_list">
				<section>
					<ul id="sports_list">
						<!-- = <li class="baby-product" -->
						<li class="sports_prod1"><a class="sports_a1" href="#"></a></li>

						<li class="sports_prod2"><a class="sports_a2" href="#"></a></li>


					</ul>
				</section>

			</div>
		</div>


	</div>
	<!-- 맨 처음 컨테이너div -->
</body>
</html>