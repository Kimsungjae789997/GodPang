<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쿠팡 계정 정보 찾기</title>
 <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript">
	mypath = "<%=request.getContextPath()%>";
</script>
<script src="<%=request.getContextPath()%>/login/scripts.js"></script>
<style>
h1 {
	margin: 50px;
}

.vertical-align {
	display: flex;
	align-items: center;
}

.container {
	width: 50%;
	text-align: center;
}

.vertical-align .col-md-6 {
	display: flex;
	flex-direction: column;
	justify-content: center;
}

div .row {
	display: block;
	text-align: -webkit-center;
}

h3 {
	text-align: left;
	margin-left: 20px; /* 아이디 찾기와 비밀번호 찾기의 왼쪽 여백 조절 */
}
</style>

<script type="text/javascript">
	
</script>
</head>

<body>
	<div class="container" style="border: solid 2px">
		<h1 class="text-center" style="font-weight: bolder;"><a  href="<%=request.getContextPath()%>/mainpage.jsp">갓팡 계정 정보 찾기</a></h1>
		<div style="height: 10%"></div>
		<div class="row">
			<div class="col-md-6">
				<h4>아이디 찾기</h4>
				<div class="input-group mb-3">
					<input type="tel" class="form-control" id="phoneInput"
						placeholder="휴대폰 번호를 입력하세요...">
					<button class="btn btn-primary" type="button" id="idSearchButton">입력
					</button>
				</div>
				<div id="idSearchResults"></div>
			</div>
			<div style="height: 50px;"></div>


			<div class="col-md-6">
				<h4>비밀번호 찾기</h4>
				<div class="input-group mb-3">
					<input type="email" class="form-control" id="emailInput"
						placeholder="이메일을 입력하세요...">
					<button class="btn btn-primary" type="button"
						id="passwordSearchButton">입력</button>
				</div>
				<div id="passwordSearchResults"></div>
			</div>
			<div style="height: 100px;"></div>
		</div>

	</div>


</body>
</html>
