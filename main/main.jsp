<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>메인</title>
	<link rel="stylesheet" href="../main/css/main.css">
</head>
<body>
	<div class="body-content">
		<div class="slide-wrapper">
	        <ul class="slides">
	            <li class="fade"><img src="../main/image/main_01.jpg" alt="main"></li>
	            <li class="fade"><img src="../main/image/main_02.jpg" alt="main"></li>
	            <li class="fade"><img src="../main/image/main_03.jpg" alt="main"></li>
	        </ul>
		    <p class="controls">
		        <span class="dot one"></span>
		        <span class="dot two"></span>
		        <span class="dot three"></span>
		    </p>
	    </div>
	    <div class="time-wrapper">
	    	<div class="item1">오늘 관람시간</div>
	    	<div class="item2">TODAY OPEN HOURS</div>
	    	<div class="number-wrapper">
		    	<div class="item3">10</div>
		    </div>
		    <div class="line"></div>
		    <div class="number-wrapper">
		    	<div class="item4">21</div>
	    	</div>
	    </div>
	</div>
	<table>
    </table> 
</body>
<script>
	/* 회원가입, 로그인 메시지창 */
	let msg = "${param.msg}";
	if (msg) {
		alert(msg);
	}
    
	/* 슬라이드 이미지 */
    var slides = document.querySelector(".slides"),
        currentIdx = 0,
        slideCount = 3,
        slideWidth = 1000,
        slideMargin = 0,
        btn1 = document.querySelector(".one"),
        btn2 = document.querySelector(".two");
        btn3 = document.querySelector(".three");
    
	slides.style.width = (slideWidth * slideCount) +
                         slideMargin * (slideCount - 1) + "px";
    
    function moveSlide(num) {
        slides.style.left = (-num * 1000) + "px";
        currentIdx = num;
    }
    
    btn1.classList.add("active");
    
    btn1.addEventListener("click", function(){
    	moveSlide(0);
    	btn1.classList.add("active");
    	btn2.classList.remove("active");
    	btn3.classList.remove("active");
    });
    btn2.addEventListener("click", function(){
    	moveSlide(1);
    	btn1.classList.remove("active");
    	btn2.classList.add("active");
    	btn3.classList.remove("active");
    });
    btn3.addEventListener("click", function(){
    	moveSlide(2);
    	btn1.classList.remove("active");
    	btn2.classList.remove("active");
    	btn3.classList.add("active");
    });

</script>
</html>