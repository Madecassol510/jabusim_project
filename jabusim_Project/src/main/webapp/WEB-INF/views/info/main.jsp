<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>자격증 정보 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>
.sidebar-styling {
	width: 100px;
	position: fixed;
	top: 30%;
	right: 150px;
	height: 18%;
	background-color: transparent;
	border-left: 1px solid grey;
}

.sidebar-styling ul {
	list-style-type: none;
	padding: 0;
	margin: 0;
}

.sidebar-btn {
	display: block;
	width: 100%;
	padding: 10px;
	border: none;
	background-color: transparent;
	color: grey;
	text-align: left;
	transition: color 0.3s, background-color 0.3s;
	cursor: pointer;
}

.sidebar-btn.active, .sidebar-btn:hover {
	color: black;
	background-color: rgba(255, 255, 255, 0.1);
}

.navbar {
	position: fixed;
	top: 0;
	right: 0;
	left: 0;
	z-index: 1030;
}

.container-box {
	position: relative;
	width: 1250px;
	min-height: 700px;
	margin: 0 auto;
	border: 1px solid blue;
	box-shadow: 0 .5rem 1rem rgba(0,0,0,.15)!important;
	border-radius: 10px;
}

.card {
	width: 1000px;
	min-height: 230px;
	margin-bottom: 1rem;
	border-radius: 10px;
	border:1px solid #A4A4A4;
}

.card-body {
	border-radius: 10px;
	
}

#fbanner-section {
	height: 270px;
}

#fbanner-section h1 {
	font-weight: 700;
	color: #fff;
	padding-top: 79px;
	font-size: 40px;
}

#건설 {
	background-image: url('${root}image/licenseImage/건설.jpg');
	background-size: 1000px 295px;
	background-position: center;
}

#경영\.회계\.사무 {
	background-image: url('${root}image/licenseImage/경영.회계.사무.jpg');
	background-size: 1000px 295px;
	background-position: center;
}

#교육\.자연\.과학\.사회과학 {
	background-image: url('${root}image/licenseImage/교육.자연.과학.사회과학.jpg');
	background-size: 1000px 295px;
	background-position: center;
}

#기계 {
	background-image: url('${root}image/licenseImage/기계.jpg');
	background-size: 1000px 295px;
	background-position: center;
}

#농림어업 {
	background-image: url('${root}image/licenseImage/농림어업.jpg');
	background-size: 1000px 295px;
	background-position: center;
}

#문화\.예술\.디자인\.방송 {
	background-image: url('${root}image/licenseImage/문화.예술.디자인.방송.jpg');
	background-size: 1000px 295px;
	background-position: center;
}

#보건\.의료 {
	background-image: url('${root}image/licenseImage/보건.의료.jpg');
	background-size: 1000px 295px;
	background-position: center;
}

#사회복지\.종교 {
	background-image: url('${root}image/licenseImage/사회복지.종교.jpg');
	background-size: 1000px 295px;
	background-position: center;
}

#식품\.가공 {
	background-image: url('${root}image/licenseImage/식품.가공.jpg');
	background-size: 1000px 295px;
	background-position: center;
}

#안전관리 {
	background-image: url('${root}image/licenseImage/안전관리.jpg');
	background-size: 1000px 295px;
	background-position: center;
}

#영업\.판매 {
	background-image: url('${root}image/licenseImage/영업.판매.jpg');
	background-size: 1000px 295px;
	background-position: center;
}

#운전\.운송 {
	background-image: url('${root}image/licenseImage/운전.운송.jpg');
	background-size: 1000px 295px;
	background-position: center;
}

#음식서비스 {
	background-image: url('${root}image/licenseImage/음식서비스.jpg');
	background-size: 1000px 295px;
	background-position: center;
}

#인쇄\.목재\.가구\.공예 {
	background-image: url('${root}image/licenseImage/인쇄.목재.가구.공예.jpg');
	background-size: 1000px 295px;
	background-position: center;
}

#재료 {
	background-image: url('${root}image/licenseImage/재료.jpg');
	background-size: 1000px 295px;
	background-position: center;
}

#전기\.전자 {
	background-image: url('${root}image/licenseImage/전기.전자.jpg');
	background-size: 1000px 295px;
	background-position: center;
}

#정보통신 {
	background-image: url('${root}image/licenseImage/정보통신.jpg');
	background-size: 1000px 295px;
	background-position: center;
}

#화학 {
	background-image: url('${root}image/licenseImage/화학.jpg');
	background-size: 1000px 295px;
	background-position: center;
}

#환경\.에너지 {
	background-image: url('${root}image/licenseImage/환경.에너지.jpg');
	background-size: 1000px 295px;
	background-position: center;
}

/* =================================================================== */
#섬유\.의복 {
	background-color: gray;
}

#광업자원 {
	background-color: gray;
}

#이용\.숙박\.여행\.오락\.스포츠 {
	background-color: gray;
}

.licenseContext{
	margin-top:10px;
	padding: 0 20px;
	font-family: monospace;
}

#examSchedule{
	width: 100%;
	text-align: center;
}

.imgDiv{
	text-align: center;
}

.card-title{
	font-family: Arial;
	font-size: 23px;
	font-weight: 600;
	margin-bottom: 17px;
}

th{
	background-color: rgb(241,238,245);
}

th, td {
	border: 1px solid #dadada!important;
	padding: 5px;
}

</style>

<%
    // Java 코드로 현재 날짜와 시간을 구합니다.
    java.util.Date currentDate = new java.util.Date();
%>

