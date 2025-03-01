<%@page import="admin.service.AdminServiceImpl"%>
<%@page import="admin.service.IAdminService"%>
<%@page import="shop.vo.ProdVO"%>
<%@page import="java.util.List"%>
<%@page import="shop.vo.LprodVO"%>
<%@ page isELIgnored="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>관리자 페이지</title>
  <link rel ="shortcut icon" href="#">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


  <style>
  .nav-item:hover {
    background-color: #343a40 !important; /* 호버 시 배경색 변경 */
  }

  .nav-item.active {
    color: #ffc107 !important; /* active 클래스에 대한 글자색 변경 */
    background-color: #343a40 !important; /* active 클래스에 대한 배경색 변경 */
  }

  .numStyle{
  	font-weight: bold;
  	font-size: 20px;
  	color: red;
  }
  
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  #time {
    font-size: 3em; 
    font-weight: bold; 
    margin-bottom: 20px; 
  }
     table {
            width: 100%;
            border-collapse: collapse;
            font-size: 20pt;
            margin-left: auto;
            margin-right: 0;
        }

        th, td {
            text-align: center;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        
   .button-location {
    display: flex;
    justify-content: flex-start; /* 왼쪽 정렬로 변경 */
    margin-bottom: 20px;
  }

  .button{
    margin: 0 10px;
    padding: 15px 30px;
    font-size: 15px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: all 0.3s ease;
  }
#updateComplete, #updateCancel, #insertCancel, #insertComplete{
    margin: 0 10px;
    padding: 15px 30px;
    font-size: 15px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: all 0.3s ease;
}
  .button:hover {
    background-color: #0056b3;
    transform: scale(1.05);
  }

.container-1{
    display: flex;
    flex-direction: column;
    flex-wrap: wrap;
    align-content: space-around;
}
#cc{
text-align: center;
}
  </style>
  
<script>
// 페이지처리
currentPage = 1;

$(function(){
	 $.listPage();
	 
	 $('#search').on('click', function() {
         currentPage = 1;
         $.listPage();
      })

      // 이전 버튼 클릭
      $(document).on('click', '.prev', function() {
         currentPage = parseInt($('.pnum').first().text()) - 1;
         $.listPage();
      })
      
      // 다음 버튼 클릭
      $(document).on('click', '.next', function() {
         currentPage = parseInt($('.pnum').last().text()) + 1;
         $.listPage();
      })

      // 페이지 번호 클릭
      $(document).on('click', '.pnum', function() {
         currentPage = $(this).text();
         $.listPage();
      })
})


$.listPage = function(){

    var vstype = $('#stype option:selected').val().trim(); // 변수 선언 수정
    var vsword = $('#sword').val().trim(); // 변수 선언 수정

    console.log(vstype, vsword);
    
    $.ajax({
        url : '<%=request.getContextPath()%>/payGet.do',
        data : {
            "page" : currentPage,
            "stype"  :  vstype,
            "sword"  :  vsword
        },
        type : 'post',
        success : function(result){

            var code = `
                <h3 id="cc"> 결제 현황 게시판</h3>
                <div class='container-1'> `
                ; 

            $.each(result.datas, function(i,v){

                code +=`

                <div class="col-sm-8">
				
     
                <table>
                    <tr>
                        <th>선택</th>
                        <th>주문번호</th>
                        <th>회원아이디</th>
                        <th>결제 총금액</th>
                        <th>최종 결제 금액</th>
                        <th>쿠폰번호</th>
                        <th>결제일</th>
                    </tr>

                    <tr>
                        <td><input type="checkbox" name="checkbox" class="check"></td>
                        <td class="cart_no">${v.cart_no}</td> 
                        <td class="mem_id">${v.mem_id}</td> 
                        <td class="pay_amt">${v.pay_amt}</td>
                        <td class="pay_filnalprice">${v.pay_filnalprice}</td> 
                        <td class="coupone_no">${v.coupon_no}</td>
                        <td class="pay_date">${v.pay_date}</td>
                    </tr>
                </table>
                </div>

            `
            })


            code += `</div>`;

            $('#prodList').html(code);

             pagecontroll = pageList(result.sp, result.ep, result.tp); // 변수 선언 수정
            $('#pageList').html(pagecontroll);
        },
        dataType : 'json',
        error : function(xhr){
			   alert("상태 : " + xhr.status);
		   }
    })

};

pageList = function(ps, pe, pt ){
	
	pager = `<ul class="pagination" style="justify-content: center;">`;
	
	//이전 버튼 생성 
	if(ps > 1) {
		
		pager += `<li class="page-item"><a class="page-link prev" href="#">Previous</a></li>`
	}	
		
	//페이지번호 생성
	for(i=ps ; i<=pe ;i++){
		
		if(i == currentPage) {
			pager += `<li class="page-item active"><a class="page-link pnum" href="#">${i}</a></li>`;
		} else{
			pager += `<li class="page-item"><a class="page-link pnum" href="#">${i}</a></li>`;
		}
		
	}
			
	//다음버튼 생성 
	if(pt > pe){
		pager += `<li class="page-item"><a class="page-link next" href="#">Next</a></li>`
	}
		
	
	pager += `</ul>`
	
	return pager;
}


// 시계 ====================================================================
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

// 버튼=======================================================================
var check = 0;
$(function(){
	

    var checkedIds = [];

   

});
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
        <a class="nav-link " href="<%=request.getContextPath()%>/admin_jsp/admin_reply/admin_paylist.jsp">결제 현황 관리</a>
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
     <div class="col-sm-4" style="width: 100%; text-align: center;">
      <h1 style="font-weight: bold; ">결제 현황</h1>
      <br><br><br>
      <h3>현재 시간</h3>
      <div id="time">time</div>
      <br><br><br>
      <div class="button-container">

     	<br><br>
		<div class="button-location">
		
		</div>
		</div>
		
				<hr class="d-sm-none">
    </div>
    
    <div class="col-sm-8" style="width: 100%;">
	            <form class="d-flex">
               <select class="form-select" id="stype">
                  <option value="">전체</option>
                  <option value="mem_id">회원아이디</option>
               </select> <input class="form-control me-2" type="text" id="sword" placeholder="Search">
               <button class="btn btn-primary" id="search" type="button">검색</button>
            </form>
	  
	  <br>
	  <br>
	  
	  <div id="prodList"></div>
	  
	  <br>
	  <br>
	  
	  <div id="pageList"></div>
	  
    </div>
    
    
  </div>
</div>

<div class="mt-5 p-4 bg-dark text-white text-center">
  <p></p>
</div>

</body>
</html>