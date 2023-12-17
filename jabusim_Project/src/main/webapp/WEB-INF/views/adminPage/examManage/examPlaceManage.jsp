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
	padding-bottom: 50px;
}

.article {
	display: inline-block;
	width: 100%;
	margin: 0 auto;
	/* border: 1px solid black;*/
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
	border: 1px solid #dfe1e5;
	margin-bottom : 60px;
	box-shadow: 0 .5rem 1rem rgba(0,0,0,.15)!important;
	border-radius: 10px;
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
	border: 1px solid #dfe1e5;
	box-shadow: 0 .5rem 1rem rgba(0,0,0,.15)!important;
	border-radius: 10px;
	max-height: 560px; /* 원하는 최대 높이 설정 */
  	overflow-y: auto; /* 세로 스크롤 활성화 */
  	margin-bottom: 80px;
}

.dashBoard .dashBoardArticle table {
	width:100%;
}

.dashBoard .dashBoardArticle table tr{
	width:100%;
	height: 50px;
}

.dashBoard .dashBoardArticle table thead{
	border-bottom: 2px solid #dfe1e5;
}

.dashBoard .dashBoardArticle table tbody{
	border-bottom: 1px solid #dfe1e5;
}

.dashBoard .dashBoardArticle table th{
	padding: 0 15px;
}

.dashBoard .dashBoardArticle table td{
	padding: 0 15px;
}

.dashBoard .dashBoardSearch .searchButton button.btn-primary {
  background-color: #7285A5; 
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
    /* border-bottom: 1px solid #dfe1e5; */
    border:none;
}

.nav-tabs .nav-link.active {
	border-color: black black #fff;
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
	grid-template-columns: repeat(2, 200px); /* 2개의 동일한 폭의 칸으로 나눔 */
	grid-template-rows: repeat(1, 90px);
	gap: 20px;
	margin-right: 100px;
}

.footer .footerHd {
	display: flex;
	align-items: center;
	justify-content: center;
}

.footer span {
	font-size: 30px;
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
	background-color: #7285A5; /* 파란색 배경 */
	border: none; /* 테두리 제거 */
	font-size: 20px;
}

</style>

