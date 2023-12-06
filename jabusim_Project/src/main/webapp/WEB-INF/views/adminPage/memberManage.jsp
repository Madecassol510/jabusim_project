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
	margin-bottom: 20px;
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

#inter_list{
	width:150px;
}

#edu_list, #career_list{
	width:150px;
} 

span {
	text-align: left;
}


/* =========================================================================== */
	
	/* 모달창 */
	.modalBackground {
		width:100%;
		height: 100%;
		position: fixed;
		top:0;
		left:0;
		justify-content: center;
  		align-items: center;
		background: rgba(0,0,0,0.5);
		display: none;
	}
	
	.modalContainer{
		width:650px;
		height:700px;
		position: absolute;
		background: white;
		
	}
	
	.modalContainer .modalContainerHd{
		padding:10px;
		width:100%;
		height:9%;
		border-bottom: 1px solid black;
	}
	
	.modalContainer .modalContainerHd h4{
		height:100%;
		margin: auto 0px;
		display:inline-block;
		float: left;
		padding-top: 5px;
	}
	
	.modalContainer .modalContainerHd button{
		float: right;
		height : 40px;
		width : 40px;
		padding : 0;
	}
	
	.modalContainer .modalContent{
		width : 100%;
		height: 88%;
		padding : 5%;
	}
	
	.modalContainer .searchHd{
		width : 100%;
		height: 17%;
		margin-bottom: 3%;
		border: 1px solid black;
		display: flex;
        justify-content: center;
        align-items: center;
	}
	
	
	.modalContainer .searchResult{
		width : 100%;
		height: 80%;
		border: 1px solid black;
		overflow: auto;
	}
	
	.modalContainer .searchResult ul{
		width : 100%;
		height : 100%;
		display: inline-block;
		padding : 0px 0px 0px 15px;
		margin: 0;
	}

	.modalContainer .searchResult li{
		height : 12.5%;
		width: 100%;
		padding: 10px;
	}
	
	.modalContainer .searchResult li span{
		cursor: pointer;
	}

/* =========================================================================== */
	
	/* 부트스트랩 */

	

</style>

