<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function getCookie(name) {
    var cookies = document.cookie.split(';');
    for (var i = 0; i < cookies.length; i++) {
        var cookie = cookies[i].trim();
        if (cookie.startsWith(name + '=')) {
            return cookie.substring(name.length + 1);
        }
    }
    return null;
}

function setCookie(name, value, expiredays) {
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() + expiredays);
    var cookieString = name + '=' + value + ';expires=' + expireDate.toUTCString();
    document.cookie = cookieString;
}

$(function() {
    var maindivCookie = getCookie("maindiv");
    if (maindivCookie !== "done") {
        $('#layer_popup1').css('visibility', 'visible');
        $('#layer_popup2').css('visibility', 'visible');
    } else {
        $('#layer_popup1').css('visibility', 'hidden');
        $('#layer_popup2').css('visibility', 'hidden');
    }

    $('#close1 a').on('click', function() {
        if ($('#chkbox1').prop('checked')) {
            setCookie("maindiv", "done", 1);
        }
        $('#layer_popup1').css('visibility', 'hidden');
    });

    $('#close2 a').on('click', function() {
        if ($('#chkbox2').prop('checked')) {
            setCookie("maindiv", "done", 1);
        }
        $('#layer_popup2').css('visibility', 'hidden');
    });
});
</script>
<style>
   .layerPopup img {
        margin-bottom: 20px;
    }
    .layerPopup .layerBox {
        z-index: 10000;
        position: fixed;
        padding: 30px;
        background: #fff;
        border-radius: 6px;
    }
    .layerPopup .layerBox .title {
        margin-bottom: 10px;
        padding-bottom: 10px;
        font-weight: 600;
        border-bottom: 1px solid #d9d9d9;
    }
    .layerPopup div {
        display: inline;
    }
    .layerPopup form {
        margin-top: 5px;
        font-size: 16px;
        font-weight: 600;
        weight: 100%;
        height: 30px;
        line-height: 30px;
    }
    .layerPopup #close1, .layerPopup #close2 {
        font-size: 16px;
        font-weight: 600;
        width: 40px;
        height: 30px;
        color: black;
        float: right;
        line-height: 30px;
        text-align: center;
        text-decoration: underline;
    }
    .layerPopup a {
        text-decoration: none;
        color: black;
        width: 50px;
        height: 40px;
    }
    #content{
    font-size: 20px;
    color: black;
    font-weight: bold;
    }
    .layerPopup {
        visibility: hidden;
    }

</style>
</head>
<body>
<!-- layer popup content -->
<div id="direction" style="display: flex; justify-content: space-around;">
<div class="layerPopup" id="layer_popup1">
    <div class="layerBox">
        <h4 class="title">God팡 공지사항 1</h4>
        <div class="cont">
            <p>
                <img src="<%=request.getContextPath()%>/images/mainpage/쿠폰팝업사진.png" width="300" height="400"  alt="event page">
            </p>
            <p id="content">사이트 개최기념으로 무료배송</p>
        </div>
        <form name="pop_form">
            <div id="check1">
                <input type="checkbox" name="chkbox1" value="checkbox" id="chkbox1">
                <label for="chkbox1">오늘 하루동안 보지 않기</label>
            </div>
            <div id="close1">
                <a href="#">닫기</a>
            </div>
        </form>
    </div>
</div>

<div class="layerPopup" id="layer_popup2">
    <div class="layerBox">
        <h4 class="title">God팡 공지사항 2</h4>
        <div class="cont">
            <p>
                <img src="<%=request.getContextPath()%>/images/mainpage/배송무료.png" width="300" height="400"  alt="event page">
            </p>
            <p id="content">사이트 개최기념으로 무료배송</p>
        </div>
        <form name="pop_form">
            <div id="check2">
                <input type="checkbox" name="chkbox2" value="checkbox" id="chkbox2">
                <label for="chkbox2">오늘 하루동안 보지 않기</label>
            </div>
            <div id="close2">
                <a href="#">닫기</a>
            </div>
        </form>
    </div>
</div>

</div>
</body>
</html>