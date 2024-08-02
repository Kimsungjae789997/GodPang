/**
 * 상품디테일 자바스크립트 
 */


$.getLprodList = function(){
    $.ajax({
        url: `${mypath}/getReviewCount.do`,
        type: 'get',
		data: {prod_id : prod_id},
        success: function(res){
        	console.log(res.count);
			$('#review_count a').val(res.count);
		},
        error: function(xhr){
            alert("실패" + xhr.status);
        },
        dataType: 'json'
    });
}


$.calcPrice = function(prod_id){
	console.log("calcPrice"+prod_id);
	
	$.ajax({
        url: `${mypath}/calcPrice.do`,
        type: 'get',
		data: {
        	prod_id: prod_id,
        	myNumberInput: myNumberInputValue
    	},
        success: function(res){
			 $("#myNumberInput").attr("max", res.cnt);
		},
        error: function(xhr){
            alert("실패" + xhr.status);
        },
        dataType: 'json'
    });
	
}
