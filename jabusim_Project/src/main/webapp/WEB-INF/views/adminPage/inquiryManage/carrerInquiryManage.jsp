<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JaBuSim</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">



<style>

/* ==========================페이지 공용================================== */
body {
	width: 100%;
	/* min-height : 1200px; */
}

ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

li {
	
}

.pageContainer {
	position: relative;
	width: 1400px;
	min-height: 951px;
	border: 1px solid red;
	float: left;
	margin-left: 250px;
	margin-top: 100px;
}

.module {
	min-height: 600px;
	width: 100%;
	border: 1px solid blue;
	text-align: center;
	padding-top: 10px;
	padding-bottom: 50px;
}

.article {
	display: inline-block;
	width: 100%;
	margin: 0 auto;
	border: 1px solid black;
}

/* =========================================================================== */


#dashBoardModule {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 100%;
}

#dashBoardModule .dashBoard {
	width: 95%;
	height: 100%;
	border: 1px solid black;;
}

/* #dashBoardModule .dashBoard {
	border: 1px solid black;
	width: 100%;
	height: 100%;
} */

/* =========================================================================== */

#dashBoardModule .dashBoard .dashBoardHd {
	border-bottom: 1px solid black;
	text-align: left;
	margin: 0;
	padding: 15px;
	margin-bottom: 15px;
}


.dashBoard .dashBoardHd h2{
	display: inline-block;
	margin: 0;
	margin-top: 3px;
}


.dashBoard .dashBoardHd button{
	float: right;
}

.dashBoard .dashBoardArticle{
	width:100%;
	min-height: 450px;
}



/* =========================================================================== */
/* 검색조건 */


.dashBoard .dashBoardSearch{
	text-align: left;
	border: 1px solid black;
	border-top: none;
	margin-bottom : 60px; 
}

.dashBoard .dashBoardSearch form{
	display: inline-block;
	width: 100%;
	position:relative;
	padding-top: 10px;
	padding-bottom: 10px;
}

.dashBoard .dashBoardSearch .searchTable{
	width: 80%;
	float: left;
}

.dashBoard .dashBoardSearch .searchTable th{
	padding-bottom: 10px;
	padding-top: 10px;
}

.dashBoard .dashBoardSearch .searchTable td{
	padding-bottom: 10px;
	padding-top: 10px;
}

.dashBoard .dashBoardSearch .searchHd{
	width: 10%;
	height: 100%;
	text-align: center;
}


.dashBoard .dashBoardSearch  .searchTable .searchArticle{
	width:80%;
}



.dashBoard .dashBoardSearch .searchTable .searchArticle .searchReq{
	display: inline-block;
	margin-left: 15px;
}


.dashBoard .dashBoardSearch .searchButton{
	position:absolute;
	width: 10%;
	right:0;
	bottom:20px;
}	


.dashBoard .dashBoardSearch .searchButton button{
	width: 100px;
	height: 60px;
}

/* =================================================== */

/* 테이블 리스트 */

.dashBoard .dashBoardArticle {
	border:1px solid black; 
}

.dashBoard .dashBoardArticle table {
	width:100%;
}

.dashBoard .dashBoardArticle table tr{
	width:100%;
	height: 50px;
}

.dashBoard .dashBoardArticle table thead{
	border-bottom: 2px solid black;
}

.dashBoard .dashBoardArticle table tbody{
	border-bottom: 1px solid black;
}

.dashBoard .dashBoardArticle table th{
	padding: 0 15px;
}

.dashBoard .dashBoardArticle table td{
	padding: 0 15px;
}




/* ================================================ */

#edu_list, #career_list{
	width:200px;
} 

span {
	text-align: left;
}

/* ================================================ */
/* 부트스트랩 */
.nav-tabs {
    border-bottom: 1px solid black;
}

.nav-tabs .nav-link.active {
	border-color: black black #fff;
}

</style>




