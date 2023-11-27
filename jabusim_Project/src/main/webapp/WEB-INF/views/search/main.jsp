<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자격증 검색</title>
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<!-- AJAX -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	<% request.setCharacterEncoding("UTF-8"); %>
	
	/* 자바스크립트 el태그 변수 */
	var rootContextPath = "<c:out value='${root}'/>";
	
	$(document).ready(function(){
		/* Ajax 셋업!! */
		$.ajaxSetup({
			success:function(result){					
				alert(result);
			},
			error: function (jqXHR) {
                alert("jqXHR status code:"+jqXHR.status+" message:"+jqXHR.responseText);
            }
		});//ajax setup
		
		// 더미데이터 끌고오기
		$.ajax({
		    type: "GET",
		    url: "/jabusim_Project/licenses", // 실제 경로에 맞게 수정하세요.
		    success: function(licenseList){
		        $("#list_area").empty(); // 기존 내용을 비우고 새로 시작합니다.
		        
		        $.each(licenseList, function(i, license){
		        	var num = i+1;

		        	var license_id = license.license_id;
					var type = license.type;
					var type_code = license.type_code;
					var license_name = license.license_name;
					var name_code = license.name_code;
					var div_code = license.div_code;
					var div_name = license.div_name;
					
					//추후 추가
					var dDay = null;
		            var organizer = null;
		            var registrationDate=null;
		            var examDate=null;
		            
		            var link = $('<a></a>').attr('href', rootContextPath + 'info/main/' + license.license_id);
		            
					// ul 생성
			    	var list = $('<ul>', { class: 'list-item' });

			    	// 첫 번째 줄: D-Day
			    	var dDayLi = $('<li>', { class: 'd-day-container' });
			    	dDayLi.append($('<span>', { class: 'd-day-class', text: dDay ? dDay : 'N/A' }));
			    	list.append(dDayLi);

			    	// 두 번째 줄: 자격증 이름, 주최
			    	var certificateOrganizerLi = $('<li>', { class: 'info-container' });
			    	certificateOrganizerLi.append($('<span>', { class: 'certificate-name-class', text: license_name }));
			    	certificateOrganizerLi.append($('<span>', { class: 'organizer-class', text: organizer ? organizer : 'N/A' }));
			    	list.append(certificateOrganizerLi);

			    	// 세 번째 줄: 접수일, 시험일
			    	var datesLi = $('<li>', { class: 'info-container' });
			    	datesLi.append($('<span>', { class: 'registration-date-class', text: registrationDate ? registrationDate : 'N/A' }));
			    	datesLi.append($('<span>', { class: 'exam-date-class', text: examDate ? examDate : 'N/A' }));
			    	list.append(datesLi);
			    	
			    	link.append(list);

			    	// list를 list_area에 추가
			    	$('#list_area').append(link);
			    });
					
				
		    },
		    error: function(jqXHR){
		        alert("Error: " + jqXHR.status);
		    }
		});
		
		//검색ajax
		 $("#searchButton").click(function() {
		        var query = $("#searchInput").val(); // 검색어 가져오기
		        $.ajax({
		            url: '/jabusim_Project/searchLicenseName',
		            data: { query: query },
		            success: function(licenseList) {
		                $("#list_area").empty(); // 기존 내용을 비우고 새로 시작합니다.

		                $.each(licenseList, function(i, license) {
		                    var link = $('<a></a>').attr('href', 'info/main/' + license.license_id); // 링크 설정

		                    var list = $('<ul>', { class: 'list-item' });

		                    // D-Day, 주최 등 추가 정보는 구현에 따라 변경해야 할 수 있음
		                    var dDay = license.dDay || 'N/A';
		                    var organizer = license.organizer || 'N/A';
		                    var registrationDate = license.registrationDate || 'N/A';
		                    var examDate = license.examDate || 'N/A';

		                    // 각 줄에 대한 정보 추가
		                    list.append($('<li>', { class: 'd-day-container' }).append($('<span>', { class: 'd-day-class', text: dDay })));
		                    list.append($('<li>', { class: 'info-container' })
		                        .append($('<span>', { class: 'certificate-name-class', text: license.license_name }))
		                        .append($('<span>', { class: 'organizer-class', text: organizer })));
		                    list.append($('<li>', { class: 'info-container' })
		                        .append($('<span>', { class: 'registration-date-class', text: registrationDate }))
		                        .append($('<span>', { class: 'exam-date-class', text: examDate })));

		                    link.append(list);
		                    $('#list_area').append(link); // list를 list_area에 추가
		                });
		            },
		            error: function(error) {
		                console.error("Error: ", error);
		            }
		        });
		    });
		
	}); //document ready
	
</script>

<style>
ul, li {
	list-style-type: none;
	list-style: none;
	padding: 0;
	margin: 0;
}
a, a:hover {
    color: inherit;
    text-decoration: none;
}

.pageContainer {
	position: relative;
	width: 1250px;
	min-height: 700px;
	margin: 0 auto;
	padding-top: 80px;
	border: 1px solid red;
}

.top_module {
	min-height: 600px;
	width: 100%;
	border: 1px solid blue;
	padding-top: 50px;
	padding-bottom: 50px;
	margin-bottom: 50px;
}

