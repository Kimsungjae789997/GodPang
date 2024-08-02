<%@page import="com.google.gson.Gson"%>
<%@page import="shop.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>갓팡!</title>

<!-- 
[홈페이지 구성요소]
- header(화면 최상단): 웹 사이트 로고, 로그인, 회원가입, 사이트맵, 언어 선택
                      우리홈페이지에서는 header안에 nav를 묶어놓음
- nav(header밑): 문서의 navigation , 메뉴 , 리스트와 링크(ul , li, a )​
                      우리홈페이지는 로고, 검색창, 로그인,장바구니 들어감
- aside(화면 좌측, 우측) : 본문 글과 연관성 없는 내용 (배너 광고, 위젯등)
- section(본문) : 문서에서 관련 있는 내용을 묶음
- article(추가 본문) : 독립적인 내용, 뉴스 기사나 블로그 내용 
- footer(화면 맨하단) : 사이트 회사 정보들(주소, 연락처, 저작권)


[로직설명]
- header 안에 nav를 포함해놓음
- nav를 통째로 묶어서 div씌운것 : css주기 위함 
                     (<div class="wrapper" style="display: flex;">)
 -->
<!-- 
[홈페이지 구성요소]
- header(화면 최상단): 웹 사이트 로고, 로그인, 회원가입, 사이트맵, 언어 선택
                      우리홈페이지에서는 header안에 nav를 묶어놓음(기능이 많지 않기때문)
- nav(header밑): 문서의 navigation , 메뉴 , 리스트와 링크(ul , li, a )​
                      우리홈페이지는 로고, 검색창, 로그인,장바구니 들어감
- aside(화면 좌측, 우측) : 본문 글과 연관성 없는 내용 (배너 광고, 위젯등)
- section(본문) : 문서에서 관련 있는 내용을 묶음
- article(추가 본문) : 독립적인 내용, 뉴스 기사나 블로그 내용 
- footer(화면 맨하단) : 사이트 회사 정보들(주소, 연락처, 저작권)


[로직설명]
- header 안에 nav를 포함해놓음
- nav를 통째로 묶어서 div씌운것 : css주기 위함 
                     (<div class="wrapper" style="display: flex;">)

 -->
 
<!-- mypath 설정 -->
<script type="text/javascript"> mypath = "<%=request.getContextPath()%>"; </script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mainpage.css" type="text/css" />
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
<script src="<%=request.getContextPath()%>js/jquery.serializejson.min.j"></script>

    
    
</head>
<body>
<header id="header" >
   <nav>
      <!-- <div class="search_container"> -->
      <!-- </div> -->
      
      <div class="search_container">
         <!-- 갓팡 로고(클릭시 메인페이지로 이동) -->
         <a href="./mainpage.jsp" class="pad" title="Godpang - 내가 잘사는 이유"><img src="images/mainpage/00.갓팡아이콘.jpg" width="240" height="60" alt="갓팡로고"></a>
          <a class="pad">
          <!-- 검색창의 왼쪽 카테고리 클릭할수 있는 부분 -->
          <div class="selectBox search_item">
             <select name="lprod" class="select">
               <!-- <option disabled selected>전체</option> -->
               <option value="all">전체</option>
               <option value="fashion">패션의류/잡화</option>
               <option value="beauty">뷰티</option>
               <option value="baby">출산/유아동</option>
               <option value="food">식품</option>
               <option value="kitchen">주방용품</option>
               <option value="life">생활용품</option>
               <option value="interior">홈인테리어</option>
               <option value="digital">가전디지털</option>
               <option value="sports">스포츠/레저</option>
            </select>
          </div>
          </a>
          <!-- 검색단어 입력창 + 감섹버튼 -->
          <a class="pad">
          <input type="text" class="search_input" placeholder="찾고 싶은 상품을 검색해보세요!"></a>
          <a href="./search.jsp" class="pad"><button>검색</button></a>   
          
          <!-- 로그인, 장바구니 -->
          <a href="./login.jsp" class="pad" title="로그인 하기">
          <img src="images/mainpage/00.로그인.JPG" width="80" height="65" alt="로그인"><br>&nbsp;&nbsp;로그인</a>
          <a href="./cart.jsp" class="pad" title="장바구니 가기">
          <img src="images/mainpage/00.장바구니.JPG" width="80" height="65" alt="장바구니"><br>&nbsp;장바구니</a>
      </div>    
   </nav>
       
