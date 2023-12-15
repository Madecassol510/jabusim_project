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
<link rel="stylesheet" href="${root}css/testTpdyd.css?ver=4" />
<link rel="stylesheet" href="${root}css/receiptCSS/main.css?ver=4" />
<!-- 외부 js파일 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="${root}js/codeMapping.js"></script>

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
		/*
		$('.page-link').on('click', function(e) {
	        e.preventDefault(); // 기본 이벤트 방지
	        var pageNumber = $(this).data('page');
	        loadPage(pageNumber);
	    });
		*/
		
		$('#pagingSection .page-link').on('click', function(e) {
	        e.preventDefault(); // 기본 링크 동작 중단

	        var pageNumber = $(this).data('page'); // 페이지 번호를 가져옴
	        loadPage(pageNumber); // AJAX 함수 호출
	    });
	});
	
</script>


</head>
<body>


	<c:import url="/WEB-INF/views/include/top_menu.jsp" />

	<div class="pageContainer">
	
		<section id="top_module" class="top_module">
			<article id="top_module_inner" class="top_module_inner">
				<ul class="list-group list-group-horizontal step-indicator">
				    <li class="list-group-item text-center step">
				        <span class="badge bg-primary">1. 시험 선택</span>
				    </li>
				    <li class="list-group-item text-center step">
				        <span class="badge bg-secondary">2. 종목 선택</span>
				    </li>
				    <li class="list-group-item text-center step">
				        <span class="badge bg-secondary">3. 시험장소 선택</span>
				    </li>
				</ul>
			</article>
		</section>

		<section id="bottom_module" class="bottom_module">
			<article id="bottom_module_inner" class="bottom_module_inner">
				<article id="search_module" class="search_module row">
					
					<h3>자격증 검색</h3>
					
					<div class="text_search d-flex">
						<div class="search_box col-4">
							<input type="text" id="searchInput" class="form-control"
								placeholder="자격증 검색">
						</div>
						<button class="btn btn-primary col-1 ms-2" id="searchButton" type="button">검색</button>
					</div>
					
					<h3>분야 선택</h3>
					
					<div class="col-md-3">
						<label for="majorSelect" class="form-label">대분야 선택</label> 
						<select class="form-select" id="majorSelect">
							<option selected disabled value="">대분야를 선택하세요</option>
								<option value="전체">-전체보기-</option>
								<c:forEach items="${getMajorCodes}" var="majorCode">
						            <option value="${majorCode}">${majorCode}</option>
						        </c:forEach>
						</select>
					</div>
	
					<div class="col-md-3">
						<label for="minorSelect" class="form-label">소분야 선택</label> 
						<select class="form-select" id="minorSelect" disabled>
							<option selected disabled value="">소분야를 선택하세요</option>
						</select>
					</div>
	
					<div class="col-md-3">
						<button id="optionButton" class="col-md-3" style='height: 38px'>조회</button>
					</div>
				</article>
	
	
				<article id="top_module_inner"
					class="top_module_inner d-flex flex-column">
	
	
					<h3>${sessionScope.examName } ${sessionScope.examType } 응시종목 선택</h3>
	
					<table class="table">
						<thead>
							<tr>
								<th>NO</th>
								<th>응시종목</th>
								<th>대분야</th>
								<th>세부분야</th>
								<th>접수</th>
							</tr>
						</thead>
	
						<tbody>
							<c:forEach items="${getSelectedLicenseType}" var="licenseBean" varStatus="data">
								<tr>
									<td>${data.count +(pageBean.currentPage-1)*10}</td>
			                       <td>${licenseBean.license_name}</td>
			                       <td>${licenseBean.license_mainCategory}</td>
			                       <td>${licenseBean.license_subCategory}</td>
									<td>
										<form action="${root}receipt/selectPlace" method="post">
											<!-- 숨겨진 입력 필드 추가 -->
							               	<input type="hidden" name="licenseName" value="${licenseBean.license_name}" />
											<!-- 폼 입력 필드들 -->
											<button type="submit">선택</button>
										</form>
									</td>
								</tr>
							</c:forEach>
	
						</tbody>
					</table>
					
				<div id="pagingSection" class="d-none d-md-block">
					<ul class="pagination justify-content-center">
						<%-- <c:choose>
							<c:when test="${pageBean.prevPage <= 0 }">
								<li class="page-item disabled">
									<a href="#" class="page-link" data-page="${pageBean.prevPage}">이전</a>
									<a href="#" class="page-link" data-page="${pageBean.prevPage}">이전</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<a href="${root}receipt/receipt_select_subject?licenseType=${sessionScope.licenseType}&page=${pageBean.prevPage}" class="page-link" data-page="${pageBean.prevPage}">이전</a>
									<a href="#" class="page-link" data-page="${pageBean.prevPage}">이전</a>
								</li>
							</c:otherwise>
						</c:choose> --%>
						
						<c:choose>
						    <c:when test="${pageBean.prevPage <= 0 }">
						        <li class="page-item disabled">
						            <a href="#" class="page-link" data-page="${pageBean.prevPage}">이전</a>
						        </li>
						    </c:when>
						    <c:otherwise>
						        <li class="page-item">
						            <a href="#" class="page-link" data-page="${pageBean.prevPage}">이전</a>
						        </li>
						    </c:otherwise>
						</c:choose>
						<%-- 
						<c:forEach var='idx' begin="${pageBean.min }" end="${pageBean.max }">
							<!-- 현재페이지에 대한 부트스트랩 클래스 적용 -->
							<c:choose>
							<c:when test="${idx==pageBean.currentPage }">
								<li class="page-item active">
									<a href="#" class="page-link">${idx }</a>
									<a href="#" class="page-link" data-page="${idx}">${idx}</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<a href="${root }receipt/receipt_select_subject?licenseType=${sessionScope.licenseType}&page=${idx}" class="page-link" data-page="${idx}">${idx }</a>
									<a href="#" class="page-link" data-page="${idx}">${idx}</a>
								</li>
							</c:otherwise>
							</c:choose>
						</c:forEach> --%>
						<c:forEach var='idx' begin="${pageBean.min }" end="${pageBean.max }">
						    <li class="page-item">
						        <a href="#" class="page-link" data-page="${idx}">${idx}</a>
						    </li>
						</c:forEach>
						
						<!-- MAX값이 전체페이지보다 크거나 같으면 비활성화 disabled(부트스트랩)-->
		               <%-- <c:choose>
			               <c:when test="${pageBean.max >= pageBean.pageCnt }">
				               <li class="page-item disabled">
				                  <a href="#" class="page-link" data-page="${pageBean.nextPage}">다음</a>
				                  <a href="#" class="page-link" data-page="${pageBean.nextPage}">다음</a>
				               </li>
			               </c:when>
			               <c:otherwise>
				               <li class="page-item">
				               		<a href="${root}receipt/receipt_select_subject?licenseType=${sessionScope.licenseType}&page=${pageBean.nextPage}" class="page-link" data-page="${pageBean.nextPage}">다음</a>
				               		<a href="#" class="page-link" data-page="${pageBean.nextPage}">다음</a>
				               </li>
			               </c:otherwise>
		               </c:choose> --%>
						<c:choose>
						    <c:when test="${pageBean.max >= pageBean.pageCnt }">
						        <li class="page-item disabled">
						            <a href="#" class="page-link" data-page="${pageBean.nextPage}">다음</a>
						        </li>
						    </c:when>
						    <c:otherwise>
						        <li class="page-item">
						            <a href="#" class="page-link" data-page="${pageBean.nextPage}">다음</a>
						        </li>
						    </c:otherwise>
						</c:choose>
					</ul>
				</div>
				
				</article>
				
			</article>
		</section>

	</div>
	<!-- 큰틀 -->


	<c:import url="/WEB-INF/views/include/buttom_info.jsp" />



</body>
<script type="text/javascript" src="${root}js/receiptJS/receipt_select_subject.js?ver=1"></script>

</html>