<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>미니 프로젝트</title>
<!-- Bootstrap CDN -->
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
	    min-height: 700px;
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
	
	#modify_module .article{
		width : 85%;
		border: 1px solid black;
		text-align: left;
	}
	
	#modify_module .article .articleBox{
		width: 100%;
		display: inline-block;
		margin-bottom : 50px;
	}
	
	#modify_module .article .articleBox table{
		text-align:center;
		width: 100%;
		border: 1px solid black;
	}
	
	#modify_module .article .articleBox table tbody, tr{
		width: 100%;
	}
	
	#modify_module .article .articleBox table th{
		width: 30%;
		display: inline-block;
		padding-top: 10px;
		padding-bottom: 10px;
		border: 1px solid black;
	}
	
	#modify_module .article .articleBox table td{
		display: inline-block;
		width: 70%;
		padding-top: 10px;
		padding-bottom: 10px;
		border: 1px solid black;
	}
	
	#modify_module h3{
		padding-left: 37px;
	}
	
	
	#modify_module h5{
		margin-top : 20px;
		margin-bottom: 20px;
		padding-left: 37px;
	}
	
	
	/* =========================================================================== */
	
	#modify_module .articleBox .present_div, .modify_div {
		width : 500px;
		border: 1px solid red;
		padding-bottom : 30px;
		height: 300px;
	}
		
	#modify_module .articleBox .present_div {		
		float: left;
	}
	
	#modify_module .articleBox .modify_div {
		float: right;
		
	}
	
	#modify_module .articleBox .present_div div{		
		margin-left: 36px;
		margin-right: 36px;
	}
	
	#modify_module .articleBox .modify_div div{
		margin-left: 37px;
		margin-right: 36px;
	}
	
	#modify_module .articleBox .button_div{
		text-align:right;
		padding-top: 20px;
	}
	
	#modify_module .articleBox .button_div button{
		width: 120px;
		height: 45px;
	}
	
	
</style>

</head>
<body>
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />
	<c:import url="/WEB-INF/views/include/mypage_sideMenu.jsp" />


	<div class="pageContainer">
		<div class="module" id="modify_module">
			<div class="article">
				<div class="articleBox" id="edu_articleBox">
					<h3>학력 수정</h3>
					<div class="present_div">
						<h5>현재 학력</h5>
						<div>
							<table>
								<tr>
									<th>학력구분</th>
									<td>평생교육진흥원 인정학점(106학점 이상)</td>
								</tr>
								<tr>
									<th>학력(기관)명</th>
									<td>서울대학교</td>					
								</tr>
								<tr>
									<th>학과/전공</th>
									<td>컴퓨터공학</td>
								</tr>
							</table>					
						</div>
										
						<!-- 
						학력구분
							고졸 검정고시
							고등학교 졸업 이하
							평생교육진흥원 인정학점(81학점 이상)
							평생교육진흥원 인정학점(106학점 이상)
							2년제대학
							4년제대학
							석학학위
							박사학위 
						-->
					</div>
					<div class="modify_div">
						<h5>학력 수정</h5>
						<div>
							<table>
								<tr>
									<th>학력구분</th>
									<td>평생교육진흥원 인정학점(106학점 이상)</td>
								</tr>
								<tr>
									<th>학력(기관)명</th>
									<td>서울대학교</td>
								</tr>
								<tr>
									<th>학과/전공</th>
									<td>컴퓨터공학</td>
								</tr>
							</table>						
						</div>
						<div class="button_div">
							<button>신청</button>
						</div>
					</div>
							
				</div>
				
				<div class="articleBox" id="carrer_articleBox">
					<h3>경력 수정</h3>
					<div class="present_div">
						<h5>현재 경력</h5>
						<div>
							<table>
								<tr>
									<th>경력구분</th>
									<td>평생교육진흥원 인정학점(106학점 이상)</td>
								</tr>
								<tr>
									<th>직무분야</th>
									<td>사무관리</td>					
								</tr>
								<tr>
									<th>업체명</th>
									<td>솔데스크</td>
								</tr>
							</table>					
						</div>
						<!-- 
						경력구분
							고졸 검정고시
							고등학교 졸업 이하
							평생교육진흥원 인정학점(81학점 이상)
							평생교육진흥원 인정학점(106학점 이상)
							2년제대학
							4년제대학
							석학학위
							박사학위 
						-->
					</div>
					<div class="modify_div">
						<h5>경력 수정</h5>
						<div>
							<table>
								<tr>
									<th>학력구분</th>
									<td>평생교육진흥원 인정학점(106학점 이상)</td>
								</tr>
								<tr>
									<th>학력(기관)명</th>
									<td>서울대학교</td>
								</tr>
								<tr>
									<th>학과/전공</th>
									<td>컴퓨터공학</td>
								</tr>
							</table>
						</div>
						<div class="button_div">
							<button>신청</button>
						</div>
					</div>
				</div>
			</div>
		</div>	
	</div>


	<c:import url="/WEB-INF/views/include/buttom_info.jsp" />
</body>
</html>