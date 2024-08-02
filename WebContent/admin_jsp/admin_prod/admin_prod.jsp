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

  <!-- modal -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">

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
        url : '<%=request.getContextPath()%>/prodGet.do',
        data : {
            "page" : currentPage,
            "stype"  :  vstype,
            "sword"  :  vsword
        },
        type : 'post',
        success : function(result){

            var code = `
                <h3 id="cc"> 상품 관리 게시판</h3>
                <div class='container-1'> `
                ; 

            $.each(result.datas, function(i,v){

                code +=`

                <div class="col-sm-8">
				
     
                <table>
                    <tr>
                        <th>선택</th>
                        <th>상품 코드</th>
                        <th>분류 코드</th>
                        <th>상품명</th>
                        <th>이미지</th>
                        <th>등록일</th>
                    </tr>

                    <tr>
                        <td><input type="checkbox" name="checkbox" class="check"></td>
                        <td class="prod_id">${v.prod_id}</td> 
                        <td class="lprod_gu">${v.lprod_gu}</td>
                        <td class="prod_name">${v.prod_name}</td> 
                        <td class="prod_img"><img src="<%=request.getContextPath()%>/imageView.do?prod_id=${v.prod_id}" width="100"></td>
                        <td class="prod_insdate">${v.prod_insdate}</td>
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


    // 등록 ==========================================================================================================================
   

    var checkedIds = [];
    $(function(){
    //체크박스 클릭 이벤트
    $(document).on('click', 'input[name="checkbox"]', function() {
        var id = $(this).closest('tr').find('.prod_id').text();

        // 체크박스 상태에 따라 배열에 id 추가 또는 제거
        if ($(this).is(':checked')) {
            if(id!="") checkedIds.push(id);
        } else {
            checkedIds = checkedIds.filter(function(item) {
                return item !== id;
            });
        }
    });


	// 등록 =============================================================================================
    // 등록 버튼 클릭 이벤트
    $('#insert').on('click', function(){
        $('#insertModal').modal('show');
    });

    
	
    // 수정 =================================================================================================================
$('#update').on('click', function(){
    var checkedIds = [];
    $('input[name="checkbox"]:checked').each(function() {
        var id = $(this).closest('tr').find('.prod_id').text();
        checkedIds.push(id);
    });

    // 선택된 체크박스가 하나인지 확인
    if (checkedIds.length !== 1) {
        alert('수정은 1개의 항목만 선택할 수 있습니다.');
        return;
    }
    
    // 선택된 체크박스의 상품 코드 가져오기
    var fixid = $('input[name="checkbox"]:checked').closest('tr').find('.prod_id').text();
    
    $('#prod_id1').val(fixid);

    $('#updateModal').modal('show');
});

        


        // 삭제 ========================================================================

        $('#delete').on('click', function(){
            if (checkedIds.length === 0) {
                alert('삭제할 것들을 선택해주세요');
                return;
            }
            $.ajax({
                url: "<%=request.getContextPath()%>/prodDelete.do",
                type: 'post',
                data: JSON.stringify({ "checkedIds": checkedIds }),
                success: function(){
                	location.reload();
                 	alert("삭제 완료했습니다!");
                },
                dataType: 'json'  
            });
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
      <h1 style="font-weight: bold; ">상품 관리</h1>
      <br><br><br>
      <h3>현재 시간</h3>
      <div id="time">time</div>
      <br><br><br>
      <div class="button-container">
        <button class="button" id="insert" >등록</button>
        <button class="button" id="update">수정</button>
        <button class="button" id="delete">삭제</button>
     	<br><br>
		<div class="button-location">
		<div id="pop_up"></div>
		
		</div>
		</div>
		
				<hr class="d-sm-none">
    </div>
    
    <div class="col-sm-8" style="width: 100%;">
	            <form class="d-flex">
               <select class="form-select" id="stype">
                  <option value="">전체</option>
                  <option value="prod_name">상품명</option>
                  <option value="prod_id">상품 코드</option>
                  <option value="lprod_gu">분류 코드</option>
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



<!--  insert Modal -->
<div class="modal" id="insertModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">상품 관리</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        
        
  <form action="<%=request.getContextPath()%>/prodInsert.do" method="post" enctype=multipart/form-data>
  <div class="mb-3 mt-3">
    <label for="prod_id" class="form-label">상품코드:</label>
    <input type="text" class="form-control" id="prod_id" placeholder="Enter prod_id" name="prod_id">
  </div>
  <div class="mb-3">
    <label for="prod_name" class="form-label">상품명:</label>
    <input type="text" class="form-control" id="prod_name" placeholder="Enter prod_name" name="prod_name">
  </div>
    <div class="mb-3">
    <label for="prod_content" class="form-label">상품본문:</label>
    <input type="text" class="form-control" id="prod_content" placeholder="Enter prod_content" name="prod_content">
  </div>
    <div class="mb-3">
    <label for="prod_cost" class="form-label">상품매입가격:</label>
    <input type="text" class="form-control" id="prod_cost" placeholder="Enter prod_cost" name="prod_cost">
  </div>
    <div class="mb-3">
    <label for="prod_price" class="form-label">상품판매가격:</label>
    <input type="text" class="form-control" id="prod_price" placeholder="Enter prod_price" name="prod_price">
  </div>
    <div class="mb-3">
    <label for="prod_img" class="form-label">상품이미지:</label>
    <input type="file" class="form-control" id="prod_img" placeholder="Enter prod_img" name="prod_img">
  </div>
   <div class="mb-3">
    <label for="lprod_gu" class="form-label">분류코드:</label>
    <input type="text" class="form-control" id="lprod_gu" placeholder="Enter lprod_gu" name="lprod_gu">
  </div>
  

  <div class="form-check mb-3">
      <span id="checkcode"></span>
  </div>
  <button type="submit" class="btn btn-primary">등록</button>
  
  </form>
      
        
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
   


<!-- updateModal -->
<!-- The Modal -->
<div class="modal" id="updateModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">상품 관리</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        
        
  <form action="<%=request.getContextPath()%>/prodUpdate.do" method="post" enctype=multipart/form-data>
  <div class="mb-3 mt-3">
    <label for="prod_id" class="form-label">상품코드:</label>
    <input type="text" class="form-control" id="prod_id1" placeholder="선택한 상품과 상품코드 같게해주세요" name="prod_id1" readonly>
  </div>
  <div class="mb-3">
    <label for="prod_name" class="form-label">상품명:</label>
    <input type="text" class="form-control" id="prod_name1" placeholder="Enter prod_name" name="prod_name1">
  </div>
    <div class="mb-3">
    <label for="prod_content" class="form-label">상품본문:</label>
    <input type="text" class="form-control" id="prod_content1" placeholder="Enter prod_content" name="prod_content1">
  </div>
    <div class="mb-3">
    <label for="prod_cost" class="form-label">상품매입가격:</label>
    <input type="text" class="form-control" id="prod_cost1" placeholder="Enter prod_cost" name="prod_cost1">
  </div>
    <div class="mb-3">
    <label for="prod_price" class="form-label">상품판매가격:</label>
    <input type="text" class="form-control" id="prod_price1" placeholder="Enter prod_price" name="prod_price1">
  </div>
    <div class="mb-3">
    <label for="prod_img" class="form-label">상품이미지:</label>
    <input type="file" class="form-control" id="prod_img1" placeholder="Enter prod_img" name="prod_img1">
  </div>
   <div class="mb-3">
    <label for="lprod_gu" class="form-label">분류코드:</label>
    <input type="text" class="form-control" id="lprod_gu1" placeholder="Enter lprod_gu" name="lprod_gu1">
  </div>
  

  <div class="form-check mb-3">
      <span id="checkcode"></span>
  </div>
  <button type="submit" class="btn btn-primary">수정</button>
  </form>
        
        
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
</body>
</html>