<script type="text/javascript">
	
	var checkedCount=0;

	
	//검색 필드
	var placeName;
	var placeRegion;
	var placeAddress;
	var placeNumStart;
	var placeNumEnd;

	// 검색 필드에 값넣기
	 function fieldSearch(){
		 placeName = null;
		 placeRegion = null;  // 여기를 변경하려는 변수명으로 수정해야 합니다.
		 placeAddress = null;
		 placeNumStart = null;
		 placeNumEnd = null;

		 placeName = document.getElementById("placeNameInput").value;
	     placeAddress = document.getElementById("placeAddressInput").value;

	     // select 태그의 DOM 요소 가져오기
	     var selectElement = document.getElementById("placeRegionInput");
	     placeRegion = selectElement.value;
	     
	   
	     //ajax 검색
	     tableSearch();
	     
	 }
		
	// ajax 검색
	
	// Ajax 검색
	function tableSearch(){
		$.ajax({
	        type : 'GET',
	        url: '/jabusim_Project/admin/examPlaceTableSearch/?placeName=' + placeName + 
	        		'&placeRegion=' + placeRegion + 
	        		'&placeAddress=' + placeAddress + 
	        		'&placeNumStart=' + placeNumStart +
	        		'&placeNumEnd=' + placeNumEnd,
	        success : function(allExamPlaceBeans) {
	           console.log("왜 안돼?");
	           updateModel(allExamPlaceBeans);
	        }
	     });
	}
	
	function updateModel(allExamPlaceBeans) {
	    var dynamicHtml = document.getElementById('searchResultContainer');
	    dynamicHtml.innerHTML = '';

	    for (var i = 0; i < allExamPlaceBeans.length; i++) {
	        var examPlaceBean = allExamPlaceBeans[i];

	        dynamicHtml.innerHTML += "<tr>" +
	            "<th><input type='checkbox' class='checkList' onclick='updateCounter()' value='" + examPlaceBean.examPlace_idx + "' ></th>" +
	            "<td><span>" + (i + 1) + "</span></td>" +
	            "<td><span>" + examPlaceBean.examPlace_name + "</span></td>" +
	            "<td><span>" + examPlaceBean.examPlace_region + "</span></td>" +
	            "<td><span>" + examPlaceBean.examPlace_address + "</span></td>" +
	            "<td><span>" + examPlaceBean.examPlace_maximum + "</span></td></tr>";
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
		
		var deleteConfirmed = confirm("해당 시험장소를 삭제하시겠습니까?");
		
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
		        url: '/jabusim_Project/admin/examPlaceTableDelete/?checkedList=' + checkedList,
		        success : function(result) {
		           console.log("성공");
		           alert("해당 장소를 성공적으로 삭제했습니다");
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
						<h2>시험 장소 관리</h2>
					</div>
					<ul class="nav nav-tabs">
						<li class="nav-item">					
							<a class="nav-link" href="${root}adminPage/examManage/examManage">시험관리</a>		
						</li>
						<li class="nav-item">
							<a class="nav-link active" aria-current="page" href="#" style="border: 1px solid #dfe1e5; border-bottom: 1px solid transparent">시험장소</a>			
						</li>
						<li class="nav-item">
							<a class="nav-link" href="${root}adminPage/examManage/examReceiptManage">시험접수</a>				
						</li>
						<li class="nav-item">
							<a class="nav-link" href="${root}adminPage/examManage/examResultManage">시험결과</a>				
						</li>	
					</ul>				
					<div class="dashBoardSearch">
						<form action="">
							<table class="searchTable">
								<tr>
									<th class="searchHd">지역구</th>
									<td class="searchArticle">
										<div class="searchReq">
											<select id="placeRegionInput">
												<option value="">선택해주세요</option>
												<option value="서울">서울</option>
												<option value="부산">부산</option>
												<option value="대구">대구</option>
												<option value="인천">인천</option>
												<option value="광주">광주</option>
												<option value="충남">충남</option>
												<option value="울산">울산</option>
												<option value="경기">경기</option>
												<option value="강원">강원</option>
												<option value="충북">충북</option>
												<option value="대전">대전</option>
												<option value="전북">전북</option>
												<option value="전남">전남</option>
												<option value="경북">경북</option>
												<option value="경남">경남</option>
												<option value="제주">제주</option>
											</select>
										</div>
									</td>
								</tr>
								<tr>
									<th class="searchHd">주소명</th>
									<td class="searchArticle">
										<div class="searchReq">
											<input type="text" id="placeAddressInput" 
												class="form-control" placeholder="search" 
												aria-label="Username" aria-describedby="basic-addon1">
										</div>						
									</td>
								</tr>							
								<tr>
									<th class="searchHd">장소명</th>
									<td class="searchArticle">
										<div class="searchReq">
											<input type="text" id="placeNameInput" 
												class="form-control" placeholder="search" 
												aria-label="Username" aria-describedby="basic-addon1">
										</div>						
									</td>
								</tr>							
							</table>
							<div class="searchButton">
								<button type="button" onclick="fieldSearch()" class="btn btn-primary">검색</button>
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
									<th><input type="checkbox" onclick="checkAll(this)"></th>
									<th><span>no.</span></th>
									<th><span>장소명</span></th>
									<th><span>지역구</span></th>
									<th><span>주소</span></th>
									<th><span>최대수용인</span></th>
									<th><span></span></th>
								</tr>
							</thead>
							<tbody id="searchResultContainer">
								<c:forEach items="${allExamPlaceBeans}" var="examPlaceBean" varStatus="loopStatus">
									<tr>
										<th><input type="checkbox" class="checkList"  onclick="updateCounter()"  value="${examPlaceBean.getExamPlace_idx()}" ></th>
										<td><span>${loopStatus.index + 1}</span></td>
										<td><span>${examPlaceBean.getExamPlace_name()}</span></td>
										<td><span>${examPlaceBean.getExamPlace_region()}</span></td>
										<td><span>${examPlaceBean.getExamPlace_address()}</span></td>
										<td><span>${examPlaceBean.getExamPlace_maximum()}</span></td> 		
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