<script type="text/javascript">
	var examPassingJson = ${examPassingJson != null ? examPassingJson : 'null'};

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
</head>
<body>

	<c:import url="/WEB-INF/views/include/top_menu.jsp" />

	<!-- 사이드바 -->
	<div class="sidebar-styling">
		<ul>
			<li><button class="sidebar-btn" data-bs-target="#banner-section">배너</button></li>
			<li><button class="sidebar-btn" data-bs-target="#info-section">정보</button></li>
			<li><button class="sidebar-btn"
					data-bs-target="#passrate-section">합격률</button></li>
		</ul>
	</div>

	<div class="container-box mx-auto my-5">
		<div id="fbanner-section" class="card mx-auto my-5">
			<div class="card-body text-center"
				id="${infoLicenseBean.getLicense_mainCategory()}">
				<h1 class="card-title mt-3">${infoLicenseBean.getLicense_name()}</h1>
			</div>
		</div>
		<div id="info-section" class="card mx-auto my-5">
			<div class="card-body">
				<h2 class="card-title">자격증 정보</h2>
				<div class="licenseContext">
					<c:choose>
						<c:when	test="${infoLicenseBean.getLicense_info()=='자격증에 대한 정보가 현재 없습니다.'}">
							<div class="imgDiv">
								<img src="${root}image/dataNothing.png" />
							</div>							
						</c:when>
						<c:otherwise>
							<p class="card-text">${infoLicenseBean.getLicense_info()}</p>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
			
		<div id="passrate-section" class="card mx-auto my-5">
			<div class="card-body">
				<h2 class="card-title">시험 합격률</h2>
				<div class="licenseContext">
					<c:choose>
						<c:when test="${empty examPassingJson}">
							<div class="imgDiv">
								<img src="${root}image/dataNothing.png" />
							</div>	
						</c:when>
						<c:otherwise>
							<canvas id="passRateChart"></canvas>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>	
		
		<div id="exam-section" class="card mx-auto my-5">
			<div class="card-body">
				<h2 class="card-title">시험 일정</h2>
				<div class="licenseContext">
					<table id="examSchedule">
						<thead>
							<tr>
								<th>시험명</th>
								<th>구분</th>
								<th>접수시간</th>
								<th>시험일</th>
								<th>결과발표일</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty infoExamBeanList}">
									<div>헤헤 없당</div>
								</c:when>
								<c:otherwise>
									<c:forEach items="${infoExamBeanList}" var="infoExamBean">
										<c:if test="${infoExamBean.exam_status!='시험마감'}">
											<tr>
												<td>${infoExamBean.exam_name}</td>
												<td>${infoExamBean.exam_type}</td>
												<td>${infoExamBean.exam_receiptStartDate} ~
													${infoExamBean.exam_receiptEndDate}</td>
												<td>${infoExamBean.exam_date}</td>
												<td>${infoExamBean.exam_resultDate}</td>
												<td>${infoExamBean.exam_status}</td>
											</tr>
										</c:if>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script>  
	    if (examPassingJson != null) {
	    	
	    	var exam2018_1 = examPassingJson.etyprate;
	    	var exam2019_1 = examPassingJson.ntyprate;
	    	var exam2020_1 = examPassingJson.twyprate;
	    	var exam2021_1 = examPassingJson.toyprate;
	    	var exam2022_1 = examPassingJson.ttyprate;
	    	
	    	var exam2018_2 = examPassingJson.etysrate;
	    	var exam2019_2 = examPassingJson.ntysrate;
	    	var exam2020_2 = examPassingJson.twysrate;
	    	var exam2021_2 = examPassingJson.toysrate;
	    	var exam2022_2 = examPassingJson.ttysrate;
	    	
  	
	        const ctx = document.getElementById('passRateChart').getContext('2d');
	        const passRateChart = new Chart(ctx, {
	            type: 'bar',
	            data: {
	                labels: ['2018년', '2019년', '2020년', '2021년', '2022년'],
	                datasets: [{
	                    label: '필기',
	                    data: [exam2018_1, exam2019_1, exam2020_1, exam2021_1, exam2022_1],
	                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
	                    borderColor: 'rgba(54, 162, 235, 1)',
	                    borderWidth: 1
	                }, {
	                    label: '실기',
	                    data: [exam2018_2, exam2019_2, exam2020_2, exam2021_2, exam2022_2],
	                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
	                    borderColor: 'rgba(255, 99, 132, 1)',
	                    borderWidth: 1
	                }]
	            },
	            options: {
	                scales: {
	                    x: {
	                        barPercentage: 0.4,
	                        categoryPercentage: 0.8
	                    },
	                    y: {
	                        beginAtZero: true,
	                        max: 100 
	                    }
	                },
	                plugins: {
	                    legend: {
	                        position: 'top',
	                    }
	                }
	            }
	        });
	    } else {
	        console.log("infoExamPassingBean is null. Chart will not be rendered.");
	    }

        document.querySelectorAll('.sidebar-btn').forEach(item => {
            item.addEventListener('click', event => {
                event.preventDefault();
                const section = document.querySelector(item.getAttribute('data-bs-target'));
                section.scrollIntoView({ behavior: 'smooth' });
            });
        });

        window.addEventListener('scroll', function() {
            var scrollPosition = window.scrollY || document.documentElement.scrollTop;

            document.querySelectorAll('.container-box > div[id]').forEach(function(section) {
                if (section.offsetTop <= scrollPosition && (section.offsetTop + section.offsetHeight) > scrollPosition) {
                    document.querySelectorAll('.sidebar-btn').forEach(function(btn) {
                        btn.classList.remove('active');
                        if (section.getAttribute('id') === btn.getAttribute('data-bs-target').substring(1)) {
                            btn.classList.add('active');
                        }
                    });
                }
            });
        });
    </script>

	<c:import url="/WEB-INF/views/include/buttom_info.jsp" />
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
</body>
</html>