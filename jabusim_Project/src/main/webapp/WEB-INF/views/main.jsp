<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JaBuSim</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">








<style>

	/* ==========================페이지 공용================================== */

	body{
		width:100%;
		min-height : 1200px;
	}
	
	ul{
		list-style:none;
		padding : 5px;
	}
	
	li{
	
	}
	
	.pageContainer{
		position: relative;
	    width: 1250px;
	    min-height: 700px;
	    margin: 0 auto;
	   	padding-top: 80px;
	    border: 1px solid red;
	}
	.module{
		min-height : 600px;
		width:100%;
		border: 1px solid blue;
		text-align:center;
		padding-top: 50px;
		padding-bottom: 50px;
	}
	
	.article{	
		display : inline-block;
		margin: 0 auto;
		
	}
	
	/* =========================================================================== */
	
	/*top_module*/
	
	#top_module .article{
		width : 94%;
		height : 650px;
		
	}
	
	#top_module .left_div{
		border : 1px solid red;
		display:inline-block;
		width : 700px;
		height : 100%;
		float: left;
	}
	
	#top_module .right_div{
		display:inline-block;
		border : 1px solid red;
		width : 450px;
		height : 100%;
		float: right;
		text-align: center
	}
	
	
	/* 자겨증 캐러셀 */
	#top_module .carousel{
		
		width:100%;
		height:100%;
	}
	
	#top_module .carousel .carousel-inner {
		width:100%;
		height:100%;
	}
	
	#top_module .carousel .carousel-inner div{
		width:100%;
		height:100%;
	}
	
	#top_module .carousel .carousel-inner img{
		width:100%;
		height:100%;
	}
	
	/* 달력 */
	
	#top_module .schedule{
		border: 1px solid black;
		width : 100%;
		height : 450px;
		/* margin-right: 60px; */
	}
		
	#top_module .schedule .hd{
		display : inline-block;
		align: center;
		width : 100%;
		margin : auto;
		justify-content :space-between;
		height : 10%;
		padding-top: 5px;
		padding-bottom: 5px;
		
	}
		
	#top_module .schedule .calendar{
		width : 100%;
		height: 90%;
		border: 1px solid black;	
	}
	
	
	
	
	#top_module .schedule .hd span{
		display : inline-block;
		width:100px;
		heigh:100%;
		
	}
	
	#top_module .schedule .hd button{
		width:30px;
		heigh:20px;
	}
	
	#top_module .calendar .cbody{
		display:grid;
		grid-template-columns:repeat(7, 1fr);
		grid-template-rows : repeat(6, 1fr);
	}
	
	
	#top_module .calendar .date{	
		border: 1px solid red;
	}
	
	/*공지사항*/
	#top_module .notice{
		border: 1px solid black;
		width : 100%;
		height : 180px;
		margin-top: 20px;
		padding-left: 5%;
		padding-right: 5%;
		display: inline-block;
	}
	
	#top_module .notice .hd{
		width:100%;
		height: 23%;
		border-bottom: 1px solid black;
	}
	
	#top_module .hd .notice_name{
		float: left;
		margin : 7px 5px 3px  5px;
		font-size: 20px;
		
	}
	
	#top_module .hd .notice_showMore{	
		float: right;
    	margin-top: 12px;
	}
	
	#top_module .noticeList{
		width : 100%;
		height: 77%;
	}
	
	#top_module .noticeList ul{
		height:100%;
		padding : 0;
		margin: 0;
		padding-top: 10px;
		padding-bottom: 10px;
	}
	
	#top_module .noticeList li{
		height:25%;
		text-align: left;
		padding-left: 5px;
	
		
	}
	
	
	/* =========================================================================== */
	
	/* bottom_module */
	
	/*자격증 리스트*/
	#bottom_module .licenseCardList{
		padding : 0px;
		display : inline-block;
	}
	

	#bottom_module .licenseCard{
		display : inline-block;
		list-style:none;
		margin: 10px auto;
	}
	
	
	#bottom_module .articleBtn{
		text-align: center;
	}
	
