<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="ko">
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./reset.css">
<link rel="stylesheet" href="./style.css">
<script src="../admin_js/jquery-3.7.1.min.js"></script>
<script src="javascript.js"> </script>
<script type="text/javascript">


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
		<a href="#" class="join_link">회원 가입</a>
	</main>
	
	<footer>
		&copy; GodPang corp. All right 
	</footer>
</body>
</html>	