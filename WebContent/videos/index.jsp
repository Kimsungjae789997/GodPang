<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@6/swiper-bundle.min.css" />
<link rel="stylesheet" href="style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
	
		$.ajax({
	        url: "<%=request.getContextPath()%>/shortsController.do", 
	        method: "get", 
	        success: function(res) {
            rcode = "";
			
			$.each(res, function(i , v){
			rcode += `<div class="swiper-slide"><h3>`;
			rcode += `<span style="color: white;">${v.shorts_content}</span>`;
			rcode += `</h3> <div class="slider-video">`;
			rcode += `<a href="#"><video src= "${v.shorts_url}" type="video/mp4"></video></a>`;
			rcode += `</div> </div>`;
				
			}) // $.each문 
			$('.swiper-wrapper').append(rcode);
	        
	        },
	        error: function(xhr) {
	        },
	        dataType: "json" 
	        
	    });
		
	
	
	})
	

</script>

</head>
<body>
	
<section>
    <div class="swiper-btn">
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
    </div>
    <div class="swiper">
        <div class="swiper-wrapper">
                <!-- Additional required wrapper -->
            
            <!-- 다른 슬라이드도 같은 방식으로 추가 -->
        </div>
    </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script>
    const swiper = new Swiper('.swiper', {
        loop: false,
        slidesPerView: 'auto',
        spaceBetween: 33,
        centeredSlides: true,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        on: {
            init: function () {
              const videos = document.querySelectorAll('video');
              const activeIndex = this.realIndex;
              const activeSlide = document.getElementsByClassName('swiper-slide')[activeIndex];
              const activeVideo = activeSlide.getElementsByTagName('video')[0];
              activeVideo.muted = false;
              Array.prototype.forEach.call(videos, function(video){
            	  video.pause();
              	  video.currentTime = 0;
              	  
              })
              activeVideo.play();
            },
            slideChange: function () {
                const videos = document.querySelectorAll('video');
                const activeIndex = this.realIndex;
                const activeSlide = document.getElementsByClassName('swiper-slide')[activeIndex];
                const activeVideo = activeSlide.getElementsByTagName('video')[0];
                activeVideo.muted = false;
                Array.prototype.forEach.call(videos, function(video){
              	  video.pause();
                	  video.currentTime = 0;
                	  
                })
                activeVideo.play();
              },
          	},
          	
          	
    });
    
    window.onbeforeunload = function() {
        const videos = document.querySelectorAll('video');
        videos.forEach(function(video) {
            video.pause();
        });
    };
</script>
</body>
</html>