</header>
 
<!-- <nav>
   <ul>
      <li><a href="main.html">Home</a></li>
      <li><a href="#">About Us</a></li>
      <li><a href="#">News</a></li>
      <li><a href="#">My Account</a></li>
      <li><a href="#">Contacts</a></li>
   </ul>
</nav> -->

<!-- div : 카테고리 (aside id=left),  메인광고+쇼츠+카테고리별 상품목록(section) -->  
<div class="wrapper" style="display: flex;">
<!-- aside left 화면 좌측 - 카테고리ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
<!-- <div id="asideleft"> -->
   <div id="lprod_hover">
   <a href="./lprod.jsp" title="카테고리 보기"><img src="images/mainpage/00.카테고리.JPG" width="150" height="160.5" alt="카테고리"></a>
   <aside id="left">
      <ul>
      <!-- 전체 빠짐 -->
         <li><a href="fashion.jsp" target="ifr"><img src="images/mainpage/01.카테고리_패션의류잡화.JPG" width="60" height="45" alt="패션의류/잡화">패션의류/잡화</a></li>
         <li><a href="beauty.jsp" target="ifr"><img src="images/mainpage/02.카테고리_뷰티.JPG" width="60" height="45" alt="뷰티">뷰티</a></li>
         <li><a href="baby.jsp" target="ifr"><img src="images/mainpage/03.카테고리_출산유아동.JPG" width="60" height="45" alt="출산">출산/유아동</a></li>
         <li><a href="food.jsp" target="ifr"><img src="images/mainpage/04.카테고리_식품.JPG" width="60" height="45" alt="식품">식품</a></li>
         <li><a href="kitchen.jsp" target="ifr"><img src="images/mainpage/05.카테고리_주방용품.JPG" width="60" height="45" alt="주방용품">주방용품</a></li>
         <li><a href="life.jsp" target="ifr"><img src="images/mainpage/06.카테고리_생활용품.JPG" width="60" height="45" alt="생활용품">생활용품</a></li>
         <li><a href="interior.jsp" target="ifr"><img src="images/mainpage/07.카테고리_홈인테리어.JPG" width="60" height="45" alt="가전디지털">홈인테리어</a></li>
         <li><a href="digital.jsp" target="ifr"><img src="images/mainpage/08.카테고리_가전디지털.JPG" width="60" height="45" alt="가전디지털">가전디지털</a></li>
         <li><a href="sports.jsp" target="ifr"><img src="images/mainpage/09.카테고리_스포츠레저.JPG" width="60" height="45" alt="스포츠/레저">스포츠/레저</a></li>
      </ul>
   </aside>
   </div>
<!-- </div> -->

<!-- 메인 카테고리 광고ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
   <div id="container">   
      <section id="section">
