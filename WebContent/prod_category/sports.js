
// 상품 카테고리 - 전체리스트
$.getLprodList = function(){
    $.ajax({
        url: `${mypath}/getLprodList.do`,
        type: 'get',
        success: function(res){
            var rcode = "";
            $.each(res, function(i , v){
                rcode += `<li style="height:50px;"><a class="lprod-link" data-lprod="${v.lprod_gu}" target="ifr"><img src="../../images/mainpage/${v.lprod_gu}.JPG" width="60" height="43" alt="이미지"  style="margin:9px;"> ${v.lprod_nm}</a></li>`;
            });
            $('#left ul').append(rcode);
        },
        error: function(xhr){
            alert("실패" + xhr.status);
        },
        dataType: 'json'
    });
}



$(document).on('click', '.lprod-link', function() {
    var lprod = $(this).data('lprod');
    $.ajax({
        url: `${mypath}/prodList.do`,
        type: 'get',
        data: { lprod: lprod },
        success: function(res){
           rcode  ="";
			$.each(res, function(i ,v){
				rcode += `<dl class="sports_d1">
								<div class="prod_detail_id" style="display:none">${v.prod_id}</div>
								<dt class="sports_dt1">
									<img src="../../images/prod/${lprod}/${v.prod_img}" width="300" height="300" alt="${v.prod_name}">
 									 
								</dt>
								<dd class="sports_dd1">
									<div class="sports_div">
										<h5>${v.prod_price}원 </h5>
										<hr style="width:30%;">
										<h3>${v.prod_name}</h3><br>
									</div>
								</dd>
							</dl></a>`;
				
			} )
			
			$('.sports_prod1').html(rcode);
        },
        error: function(xhr){
            alert("실패");
        },
        dataType: 'json'
    });
});




$(document).on('click', '.sports_d1', function() {
    // 클릭된 상품의 고유한 식별자 가져오기
    var prodId = $(this).find('.prod_detail_id').text();

    
    // 상세정보 페이지 URL 생성
    var detailPageUrl = `${mypath}/prodDetail.do?prodId=${prodId}`;
    
    // 상세정보 페이지로 이동
    window.location.href = detailPageUrl;
});


