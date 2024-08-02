<%@page import="java.util.List"%>
<%@page import="shop.vo.LprodVO"%>
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
  
  .nav-item:hover {
    background-color: #343a40 !important; /* 호버 시 배경색 변경 */
  }

  .nav-item.active {
    color: #ffc107 !important; /* active 클래스에 대한 글자색 변경 */
    background-color: #343a40 !important; /* active 클래스에 대한 배경색 변경 */
  }
  </style>
  
<script>
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
  	checkInsert = false;
  	checkUpdate = false;
  	// 등록 ==========================================================================================================================
      var isRegistered = false; // 등록 여부를 나타내는 변수
      
      
      
      var checkedIds = [];

  	//체크박스 클릭 이벤트
  	$(document).on('click', 'input[name="checkbox"]', function() {
  		 var id = $(this).closest('tr').find('.lprod_gu').text();
  	 
  	 // 체크박스 상태에 따라 배열에 id 추가 또는 제거
  	 if ($(this).is(':checked')) {
  		 if(id!="") checkedIds.push(id);
  	 } else {
  	     checkedIds = checkedIds.filter(function(item) {
  	         return item !== id;
  	     });
  	 }
  	});
      
      
      
      
      $('#insert').on('click', function(){
   if(!checkInsert && !checkUpdate)  {
      	if (!isRegistered) { // 등록되지 않은 경우에만 실행
              checkInsert = true;
              
          	var newRow = '<tr>' +
                              '<td><input type="checkbox" name="checkbox" class="check"></td>'+
                              '<td><input type="text" name="lprod_gu" class="lprod_gu"></td>'+
                              '<td><input type="text" name="lprod_nm" class="lprod_nm"></td>'+
                              '</tr>';
              $('table').append(newRow);
              
              var completeButton = '<button id="insertComplete">등록 완료</button>  <button id="insertCancel">등록 취소</button>  <br><span id="ff"></span>';
              $('.button-location').append(completeButton);
              
              isRegistered = true; 
             	checkInsert = true;
          } else {
              alert('등록은 1개씩 가능합니다.'); 
          }
  }
   });
      	$(document).on('click','#insertCancel',function(){
      		location.href = "<%=request.getContextPath()%>/lprodAllSelect.do";
      	})
      
          $(document).on('click', '#insertComplete', function() {
          	    var lprod_gu = $('input[name="lprod_gu"]').val();
          	    var lprod_nm = $('input[name="lprod_nm"]').val();
             
              // 여기서 서버로 데이터를 전송하여 등록하는 로직을 구현하면 됩니다.
              // 예를 들어, Ajax를 사용하여 서버에 데이터를 전송할 수 있습니다.
             
              $.ajax({
              	url :"<%=request.getContextPath()%>/lprodInsert.do",
              	data :{"lprod_gu" : lprod_gu, "lprod_nm" : lprod_nm},
              	dataType : 'json',
              	success : function(result){              		
          			if(result.res =="등록성공"){
      					$('#ff').text(result.res).css('color','blue');
      					
      				    $('input[name="lprod_gu"]').replaceWith('<span class="lprod-gu">' + lprod_gu + '</span>');
                          $('input[name="lprod_nm"]').replaceWith('<span class="lprod-nm">' + lprod_nm + '</span>');
      				
                          $('#insertComplete, #insertCancel, #ff').remove();
          			} else{
      					$('#ff').text(result.res).css('color','red');
      				}
              		
              	}
              	
              })
              checkInsert = false;
          });
       //====================================================================================================================
      	
      	
      // 수정 =================================================================================================================
                 

  $('#update').on('click', function(){
   
  if(!checkInsert && !checkUpdate)  {
      if (checkedIds.length === 0) {
          alert('수정할 것들을 선택해주세요');
          return;
      }


      $('input[type="checkbox"].check:checked').each(function(){
          var tr = $(this).closest('tr');
          

         var lprod_nm = tr.find('.lprod_nm').text(); 
          

         tr.find('.lprod_nm').replaceWith('<input type="text" name="lprod_nm" class="lprod_nm22" style="margin-left: 10px;" value="' + lprod_nm + '">');
          
         if(check==0){ 
             $('.button-location').append('<button id="updateComplete">수정 완료</button>  <button id="updateCancel">뒤로 가기</button> <br><span id="gg"></span>');
             check++;
         }
      })
  	
      checkUpdate = true;
  }

  });


  $(document).on('click', '#updateComplete', function(){
      let lprod_list = [];
      
      $(".lprod_nm22").each(function(){
          let lprod_gu = $(this).closest('tr').find('.lprod_gu').text();
          let lprod_nm = $(this).val();
          
          let lprod = {};
          lprod.lprod_gu = lprod_gu;
          lprod.lprod_nm = lprod_nm
          lprod_list.push(lprod);
      });
      
      $.ajax({
          url: "<%=request.getContextPath()%>/lprodUpdate.do",
          type: "POST",
          data: JSON.stringify({ "lprod_list": lprod_list }),
          success: function(result){
              if(result.res == "수정 성공"){
                  $('#gg').text(result.res).css('color','blue');
                      
                  $('#updateComplete, #updateCancel, #gg').remove();
              } else {
                  $('#gg').text(result.res).css('color','red');
              }
          },
          dataType : 'json'
      });
      checkUpdate = false;
  });


  $(document).on('click','#updateCancel',function(){
  	
  	location.href = "<%=request.getContextPath()%>/lprodAllSelect.do";
  })
  // ===========================================================================
  	
  	
  // 삭제 ========================================================================
  		
  	$('#delete').on('click', function(){
  	 if (checkedIds.length === 0) {
  	     alert('삭제할 것들을 선택해주세요');
  	     return;
  	 }
  	 
  	 // 삭제 완료 버튼이 이미 추가되어 있는지 확인 후 추가
  	 if ($('#deleteComplete').length === 0) {
  	     $('body').append('<button id="deleteComplete">삭제 완료</button>');
  	 }
  	});
  	
  	$(document).on('click','#deleteComplete',function(){
  	 $.ajax({
  	     url: "<%=request.getContextPath()%>/lprodDelete.do",
  	     type: "POST",
  	     data: JSON.stringify({ "checkedIds": checkedIds }),
  	     success: function(result){
  	         if(result.res == "삭제 성공"){
  	             alert('삭제되었습니다.');
  	         } else {
  	             alert('삭제 실패하였습니다.');
  	         }
  	     },
  	     dataType : 'json'
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
      <a href="<%=request.getContextPath()%>/admin_main.jsp" style="color: white; font-size: 30pt; text-decoration: none;">관리자 페이지</a>
      <br><br><br>
      <h3>현재 시간</h3>
      <div id="time">time</div>
      <br><br><br>
      <div class="button-container">
        <button class="button" id="insert">등록</button>
        <button class="button" id="update">수정</button>
     	<br><br>
		<div class="button-location">
		
		</div>
		</div>
      <hr class="d-sm-none">
    </div>
    
    <div class="col-sm-8">
    <%List<LprodVO> list = (List<LprodVO>)request.getAttribute("list"); %>
<table>
    <tr>
    	<th>선택</th>
        <th>분류 번호</th>
        <th>카테고리</th>
        
    </tr>
    <%for(LprodVO vo : list){ %>
    <tr>
        <td><input type="checkbox" name="checkbox" class="check"></td>
        <td class="lprod_gu"><%=vo.getLprod_gu() %></td>
        <td class="lprod_nm"><%=vo.getLprod_nm() %></td>
    </tr>
    <%} %>
</table>

    </div>
  </div>
</div>

<div class="mt-5 p-4 bg-dark text-white text-center">
  <p></p>
</div>

</body>
</html>