</head>
<body>

	<c:import url="/WEB-INF/views/include/admin_sideMenu.jsp" />

	<div class="pageContainer">

		<div class="article">			
			<div class="module" id="dashBoardModule">
				<div class="dashBoard">
					<div class="dashBoardHd">
						<h2>최근 가입자</h2>
					</div>
					<ul class="nav nav-tabs">
						<li class="nav-item">
							<a class="nav-link" href="${root}adminPage/inquiryManage/eduInquiryManage">학력문의</a>				
						</li>
						<li class="nav-item">
						<a class="nav-link active" aria-current="page" href="#">경력문의</a>
						</li>
					</ul>
					<div class="dashBoardSearch">
						<form action="">
							<table class="searchTable">
								<!-- <tr>
									<th class="searchHd">문의종류</th>
									<td class="searchArticle">
										<div class="searchReq">
											<input type="checkbox" name="edu_list" /> 학력 추가
										</div>
										<div class="searchReq">
											<input type="checkbox" name="edu_list" /> 경력 추가
										</div>
										<div class="searchReq">
											<input type="checkbox" name="edu_list" /> 자격증 보유 인증
										</div>
									</td>
								</tr> -->
								<tr>
									<th class="searchHd">직무분야</th>
									<td class="searchArticle">
										<div class="searchReq">
											<select>
												<option value="">경력분야</option>
											</select>
										</div>
									</td>
								</tr>
								<tr>
									<th class="searchHd">경력구분</th>
									<td class="searchArticle">
										<div class="searchReq">
											<input type="checkbox" name="edu_list" /> 2년 이상
										</div>
										<div class="searchReq">
											<input type="checkbox" name="edu_list" /> 4년 이상
										</div>
									</td>
								</tr>
								
								<tr>
									<th class="searchHd">문의날짜</th>
									<td class="searchArticle">
										<div class="searchReq">
											<input type="date" /> ~ <input type="date" />
											<!-- max="2077-06-20" -->
										</div>
									</td>
								</tr>
								<tr>
									<th class="searchHd">처리날짜</th>
									<td class="searchArticle">
										<div class="searchReq">
											<input type="date" /> ~ <input type="date" />
											<!-- max="2077-06-20" -->
										</div>
									</td>
								</tr>
								<tr>
									<th class="searchHd">처리상태</th>
									<td class="searchArticle">
										<div class="searchReq">
											<input type="checkbox" name="edu_list" /> 처리완료
										</div>
										<div class="searchReq">
											<input type="checkbox" name="edu_list" /> 처리불가
										</div>
										<div class="searchReq">
											<input type="checkbox" name="edu_list" /> 처리대기
										</div>
									</td>
								</tr>
								<tr>
									<th class="searchHd">이름검색</th>
									<td class="searchArticle">
										<div class="searchReq">
											<input type="text" />
										</div>
									</td>
								</tr>

							</table>
							<div class="searchButton">
								<button type="submit">검색</button>
							</div>
						</form>
					</div>

					<div class="searchResultCount" style="text-align: left; padding-left: 10px;">
					<span>검색결과 : 13/ 총 13명 검색결과 </span>
					</div>
					
					<div class="dashBoardArticle">
						<table>
							<thead>
								<tr>
									<th><input type="checkbox"></th>
									<th><span>no.</span></th>
									<th><span>이름</span></th>
									<th><span>아이디</span></th>
									<th><span>직무분야</span></th>									
									<th><span>경력구분</span></th>									
									<th><span>업체명</span></th>
									<th><span>문의날짜</span></th>
									<th><span>처리날짜</span></th>
									<th><span>처리상태</span></th>								
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${allUserCareerBeans}" var="userCareerBean">
									<tr>
										<th><input type="checkbox" value="${userEduBean.getUser_idx()}"></th>
										<td><span>${loopStatus.index+1}</span></td>
										<td><span>${userCareerBean.getUser_name()}</span></td>
										<td><span>${userCareerBean.getUserCareer_Field()}</span></td>
										<td><span>${userCareerBean.getUserEdu_academy()}</span></td>
										<td><span>${userCareerBean.getUserEdu_major()}</span></td>	
										<td><span>${userCareerBean.getUserEdu_academy()}</span></td>	
										<td><span>${userCareerBean.getUserCareer_major()}</span></td>								
										<td><span>${userCareerBean.getUserCareer_inquiryDate()}</span></td>	
										<td><span>${userCareerBean.getUserCareer_processDate()}</span></td>
										
										<c:choose>
											<c:when test="${userCareerBean.getUserCareer_processDate()==null}">
												<td><span></span></td>
											</c:when>
											<c:otherwise>
												<td><span>${userCareerBean.getUserCareer_processDate()}</span></td>
											</c:otherwise>
										</c:choose>	
										
										<td><span>${userCareerBean.getUserCareer_processStatus()}</span></td>		
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous"></script>
</body>
</html>