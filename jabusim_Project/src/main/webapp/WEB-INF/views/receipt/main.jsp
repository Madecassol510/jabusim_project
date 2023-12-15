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
<link rel="stylesheet" href="${root}css/testTpdyd.css?ver=3" />
<link rel="stylesheet" href="${root}css/receiptCSS/main.css?ver=3" />
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
				<h1>시험 선택</h1>
		        <table class="table">
		            <thead>
		                <tr>
		                    <th>시험명</th>
		                    <th>계열</th>
		                    <th>구분</th>
		                    <th>회차</th>
		                    <th>접수시작</th>
		                    <th>접수마감</th>
		                    <th>시험일</th>
		                    <th>접수</th>
		                </tr>
		            </thead>
		            
		            <tbody>
		            	<c:forEach items="${getRegisting}" var="examBean" varStatus="data">
		                   <tr>
		                       <td>${examBean.exam_name}</td>
		                       <td>${examBean.exam_type}</td>
		                       <td>${examBean.exam_licenseType}</td>
		                       <td>${examBean.exam_round}</td>
		                       <td>${examBean.exam_receiptStartDate}</td>
		                       <td>${examBean.exam_receiptEndDate}</td>
		                       <td>${examBean.exam_date}</td>
		                       <td>
		                       	<form action="${root}receipt/receipt_select_subject" method="post">
									<!-- 숨겨진 입력 필드 추가 -->
					               <input type="hidden" name="examName" value="${examBean.exam_name}" />
					               <input type="hidden" name="examType" value="${examBean.exam_type}" />
					               <input type="hidden" name="licenseType" value="${examBean.exam_licenseType}" />
					               <input type="hidden" name="examResultDate" value="${examBean.exam_resultDate}" />
					               <input type="hidden" name="examDate" value="${examBean.exam_date}" />
					               <!-- 기타 필요한 폼 입력 필드들 -->
					               <button type="submit" class="id_btn" data-licenseType="${examBean.exam_licenseType}">제출</button>
								</form>
		                       </td>
		                   </tr>
		               	</c:forEach>
		            </tbody>
		            
		        </table>
	        </article>
		</section>
		

	</div> <!-- 큰틀 -->


<c:import url="/WEB-INF/views/include/buttom_info.jsp" />


</body>
<script>
function saveLicenseType(licenseTypeValue) {
    sessionStorage.setItem('licenseType', licenseTypeValue);
}

document.querySelectorAll('.id_btn').forEach(function(button) {
    button.addEventListener('click', function() {
        var licenseTypeValue = this.getAttribute('data-licenseType');
        saveLicenseType(licenseTypeValue);
    });
});
</script>

</html>