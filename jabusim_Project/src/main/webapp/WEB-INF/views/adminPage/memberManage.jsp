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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<style>
.navbar.navbar-expand-sm.navbar-dark.bg-dark {
	position: fixed;
	width: 100%;
}
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
	/* border: 1px solid red; */
	margin:0 auto;
	margin-top: 100px;
}

.module {
	min-height: 600px;
	width: 100%;
	/* border: 1px solid blue; */
	text-align: center;
	padding-top: 10px;
	padding-bottom: 180px;
}

.article {
	display: inline-block;
	width: 100%;
	margin: 0 auto;
	/* border: 1px solid black; */
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
	/* border: 1px solid black;; */
}

/* #dashBoardModule .dashBoard {
	border: 1px solid black;
	width: 100%;
	height: 100%;
} */

/* =========================================================================== */
#dashBoardModule .dashBoard .dashBoardHd {
	border-bottom: 3px solid grey;
	text-align: left;
	margin: 0;
	padding: 15px;
	margin-bottom: 20px;
}

.dashBoard .dashBoardHd h2 {
	display: inline-block;
	margin: 0;
	margin-top: 3px;
}

.dashBoard .dashBoardHd button {
	float: right;
}

.dashBoard .dashBoardArticle {
	width: 100%;
	min-height: 600px;
	overflow: auto;
}

/* =========================================================================== */
/* 검색조건 */
.dashBoard .dashBoardSearch {
	text-align: left;
	margin-bottom: 60px;
	box-shadow: 5px 5px 5px;
	border: 1px solid #dfe1e5;
	box-shadow: 0 .5rem 1rem rgba(0, 0, 0, .15) !important;
	border-radius: 10px;
}

.dashBoard .dashBoardSearch form {
	display: inline-block;
	width: 100%;
	position: relative;
	padding-top: 10px;
	padding-bottom: 10px;
}

.dashBoard .dashBoardSearch .searchTable {
	width: 80%;
	float: left;
}

.dashBoard .dashBoardSearch .searchTable th {
	padding-bottom: 10px;
	padding-top: 10px;
}

.dashBoard .dashBoardSearch .searchTable td {
	padding-bottom: 10px;
	padding-top: 10px;
}

.dashBoard .dashBoardSearch .searchHd {
	width: 10%;
	height: 100%;
	text-align: center;
}

.dashBoard .dashBoardSearch  .searchTable .searchArticle {
	width: 80%;
}

.dashBoard .dashBoardSearch .searchTable .searchArticle .searchReq {
	display: inline-block;
	margin-left: 15px;
}

.dashBoard .dashBoardSearch .searchButton {
	position: absolute;
	width: 10%;
	right: 0;
	bottom: 20px;
}

.dashBoard .dashBoardSearch .searchButton button {
	width: 100px;
	height: 60px;
}

/* =================================================== */

/* 테이블 리스트 */
.dashBoard .dashBoardArticle {
	border: 1px solid #dfe1e5;
	box-shadow: 0 .5rem 1rem rgba(0, 0, 0, .15) !important;
	border-radius: 10px;
	max-height: 560px;
	overflow-y: auto;
	margin-bottom: 80px;
}

.dashBoard .dashBoardArticle table {
	width: 100%;
}

.dashBoard .dashBoardArticle table tr {
	width: 100%;
	height: 50px;
}

.dashBoard .dashBoardArticle table thead {
	border-bottom: 2px solid #dfe1e5;
}

.dashBoard .dashBoardArticle table tbody {
	border-bottom: 1px solid #dfe1e5;
}

.dashBoard .dashBoardArticle table th {
	padding: 0 15px;
}

.dashBoard .dashBoardArticle table td {
	padding: 0 15px;
}

.dashBoard .dashBoardSearch .searchButton button.btn-primary {
	background-color: #7285A5;
	border: none; /* 테두리 제거 */
}

/* ================================================ */
#inter_list {
	width: 150px;
}

