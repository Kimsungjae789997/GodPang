<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<!-- 결재api -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


<script type="text/javascript">

</script>


</head>
<body>

		<div>
			<select id="fundmoney" name="fundmoney"
				style="width: 100px; height: 30px;">
				<option>100</option>
				<option>1000</option>
				<option>5000</option>
				<option>10000</option>
			</select><span>원</span>
		</div>

		<div>
			<button type="button" id='kakao'>
				<img src="<%=request.getContextPath() %>/images/login/kakao.png">
			</button>
		</div>



	<script>

//카카오버튼 누르기전 체크
$(function(){
	
$('#kakao').click(function(){

					
					var money=$('#fundmoney option:selected').val();
					
				    var IMP = window.IMP; 
				    IMP.init('imp17732717'); 
				    IMP.request_pay({
				    	pg : "kakaopay", 
				        pay_method : 'card',
				        merchant_uid : 'merchant_' + new Date().getTime(),
				        name : '카카오페이결제',
				        amount : money,
				        buyer_email : 'email',
				        buyer_name : 'name',
				        buyer_tel : 'tel',
				        buyer_addr : '구매자 주소',
				        buyer_postcode : '구매자 주소',
				        m_redirect_url : '/fund/completekakao.jsp'
				    }, function(rsp) {
				        if ( rsp.success ) {
				            var msg = '결제가 완료되었습니다.';
				            console.log("rsp",rsp);
				            //location.href='completekakao.jsp';
				        } else {
				            var msg = '결제에 실패하였습니다.';
				            rsp.error_msg;
			    	}
						});
	
		
	});
})
	
</script>

</body>
</html>