<!--          <article id="article1">
            <iframe src="html/computer.html" name="ifr"> </iframe>
            <iframe src="html/clothing.html" name="ifr"> </iframe>
            <iframe src="html/music.html" name="ifr"> </iframe>
            <iframe src="html/movie.html" name="ifr"> </iframe>
            <iframe src="html/sports.html" name="ifr"> </iframe>
            <iframe src="html/interior.html" name="ifr"> </iframe>
            <iframe src="html/food.html" name="ifr"> </iframe>
         </article> -->
         <img alt="패션의류/잡화 카테고리" src="images/mainpage/ad_02_뷰티.jpg" width="1920" height="450">
         <img alt="뷰티 카테고리" src="images/mainpage/ad_02_뷰티.jpg" style="display: none;" width="1920" height="450">
         <img alt="출산유아동 카테고리" src="images/mainpage/ad_02_뷰티.jpg" style="display: none;" width="1920" height="450">
         <img alt="식품 카테고리" src="images/mainpage/ad_04_식품.jpg" style="display: none;" width="1920" height="450">
         <img alt="주방용픔 카테고리" src="images/mainpage/ad_02_뷰티.jpg" style="display: none;" width="1920" height="450">
         <img alt="생활용품 카테고리" src="images/mainpage/ad_06_생활용품.jpg" style="display: none;" width="1920" height="450">
         <img alt="홈인테리어 카테고리" src="images/mainpage/ad_02_뷰티.jpg" style="display: none;" width="1920" height="450">
         <img alt="가전디지털 카테고리" src="images/mainpage/ad_02_뷰티.jpg" style="display: none;" width="1920" height="450">
         <img alt="스포츠레저 카테고리" src="images/mainpage/ad_02_뷰티.jpg" style="display: none;" width="1920" height="450">
         <div class="ad_img_container">
            <div class="ad_list">
               <ul class="ad_ul">
                  <li class="ad_ul_li">
                     <a href="/fassion.jsp">
                     <img alt="패션의류/잡화" src="images/mainpage/ad_02_뷰티_li용.jpg" width="180" height="60">
                     </a>
                  </li>
                  <li class="ad_ul_li">
                     <a href="/beauty.jsp">
                     <img alt="뷰티" src="images/mainpage/ad_02_뷰티_li용.jpg" width="180" height="60">
                     </a>
                  </li>
                  <li class="ad_ul_li">
                     <a href="/baby.jsp">
                     <img alt="출산유아동" src="images/mainpage/ad_02_뷰티_li용.jpg" width="180" height="60">
                     </a>
                  </li>
                  <li class="ad_ul_li">
                     <a href="/food.jsp">
                     <img alt="식품" src="images/mainpage/ad_04_식품_li용.jpg" width="180" height="60">
                     </a>
                  </li>
                  <li class="ad_ul_li">
                     <a href="/kitchen.jsp">
                     <img alt="주방용품" src="images/mainpage/ad_02_뷰티_li용.jpg" width="180" height="60">
                     </a>
                  </li>
                  <li class="ad_ul_li">
                     <a href="/life.jsp">
                     <img alt="생활용품" src="images/mainpage/ad_06_생활용품_li용.jpg" width="180" height="60">
                     </a>
                  </li>
                  <li class="ad_ul_li">
                     <a href="/interior.jsp">
                     <img alt="홈인테리어" src="images/mainpage/ad_02_뷰티_li용.jpg" width="180" height="60">
                     </a>
                  </li>
                  <li class="ad_ul_li">
                     <a href="/digital.jsp">
                     <img alt="가전디지털" src="images/mainpage/ad_02_뷰티_li용.jpg" width="180" height="60">
                     </a>
                  </li>
                  <li class="ad_ul_li">
                     <a href="/sports.jsp">
                     <img alt="스포츠레저" src="images/mainpage/ad_02_뷰티_li용.jpg" width="180" height="60">
                     </a>
                  </li>
               </ul>
            </div>
         </div>
      </section>
   
      <!-- <aside id="right">
         <div id="shopcart">
            <h4>Shopping Cart</h4>
            <br>
            <span>현재 쇼핑카트에 물품이 없습니다. <br> 
            <a href="html/shopcart.html" target="_blank">
                  <h4>쇼핑카트 보기</h4>
            </a>
            </span>
         </div>
         <br>
         <div id="login">
            <h4>Log In</h4>
            <br>
            <form action="#">
               <label for="id">아이디</label><br> <input type="text" id="id">
               <br> <label for="id">비밀번호</label><br> <input
                  type="password" id="pass"><br> <input type="button"
                  value="로그인"> <input type="button" value="초기화"><br>
               <a href="html/register.html" target="_blank">회원가입</a> <a href="#">비밀번호분실</a>
            </form>
         </div>
      </aside> -->
   </div>
</div>

   <footer>
      <p>2024 대덕인재개발원</p>
   </footer>
</body>
</html>








