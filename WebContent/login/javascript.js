$(function(){
	const pw_show_hide = document.querySelector('.pw_show_hide')
	
	let i = true;
	pw_show_hide.addEventListener('click', function() { // 함수를 정의할 때 괄호를 추가해야 합니다.
		if(i == true) {
			pw_show_hide.style.backgroundPosition = '-126px 0'
			i = false
		} else {
			pw_show_hide.style.backgroundPosition = '-105px 0'
			i = true
		}
	}); // 화면 눈 깜빡이는 효과 js 
	
	 var rememberedId = getCookie("rememberedId");
    if (rememberedId !== "") {
        $("#member_id").val(rememberedId);
    }

    // 아이디를 기억하는 체크박스의 상태 변경 감지
    $("#remember_id").change(function() {
        if ($(this).is(":checked")) {
            // 체크됐을 때, 입력된 아이디를 쿠키에 저장 (유효 기간: 7일)
            var memberId = $("#member_id").val();
            setCookie("rememberedId", memberId, 7);
        } else {
            // 체크가 해제됐을 때, 쿠키에서 아이디 제거
            deleteCookie("rememberedId");
        }
    });


}); // onload funtion
function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    var expires = "expires=" + d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

// 쿠키 가져오기 
function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}


function deleteCookie(cname) {
    document.cookie = cname + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT; path=/';
}
