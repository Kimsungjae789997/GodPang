<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>관리자 페이지</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
   <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> <!-- chart -->  
    <link rel ="shortcut icon" href="#">
  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  #time {
    font-size: 3em; 
    font-weight: bold; 
    margin-bottom: 20px; 
  }
  
  .nav-item:hover {
    background-color: #343a40 !important; /* 호버 시 배경색 변경 */
  }

  .nav-item.active {
    color: #ffc107 !important; /* active 클래스에 대한 글자색 변경 */
    background-color: #343a40 !important; /* active 클래스에 대한 배경색 변경 */
  }
  </style>
  
<script>

const dpTime = function () {
    const now = new Date()
    let hours = now.getHours()
    let minutes = now.getMinutes()
    let seconds = now.getSeconds()
    let ampm = ''
    if (hours > 12) {
      hours -= 12
      ampm = '오후'
    } else {
      ampm = '오전'
    }
    if (hours < 10) {
      hours = '0' + hours
    }
    if (minutes < 10) {
      minutes = '0' + minutes
    }
    if (seconds < 10) {
      seconds = '0' + seconds
    }
    document.querySelector('#time').innerHTML = ampm + hours + ":" + minutes + ":" + seconds
  }
  setInterval(dpTime, 1000)  // 1초마다 함수 실행되도록 설정
  
  
  $(function(){
		
		// bar-chart
		const ctx = document.getElementById('line-Chart');

		new Chart(ctx, {
		  type: 'bar',
		  data: {
		    labels: ['패션의류/잡화(P001)', '뷰티(P002)', '출산/유아동(P003)', '식품(P004)', '주방용품(P005)', '생활용품(P006)','홈인테리어(P007)','가전디지털(P008)','스포츠레저(P009)'],
		    datasets: [{		// json이나 배열로 데이터 보내기
		      label: 'prod of lprod',
		      data: [20, 20, 20, 20, 20, 20,20,20,20],
		      borderWidth: 1
		    }]
		  }
		});
	})
</script>
</head>
<body>

<div class="p-5 bg-primary text-white text-center">

 <a href="<%=request.getContextPath()%>/admin_main.jsp" style="color: white; font-size: 30pt; text-decoration: none;">관리자 페이지</a>
  <p>ADMIN</p> 
</div>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <div class="container-fluid d-flex justify-content-center">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="#">메인 광고관리</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<%=request.getContextPath()%>/lprodAllSelect.do">상품 카테고리 관리</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<%=request.getContextPath()%>/admin_jsp/admin_prod/admin_prod.jsp">상품 관리</a>
      </li>
		<li class="nav-item">
		    <a class="nav-link" href="<%=request.getContextPath()%>/admin_jsp/admin_reply/admin_paylist.jsp">결제 현황 관리</a>
		</li>
            <li class="nav-item">
        <a class="nav-link " href="<%=request.getContextPath()%>/admin_jsp/admin_prodstock/admin_prodstock.jsp">상품 재고 관리</a>
      </li>
            <li class="nav-item">
             <a class="nav-link " href="<%=request.getContextPath()%>/admin_jsp/admin_notice/admin_notice.jsp">공지사항 관리</a>
      </li>
            <li class="nav-item">
       <a class="nav-link " href="<%=request.getContextPath()%>/admin_jsp/admin_review/admin_review.jsp">리뷰 관리</a>
      </li>
    </ul>
  </div>
</nav>

<div class="container mt-5">
  <div class="row">
    <div class="col-sm-4">
      <h3>현재 시간</h3>
      <div id="time">time</div>
   
    </div>
    <div class="col-sm-8">
      <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;각 카테고리별 상품량</h2>
        
      <div> <canvas id="line-Chart"></canvas></div>


 
    </div>
  </div>
</div>

<div class="mt-5 p-4 bg-dark text-white text-center">
  <p></p>
</div>

</body>
</html>