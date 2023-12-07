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
<link rel="stylesheet" href="${root}css/receptCSS/main.css" />
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
		    <li class="list-group-item text-center step">
		        <span class="badge bg-secondary">2. 종목선택</span>
		    </li>
		    <li class="list-group-item text-center step">
		        <span class="badge bg-secondary">3. 시험장소 선택</span>
		    </li>
		</ul>
		
		
		<section id="top_module" class="top_module">
			
			<article id="top_module_inner" class="top_module_inner">
				<h3>시험 선택</h3>
		        <table class="table table-striped">
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
						<tr>
		                   <td>예시 시험명</td>
		                   <td>예시 계열</td>
		                   <td>예시 구분</td>
		                   <td>1</td>
		                   <td>2023-01-01</td>
		                   <td>2023-01-10</td>
		                   <td>2023-02-01</td>
		                   <td>
		                   	<form action="${root}recept/recept_select_subject" method="post">
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
		                       <td>${data.registrationEnd}</td>
		                       <td>${data.examDate}</td>
		                       <td>
		                       	<form action="${root}recept/recept_select_subject" method="post">
								    <!-- 폼 입력 필드들 -->
								    <button type="submit">제출</button>
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
</html>