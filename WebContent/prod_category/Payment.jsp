<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/payment.css" type="text/css" />
</head>
<body>
	<div class="nognb">
		<div class="logo">
			<a id="headerLogo" class="icon" href="#"> <img
				src="//image7.coupangcdn.com/image/coupang/common/logo_coupang_w350.png"
				width="174" height="41" alt="쿠팡">
			</a>
		</div>
	</div>

	<div id="body">
		<div class="middle">
			<div class="ordTitle">
				<h3 class="title">주문/결제</h3>
				<span class="steps"> 장바구니&gt;<em>주문결제 &gt;</em>주문완료
				</span>
			</div>
		</div>

		<div data-component="customer">
			<div class="customer__root">
				<h2 class="customer__h2">구매자정보</h2>
				<table class="customer__table">
					<tbody>
						<tr>
							<td class="customer__col customer__col--1">이름</td>
							<td class="customer__col customer__col--2">김환용</td>
						</tr>
						<tr data-component="customer-realname-auth"></tr>
						<tr>
							<td class="customer__col customer__col--1">이메일</td>
							<td class="customer__col customer__col--2">
								kkkk2088@naver.com</td>
						</tr>
						<tr>
							<td class="customer__col customer__col--1">휴대폰 번호</td>
							<td class="customer__col customer__col--2">
								<div data-component="customer-phone">
									<div class="customer-phone__root">
										<div data-component="customer-phone-form-tel">
											<form data-customer-phone--form-tel="">
												<div>
													<input type="tel" class="customer-phone__input-tel "
														data-customer-phone--input-tel="" value="010-3706-2088">

												</div>
											</form>
										</div>

									</div>

								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div data-component="deliveryAddress">
			<h2 class="delivery-address__caption-header">
				받는사람정보
				<button class="delivery-address__popup-list-button" type="button"
					data-delivery-address__popup-list-button="">배송지변경</button>
			</h2>
			<table class="delivery-address">
				<tbody>
					<tr>
						<th class="delivery-address__th">이름</th>
						<td class="customer__col customer__col--2">
							<span>김환용</span> 
						</td>
					</tr>
					<tr>
						<th class="delivery-address__th">배송주소</th>
						<td class="customer__col customer__col--2">충청남도 서산시 동문동 1259 서산 동문동
							한라비발디 &nbsp;107동 1006호
							<div id="blocked-address-error-message"
								class="blocked-address-section"
								data-delivery-address__blocked-message="">
								<span class="blocked-address__attention-icon">dd</span>
							</div>
						</td>
					</tr>
					<tr>
						<th class="delivery-address__th delivery-address__th--no-line">연락처</th>
						<td class="customer__col customer__col--2"
							id="delivery-address__phone-panel">010 - 3706 - 2088</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class= "box">
		<h2 class="delivery-address__caption-header"> 배송 중 <span> 1(cartcount) </span>건 </h2>
			<table class="delivery-address">
				<tr> <th class="delivery-address__th"> 배송 </th>
				<td class="customer__col customer__col--2"> </td>
				
				</tr >
				<tr class="customer__col--2"> <th class="delivery-address__th"> 상품명 </th>   
				<td class="customer__col customer__col--2"> </td>
				</tr>
			</table>
		</div>
		<div class="Payment">
		<h2 class="delivery-address__caption-header"> 결제정보 </h2> 
			<table class="delivery-address">
				<tr> <th class="delivery-address__th"> 총 상품 가격  </th>
				<td class="customer__col customer__col--2"> </td>
				</tr >
				<tr> <th class="delivery-address__th"> 할인 쿠폰  </th>
				<td class="customer__col customer__col--2"> 
					<select id="couponSelect">  <!-- 쿠폰이 없으면 비활성화 -->
  						<option value="1000">1000원 할인 쿠폰</option>
  						<option value="2000">2000원 할인 쿠폰</option>
  						<option value="3000">3000원 할인 쿠폰</option>
  						<option value="4000">4000원 할인 쿠폰</option>
  						<option value="5000">5000원 할인 쿠폰</option>
					</select>
				 </td>
				</tr >
			</table>
		
		</div>
		
		
		<div>
		</div>
		<div style="margin-top: 40px; margin-left: 30%">
		<button type="button" id="paymentBtn" value="결제하기" > 결제하기 
        </button>
		</div>
	</div> <!-- body -->
</body>
</html>