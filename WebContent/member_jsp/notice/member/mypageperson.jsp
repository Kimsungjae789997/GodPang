<%@page import="shop.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link rel="stylesheet" href="/ShopEcommerce/css/public.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/ShopEcommerce/member_js/jquery-3.7.1.min.js"></script>
<script src="/ShopEcommerce/member_js/jquery.serializejson.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
input[type=text], input[type=password] {
    width: 350px;
}

html, body {
    height: 100%;
    margin: 0;
    display: flex;
    justify-content: center;
    align-items: center;
}
</style>

<script>
$(() => {
    // 이름 데이터 형식 체크 - 정규식
    $('#name').on('keyup', function(){
        // 입력한 이름
        namevalue = $(this).val().trim();
        namereg = /^[가-힣]{2,10}$/;
        if(namereg.test(namevalue)){
            $(this).css('border', '2px solid blue');
        }else{
            $(this).css('border', '2px solid red');
        }
    });
    
    // 전화번호 형식체크 - hpvalue
    $('#hp').on('keyup', function(){
        namevalue = $(this).val().trim();
        namereg =/^[0-9|-]{2,12}$/;
        if(namereg.test(namevalue)){
            $(this).css('border', '2px solid blue');
        }else{
            $(this).css('border', '2px solid red');
        }
    });
    
    // 이메일 형식체크 - mailvalue
    $('#mail').on('keyup', function(){
        namevalue = $(this).val().trim();
        namereg =/^[a-zA-Z0-9@.]{2,20}$/;
        if(namereg.test(namevalue)){
            $(this).css('border', '2px solid blue');
        }else{
            $(this).css('border', '2px solid red');
        }
    });

    // 전송하기 - 이벤트
    $('#send').on('click',function(){
        fdata1 = $('#ff').serialize();
        fdata2 = $('#ff').serializeArray();
        fdata3 = $('#ff').serializeJSON();
        console.log("fdata3",fdata3);
        $.ajax({
            url : "/ShopEcommerce/MypagePerson.do",
            type : 'post',
            data : fdata3,
            success : result => {
                if(result.flag == "성공"){
                    alert("회원정보가 성공적으로 수정되었습니다.");
                    location.href =  "<%=request.getContextPath()%>/login/LoginMember.jsp";
                }
            },
            error : xhr => {
                alert("상태 : " + xhr.status);
            },
            dataType : 'json'
        });
    });

    $('#zipbtn').on('click', function(){
        new daum.Postcode({
            oncomplete: function(data) {
                let zonecode = data.zonecode;
                let address = data.address;
                let buildingName = data.buildingName;
                $("#zip").val(zonecode);
                $("#add1").val(address);
                $("#add2").val(buildingName);
            }
        }).open();
    });
});
</script>
</head>
<body>
<%
	MemberVO memberVO = (MemberVO)request.getAttribute("memberVO");

// 	out.print("memberVO : " + memberVO);
%>
<div class="container mt-3">
    <h2>회원정보 수정</h2>
    <form id="ff" action="/ShopEcommerce/UpdateMember.do" method="post">
        <div class="mb-1 mt-3">
            <label for="id">아이디</label>
            <input type="text" class="form-control" id="id" name="mem_id" value="<%=memberVO.getMem_id()%>" readonly>
            <span id="checkid"></span>
        </div>
        <div class="mb-3 mt-3">
            <label for="pwd">비밀번호</label>
            <input type="password" class="form-control" id="pwd" name="mem_pass">
        </div>
        <div class="mb-3 mt-3">
            <label for="name">이름</label>
            <input type="text" class="form-control" id="name" name="mem_name" value="<%=memberVO.getMem_name()%>">
        </div>
        <div class="mb-3 mt-3">
            <label for="hp">전화번호</label>
            <input type="text" class="form-control" id="hp" name="mem_tel" value="<%=memberVO.getMem_tel()%>">
        </div>
        <div class="mb-3 mt-3">
            <label for="mail">Email</label>
            <input type="text" class="form-control" id="mail" name="mem_mail" value="<%=memberVO.getMem_mail()%>">
        </div>
        <div class="mb-3 mt-3">
            <label for="zip" id="ziptb">우편번호</label>
            <button type="button" id="zipbtn" class="btn btn-success btn-sm">번호검색</button>
            <input type="text" class="form-control" id="zip" name="mem_zip" value="<%=memberVO.getMem_zip()%>">
        </div>
        <div class="mb-3 mt-3">
            <label for="add1">주소</label>
            <input type="text" class="form-control addr" id="add1" name="mem_add1" value="<%=memberVO.getMem_add1()%>">
        </div>
        <div class="mb-3 mt-3">
            <label for="add2">상세주소</label>
            <input type="text" class="form-control addr" id="add2" name="mem_add2" value="<%=memberVO.getMem_add2()%>">
        </div>
        <button type="button" id="send" class="btn btn-primary btn-lg">회원정보 수정</button>
        <span id="join"></span>
    </form>
</div>
</body>
</html>
