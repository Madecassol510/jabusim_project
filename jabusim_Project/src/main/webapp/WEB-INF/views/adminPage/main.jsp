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
	padding-top: 50px;
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

#dashBoardModule .dashBoardBox {
	width: 95%;
	height: 100%;
	display: grid;
	text-align: center;
	grid-template-columns: repeat(2, 1fr);
	grid-template-rows: repeat(2, 510px);
	grid-row-gap: 50px;
	grid-column-gap: 50px;
}

#dashBoardModule .dashBoard {
	border: 1px solid black;
}

#dashBoardModule .dashBoard .dashBoardHd {
	border-bottom: 1px solid black;
}

.dashBoard .dashBoardHd {
	text-align: left;
	margin: 0;
	padding: 15px;
	height: 60px;
}

.dashBoard .dashBoardHd h5{
	display: inline-block;
	margin: 0;
	margin-top: 3px;
	
}


.dashBoard .dashBoardHd button{
	float: right;
}

.dashBoard .dashBoardArticle{
	width:100%;
	height: 450px;
}





/* =================================================== */

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


</style>


</head>
<body>

	<c:import url="/WEB-INF/views/include/admin_sideMenu.jsp" />

	<div class="pageContainer">

		<div class="article">
			<h3>${loginUserBean.getUser_name()}님환영합니다</h3>
			<div class="module" id="dashBoardModule">
				<div class="dashBoardBox">
					<div class="dashBoard">
						<div class="dashBoardHd">
							<h5>최근 가입자</h5>
							<button>더보기</button>
						</div>
						<div class="dashBoardArticle">
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
										<td><span><button>취소</button></span></td>
									</tr>
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
										<td><span><button>취소</button></span></td>
									</tr>
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
										<td><span><button>취소</button></span></td>
									</tr>
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
										<td><span><button>취소</button></span></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="dashBoard">
						<div class="dashBoardHd">
							<h5>최근 시험 일정</h5>
							<button>더보기</button>
						</div>
						<div class="dashBoardArticle">
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
										<td><span><button>취소</button></span></td>
									</tr>
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
										<td><span><button>취소</button></span></td>
									</tr>
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
										<td><span><button>취소</button></span></td>
									</tr>
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
										<td><span><button>취소</button></span></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="dashBoard">
						<div class="dashBoardHd">
							<h5>최근 문의</h5>
							<button>더보기</button>
						</div>
						<div class="dashBoardArticle">
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
										<td><span><button>취소</button></span></td>
									</tr>
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
										<td><span><button>취소</button></span></td>
									</tr>
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
										<td><span><button>취소</button></span></td>
									</tr>
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
										<td><span><button>취소</button></span></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="dashBoard">
						<div class="dashBoardHd">
							<h5>공지 사항</h5>
							<button>더보기</button>
						</div>
						<div class="dashBoardArticle">
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
										<td><span><button>취소</button></span></td>
									</tr>
									<tr>
										<td><span>2023정보처리기사</span></td>
										<td><span>3회</span></td>
										<td><span>실기</span></td>
										<td><span>2023-11-12</span></td>
										<td><span>01060742</span></td>
										<td><span>서울고등학교</span></td>
										<td><span><button>취소</button></span></td>
									</tr>
									
								</tbody>
							</table>
						</div>
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