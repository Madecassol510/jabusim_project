<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>접수</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<!-- 외부 css파일 -->
<link rel="stylesheet" href="${root}css/testTpdyd.css?ver=5" />
<link rel="stylesheet" href="${root}css/receiptCSS/selectPlace.css?ver=2" />
<!-- 외부 js파일 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
		
		var lastSearchType = 'default'; // 기본값 설정

		function getCurrentSearchType() {
		    return lastSearchType; // 마지막으로 수행된 검색 유형 반환
		}
		
		var currentRegionOption = ''; // 현재 검색어 저장 변수
		
		$('#regionButton').on('click', function() {
		    lastSearchType = 'region';
		    currentRegionOption = $('#regionButton').val(); // 검색어 업데이트
		});
		
		$('#pagingSection .page-link').on('click', function(e) {
			e.preventDefault();
		    var pageNumber = $(this).data('page');
		    console.log(pageNumber);
		    var searchType = getCurrentSearchType();

		    if (searchType === 'region') {
		    	loadPage_region(pageNumber, currentRegionOption);
		    } else {
		        loadPage(pageNumber);
		    }
		});
		
	});
	
</script>


</head>
<body>


<c:import url="/WEB-INF/views/include/top_menu.jsp"/>

	<div class="pageContainer">

		<section id="top_module" class="top_module">
			<article id="top_module_inner" class="top_module_inner">
	
				<ul class="list-group list-group-horizontal step-indicator">
				    <li class="list-group-item text-center step">
				        <span class="badge bg-primary">1. 시험선택</span>
				    </li>
				    <li class="list-group-item text-center step active">
				        <span class="badge bg-primary">2. 종목선택</span>
				    </li>
				    <li class="list-group-item text-center step active">
				        <span class="badge bg-primary">3. 시험장소 선택</span>
				    </li>
				</ul>
				
			</article>
		</section>
		
	
		<!-- 위 -->
		<section id="bottom_module" class="bottom_module">
			<article id="bottom_module_inner" class="bottom_module_inner">
				<!-- 검색모듈 -->
				<article id="search_module" class="search_module row">
			
					<div class="col-md-3">
					    <h3>지역 선택</h3>
					    <div class="categories_search">
						    <div class="categories_search2">
						        <select class="form-select" id="regionSelect">
								    <option selected disabled value="">지역을 선택하세요</option>
								    <option value="all">-전체-</option>
								    <c:forEach items="${getReceiptRegions}" var="receiptRegion">
							            <option value="${receiptRegion}">${receiptRegion}</option>
							        </c:forEach>
							    </select>
						    </div>
						    <div class="col-md-3">
						    	<button id="regionButton" class="btn btn-primary">조회</button>
						    </div>
					    </div>
			    	</div>
			    
				    
			    </article>
			    
			    <!-- table -->
   				<div style="min-height: 660px">
   					<h3>${sessionScope.examName } ${sessionScope.examType } 장소선택</h3>
					
					<table class="table">
					  <thead>
					  	<tr>
					  		<th style="width: 4%">No</th>
		                    <th style="width: 6%">지역</th>
		                    <th style="width: 50%">주소</th>
		                    <th style="width: 20%">시험장소</th>
		                    <th style="width: 11.5%">수용가능인원</th>
		                    <th style="width: 8.5%">접수하기</th>
		                </tr>
					  </thead>
					  <tbody>
						<c:forEach items="${getExamPlace}" var="examPlaceBean" varStatus="data">
						    <c:choose>
						        <c:when test="${examPlaceBean.currentRegistrations >= examPlaceBean.examPlace_maximum}">
						            <!-- 조건을 만족하는 경우에 적용할 스타일 (예: 음영) -->
						            <tr style="background-color: #f0f0f0;">
						                <td>${data.count}</td>
						                <td>${examPlaceBean.examPlace_region}</td>
						                <td>${examPlaceBean.examPlace_address}</td>
						                <td>${examPlaceBean.examPlace_name}</td>
						                <td>${examPlaceBean.currentRegistrations}/${examPlaceBean.examPlace_maximum}</td>
						                <td>
						                    <form action="${root}receipt/receipt_pro" method="post">
						                        <input type="hidden" name="examPlaceName" value="${examPlaceBean.examPlace_name}" />
						                        <button type="submit" disabled="disabled">선택</button>
						                    </form>
						                </td>
						            </tr>
						        </c:when>
						        <c:otherwise>
						            <!-- 조건을 만족하지 않는 경우 -->
						            <tr>
						                <td>${data.count}</td>
						                <td>${examPlaceBean.examPlace_region}</td>
						                <td>${examPlaceBean.examPlace_address}</td>
						                <td>${examPlaceBean.examPlace_name}</td>
						                <td>${examPlaceBean.currentRegistrations}/${examPlaceBean.examPlace_maximum}</td>
						                <td>
						                    <form action="${root}receipt/receipt_pro" method="post">
						                        <input type="hidden" name="examPlaceName" value="${examPlaceBean.examPlace_name}" />
						                        <button type="submit" class="id_btn">선택</button>
						                    </form>
						                </td>
						            </tr>
						        </c:otherwise>
						    </c:choose>
						</c:forEach>
					  </tbody>
					</table>
				</div>
				
				<div id="pagingSection" class="d-none d-md-block">
					<ul class="pagination justify-content-center">
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
						
						<c:forEach var='idx' begin="${pageBean.min }" end="${pageBean.max }">
						    <li class="page-item">
						        <a href="#" class="page-link" data-page="${idx}">${idx}</a>
						    </li>
						</c:forEach>
						
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
			    
			    
			    

			</article><!-- 바텀모듈 -->
		</section>
		
	</div> <!-- 큰틀 -->


<c:import url="/WEB-INF/views/include/buttom_info.jsp" />



</body>


<script type="text/javascript" src="${root}js/receiptJS/selectPlace.js?ver=7" ></script>

</html>