</style>
	

</head>
<body>

<script>
	var nowDay;
	var nowYear; // 년도  
	var nowMonth; // 월   0~11
	var nowDate; // 일   0~31
	var nowWeek; // 요일   0(일)~6(토)
	
	
	var firstDate; //이번달 1일	
	var lastDate; //이번달 마지막날
	
	var preDate;
	var proDate;
	
	var cell;
	
	window.onload = function(){
		nowDate = new Date();
		makeCalendar();
	}
	
	function makeCalendar(){
		
		var dayNum = 0;
		
		nowDay = nowDate.getDate();     //일 0~31
		nowWeek = nowDate.getDay();		//요일
		nowMonth = nowDate.getMonth();	//월 0~11
		nowYear = nowDate.getFullYear();	// 년도
		
		firstDate = new Date(nowYear, nowMonth, 1);   //이번달 첫번쨰 날 date 정보 가져오기
		lastDate = new Date(nowYear, nowMonth+1, 0);  //이번달 마지막 날 date 정보 가져오기
		
		preDate = new Date(nowYear, nowMonth, -(firstDate.getDay())); 	// 이전달 첫번째 날
		preLastMonth = new Date(nowYear, nowMonth, 0); //이전달 마지막 날
		
		proDate = new Date(nowYear, nowMonth+1, 1); // 달력 다음달 첫번쨰 날
		
		
		document.getElementById("calendarDate").innerText = "${nowYear}.${nowMonth}";
		
		var calendar = document.querySelector(".cbody");  //가져와서 쓸 html 변수 만들기
		calendar.innerHTML = "";
		
	 	
		for(var date = preDate.getDate()+1; date<=preLastMonth.getDate(); date++){
			cell = document.createElement("div");		// tobody 안에 추가할 요소 변수 만들기
			cell.classList.add("date");
			cell.textContent = date;
			calendar.appendChild(cell);
			
			dayNum++;
		}
		
		
		
		for(var date = firstDate.getDate(); date<= lastDate.getDate(); date++){
			cell = document.createElement("div");
			cell.classList.add("date");
			cell.textContent = date;
			calendar.appendChild(cell);
			
			dayNum++;
		} 
		
		for(var date = 1; date<=(42-dayNum); date++){
			cell = document.createElement("div");
			cell.classList.add("date");
			cell.textContent = date;
			calendar.appendChild(cell);
		}
	}	
	
	
	function preCalendar(){
		nowDate = new Date(nowYear, nowMonth-1, nowDay);
		makeCalendar();
	}
	
	function proCalendar(){
		nowDate = new Date(nowYear, nowMonth+1, nowDay);
		makeCalendar();
	}
	

</script>


