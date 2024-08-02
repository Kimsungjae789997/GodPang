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
	<h1><a href="#"><img alt="갓팡" src="../images/login/godpang.png"></a>_to admin</h1>
	<main>
		<form action="<%=request.getContextPath()%>/sessionLoginAdmin.do" method="post" id="loginform">
			<fieldset>
				<legend class="skip"> 로그인 양식</legend>
				<ul>
					<li>
					<span class="id_bg">  <!-- 아이디 --></span>
					<span><input type="text" name="admin_code" placeholder="어드민 코드"></span>
					</li>
					<li class="error id_error"> 아이디을 입력해 주세요  </li>
					<li>
					</li>
					<li class="error pw_error"> 패스워드를 입력해 주세요  </li>
				</ul>
				<div class="btm">
					
				</div>
				<button type="submit" id="login_btn" style="font-weight: bolder; font-size: 17px;">로그인</button>
			</fieldset>
		</form>
		<a href="#" class="join_link">어드민 페이지입니다</a>
	</main>
	
	<footer>
		&copy; GodPang corp. All right 
	</footer>
</body>
</html>	