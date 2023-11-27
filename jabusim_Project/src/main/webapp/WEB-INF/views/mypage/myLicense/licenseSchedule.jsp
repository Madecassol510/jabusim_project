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
		
		
		document.getElementById("calendarDate").textContent = nowYear + "." + (nowMonth+1);
		
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
		min-height : 600px;
		display: inline-block;
		
	}
	
	#top_module .left_div{
		border : 1px solid red;
		display:inline-block;
		width : 600px;
		height : 600px;
		float: left;
	}
	
	#top_module .right_div{
		display:inline-block;
		border : 1px solid red;
		width : 530px;
		height : 100%;
		float: right;
		text-align: center
	}
	
	/* 달력 */
	
	#top_module .schedule{
		border: 1px solid black;
		width : 100%;
		height :100%;
		/* margin-right: 60px; */
	}
		
	#top_module .schedule .hd{
		display : inline-block;
		align: center;
		width : 100%;
		margin : auto;
		justify-content :space-between;
		height : 15%;
		padding-top: 20px;
		padding-bottom: 5px;
		
	}
		
	#top_module .schedule .calendar{
		width : 100%;
		height: 85%;
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
	
	#top_module .calendar .chead{
		display:grid;
		grid-template-columns:repeat(7, 1fr);
		border-bottom: 1px solid red; 
		width:100%; 
		height:10%;
	
	}
	
	#top_module .calendar .chead span{
		padding-top: 7px;
	}
	
	#top_module .calendar .cbody{
		display:grid;
		grid-template-columns:repeat(7, 1fr);
		grid-template-rows : repeat(6, 1fr);
		width:100%;
		height:90%;
	}
	
	
	#top_module .calendar .date{	
		border: 1px solid red;
	}
	
	
	
	/* =========================================================================== */
	/*스케줄리스트*/
	#top_module .scheduleList{
		border: 1px solid black;
		width : 100%;
		min-height : 180px;
		display: inline-block;
	}
	
	
	
</style>
	

</head>
<body>



	<c:import url="/WEB-INF/views/include/top_menu.jsp" />
	<c:import url="/WEB-INF/views/include/mypage_sideMenu.jsp" />

	<div class="pageContainer">
		<div class="module" id="top_module">
			<div class="article">
				<div class="left_div">
					<div class="schedule">
						<div class="hd">
							<button type="button" onClick="preCalendar();">&lt;</button>
							<span id="calendarDate"></span>
							<button type="button" onClick="proCalendar();">&gt;</button>
						</div>
						<div class="calendar">
							<div class="chead">
								<span>일</span>
								<span>월</span>
								<span>화</span>
								<span>수</span>
								<span>목</span>
								<span>금</span>
								<span>토</span>
							</div>
							<div class="cbody">
								
							</div>
						</div>
					</div>
				</div>
				<div class="right_div">			
					<div class="scheduleList">
						<h3>날짜별 자격증일정</h3>
						<div>
							원서접수/ 시험일/ 합격자발표일
						</div>
						<div class="scheduleModule">
							<div class="scheduleDate">
								2023-07-01
							</div>
							<div class="scheduleLicense" style="width:100%; height:120px; border:1px solid green;">	
							</div>
						</div>
						<div class="scheduleModule">
							<div class="scheduleDate">
								2023-07-01
							</div>
							<div class="scheduleLicense" style="width:100%; height:120px; border:1px solid green;">	
							</div>
						</div>
						<div class="scheduleModule">
							<div class="scheduleDate">
								2023-07-01
							</div>
							<div class="scheduleLicense" style="width:100%; height:120px; border:1px solid green;">	
							</div>
						</div>
						<div class="scheduleModule">
							<div class="scheduleDate">
								2023-07-01
							</div>
							<div class="scheduleLicense" style="width:100%; height:120px; border:1px solid green;">	
							</div>
							<div class="scheduleModule">
							<div class="scheduleDate">
								2023-07-01
							</div>
							<div class="scheduleLicense" style="width:100%; height:120px; border:1px solid green;">	
							</div>
						</div>
						<div class="scheduleModule">
							<div class="scheduleDate">
								2023-07-01
							</div>
							<div class="scheduleLicense" style="width:100%; height:120px; border:1px solid green;">	
							</div>
						</div>
						<div class="scheduleModule">
							<div class="scheduleDate">
								2023-07-01
							</div>
							<div class="scheduleLicense" style="width:100%; height:120px; border:1px solid green;">	
							</div>
						</div>
						</div>
					</div>
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