<c:import url="/WEB-INF/views/include/top_menu.jsp"/>

	

		



	<div class="pageContainer">
		<div class="module" id="top_module">
			<div class="article">
				<div class="left_div">
					<div id="carouselExampleInterval" class="carousel slide"
						data-bs-ride="carousel">
						<div class="carousel-inner">
							<div class="carousel-item active" data-bs-interval="5000">
								<img src="${root }image/icon-spring-framework.svg" />
							</div>
							<div class="carousel-item" data-bs-interval="5000">
								<img src="${root }image/icon-spring-framework.svg" />
							</div>
							<div class="carousel-item" data-bs-interval="5000">
								<img src="${root }image/icon-spring-framework.svg" />
							</div>
						</div>
						<button class="carousel-control-prev" type="button"
							data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button"
							data-bs-target="#carouselExampleInterval" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
				</div>
				<div class="right_div">
					<div class="schedule">
						<div class="hd">
							<button type="button" onClick="preCalendar();">&lt;</button>
							<span id="calendarDate"></span>
							<button type="button" onClick="proCalendar();">&gt;</button>
						</div>
						<div class="calendar">
							<div class="cHead" style="border-bottom: 1px solid red; width:100%; height:15%;">
								<span>일</span>
								<span>월</span>
								<span>화</span>
								<span>수</span>
								<span>목</span>
								<span>금</span>
								<span>토</span>
							</div>
							<div class="cbody" style="width: 100%; height:85%">
								
							</div>
						</div>
					</div>
					<div class="notice">
						<div class="hd">
							<span class="notice_name">공지사항</span> <span
								class="notice_showMore"><a href="#">더보기 &gt;</a></span>
						</div>
						<div class="noticeList">
							<ul>
								<li><a href="#"> <span>2023-04-26</span> <span>'자넷',
											'대한민국 브랜드파워 1위' IT 에</span>
								</a></li>
								<li><a href="#"> <span>2023-04-26</span> <span>'자넷',
											'대한민국 브랜드파워 1위' IT 에</span>
								</a></li>
								<li><a href="#"> <span>2023-04-26</span> <span>'자넷',
											'대한민국 브랜드파워 1위' IT 에</span>
								</a></li>
								<li><a href="#"> <span>2023-04-26</span> <span>'자넷',
											'대한민국 브랜드파워 1위' IT 에</span>
								</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>

		</div>
		<div class="module" id="bottom_module">
			<div class="article">
				<!-- <h3>오늘의 자격증</h3> -->
				<ul class="licenseCardList">
					<li class="licenseCard">
						<div class="card border-dark mb-3" style="max-width: 18rem;">
							<div class="card-header">Header</div>
							<div class="card-body">
								<h5 class="card-title">Dark card title</h5>
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card's content.</p>
							</div>
						</div>
					</li>
					<li class="licenseCardList">
						<div class="card border-dark mb-3" style="max-width: 18rem;">
							<div class="card-header">Header</div>
							<div class="card-body">
								<h5 class="card-title">Dark card title</h5>
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card's content.</p>
							</div>
						</div>
					</li>
					<li class="licenseCardList">
						<div class="card border-dark mb-3" style="max-width: 18rem;">
							<div class="card-header">Header</div>
							<div class="card-body">
								<h5 class="card-title">Dark card title</h5>
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card's content.</p>
							</div>
						</div>
					</li>
					<li class="licenseCardList">
						<div class="card border-dark mb-3" style="max-width: 18rem;">
							<div class="card-header">Header</div>
							<div class="card-body">
								<h5 class="card-title">Dark card title</h5>
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card's content.</p>
							</div>
						</div>
					</li>
					<li class="licenseCardList">
						<div class="card border-dark mb-3" style="max-width: 18rem;">
							<div class="card-header">Header</div>
							<div class="card-body">
								<h5 class="card-title">Dark card title</h5>
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card's content.</p>
							</div>
						</div>
					</li>
					<li class="licenseCardList">
						<div class="card border-dark mb-3" style="max-width: 18rem;">
							<div class="card-header">Header</div>
							<div class="card-body">
								<h5 class="card-title">Dark card title</h5>
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card's content.</p>
							</div>
						</div>
					</li>
					<li class="licenseCardList">
						<div class="card border-dark mb-3" style="max-width: 18rem;">
							<div class="card-header">Header</div>
							<div class="card-body">
								<h5 class="card-title">Dark card title</h5>
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card's content.</p>
							</div>
						</div>
					</li>
					<li class="licenseCardList">
						<div class="card border-dark mb-3" style="max-width: 18rem;">
							<div class="card-header">Header</div>
							<div class="card-body">
								<h5 class="card-title">Dark card title</h5>
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card's content.</p>
							</div>
						</div>
					</li>
				</ul>
				<div class="articleBtn">
					<button type="button">이전</button>
					<button type="button">다음</button>
				</div>
			</div>
		</div>
	</div>



	<c:import url="/WEB-INF/views/include/buttom_info.jsp" />

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous"></script>
</body>
</html>