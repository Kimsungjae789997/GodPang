
// 메인페이지의 로그인아이콘 버튼 클릭시
$(function(){
	
})

// 로그인 정규식
$(function(){
	
	
	
	// 비밀번호 숨기기
    const pw_show_hide = $('.pw_show_hide');
    let i = true;

	// 비밀번호 숨겼을때 클릭 할때마다 비밀번호 필드 정규식 검사
    pw_show_hide.click(function() {
        if (i == true) {
            pw_show_hide.css('background-position', '-126px 0');
            i = false;
        } else {
            pw_show_hide.css('background-position', '-105px 0');
            i = true;
        }
    });

	// 'id기억하기' 선택시 쿠키에 저장
    var rememberedId = getCookie("rememberedId");
    if (rememberedId !== "") {
        $("#member_id").val(rememberedId);
    }

	// 'id기억하기' 체크박스 선택/미선택 체크
    $("#remember_id").change(function() {
        if ($(this).is(":checked")) {
            var memberId = $("#member_id").val();
            setCookie("rememberedId", memberId, 7);	// 체크시 쿠키저장
        } else {
            deleteCookie("rememberedId");	// 미체크시 쿠키 삭제
        }
    });
});


// 쿠키 설정
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

// 쿠키 삭제하기
function deleteCookie(cname) { 
    document.cookie = cname + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT; path=/';
}