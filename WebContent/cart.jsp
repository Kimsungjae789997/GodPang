<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>God팡 장바구니</title>
<style>
body.sijunBody{
	background-color: #f5f5f0;
	font-size: 13pt;
	min-width: 1480px;
	width: 100%;
	padding: 50px 0;
}
#frame{
	width: 80%;
	margin: 0 auto;
	padding: 50px 50px;
	background-color: #fff;
}
#fram2{
	border-bottom: 1px solid #e0e0eb;
	padding-bottom: 10px;
}
.home{
	float: right;
}
table.calculation1{
	clear: both;
	border: 1px solid #e0e0eb;
	border-collapse: collapse;
	width: 100%;
	font-size: 10pt;
}
table.calculation1 th{
	border: 1px solid #e0e0eb;
	padding: 10px 0;
}
table.calculation1 td{
	border: 1px solid #e0e0eb;
	text-align: center;
}
table.calculation2{
	border: 1px solid #e0e0eb;
	border-collapse: collapse;
	background-color : #f5f5f0;
	width: 100%;
	font-size: 10pt;
}
table.calculation2 td{
	border: 1px solid #e0e0eb;
	text-align: center;
}
.price{
	font-size: 20pt;
	font-weight: bold;
}
.lifont{
	font-size: 15pt;
	color : gray;
	padding-left: 10px;
}
.btn{
	border: none;
	color: white;
	padding: 5px 10px;
	font-size: 13px;
	cursor: pointer;
	border-radius: 5px;
}
.default{
	background-color: #fff;
	border: 1px solid gray;
	color: black;
}
.default:hover {
	background: #ddd;
}
.backBtn{
	background: #fff;
	border: 1px solid gray;
}
.btnfloat{
	float: left;
	font-size: 17pt;
}
.btnfloat2{
	float: right;
	padding: 10px;
}
.clearboth{
	clear: both;
}
#productClear{
	padding: 11px 25px;
}
 #productClear{
 	background-color: gray;
 	color: #fff;
 	font-weight: bold;
 	font-size: 20pt;
 }
  #home_detail{
  color: red;
  }
  .ff{
  	font-size: 20pt;
  }
   .fd{
  	font-size: 15pt;
  }
  #sel{
  font-size: 12pt;
  }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$('#check').on('click',function(){
		var result = $(this).prop('checked');
		$('.check1').prop('checked',result);
	})
	
	$('.check1').on('click',function(){
		
		var chk_length = $('.check1:checked').length;
		var chk_ctrl = $('.check1').length;
		if(chk_length == chk_ctrl){
			$('#check').prop('checked',true);
		}else{
			$('#check').prop('checked',false);
		}
		
	})
	
	
})
</script>
</head>
<body class = "sijunBody">
	<div id="frame">
	<a href=""><img src="../images/KakaoTalk_20240403_140230579.png"></a>
	<br><br><br>
		<form>
			<div id="fram2">
				<a href="" style="font-size: 35pt; font-weight: bold; text-decoration: none; color : inherit;">&lt;장바구니</a>
				<p class="home"> 01 옵션선택 > <span id="home_detail">02 장바구니 ></span> 03 주문/결제 > 04주문완료<p>
			</div>
			<br>
			
			<div>
				<table class="calculation1">
					<tr>
						<th class="aa" style="text-align: center; font-size: 20pt;">일반 구매</th>
					</tr>
				</table>
			</div>
			<br>
			
			<div>
				<table class="calculation1">
				
				<thead>
					<tr>
						<th colspan="10" style="text-align: center; padding-left: 10px; font-size: 20pt; ">판매자배송 상품(여기에 장바구니 수량 넣기)</th>
					</tr>
					<tr>
						<th><input type="checkbox" name="checkbox" id="check"></th>
						<th class="ff">이미지</th>
						<th class="ff">상품 정보</th>
						<th class="ff">판매가</th>
						<th class="ff">수량</th>
						<th class="ff">배송구분</th>
						<th class="ff">배송비</th>
						<th class="ff">합계</th>
					</tr>
				</thead>
				
				<tbody>
					<tr style="height: 90px; background-color: #fff;">
						<td style="text-align: center; border-right: none;">
						<input type="checkbox" name="checkbox" class="check1">
						</td>
						<td style="border-right: none; border-right: none;"><img style="width: 80%;" src="../images/무료배송.png"></td>
						<td class="fd" style="text-align: left; padding-left: 10px; border-left: none; font-weight: bold;">상품 내용</td>
						<td class="fd" ><span style="padding-left: 10px;">0</span>원</td>
						<td style="width: 80px;">
							<input class="ff" type="number" name="number" style="text-align: right; width: 43px; margin-bottom: 5px;" min="1" max="99"  step="1" value="1">
							<button class="btn default fd" style="border-radius: 3px; size: 10px;">변경</button>
						</td>
						<td class="fd">무료배송</td>
						<td class="fd">0원<br>고정</td>
						<td class="fd"><span>상픔가격(할인전)</span>원</td>
					</tr>
				</tbody>
				
				<tfoot>
					<tr style="height: 60px;">
						<td colspan="5" style="border-right:none; text-align: left; padding-left: 40px; font-size: 15pt;">
							<span>[기본배송]</span>
						</td>
						<td colspan="5" style="border-right:none; text-align: right; padding-right: 40px;">
						<span id="sel">선택상픔가격(할인전)<span>0</span> + <span>배송비 0 = 합계</span>&nbsp;<span style="font-weight: bold; font-size: 15pt;">선택상픔가격(할인전)</span>
						</span>
						</td>
					</tr>
				</tfoot>
				</table>
				
				<div style="border: 1px solid #e0e0eb; padding: 15px 0;">
					<img alt="" src="../images/check.png" style="margin-left: 5px">
					<span style="font-size: 15px; color: gray;">쿠폰할인과 멤버쉽할인은 주문/결제창에서 적용 가능합니다</span>
				</div>
			</div>
			
			<div style="margin: 10px 0;">
				<span style="margin: 0 10px;" class="btnfloat">선택상품을</span>
				<button class="btn default btnfloat" style="background-color: gray; color: #fff;">삭제하기</button>
			</div>
			<br><br>
			
			<table class="calculation2">
				<tr>
					<th>총 상품금액</th>
					<th>총 배송비</th>
					<th style="width: 750px; padding: 22px 0;"><span>결제예정금액</span></th>
				</tr>
				
				<tr style="background-color: #fff;">
					<td style="padding: 22px 0;" class="ff"><span>총상품가격(할인전)</span>원</td>
					<td>+<span class="price ff">0</span>원</td>
					<td>=<span class="price ff" >총상품가격(할인전)</span>원</td>
				</tr>
			</table>
			<br><br>
			
			<div align="center">
				<button class="btn default backBtn" id="productClear">선택상품주문</button>
				<span class="clearboth"></span>
			</div>
			<br><br><br><br><br>
			<div style="border: 1px solid #e0e0eb; padding: 10px 0; font-size: 12pt; background-color: #f5f5f0; padding-left: 10px;">
				이용안내
			</div>
			<div style="border : 1px solid #e0e0eb; height: 300px; font-size: 23pt; padding-left: 10px;">
				<br>장바구니 이용안내
				<ol>
					<li class="lifont">선택하신 상품의 수량을 변경하시려면 수량변경 후 [변경] 버튼을 누르시면 됩니다.</li>
					<li class="lifont">상품을 구매하기 전에 반드시 장바구니 페이지에서 구매하고자 하는 제품을 확인해주시기 바랍니다.
					잘못된 상품을 구매하실 수 있으니 주의해주세요</li>
					<li class="lifont">멤버십에 가입하시면 더 많은 혜택을 누리실 수 있습니다.</li>
					<li class="lifont">상품을 구매하기 전에 배송 정보를 정확하게 확인해주세요
					잘못된 배송지 정보로 인해 상품 배송이 지연될 수 있습니다.</li>
					<li class="lifont">상품을 장바구니에 담을 때 배송시간을 고려해야 합니다. </li>
					<li class="lifont">여러 상품을 고민 중이라면 장바구니에 담아둔 상품들을 비교해 보세요. 
					가격,품질,디자인 등을 비교하여 자신에게 가장 적합한 상품을 선택할 수 있습니다.</li>
				</ol>
			</div>
		</form>
	</div>
</body>
</html>