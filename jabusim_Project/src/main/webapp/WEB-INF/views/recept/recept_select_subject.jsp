<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>접수</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<!-- 외부 css파일 -->
<link rel="stylesheet" href="${root}css/testTpdyd.css" />
<link rel="stylesheet" href="${root}css/receptCSS/recept_select_subject.css" />
<!-- 외부 js파일 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
	<%request.setCharacterEncoding("UTF-8");%>
	
	/* 자바스크립트 el태그 변수 */
	var rootContextPath = "<c:out value='${root}'/>";
	
	$(document).ready(async function(){
		/* Ajax 셋업!! */
		$.ajaxSetup({
			success:function(result){					
				alert(result);
			},
			error: function (jqXHR) {
                alert("jqXHR status code:"+jqXHR.status+" message:"+jqXHR.responseText);
            }
		});//ajax setup
		
		
	});
	
</script>


</head>
<body>


	<c:import url="/WEB-INF/views/include/top_menu.jsp" />

	<div class="pageContainer">
	
			<ul class="list-group list-group-horizontal step-indicator">
				<li class="list-group-item text-center step"><span
					class="badge bg-primary">1. 시험선택</span></li>
				<li class="list-group-item text-center step active"><span
					class="badge bg-primary">2. 종목선택</span></li>
				<li class="list-group-item text-center step"><span
					class="badge bg-secondary">3. 시험장소 선택</span></li>
			</ul>

		<section id="top_module" class="top_module">
			
			<article id="test_module_inner" class="test_module_inner row">
				
				<h3>자격증 검색</h3>
				
				<div class="text_search d-flex">
					<div class="search_box col-4">
						<input type="text" id="searchInput" class="form-control"
							placeholder="자격증 검색">
					</div>
					<button class="btn btn-primary col-1 ms-2" id="searchButton"
						type="button">검색</button>
				</div>
				
				<h3>분야 선택</h3>
				
				<div class="col-md-3">
					<label for="regionSelect" class="form-label">대분야 선택</label> <select
						class="form-select" id="regionSelect">
						<option selected disabled value="">대분야를 선택하세요</option>
						<option value="seoul">경영.회계.사무</option>
						<option value="all">전체</option>
					</select>
				</div>

				<div class="col-md-3">
					<label for="districtSelect" class="form-label">소분야 선택</label> <select
						class="form-select" id="districtSelect" disabled>
						<option selected disabled value="">소분야를 선택하세요</option>
						<!-- 서울의 구 옵션들은 JavaScript에서 추가됩니다 -->
					</select>
				</div>

				<div class="col-md-3">
					<button class="col-md-3" style='height: 38px'>조회</button>
				</div>
			</article>


			<article id="top_module_inner"
				class="top_module_inner d-flex flex-column">


				<h3>응시종목 선택</h3>


				<table class="table table-striped">
					<thead>
						<tr>
							<th>NO</th>
							<th>응시종목</th>
							<th>구분</th>
							<th>계열</th>
							<th>대분야</th>
							<th>세부분야</th>
							<th>접수</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td>1</td>
							<td>정보처리기사</td>
							<td>필기</td>
							<td>기사</td>
							<td>기계</td>
							<td>기계장비설비.설치</td>
							<td>
								<form action="${root}recept/selectPlace" method="post">
									<!-- 폼 입력 필드들 -->
									<button type="submit">제출</button>
								</form>
							</td>
						</tr>

						<c:forEach var="data" items="${dataList}">
							<tr>
								<td>${data.examName}</td>
								<td>${data.major}</td>
								<td>${data.category}</td>
								<td>${data.session}</td>
								<td>${data.registrationStart}</td>
								<td>
									<form action="${root}recept/selectPlace" method="post">
										<!-- 폼 입력 필드들 -->
										<button type="submit">선택</button>
									</form>
								</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>


			</article>

		</section>

	</div>
	<!-- 큰틀 -->


	<c:import url="/WEB-INF/views/include/buttom_info.jsp" />



</body>

<script type="text/javascript" src="${root}js/receptJS/recept_select_subject.js"></script>
</html>