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
        url : '<%=request.getContextPath()%>/noticeGet.do',
        data : {
            "page" : currentPage,
            "stype"  :  vstype,
            "sword"  :  vsword
        },
        type : 'post',
        success : function(result){

            var code = `
                <h3 id="cc"> 공지 사항 게시판</h3>
                <div class='container-1'> `
                ; 

            $.each(result.datas, function(i,v){

                code +=`

                <div class="col-sm-8">
				
     
                <table>
                    <tr>
                        <th>선택</th>
                        <th>번호</th>
                        <th>공지사항 제목</th>
                        <th>공지사항 내용</th>
                        <th>작성일</th>
                    </tr>

                    <tr>
                        <td><input type="checkbox" name="checkbox" class="check"></td>
                        <td class="notice_no">${v.notice_no}</td> 
                        <td class="notice_title">${v.notice_title}</td>
                        <td class="notice_content">${v.notice_content}</td> 
                        <td class="notice_write_date">${v.notice_write_date}</td> 
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

//버튼=======================================================================

$(function() {
    // 현재 체크된 상품 ID들을 저장할 배열
    var checkedIds = [];

    // 등록 버튼 클릭 시 등록 모달 표시
    $('#insert').on('click', function() {
        $('#insertModal').modal('show');
    });

    // 수정 버튼 클릭 시 체크된 상품이 1개인 경우에만 수정 모달 표시
    $('#update').on('click', function() {
        // 체크된 상품 ID를 배열에 추가
        checkedIds = [];
        $('input[name="checkbox"]:checked').each(function() {
            var id = $(this).closest('tr').find('.prod_id').text();
            checkedIds.push(id);
        });
        // 체크된 상품이 1개가 아니면 알림 표시 후 함수 종료
        if (checkedIds.length !== 1) {
            alert('수정은 1개의 항목만 선택할 수 있습니다.');
            return;
        }
        // 체크된 상품이 1개일 때 수정 모달 표시
        var fixid = $('input[name="checkbox"]:checked').closest('tr').find('.notice_no').text();
        $('#notice_no1').val(fixid);
        $('#updateModal').modal('show');
    });

    // 삭제 버튼 클릭 시 체크된 상품들을 삭제
    $('#delete').on('click', function() {
        // 체크된 상품 ID를 배열에 추가
        checkedIds = [];
        $('input[name="checkbox"]:checked').each(function() {
            var id = $(this).closest('tr').find('.notice_no').text();
            checkedIds.push(id);
        });
        // 체크된 상품이 없으면 알림 표시 후 함수 종료
        if (checkedIds.length === 0) {
            alert('삭제할 항목을 선택해주세요.');
            return;
        }
        // AJAX를 통해 서버로 체크된 상품 ID 배열을 전송하여 삭제 요청
        $.ajax({
            url: '<%=request.getContextPath()%>/noticeDelete.do',
            type: 'post',
            data: JSON.stringify({ "checkedIds": checkedIds }),
            contentType: 'application/json',
            success: function(result) {
                // 삭제 완료 시 페이지 다시 로드
                location.reload();
                alert("삭제 완료되었습니다!");
            },
            error: function(xhr) {
                alert('상태: ' + xhr.status);
            }
        });
    });
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
      <h1 style="font-weight: bold; ">공지사항 관리</h1>
      <br><br><br>
      <h3>현재 시간</h3>
      <div id="time">time</div>
      <br><br><br>
      <div class="button-container">
        <button class="button" id="insert">등록</button>
        <button class="button" id="update">수정</button>
        <button class="button" id="delete">삭제</button>

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
                  <option value="prod_name">공지사항 제목</option>
                  <option value="prod_id">공지사항 내용</option>
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



<!-- insert Modal -->
<div class="modal" id="insertModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">공지사항 관리</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        
        
  <form action="<%=request.getContextPath()%>/noticeInsert.do" method="post" >
  <div class="mb-3 mt-3">
    <label for="notice_title" class="form-label">공지사항 제목:</label>
    <input type="text" class="form-control" id="notice_title" placeholder="Enter notice_title" name="notice_title">
  </div>
  <div class="mb-3">
    <label for="notice_content" class="form-label">공지사항 내용:</label>
    <input type="text" class="form-control" id="notice_content" placeholder="Enter notice_content" name="notice_content">
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




<!-- update Modal -->
<div class="modal" id="updateModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">공지사항 관리</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        
        
  <form action="<%=request.getContextPath()%>/noticeUpdate.do" method="post" >
  <div class="mb-3 mt-3">
    <label for="notice_title" class="form-label">공지사항 제목:</label>
    <input type="text" class="form-control" id="notice_title1" placeholder="Enter notice_title" name="notice_title1">
  </div>
  <div class="mb-3">
    <label for="notice_content" class="form-label">공지사항 내용:</label>
    <input type="text" class="form-control" id="notice_content1" placeholder="Enter notice_content" name="notice_content1">
  </div>

  <input type="hidden" id="notice_no1" name="notice_no1">

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








<!-- The Modal -->
<div class="modal" id="insertModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">공지사항 관리</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        
        
  <form action="" method="post" >
  <div class="mb-3 mt-3">
    <label for="notice_title" class="form-label">공지사항 제목:</label>
    <input type="text" class="form-control" id="notice_title" placeholder="Enter notice_title" name="notice_title">
  </div>
  <div class="mb-3">
    <label for="notice_content" class="form-label">공지사항 내용:</label>
    <input type="text" class="form-control" id="notice_content" placeholder="Enter notice_content" name="notice_content">
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
        <h4 class="modal-title">공지사항 관리</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        
        
  <form action="" method="post" >
  <div class="mb-3 mt-3">
    <label for="notice_title" class="form-label">공지사항 제목:</label>
    <input type="text" class="form-control" id="notice_title" placeholder="Enter notice_title" name="notice_title">
  </div>
  <div class="mb-3">
    <label for="notice_content" class="form-label">공지사항 내용:</label>
    <textarea rows="20" cols="20" class="form-control" id="notice_content"></textarea>
    <input type="hidden" id="notice_no1" name="notice_no1">
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