<script type="text/javascript">

	function memberModify() {
		
		var popupWidth = 650;
		var popupHeight = 700;
		
		var popupX = (window.screen.width / 2) - (popupWidth / 2);
		var popupY= (window.screen.height / 2) - (popupHeight / 2);
		
		window.open('${root }adminPage/main', '_blank' , 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
	}
	
	
</script>

</head>
<body>

	<c:import url="/WEB-INF/views/include/admin_sideMenu.jsp" />

	<div class="pageContainer">
		<div class="article">
			<div class="module" id="dashBoardModule">
				<div class="dashBoard">
					<div class="dashBoardHd">
						<h2>회원 관리</h2>
					</div>
					
					<div class="dashBoardSearch">
						<form action="">
							<table class="searchTable">
								<tr>
									<th class="searchHd">보유학력</th>
									<td class="searchArticle">
										<div class="searchReq">
											<input type="checkbox" name="edu_list" /> 고등학교 졸업 이하
										</div>
										<div class="searchReq">
											<input type="checkbox" name="edu_list" /> 고졸 검정고시
										</div> <br>
										<div class="searchReq">
											<input type="checkbox" name="edu_list" /> 평생교육진흥원 인정학점(81학점 이상)
										</div>
										<div class="searchReq">
											<input type="checkbox" name="edu_list" /> 평생교육진흥원 인정학점(106학점 이상)
										</div> <br>
										<div class="searchReq">
											<input type="checkbox" name="edu_list" /> 2년제대학
										</div>
										<div class="searchReq">
											<input type="checkbox" name="edu_list" /> 4년제대학
										</div>
										<div class="searchReq">
											<input type="checkbox" name="edu_list" /> 석사학위
										</div>
										<div class="searchReq">
											<input type="checkbox" name="edu_list" /> 박사학위
										</div>
									</td>
								</tr>
								<tr>
									<th class="searchHd">보유경력</th>
									<td class="searchArticle">
										<div class="searchReq">
											<select>
												<option value="">경력분야</option>
											</select>
										</div>
										<div class="searchReq">
											<input type="checkbox" name="edu_list" /> 2년 이상
										</div>
										<div class="searchReq">
											<input type="checkbox" name="edu_list" /> 4년 이상
										</div>
									</td>
								</tr>
								<tr>
									<th class="searchHd">관심분야</th>
									<td class="searchArticle">
										<div class="searchReq">
											<input type="checkbox" name="edu_list" /> 고등학교 졸업 이하
										</div>
										<div class="searchReq">
											<input type="checkbox" name="edu_list" /> 고졸 검정고시
										</div>
										<br>
										<div class="searchReq">
											<input type="checkbox" name="edu_list" /> 평생교육진흥원 인정학점(81학점 이상)
										</div>
										<div class="searchReq">
											<input type="checkbox" name="edu_list" /> 평생교육진흥원 인정학점(106학점 이상)
										</div>
										<br>
										<div class="searchReq">
											<input type="checkbox" name="edu_list" /> 2년제대학
										</div>
										<div class="searchReq">
											<input type="checkbox" name="edu_list" /> 4년제대학
										</div>
										<div class="searchReq">
											<input type="checkbox" name="edu_list" /> 석사학위
										</div>
										<div class="searchReq">
											<input type="checkbox" name="edu_list" /> 박사학위
										</div>
									</td>
								</tr>
								<tr>
									<th class="searchHd">가입일</th>
									<td class="searchArticle">
										<div class="searchReq">
											<input type="date" /> ~
											<input type="date" /> <!-- max="2077-06-20" -->
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
									<th><span>생년월일</span></th>
									<th><span>휴대폰번호</span></th>
									<th><span>관심분야</span></th>
									<th><span>학력목록</span></th>
									<th><span>경력목록</span></th>
									<th><span>가입일</span></th>
									<th><span>최근로그인</span></th>
									<th><span></span></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th><input type="checkbox"></th>
									<td><span>1</span></td>
									<td><span>홍길동</span></td>
									<td><span>20000807</span></td>
									<td><span>01035641347</span></td>
									<td><select name="" id="inter_list">
											<option></option>
											<option></option>
											<option></option>
									</select></td>
									<td><select name="" id="edu_list">
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
									</select></td>
									<td><select name="" id="career_list">
											<option>사무관리/2년 이상</option>
											<option>사무관리/2년 이상</option>
											<option>사무관리/2년 이상</option>
											<option>사무관리/2년 이상</option>
									</select></td>
									<td><span>2019-09-17</span></td>
									<td><span>2023-12-04</span></td>
									<th><span><button type="button"  onclick="memberModify()">수정</button></span></th>
								</tr>
								<tr>
									<th><input type="checkbox"></th>
									<td><span>1</span></td>
									<td><span>홍길동</span></td>
									<td><span>20000807</span></td>
									<td><span>01035641347</span></td>
									<td><span>컴퓨터전공</span></td>
									<td><select name="" id="edu_list">
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
									</select></td>
									<td><select name="" id="career_list">
											<option>사무관리/2년 이상</option>
											<option>사무관리/2년 이상</option>
											<option>사무관리/2년 이상</option>
											<option>사무관리/2년 이상</option>
									</select></td>
									<td><span>2019-09-17</span></td>
									<td><span>2023-12-04</span></td>
									<th><span><button type="button"  onclick="memberModify()">수정</button></span></th>
								</tr>
								<tr>
									<th><input type="checkbox"></th>
									<td><span>1</span></td>
									<td><span>홍길동</span></td>
									<td><span>20000807</span></td>
									<td><span>01035641347</span></td>
									<td><span>컴퓨터전공</span></td>
									<td><select name="" id="edu_list">
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
									</select></td>
									<td><select name="" id="career_list">
											<option>사무관리/2년 이상</option>
											<option>사무관리/2년 이상</option>
											<option>사무관리/2년 이상</option>
											<option>사무관리/2년 이상</option>
									</select></td>
									<td><span>2019-09-17</span></td>
									<td><span>2023-12-04</span></td>
									<th><span><button type="button"  onclick="memberModify()">수정</button></span></th>
								</tr>
								<tr>
									<th><input type="checkbox"></th>
									<td><span>1</span></td>
									<td><span>홍길동</span></td>
									<td><span>20000807</span></td>
									<td><span>01035641347</span></td>
									<td><span>컴퓨터전공</span></td>
									<td><select name="" id="edu_list">
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
									</select></td>
									<td><select name="" id="career_list">
											<option>사무관리/2년 이상</option>
											<option>사무관리/2년 이상</option>
											<option>사무관리/2년 이상</option>
											<option>사무관리/2년 이상</option>
									</select></td>
									<td><span>2019-09-17</span></td>
									<td><span>2023-12-04</span></td>
									<th><span><button type="button"  onclick="memberModify()">수정</button></span></th>
								</tr>
								<tr>
									<th><input type="checkbox"></th>
									<td><span>1</span></td>
									<td><span>홍길동</span></td>
									<td><span>20000807</span></td>
									<td><span>01035641347</span></td>
									<td><span>컴퓨터전공</span></td>
									<td><select name="" id="edu_list">
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
									</select></td>
									<td><select name="" id="career_list">
											<option>사무관리/2년 이상</option>
											<option>사무관리/2년 이상</option>
											<option>사무관리/2년 이상</option>
											<option>사무관리/2년 이상</option>
									</select></td>
									<td><span>2019-09-17</span></td>
									<td><span>2023-12-04</span></td>
									<th><span><button type="button"  onclick="memberModify()">수정</button></span></th>
								</tr>
								<tr>
									<th><input type="checkbox"></th>
									<td><span>1</span></td>
									<td><span>홍길동</span></td>
									<td><span>20000807</span></td>
									<td><span>01035641347</span></td>
									<td><span>컴퓨터전공</span></td>
									<td><select name="" id="edu_list">
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
									</select></td>
									<td><select name="" id="career_list">
											<option>사무관리/2년 이상</option>
											<option>사무관리/2년 이상</option>
											<option>사무관리/2년 이상</option>
											<option>사무관리/2년 이상</option>
									</select></td>
									<td><span>2019-09-17</span></td>
									<td><span>2023-12-04</span></td>
									<th><span><button type="button"  onclick="memberModify()">수정</button></span></th>
								</tr>
								<tr>
									<th><input type="checkbox"></th>
									<td><span>1</span></td>
									<td><span>홍길동</span></td>
									<td><span>20000807</span></td>
									<td><span>01035641347</span></td>
									<td><span>컴퓨터전공</span></td>
									<td><select name="" id="edu_list">
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
									</select></td>
									<td><select name="" id="career_list">
											<option>사무관리/2년 이상</option>
											<option>사무관리/2년 이상</option>
											<option>사무관리/2년 이상</option>
											<option>사무관리/2년 이상</option>
									</select></td>
									<td><span>2019-09-17</span></td>
									<td><span>2023-12-04</span></td>
									<th><span><button type="button"  onclick="memberModify()">수정</button></span></th>
								</tr>
								<tr>
									<th><input type="checkbox"></th>
									<td><span>1</span></td>
									<td><span>홍길동</span></td>
									<td><span>20000807</span></td>
									<td><span>01035641347</span></td>
									<td><span>컴퓨터전공</span></td>
									<td><select name="" id="edu_list">
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
									</select></td>
									<td><select name="" id="career_list">
											<option>사무관리/2년 이상</option>
											<option>사무관리/2년 이상</option>
											<option>사무관리/2년 이상</option>
											<option>사무관리/2년 이상</option>
									</select></td>
									<td><span>2019-09-17</span></td>
									<td><span>2023-12-04</span></td>
									<th><span><button type="button"  onclick="memberModify()">수정</button></span></th>
								</tr>
								<tr>
									<th><input type="checkbox"></th>
									<td><span>1</span></td>
									<td><span>홍길동</span></td>
									<td><span>20000807</span></td>
									<td><span>01035641347</span></td>
									<td><span>컴퓨터전공</span></td>
									<td><select name="" id="edu_list">
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
									</select></td>
									<td><select name="" id="career_list">
											<option>사무관리/2년 이상</option>
											<option>사무관리/2년 이상</option>
											<option>사무관리/2년 이상</option>
											<option>사무관리/2년 이상</option>
									</select></td>
									<td><span>2019-09-17</span></td>
									<td><span>2023-12-04</span></td>
									<th><span><button type="button"  onclick="memberModify()">수정</button></span></th>
								</tr>
								<tr>
									<th><input type="checkbox"></th>
									<td><span>1</span></td>
									<td><span>홍길동</span></td>
									<td><span>20000807</span></td>
									<td><span>01035641347</span></td>
									<td><span>컴퓨터전공</span></td>
									<td><select name="" id="edu_list">
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
									</select></td>
									<td><select name="" id="career_list">
											<option>사무관리/2년 이상</option>
											<option>사무관리/2년 이상</option>
											<option>사무관리/2년 이상</option>
											<option>사무관리/2년 이상</option>
									</select></td>
									<td><span>2019-09-17</span></td>
									<td><span>2023-12-04</span></td>
									<th><span><button type="button"  onclick="memberModify()">수정</button></span></th>
								</tr>
								<tr>
									<th><input type="checkbox"></th>
									<td><span>1</span></td>
									<td><span>홍길동</span></td>
									<td><span>20000807</span></td>
									<td><span>01035641347</span></td>
									<td><span>컴퓨터전공</span></td>
									<td><select name="" id="edu_list">
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
									</select></td>
									<td><select name="" id="career_list">
											<option>사무관리/2년 이상</option>
											<option>사무관리/2년 이상</option>
											<option>사무관리/2년 이상</option>
											<option>사무관리/2년 이상</option>
									</select></td>
									<td><span>2019-09-17</span></td>
									<td><span>2023-12-04</span></td>
									<th><span><button type="button"  onclick="memberModify()">수정</button></span></th>
								</tr>
								<tr>
									<th><input type="checkbox"></th>
									<td><span>1</span></td>
									<td><span>홍길동</span></td>
									<td><span>20000807</span></td>
									<td><span>01035641347</span></td>
									<td><span>컴퓨터전공</span></td>
									<td><select name="" id="edu_list">
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
									</select></td>
									<td><select name="" id="career_list">
											<option>사무관리/2년 이상</option>
											<option>사무관리/2년 이상</option>
											<option>사무관리/2년 이상</option>
											<option>사무관리/2년 이상</option>
									</select></td>
									<td><span>2019-09-17</span></td>
									<td><span>2023-12-04</span></td>
									<th><span><button type="button"  onclick="memberModify()">수정</button></span></th>
								</tr>
								<tr>
									<th><input type="checkbox"></th>
									<td><span>1</span></td>
									<td><span>홍길동</span></td>
									<td><span>20000807</span></td>
									<td><span>01035641347</span></td>
									<td><span>컴퓨터전공</span></td>
									<td><select name="" id="edu_list">
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
											<option>평생교육진흥원 인정학점(106학점 이상)</option>
									</select></td>
									<td><select name="" id="career_list">
											<option>사무관리/2년 이상</option>
											<option>사무관리/2년 이상</option>
											<option>사무관리/2년 이상</option>
											<option>사무관리/2년 이상</option>
									</select></td>
									<td><span>2019-09-17</span></td>
									<td><span>2023-12-04</span></td>
									<th><span><button type="button"  onclick="memberModify()">수정</button></span></th>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 회원수정 모달창 -->
	<div class="modalBackground" id="memberModalBackground">
		<div class="modalContainer" id="">	
			<div class="modalContainerHd">
				<h4>boradory1346(홍길동)님의 회원정보</h4>
				<button type="button" onclick="on_offModal()">닫기</button>
			</div>
			<div class="modalContent">
				<table>
					<tr>
						<th>아이디</th>
						<td></td>
					</tr>
					<tr>
						<th>아이디</th>
						<td></td>
					</tr>
					<tr>
						<th>아이디</th>
						<td></td>
					</tr>
					<tr>
						<th>아이디</th>
						<td></td>
					</tr>			
				</table>
				
				
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