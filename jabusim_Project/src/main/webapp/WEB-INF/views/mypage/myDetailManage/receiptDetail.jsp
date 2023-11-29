<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<style>

	/* ==========================페이지 공용================================== */

	body{
		width:100%;
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
	}
	
	/* =========================================================================== */

	/*exam_result_module*/
	
	#exam_result_module .hd h3{
		text-align: left;
		padding-left: 37px;
	}
	
	
	#exam_result_module .article{
		width : 94%;
		display: inline-block;
		border: 1px solid black;
	}
	
	#exam_result_module .resultBox{
		width: 100%;
		border: 1px solid red;
		padding:30px;
	}
	
	
	#exam_result_module .resultBox table{
		margin:auto;
		text-align:center; 
		width:85%;
	}

	#exam_result_module .resultBox td, th{
		padding-top: 10px;
		padding-bottom: 10px;
	}
	
	#exam_result_module .resultBox thead tr{
		border-bottom: 2px solid black;
	}
	
	#exam_result_module .resultBox tbody tr{
		border-bottom: 1px solid black;
	}
	
	/* ------------------------------------------------ */
	
	#exam_result_module .paginationBox{
		padding-top:10px;
		padding-bottom:10px;
		display: inline-block;
	}
	#exam_result_module .paginationBox ul{
		list-style:none;
		padding : 5px;
		margin:0;
		display: flex;
	}
	
	#exam_result_module .paginationBox li{
		margin: 0px 10px;	
	}

	
</style>

</head>
<body>
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />
	<c:import url="/WEB-INF/views/include/mypage_sideMenu.jsp" />


	<div class="pageContainer">		
		<div class="module" id="exam_result_module">
			<div class="article">
				<div class="hd">
					<h3>시험 접수</h3>
				</div>
				<div class="resultBox">
					<table>
						<thead>
							<tr>
								<th><span>시험명</span></th>
								<th><span>회차</span></th>
								<th><span>구분</span></th>
								<th><span>시험날짜</span></th>
								<th><span>수험번호</span></th>
								<th><span>응시장소</span></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><span>2023정보처리기사</span></td>
								<td><span>3회</span></td>
								<td><span>실기</span></td>
								<td><span>2023-11-12</span></td>
								<td><span>01060742</span></td>
								<td><span>서울고등학교</span></td>
								<td><span><button>취소</button></span></td>
							</tr>
							<tr>
								<td><span>2023정보처리기사</span></td>
								<td><span>3회</span></td>
								<td><span>실기</span></td>
								<td><span>2023-11-12</span></td>
								<td><span>01060742</span></td>
								<td><span>서울고등학교</span></td>
								<td><span>취소처리중</span></td>
							</tr>
							<tr>
								<td><span>2023정보처리기사</span></td>
								<td><span>3회</span></td>
								<td><span>실기</span></td>
								<td><span>2023-11-12</span></td>
								<td><span>01060742</span></td>
								<td><span>서울고등학교</span></td>
								<td><span>취소완료</span></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="paginationBox">
					<ul>
						<li class="page-item"><a href="#" class="page-link">이전</a></li>
						<li class="page-item"><a href="#" class="page-link">다음</a></li>					
					</ul>
				</div>
				<div class="cautionBox"></div>
			</div>
		</div>
	</div>


	<c:import url="/WEB-INF/views/include/buttom_info.jsp" />
</body>
</html>