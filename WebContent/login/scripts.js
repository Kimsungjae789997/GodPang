$(document).ready(function() {
  $("#idSearchButton").click(function() {
    var phone = $("#phoneInput").val();
    if (phone !== "") {
      findMemberIdByPhone(phone);
    } else {
      alert("휴대폰 번호를 입력하세요.");
    }
  });

  $("#passwordSearchButton").click(function() {
    var email = $("#emailInput").val();
    if (email !== "") {
      $.ajax({
		url : `${mypath}/selectMemPw.do`,  // 변수 mypath를 사용하여 서블릿 경로 지정
		type : 'post',
		data : {"email" : email },
		success : function(result) {
			console.log(result.flag);
			if(result.flag=="실패"){
			alert("이메일이 전송"+result.flag+" 되었습니다. 다른이메일을 적어주세요 ");		
			}else{
		 	alert("이메일이 전송"+result.flag+" 되었습니다. ");		
				
			}
		},
		error : function(xhr) {
			alert("상태" + xhr.status);
		},
		dataType : 'json'
		})
     
    } else {
      alert("이메일을 입력하세요.");
    }
  });
});

function findMemberIdByPhone(phone) {
  	$.ajax({
		url : `${mypath}/selectMemId.do`,  // 변수 mypath를 사용하여 서블릿 경로 지정
		type : 'post',
		data : {"phone" : phone },
		success : function(result) {
			console.log(result);
			if (result.userid) {
    			$("#idSearchResults").text("회원 아이디: " + result.userid);
  			} else {
    			$("#idSearchResults").text("해당하는 회원이 없습니다.");
  			}
		},
		error : function(xhr) {
			alert("상태" + xhr.status);
		},
		dataType : 'json'
	})
}


function displayIdSearchResults(memberId) {
  
}