#edu_list, #career_list {
	width: 150px;
}

span {
	text-align: left;
}

/* =========================================================================== */
/* 버튼 창 */
.footer {
	position: fixed;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 120px;
    display: none;
    align-items: flex-end;
    justify-content: flex-end;
    background-color: #F0F2FF;
    padding: 10px;
    text-align: center;
    border-top: 1px solid #DAE1FF;
}

.footer .footerBox {
	display: grid;
	grid-template-columns: repeat(3, 110px); /* 2개의 동일한 폭의 칸으로 나눔 */
	grid-template-rows: repeat(1, 90px);
	gap: 20px;
	margin-right: 100px;
}

.footer .footerHd {
	display: flex;
	align-items: center;
	justify-content: right;
	grid-column: span 2; /* 이 요소는 2개의 열을 차지합니다. */
}

.footer span {
	font-size: 28px;
    font-weight: 700;
    font-family: 'Nanum Gothic';
}

.footer .footerButton {
	display: flex;
	align-items: center;
	justify-content: center;
}

.footer button {
	width: 150px;
	height: 70px;
}

.footer .footerButton button.btn-danger {
	background-color: #7285A5;
    border: none;
    font-size: 20px;
    width: 120px;
}


/* =========================================================================== */

/* 부트스트랩 */
</style>

