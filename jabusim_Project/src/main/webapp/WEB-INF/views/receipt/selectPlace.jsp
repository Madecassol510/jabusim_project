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
<link rel="stylesheet" href="${root}css/testTpdyd.css" />
<link rel="stylesheet" href="${root}css/receiptCSS/selectPlace.css" />
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
		
		
	});
	
</script>


</head>
<body>


<c:import url="/WEB-INF/views/include/top_menu.jsp"/>

	<div class="pageContainer">

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
		
	
	<!-- 위 -->
	<section id="top_module" class="top_module">
		<article id="top_module_inner" class="top_module_inner row">
		
			<div class="col-md-3">
			    <label for="regionSelect" class="form-label">지역선택</label>
		        <select class="form-select" id="regionSelect">
				    <option selected disabled value="">지역을 선택하세요</option>
				    <option value="seoul">서울특별시</option>
				    <option value="gyeonggi">경기도</option>
				    <option value="gangwon">강원도</option>
				    <option value="chungbuk">충청북도</option>
				    <option value="chungnam">충청남도</option>
				    <option value="jeonbuk">전라북도</option>
				    <option value="jeonnam">전라남도</option>
				    <option value="gyeongbuk">경상북도</option>
				    <option value="gyeongnam">경상남도</option>
				    <option value="jeju">제주특별자치도</option>
				    <option value="daejeon">대전광역시</option>
				    <option value="gwangju">광주광역시</option>
				    <option value="busan">부산광역시</option>
				    <option value="ulsan">울산광역시</option>
				    <option value="incheon">인천광역시</option>
				    <option value="daegu">대구광역시</option>
				    <option value="sejong">세종특별자치시</option>
				    <option value="all">전체</option>
			    </select>
	    	</div>
	    
		    <div class="col-md-3">
		        <label for="districtSelect" class="form-label">시 / 군 / 구</label>
		        <select class="form-select" id="districtSelect" disabled>
		            <option selected disabled value="">구를 선택하세요</option>
		            <!-- 서울의 구 옵션들은 JavaScript에서 추가됩니다 -->
		        </select>
		    </div>
		    
		    <div class="col-md-3">
		    	<button class="col-md-3" style='height:38px'>조회</button>
		    </div>
		
		</article>
	</section>
	
	
	<!-- 아래 -->	
	<section id="bottom_module" class="bottom_module">
		<article id="bottom_module_inner" class="bottom_module_inner">
			<div>
				<table class="table table-striped">
				  <thead>
				  	<tr>
	                    <th>지역</th>
	                    <th>시험일자</th>
	                    <th>시험장소</th>
	                    <th>접수마감일자</th>
	                    <th>접수하기</th>
	                </tr>
				  </thead>
				  <tbody>
				  	<tr>
	                   <td>서울특별시 노원구</td>
	                   <td>2024.1.13(토)</td>
	                   <td>노원고</td>
	                   <td>2024.1.1.(일)</td>
	                   <td><button>선택</button></td>
	                 </tr>
				  </tbody>
				</table>
			</div>
		</article>
	</section>
	
		
	</div> <!-- 큰틀 -->


<c:import url="/WEB-INF/views/include/buttom_info.jsp" />



</body>


<script type="text/javascript" src="${root}js/receiptJS/selectPlace.js" ></script>

</html>