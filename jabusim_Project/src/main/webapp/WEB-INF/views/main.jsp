<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JaBuSim</title>

<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
<script type="text/javascript">
	var examBeansJson = ${examBeansJson};
</script>
	
<script src="${root }js/calendar.js"></script>
	<!-- Carousel js -->

<script src="${root }js/main_carousel.js"></script>

<script>
  function expandDate(date) {
    date.style.height = date.scrollHeight + 'px';
  }

  function collapseDate(date) {
    date.style.height = 'auto';
  }
  
  $(document).ready(function() {
	    $('.license-card').hover(function() {
	        // 마우스 오버 시
	        var newContent = $(this).data('hover-text');
	        $(this).find('.main-card-text').text(newContent);
	    }, function() {
	        // 마우스 아웃 시
	        var originalContent = $(this).data('original-text');
	        $(this).find('.main-card-text').text(originalContent);
	    });
	});
</script>

<link rel="stylesheet" href="${root }css/main_section.css" />
</head>
<body>
	
	


	<!-- 상단 메뉴 바 -->
	<c:import url="/WEB-INF/views/include/top_menu.jsp"/>

	<!-- Main Page Start -->
	<div class="main-wrapped">
		<div class="main-container">

			<div class="main-left-section">

				<!-- Calendar section start -->
				<div class="main-calendar-section">
					<div class="year-and-month">
						<div class="calendar-title">
							<button type="button" onClick="preCalendar();">&lt;</button>
							<span id="calendarDate"></span>
							<button type="button" onClick="proCalendar();">&gt;</button>
						</div>
					</div>
					<div class="calendar">
						<div class="day-of-the-week">
							<span style="color:red;">&nbsp;일</span>
							<span>&nbsp;월</span>
							<span>&nbsp;화</span>
							<span>&nbsp;수</span>
							<span>&nbsp;목</span>
							<span>&nbsp;금</span>
							<span style="color:blue;">&nbsp;토</span>
						</div>
						<div class="calendar-body"></div>
					</div>
				</div> <!-- Calendar section start -->

			</div>

			<div class="main-right-section">
				<!-- Carousel section start -->
				<div class="main-carousel-section">
					<div class="main-carousel-wrapped">
						<div class="main-carousel">
							<div class="carousel-item image-section">
								<img src="${root }image/caruosel1.jpg" />
							</div>
							<div class="carousel-item image-section">
								<img src="${root }image/caruosel2.jpg" />
							</div>
							<div class="carousel-item image-section">
								<img src="${root }image/caruosel3.jpg" />
							</div>
						</div>
					</div>
					<div class="carousel-btn-wrapped">
						<button class="carousel-btn carousel-btn-prev" onclick="prevSlide()">&lt;</button>
						<button class="carousel-btn carousel-btn-next" onclick="nextSlide()">&gt;</button>
					</div>
						<div class="carousel-indicators" id="carouselIndicators">
						<div class="carousel-indicator" onclick="currentSlide(0)"></div>
						<div class="carousel-indicator" onclick="currentSlide(1)"></div>
						<div class="carousel-indicator" onclick="currentSlide(2)"></div>
					</div>
				</div> <!-- Carousel section end -->

				<!-- Notice contents section start -->
				<div class="notice-section">
					<div class="notice-title">
						<span class="notice-name">공지사항</span> 
						<span class="notice-btn"><a href="${root }board/main">더보기 +</a></span>
					</div>
					
					<div class="notice-list-section">
						<ul class="main-notice-list">
							<li class="main-notice-item">
								<a href='${root }board/read'>
									<span>2023.12.15</span>
									<span>2023년 기술사 제131회 면접시험 최종합격자...</span>
								</a>
							</li>
							<li class="main-notice-item">
								<a href='${root }board/read'>
									<span>2023.12.14</span>
									<span>전기기능장 수험자 지참준비물 및 유의사항 확...</span>
								</a>
							</li>
							<li class="main-notice-item">
								<a href='${root }board/read'>
									<span>2023.12.12</span>
									<span>2024년도 조리기능사 실기시험 안내(첨부자료...</span>
								</a>
							</li>
							<li class="main-notice-item">
								<a href='${root }board/read'>
									<span>2023.12.12</span>
									<span>2023년도 정기 기능사 제3회 필기시험 최종결...</span>
								</a>
							</li>
							<li class="main-notice-item">
								<a href='${root }board/read'>
									<span>2023.12.12</span>
									<span>KS 기계제도 규격(Data Book) 안내(첨부자료 ...</span>
								</a>
							</li>
						</ul>
					</div>
				</div> <!-- Notice contents section end -->
			</div>
		</div>

		<!-- down-side section start -->
		<div class="down-side-section">
			<div class="card-list">
				<c:forEach items="${licenseBeans}" var="licenseBean">
					<div class="license-card" onclick="location.href='${root}info/main?licenseID=${licenseBean.license_idx}'" style="transition: transform 0.3s ease-in-out;" data-original-text="마우스를 올리면 상세내용이 뜹니다."
					data-hover-text= "${licenseBean.license_info}">
						<div class="main-card-header">${licenseBean.license_name}</div>
						<div class="main-card-body">
							<p class="main-card-title">${licenseBean.license_mainCategory}</p>
							<p class="main-card-text">마우스를 올리면 상세내용이 뜹니다.</p>
						</div>
					</div>
				</c:forEach>

			</div>
		</div> <!-- down-side section start -->
	</div>
	<!-- 하단 푸터 -->
	<c:import url="/WEB-INF/views/include/buttom_info.jsp" />

</body>
</html>