<script type="text/javascript">
	
	
	var checkedCount=0;
	
	//검색 필드
	var name = null;
	var joinStart = null;
	var joinEnd = null; 
	
	
	
	
	
	//검색 필드에 값넣기
	function fieldSearch(){
		
		name = null;
		joinStart = null;
		joinEnd = null;
		
		
		/* var myform = document.form */
		
		name = document.getElementById("nameInput").value;
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
	        url: '/jabusim_Project/admin/userTableSearch/?name=' + name  + '&joinStart=' + joinStart + '&joinEnd=' + joinEnd,
	        success : function(userBeanList) {
	           updateModel(userBeanList);
	           console.log("왜 안돼?");
	          
	        }
	     });
	}
	
	// 결과물 업데이트
	function updateModel(userBeanList){		
		var dynamicHtml  = document.getElementById('searchResultContainer');
		dynamicHtml .innerHTML = '';
		
		for (var i = 0; i < userBeanList.length; i++) {
			var userBean = userBeanList[i];

		    dynamicHtml.innerHTML += "<tr>" +
		        "<th><input type='checkbox' class='checkList' onclick='updateCounter()' value='" + userBean.user_idx + "'></th>" +
		        "<td><span>" + (i + 1) + "</span></td>" +
		        "<td><span>" + userBean.user_role + "</span></td>" +
		        "<td><span>" + userBean.user_name + "</span></td>" +
		        "<td><span>" + userBean.user_id + "</span></td>" +
		        "<td><span>" + userBean.user_birthdate + "</span></td>" +
		        "<td><span>" + userBean.user_phoneNum + "</span></td>" +
		        "<td><span>" + userBean.user_joinDate + "</span></td>" +
		        "<td><span>" + userBean.user_visitCount + "회</span></td>" +
		        "</tr>";
		}
		
		document.getElementById("searchResultContainer").innerHTML = dynamicHtml.innerHTML;
	}
	


	function updateCounter() {
		  // 동일한 ID를 갖는 체크박스를 모두 가져옵니다.
		  var checkboxes = document.querySelectorAll('.checkList');
		  
		  // 체크된 체크박스 수를 세기 위한 변수 초기화
		  checkedCount = 0;
		  
		  
		  
		  
		  // 각 체크박스에 대해 반복하여 체크 상태를 확인하고 카운터를 업데이트합니다.
		  checkboxes.forEach(function(checkbox) {
		    if (checkbox.checked) {
		      checkedCount++;
		    }
		  });
		  
		  var footerHd = document.querySelector('.footerHd span');
		  footerHd.textContent = "총 " + checkedCount + "개 선택";
		  
		  var footer = document.querySelector('.footer');

		  if (checkedCount <= 0) {
		     footer.style.display = 'none'; // 체크된 체크 박스가 없을 때 푸터를 숨김
		  } else {
		     footer.style.display = 'flex'; // 체크된 체크 박스가 있을 때 푸터를 표시
		  }
	}

	function updateCounter() {
		  // 동일한 ID를 갖는 체크박스를 모두 가져옵니다.
		  var checkboxes = document.querySelectorAll('.checkList');
		  
		  // 체크된 체크박스 수를 세기 위한 변수 초기화
		  checkedCount = 0;
	  
		  // 각 체크박스에 대해 반복하여 체크 상태를 확인하고 카운터를 업데이트합니다.
		  checkboxes.forEach(function(checkbox) {
		    if (checkbox.checked) {
		      checkedCount++;
		    }
		  });
		  
		  var footerHd = document.querySelector('.footerHd span');
		  footerHd.textContent = "총 " + checkedCount + "개 선택";
		  
		  var footer = document.querySelector('.footer');

		  if (checkedCount <= 0) {
		     footer.style.display = 'none'; // 체크된 체크 박스가 없을 때 푸터를 숨김
		  } else {
		     footer.style.display = 'flex'; // 체크된 체크 박스가 있을 때 푸터를 표시
		  }
	}	


	
	function deleteList(){
		var deleteConfirmed = confirm("해당 유저를 삭제하시겠습니까?");
		
		if(!deleteConfirmed){
			return;	
		}
		
		
		var checkboxes = document.querySelectorAll('.checkList');
		
		var checkedList = [];
		
		checkboxes.forEach(function(checkbox) {
		    if (checkbox.checked) {
		      checkedList.push(checkbox.value); // 체크된 체크박스의 값을 배열에 추가
		    }
		  });
		
		if(checkedCount>0){
			$.ajax({
		        type : 'GET',
		        url: '/jabusim_Project/admin/userTableDelete/?checkedList=' + checkedList,
		        success : function(result) {
		           console.log("성공");
		           alert("해당 유저를 성공적으로 삭제했습니다");
		           resetCheck();
		           fieldSearch();
		        }
		     });		
		}				
	}
	
	function resetCheck(){	
		checkedCount = 0;
		
		if (checkedCount <= 0) {
		     footer.style.display = 'none'; // 체크된 체크 박스가 없을 때 푸터를 숨김
		} else {
		     footer.style.display = 'flex'; // 체크된 체크 박스가 있을 때 푸터를 표시
		}
	}
	
	
	function checkAll(clickedCheckbox) {
		
	    // 클릭한 체크박스의 상태 가져오기
	    var isChecked = clickedCheckbox.checked;
	    
		if(isChecked){
			checkedCount = 0;
			
			var checkboxes = document.querySelectorAll('.checkList');
		    checkboxes.forEach(function(checkbox) {
		    	checkedCount++;
		    	checkbox.checked = isChecked;
		    });
			
		}
		else{
			var checkboxes = document.querySelectorAll('.checkList');
		    checkboxes.forEach(function(checkbox) {
		    	checkbox.checked = isChecked;
		    });
			
		    checkedCount = 0;
		}
		
		
		var footerHd = document.querySelector('.footerHd span');
		footerHd.textContent = "총 " + checkedCount + "개 선택";
		
		if (checkedCount <= 0) {
		     footer.style.display = 'none'; // 체크된 체크 박스가 없을 때 푸터를 숨김
		} else {
		     footer.style.display = 'flex'; // 체크된 체크 박스가 있을 때 푸터를 표시
		}    
	}
	
	
	
	//==============================================================================
	//상세 모달창
	function getUserInfo(userIdx){
		openModal();
		
		$.ajax({
	        type : 'GET',
	        url: '/jabusim_Project/admin/userTableDelete/?userIdx=' + userIdx,
	        success : function(userBean) {
	           console.log("유저 정보 띄우기 성공");
	        }
	    });
		$.ajax({
	        type : 'GET',
	        url: '/jabusim_Project/admin/userTableDelete/?userIdx=' + userIdx,
	        success : function(userBean) {
	           console.log("보유 경력 정보 띄우기 성공");
	        }
	    });
		$.ajax({
	        type : 'GET',
	        url: '/jabusim_Project/admin/userTableDelete/?userIdx=' + userIdx,
	        success : function(userBean) {
	           console.log("보유 학력 정보 띄우기 성공");
	        }
	    });
		
		$.ajax({
	        type : 'GET',
	        url: '/jabusim_Project/admin/userTableDelete/?userIdx=' + userIdx,
	        success : function(userBean) {
	           console.log("보유 자격증 정보 띄우기 성공");
	        }
	    });	
	}
		
	function openModal() {
	    var modal = document.getElementById('userModalBackground');
	    modal.style.display = 'flex';
	}
		
	function closeModal(){
		var modal = document.getElementById('userModalBackground');
	    modal.style.display = 'none';
	}
	
	function userBean(){
		var modal = document.getElementById('userModalBackground');
	    modal.style.display = 'none';
	}
	
	
