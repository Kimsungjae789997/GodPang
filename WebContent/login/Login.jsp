<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/login/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/login/style.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
<script src="javascript.js"> </script>
<script type="text/javascript">

mypath = "<%=request.getContextPath()%>";

$(function() {
	
	gthis = this;
})

</script>

</head>

<body>
	<h1><a href="#"><img alt="갓팡" src="../images/login/godpang.png"></a></h1>
	<main>
		<form action="<%=request.getContextPath()%>/sessionloginMember.do" method="post" id="loginform">
			<fieldset>
				<legend class="skip"> 로그인 양식</legend>
				<ul>
					<li>
					<span class="id_bg">  <!-- 아이디 --></span>
					<span><input type="text" name="admin_code" placeholder="어드민 코드"></span>
					</li>
					<li>
					<span class="id_bg">  <!-- 아이디 --></span>
					<span><input type="text" name="member_id" placeholder="아이디"></span>
					</li>
					<li class="error id_error"> 아이디을 입력해 주세요  </li>
					<li>
					<span class="pw_bg">  <!-- 패스워드 --></span>
					<span><input type="password" name="member_pw" id="myinput" placeholder="비밀번호"></span>
					<span class="pw_show_hide" ></span>
					</li>
					<li class="error pw_error"> 패스워드를 입력해 주세요  </li>
				</ul>
				<div class="btm">
					<p>
						<label>
							<input type="checkbox" name="remember_id" id="login_y" id="remember_id">
							<span>아이디기억하기</span>
						</label>
					</p>
					<a href="<%=request.getContextPath()%>/login/memidselected.jsp" target="_blank" class="idpw_search">아이디 / 비밀번호 찾기</a>
				</div>
				<button type="submit" id="login_btn" style="font-weight: bolder; font-size: 17px;">로그인</button>
			</fieldset>
		</form>
		<a href="<%=request.getContextPath()%>/member_jsp/member/member.jsp" class="join_link">회원 가입</a>
		<a href="<%=request.getContextPath()%>/admin_main.jsp" class="join_link">어드민 페이지입니다</a>
	</main>
	
	<footer>
		&copy; GodPang corp. All right 
	</footer>
	
</body>

</html>