.top_module_inner {
	width: 94%;
	margin: 0 auto;
	padding-top: 10px;
	padding-bottom: 10px;
}

.list_serch {
	width: 100%;
	margin: 0 auto;
	text-align: center;
}

.list_serch_preview {
}

.list_serch_preview>ul {
	border-right: 1px solid #ddd;
	width: 33%;
}

.list_serch_preview ul li {
  color: #495057; /* 폰트 색상 */
}

.list_serch_preview ul li:hover {
  background-color: #e9ecef; /* 호버 배경색 */
}

/* 바텀모듈 */
.bottom_module {
	min-height: 600px;
	width: 100%;
	border: 1px solid blue;
	text-align: center;
	padding-top: 50px;
	padding-bottom: 50px;
}

.bottom_module_inner {
	width: 94%;
	margin: 0 auto;
	padding-top: 10px;
	padding-bottom: 10px;
}

.list-item {
	list-style-type: none; /* 기본 리스트 스타일 제거 */
	padding-left: 0; /* 기본 패딩 제거 */
	border: 1px solid #ddd;
	margin-bottom: 10px;
}

.list-item>li {
	margin-bottom: 5px;
	padding: 5px;
	display: table;
}

.d-day-class {
	padding: 5px;
	margin-right: 10px;
}

.certificate-name-class, .organizer-class, .registration-date-class,
	.exam-date-class {
	padding: 5px;
	margin-right: 10px;
}

/* 각 클래스 별 배경색 */
.certificate-name-class {
	background-color: #d1ecf1;
}

.organizer-class {
	background-color: #fff3cd;
}

.registration-date-class {
	background-color: #cce5ff;
}

.exam-date-class {
	background-color: #f5c6cb;
}
</style>


</head>
<body>

	<c:import url="/WEB-INF/views/include/top_menu.jsp" />
	<div class="pageContainer">

		<section id="top_module" class="top_module">
			<article id="top_module_inner"
				class="top_module_inner d-flex flex-column">
				<!-- #1 제목 -->
				<h1 class="">자격증 정보 검색</h1>

				<!-- #2 검색 컨테이너 -->
				<div class="search_container">
					<!-- #1 -->
					<div class="text_search d-flex">
						<div class="search_box col-4">
							<input type="text" id="searchInput" class="form-control" placeholder="자격증 검색">
						</div>
						<button class="btn btn-primary col-1 ms-2" id="searchButton" type="button">검색</button>
					</div>

					<!-- #2 -->
					<div class="list_serch">
						<div class="list_serch_contents">
							<ul class="d-flex flex-row">
								<li class="flex-fill"><button
										class="btn btn-secondary d-block w-100" data-target="content1">1</button></li>
								<li class="flex-fill"><button
										class="btn btn-secondary d-block w-100" data-target="content2">2</button></li>
								<li class="flex-fill"><button
										class="btn btn-secondary d-block w-100" data-target="content3">3</button></li>
							</ul>
						</div>
						<div class="list_serch_preview d-flex flex-row">
							<ul id="content1" class="card flex-fill">
								<!-- 초기 내용 -->
							</ul>
							<ul id="content2" class="card flex-fill">
								<!-- 초기 내용 -->
							</ul>
							<ul id="content3" class="card flex-fill">
								<!-- 초기 내용 -->
							</ul>
						</div>
					</div>

				</div>


			</article>
		</section>


		<!-- bottom module -->
		<div id="bottom_module" class="bottom_module">
			<div id="bottom_module_inner" class="bottom_module_inner">
				<div id="list_area" class="list_area">
					<!-- 리스트 항목들이 여기에 추가됩니다 -->
				</div>

				<nav aria-label="페이지 네비게이션">
					<ul class="pagination justify-content-center" id="pagination">
						<!-- 페이지네이션 버튼들이 여기에 추가됩니다 -->
					</ul>
				</nav>
			</div>
		</div>
	</div>

	<c:import url="/WEB-INF/views/include/buttom_info.jsp" />

	<script>
    	/* 탑 모듈 */
    	const contents = {
		    content1: ["항목 1-1", "항목 1-2", "항목 1-3"],
		    content2: ["항목 2-1", "항목 2-2"],
		    content3: ["항목 3-1"]
		  };

		let lastClicked = null;

		function updatePreview(targetId) {
		  const targetUl = $('#' + targetId); // 현재 대상이 되는 <ul> 요소

		  if (lastClicked === targetId) {
		    // 동일한 버튼을 다시 클릭한 경우
		    targetUl.empty(); // 해당 <ul> 요소의 내용만 비움
		    lastClicked = null;
		  } else {
		    // 다른 버튼을 클릭한 경우
		    $('.list_serch_preview ul').empty(); // 모든 <ul> 요소의 내용을 비움
		    let newContent = '';
		    contents[targetId].forEach(item => {
		      newContent += '<li class="d-block w-100">' + item + '</li>';
		    });

		    targetUl.html(newContent); // 새로운 내용으로 업데이트
		    lastClicked = targetId;
		  }
		}

		$('.list_serch_contents .btn').each(function() {
		  $(this).on('click', function() {
		    const targetContent = $(this).data('target');
		    updatePreview(targetContent);
		  });
		});
    	
    	
    	
	</script>

</body>
</html>