</script>

</head>
<body>
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />
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
											<input type="text" id="nameInput" class="form-control"
												placeholder="search" aria-label="Username"
												aria-describedby="basic-addon1">
										</div>
									</td>
								</tr>
								<!-- <tr>
									<th class="searchHd">관심분야</th>
									<td class="searchArticle">
										<div class="form-select">class="searchReq"
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
								</tr> -->
								<tr>
									<th class="searchHd">가입일</th>
									<td class="searchArticle">
										<div class="searchReq">
											<input type="date" id="joinStartInput" MAX=29991231 /> ~ <input
												type="date" id="joinEndInput" MAX=29991231 />
											<!-- max="2077-06-20" -->
										</div>
									</td>
								</tr>
							</table>
							<div class="searchButton">
								<button type="button" onclick="fieldSearch()"
									class="btn btn-primary">검색</button>
							</div>
						</form>
					</div>

					<div class="dashBoardArticle">
						<table>
							<thead>
								<tr>
									<th><input type="checkbox" onclick="checkAll(this)"></th>
									<th><span>no.</span></th>
									<th><span>권한</span></th>
									<th><span>이름</span></th>
									<th><span>아이디</span></th>
									<th><span>생년월일</span></th>
									<th><span>휴대폰번호</span></th>
									<th><span>가입일</span></th>
									<th><span>방문횟수</span></th>
									<th><span></span></th>
								</tr>
							</thead>
							<tbody id="searchResultContainer">
								<c:forEach items="${allUserBeans}" var="userBean"
									varStatus="loopStatus">
									<tr>
										<th><input type="checkbox" class="checkList"
											onclick="updateCounter()" value="${userBean.getUser_idx()}"></th>
										<td><span>${loopStatus.index+1}</span></td>
										<td><span>${userBean.getUser_role()}</span></td>
										<td><span>${userBean.getUser_name()}</span></td>
										<td><span>${userBean.getUser_id()}</span></td>
										<td><span>${userBean.getUser_birthdate()}</span></td>
										<td><span>${userBean.getUser_phoneNum()}</span></td>
										<td><span>${userBean.getUser_joinDate()}</span></td>
										<td><span>${userBean.getUser_visitCount()}회</span></td>
										<%-- 									<td><span><button type="button" onclick="getUserInfo(${userBean.getUser_idx()})">상세정보</button></span></td> --%>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="footer" id="footer">
		<div class="footerBox">
			<div class="footerHd">
				<span>총 ${checkedCount}개 선택</span>
			</div>
			<div class="footerButton">
				<button type="button" onclick="deleteList()" class="btn btn-danger">삭제</button>
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