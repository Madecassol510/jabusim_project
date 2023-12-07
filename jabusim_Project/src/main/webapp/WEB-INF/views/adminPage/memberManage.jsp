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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

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

	/* function memberModify() {
		
		var popupWidth = 650;
		var popupHeight = 700;
		
		var popupX = (window.screen.width / 2) - (popupWidth / 2);
		var popupY= (window.screen.height / 2) - (popupHeight / 2);
		
		window.open('${root }adminPage/main', '_blank' , 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
	} */
	
	//검색 필드
	var name;
	var interests;
	var joinStart;
	var joinEnd; 
	
	
	//검색 필드에 값넣기
	function fieldSearch(){
		
		/* var myform = document.form */
		
		name = document.getElementById("nameInput").value;
		interests = document.getElementById("interestsInput").value;
		joinStart = document.getElementById("joinStartInput").value;
		joinEnd = document.getElementById("joinEndInput").value;
		
		var joinStartDate = new Date(joinStart);
		var joinEndDate = new Date(joinEnd);
		
		if(joinStartDate > joinEndDate){
			alert("가입일을 제대로 기입해주세요");
		}
		else{
			//ajax 검색
			tableSearch();
		}
	}
	
	// ajax 검색
	function tableSearch(){
		$.ajax({
	        type : 'GET',
	        url: '/jabusim_Project/admin/userTableSearch/?name=' + name + '&interests=' + interests + '&joinStart=' + joinStart + '&joinEnd=' + joinEnd,
	        success : function(result) {
	           updateModel(result);
	           console.log("왜 안돼?");
	        }
	     });
	}
	
	// 결과물 업데이트
	function updateModel(result){
		allUserBeans = result;		
		const test = document.getElementById('testtpdyd');
		test.innerHTML = '';
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
						<form id="myForm">
							<table class="searchTable">
								<tr>
									<th class="searchHd">이름검색</th>
									<td class="searchArticle">
										<div class="searchReq">
											<input type="text" id="nameInput" />
										</div>						
									</td>
								</tr>
								<tr>
									<th class="searchHd">관심분야</th>
									<td class="searchArticle">
										<div class="searchReq">
											<select id="interestsInput">
												<option></option>
												<option>건설기계운전</option>
												<option>채광</option>
												<option>기계제작</option>
												<option>기계장비설비.설치</option>
												<option>철도</option>
												<option>조선</option>
												<option>항공</option>
												<option>자동차</option>
												<option>금형.공작기계</option>
												<option>금속.재료</option>
												<option>판금.제관.새시</option>
												<option>단조.주조</option>
												<option>용접</option>
												<option>도장.도금</option>
												<option>화공</option>
												<option>위험물</option>
												<option>섬유</option>
												<option>의복</option>
												<option>전기</option>
												<option>전자</option>
												<option>정보기술</option>
												<option>식품</option>
												<option>제과.제빵</option>
												<option>인쇄.사진</option>
												<option>목재.가구.공예</option>
												<option>농업</option>
												<option>축산</option>
												<option>임업</option>
												<option>어업</option>
												<option>안전관리</option>
												<option>비파괴검사</option>
												<option>환경</option>
												<option>에너지.기상</option>
											</select>
										</div>
									</td>
								</tr>
								<tr>
									<th class="searchHd">가입일</th>
									<td class="searchArticle">
										<div class="searchReq">
											<input type="date" id="joinStartInput" /> ~
											<input type="date" id="joinEndInput" /> <!-- max="2077-06-20" -->
										</div>					
									</td>
								</tr>
							</table>
							<div class="searchButton">
								<button type="button" onclick="fieldSearch()">검색</button>
							</div>			
						</form>
					</div>
					
					<div class="dashBoardArticle">
						<table>
							<thead>
								<tr>
									<th><input type="checkbox"></th>
									<th><span>no.</span></th>
									<th><span>권한</span></th>
									<th><span>이름</span></th>
									<th><span>아이디</span></th>
									<th><span>생년월일</span></th>
									<th><span>휴대폰번호</span></th>
									<th><span>관심분야</span></th>
									<th><span>가입일</span></th>
									<th><span>최근로그인</span></th>
									<th><span></span></th>
								</tr>
							</thead>
							<tbody id="testtpdyd">
								<c:forEach items="${allUserBeans}" var="userBean">
									<tr>
										<th><input type="checkbox" value="${userBean.getUser_idx()}"></th>
										<td><span>${loopStatus.index+1}</span></td>
										<td><span>${userBean.getUser_role()}</span></td>
										<td><span>${userBean.getUser_name()}</span></td>
										<td><span>${userBean.getUser_id()}</span></td>
										<td><span>${userBean.getUser_birthdate()}</span></td>
										<td><span>${userBean.getUser_phoneNum()}</span></td>
											
										<c:choose>
											<c:when test="${userBean.getUser_interests()==null}">
												<td><span></span></td>
											</c:when>
											<c:otherwise>
												<td><span>${userBean.getUser_interests()}</span></td>
											</c:otherwise>
										</c:choose>	
										
										
										<td><span>${userBean.getUser_joinDate()}</span></td>			
										<td><span>${userBean.getUser_visitCount()}회</span></td>		
									</tr>
								</c:forEach>			
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