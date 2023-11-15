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
	let nowDay = new Date();
	let nowYear = nowDay.getFullYear(); // 년도  
	let nowMonth = nowDay.getMonth() + 1; // 월   0~11
	let nowDate = nowDay.getDate(); // 일   0~31
	let nowWeek = nowDay.getDay(); // 요일   0(일)~6(토)
	
	//Date()
	
	//이번달 1일
	let firstDate = new Date(nowYear, nowMonth, 1);
	
	//이번달 마지막날
	let lastDate = new Date(nowYear, nowMonth+1, 0);
	

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
	#top_module .left_div{
		
		
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


<c:import url="/WEB-INF/views/include/top_menu.jsp"/>

		<%-- 
<div class="container text-center">
  <div class="row">
    <div class="col-md-4">
      <div class="card" >
  <img src="${root }image/image1.jpg" class="card-img-top" alt="이미지 1">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
    </div>
    
    
    <div class="col-md-4">      
<div class="card" >
  <img src="${root }image/image1.jpg" class="card-img-top" alt="이미지 1">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
    </div>
    
    <div class="col-md-4">    
     <div class="card" >
  <img src="${root }image/image1.jpg" class="card-img-top" alt="이미지 1">
  <div class="card-body">
    <h5 class="card-title"></h5>
    <p class="card-text"></p>
    <a href="#" class="btn btn-primary">접수하기</a>
  </div>
</div>

    </div>
  </div>
</div>


<!-- ================================== -->

<div class="container text-center">
  <div class="row">
    <div class="col-md-6">
      <div class="card" >
  <img src="${root }image/image1.jpg" class="card-img-top" alt="이미지 1">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
    </div>
    
    
    <div class="col-md-6">      
<div class="card" >
  <img src="${root }image/image1.jpg" class="card-img-top" alt="이미지 1">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
    </div>
    
    

  </div>
</div>
 --%>

		<!-- 
<form class="d-flex" style="width:650px; height:65px; margin:0 auto; border: 1px solid black;">
	<input type="text" class="form-control me-2" style=" outline:none">
	<button type="submit" class="btn btn-primary">Search</button>
</form> 
			
			-->



	<div class="pageContainer">
		<div class="module" id="top_module">
			<div class="article">
				<div class="left_div">
					<div id="carouselExampleInterval" class="carousel slide"
						data-bs-ride="carousel">
						<div class="carousel-inner">
							<div class="carousel-item active" data-bs-interval="10000">
								<img src="${root }image/icon-spring-framework.svg" class="d-block w-100" alt="...">
							</div>
							<div class="carousel-item" data-bs-interval="2000">
								<img src="${root }image/icon-spring-framework.svg" class="d-block w-100" alt="...">
							</div>
							<div class="carousel-item">
								<img src="${root }image/icon-spring-framework.svg" class="d-block w-100" alt="...">
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
							<button type="button">&lt;</button>
							<span>2023.11</span>
							<button type="button">&gt;</button>
						</div>
						<div class="calendar">
							<table style="width: 100%;">
								<thead>
									<tr style="border-bottom: 1px solid red;">
										<td>일</td>
										<td>월</td>
										<td>화</td>
										<td>수</td>
										<td>목</td>
										<td>금</td>
										<td>토</td>
									</tr>
								</thead>
								<tbody>

								</tbody>
							</table>
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