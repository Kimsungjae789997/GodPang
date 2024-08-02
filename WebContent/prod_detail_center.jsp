<%@page import="member.service.MemberServiceImpl"%>
<%@page import="member.service.IMemberService"%>
<%@page import="shop.vo.ReviewVO"%>
<%@page import="java.util.List"%>
<%@page import="shop.vo.ProdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel ="shortcut icon" href="#">
<link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="./css/prod_detail_center.css" type="text/css" />
<style type="text/css">
.answer{
	display: none;
}
</style>
<script>
$(function(){
	
	$('.question').on('click',function(){
		$(this).next().slideToggle();
		$(this).next().siblings('.answer').slideUp();
	})
	
})
</script>
</head>
<body>

<div>
    <br><br><br><br><br>
    <div align="center">
        <ul class="nav nav-tabs" id="myTab" role="tablist" style="width: 60%">
            <li class="nav-item" role="presentation" style="width: 25%"><a class="nav-link active" data-toggle="tab" href="#home" role="tab" aria-selected="true">상세정보</a></li>
            <li class="nav-item" role="presentation" style="width: 25%"><a class="nav-link" data-toggle="tab" href="#re3" role="tab" aria-selected="false">상품평</a></li>
        </ul>
        <div class="tab-content" id="myTabContent">
            <!-- <div class="tab-pane fade show active" id="home" role="tabpanel"><img src="./images/prod/"></div> -->
            <!-- 상세정보 -->
        </div>
    </div>
    <br><br>
    <div align="center">
        <ul class="nav nav-tabs" id="myTab" role="tablist" style="width: 60%">
            <li class="nav-item" role="presentation" style="width: 25%"><a class="nav-link active" data-toggle="tab" href="#re3" role="tab" aria-selected="true">상품평</a></li>
        </ul>
        <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="re3" role="tabpanel">
                <!-- 상품평 -->
                <div class="xans-element- xans-product xans-product-review">
                    <div class="ec-base-table typeList">
                        <br>
                        <h3>상품평</h3>
                        <p class="desc">상품의 사용후기를 적어주세요.</p>  


						<table border="1" style="width: 90%;">
                            <thead>
			<% 
					    String prod_id = request.getParameter("prod_id");
					    IMemberService service = MemberServiceImpl.getService();
					    List<ReviewVO> list = service.getProdDetailReview(prod_id);
					    
					    if (list != null && !list.isEmpty()) {
					        for (ReviewVO vo : list) {
					%>
					            <tr class="question">
					                <th><%= vo.getReview_no() %></th>
					                <th><%= vo.getReview_title() %></th>
					                <th>김**</th>
					                <th><%= vo.getReview_write_date() %></th>
					            </tr>
					            <tr class="answer">
					                <td colspan="2"><img src='<%=request.getContextPath()%>/imageView_review.do?prod_id=${v.prod_id}' style="width: 100px; height: 100px;"></td>
					                <td colspan="2"><%= vo.getReview_content() %></td>
					            </tr>
					<%
					        }
					    } else {
					%>
					        
					        <img src="<%=request.getContextPath()%>/images/login/결과가없습니다.png" height="800px" width="800px"> 
					<%
					    }
					%>
					           
                            </thead>
                        </table>

                             
	  			  </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
</body>
</html>