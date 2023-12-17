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

#resultNothing {
    display: none;
}
/* ================================================ */

#edu_list, #career_list{
	width:200px;
} 

span {
	text-align: left;
}

/* =========================================================================== */
/* 부트스트랩 */
.nav-tabs {
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
    margin-right: 60px; /* span 태그 왼쪽으로 10px 이동 */
    margin-left: -50px; /* 왼쪽으로 10px 이동 */
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
	writing-mode: horizontal-tb;
	border: none; /* 테두리 제거 */
	font-size: 20px;
	width: 250px; /* 버튼의 너비를 넓혀보세요 */
    height: 70px;
    margin: 0 10px; /* 버튼 사이의 여백을 늘리세요 */
}
	

.footer .footerButton button {
    writing-mode: horizontal-tb;
    width: 200px; /* 버튼 너비 조정 */
    height: 70px;
    margin: 0 25px; /* 좌우 여백 조정 */
    white-space: nowrap;
}

.footer .footerButton span {
    display: inline-block;
    margin-right: 10px; /* span 태그 왼쪽으로 10px 이동 */
    margin-left: -50px; /* 왼쪽으로 10px 이동 */
}
	
	

</style>
<script type="text/javascript">

	var checkedCount=0;
	
	//검색 필드
	var name;
	var examName;
	var examSubject;
	
	var examStart;
	var examEnd;
	var resultStart;
	var resultEnd;
	
	var examType = [];
	var resultStatus =[];
	var processStatus=[];
	
	// 검색 필드에 값넣기
	function fieldSearch(){
		
		
		 name=null;
		 examName=null;
		 examSubject=null;
		
		 examStart=null;
		 examEnd=null;
		 resultStart=null;
		 resultEnd=null;
		
		 examType = [];
		 resultStatus =[];
		 processStatus=[];
		
		
		name = document.getElementById("nameInput").value;
		examName = document.getElementById("examNameInput").value;
		examSubject = document.getElementById("examSubjectInput").value;
		
		examStart = document.getElementById("examStartInput").value;
		examEnd = document.getElementById("examEndInput").value;		
		resultStart = document.getElementById("resultStartInput").value;
		resultEnd = document.getElementById("resultEndInput").value;
	   
		$("input[name='examTypeInput']:checked").each(function(i) {
	    	 examType.push($(this).val());
	         console.log("현재 인덱스: " + i);
	     });
	     
	     $("input[name='resultStatusInput']:checked").each(function(i) {
	    	 resultStatus.push($(this).val());    
	     });
   	
	     
	     $("input[name='processStatusInput']:checked").each(function(i) {
	    	 processStatus.push($(this).val());    
	     });
	     
	     
	     tableSearch();
	 }
		
	// ajax 검색
	
	// Ajax 검색
	function tableSearch(){
		$.ajax({
	        type : 'GET',
	        url: '/jabusim_Project/admin/examResultTableSearch/?name=' + name + 
	       			'&examName=' + examName + 
	        		'&examSubject=' + examSubject + 
	        		'&examStart=' + examStart + 
	        		'&examEnd=' + examEnd +
	        		'&resultStart=' + resultStart + 
	        		'&resultEnd=' + resultEnd +
	        		'&examType=' + examType +
	        		'&resultStatus=' + resultStatus +
	        		'&processStatus=' + processStatus,
	        		
	        success : function(examResultBeanList) {
	           console.log("왜 안돼?");
	           updateModel(examResultBeanList);
	        }
	     });
	}
	
	function updateModel(examResultBeanList) {
	    var dynamicHtml = "";
	    var searchResultContainer = document.getElementById('searchResultContainer');

	    for (var i = 0; i < examResultBeanList.length; i++) {
	        var examResultBean = examResultBeanList[i];

	        dynamicHtml += "<tr>" +
	            "<th><input type='checkbox' class='checkList' onclick='updateCounter()' value='" + examResultBean.examResult_idx + "'></th>" +
	            "<td><span>" + (i + 1) + "</span></td>" +
	            "<td><span>" + examResultBean.user_name + "</span></td>" +
	            "<td><span>" + examResultBean.user_id + "</span></td>" +
	            "<td><span>" + examResultBean.exam_name + "</span></td>" +
	            "<td><span>" + examResultBean.exam_subject + "</span></td>" +
	            "<td><span>" + examResultBean.exam_type + "</span></td>" +
	            "<td><span>" + examResultBean.exam_date + "</span></td>" +
	            "<td><span>" + examResultBean.exam_resultDate + "</span></td>" +
	            "<td><span>" + examResultBean.examResult_status + "</span></td>" +
	            "<td><span>" + examResultBean.examResult_processStatus + "</span></td>" +
	            "</tr>";
	    }

	    searchResultContainer.innerHTML = dynamicHtml;
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
		        url: '/jabusim_Project/admin/examResultTableDelete/?checkedList=' + checkedList,
		        success : function(result) {
		           console.log("성공");
		           alert("해당 시험결과를 성공적으로 삭제했습니다");
		           resetCheck();
		           fieldSearch();
		        }
		     });		
		}				
	}
	
	function updateList(status){
		
		if(status==='합격'){
			var updateConfirmed = confirm("해당 시험를 합격하시겠습니까?\n(처리완료 중인 시험은 변경 불가능)");
			
			if(!updateConfirmed){
				alert("합격처리가 취소되었습니다.");
				return;	
			}		
		}
		else if(status==='불합격'){
			var updateConfirmed = confirm("해당 시험를 불합격하시겠습니까?\n(처리완료 중인 시험은 변경 불가능) ");
			
			if(!updateConfirmed){
				alert("불합격 처리가 취소되었습니다.");
				return;	
			}		
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
		        url: '/jabusim_Project/admin/examResultTableUpdate/?checkedList=' + checkedList + 
		        '&status=' + status,
		        success : function(result) {
		           console.log("성공");
		           alert("수정했습니다");
		           resetCheck();
		           fieldSearch();
		        }
		     });		
		}				
	}
	
	function processList(status){
		
		if(status==='처리완료'){
			var updateConfirmed = confirm("해당 시험를 처리완료하시겠습니까?\n(미처리된 시험은 처리완료 불가능)");
			
			if(!updateConfirmed){
				alert("처리완료가 취소되었습니다.");
				return;	
			}		
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
		        url: '/jabusim_Project/admin/examResultTableProcess/?checkedList=' + checkedList + 
		        '&status=' + status,
		        success : function(result) {
		           console.log("성공");
		           alert("수정했습니다");
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
	<c:import url="/WEB-INF/views/include/top_menu.jsp"/>
	<c:import url="/WEB-INF/views/include/admin_sideMenu.jsp" />

	<div class="pageContainer">

		<div class="article">
			<div class="module" id="dashBoardModule">
				<div class="dashBoard">
					<div class="dashBoardHd">
						<h2>시험 결과 관리</h2>
					</div>
					<ul class="nav nav-tabs">
						<li class="nav-item">					
							<a class="nav-link" href="${root}adminPage/examManage/examManage">시험관리</a>		
						</li>
						<li class="nav-item">
							<a class="nav-link" href="${root}adminPage/examManage/examPlaceManage">시험장소</a>			
						</li>
						<li class="nav-item">
							<a class="nav-link" href="${root}adminPage/examManage/examReceiptManage">시험접수</a>			
						</li>
						<li class="nav-item">
							<a class="nav-link active" aria-current="page" href="#" style="border: 1px solid #dfe1e5; border-bottom: 1px solid transparent">시험결과</a>			
						</li>	
					</ul>				
					<div class="dashBoardSearch">
						<form action="">
							<table class="searchTable">
								<tr>
									<th class="searchHd">구분</th>
									<td class="searchArticle">
										<div class="searchReq">
											<input type="checkbox" value="필기" name="examTypeInput" /> 필기
										</div>
										<div class="searchReq">
											<input type="checkbox" value="실기" name="examTypeInput" /> 실기
										</div>
									</td>
								</tr>
								<tr>
									<th class="searchHd">시험일</th>
									<td class="searchArticle">
										<div class="searchReq">
											<input type="date" id="examStartInput" /> ~
											<input type="date" id="examEndInput"/> <!-- max="2077-06-20" -->
										</div>	
									</td>
								</tr>
								<tr>
									<th class="searchHd">결과발표일</th>
									<td class="searchArticle">
										<div class="searchReq">
											<input type="date" id="resultStartInput" /> ~
											<input type="date" id="resultEndInput"/> <!-- max="2077-06-20" -->
										</div>	
									</td>
								</tr>
								<tr>
									<th class="searchHd">합격여부</th>
									<td class="searchArticle">
										<div class="searchReq">
											<input type="checkbox" value="입력불가" name="resultStatusInput" /> 입력불가
										</div>							
										<div class="searchReq">
											<input type="checkbox" value="미입력" name="resultStatusInput" /> 미입력
										</div>
										<div class="searchReq">
											<input type="checkbox" value="합격" name="resultStatusInput" /> 합격/합격예정
										</div>
										<div class="searchReq">
											<input type="checkbox" value="불합격" name="resultStatusInput" /> 불합격/불합격예정
										</div>							
									</td>
								</tr>
								<tr>
									<th class="searchHd">처리상태</th>
									<td class="searchArticle">
										<div class="searchReq">
											<input type="checkbox" value="미처리" name="processStatusInput" /> 미처리
										</div>
										<div class="searchReq">
											<input type="checkbox" value="처리가능" name="processStatusInput" /> 처리가능
										</div>
										<div class="searchReq">
											<input type="checkbox" value="처리완료" name="processStatusInput" /> 처리완료
										</div>							
									</td>
								</tr>
								<tr>
									<th class="searchHd">응시종목</th>
									<td class="searchArticle">
										<div class="searchReq">
											<input type="text" id="examSubjectInput" 
												class="form-control" placeholder="search" 
												aria-label="Username" aria-describedby="basic-addon1">
										</div>
									</td>
								</tr>
								<tr>
									<th class="searchHd">시험명</th>
									<td class="searchArticle">
										<div class="searchReq">
											<input type="text" id="examNameInput" 
												class="form-control" placeholder="search" 
												aria-label="Username" aria-describedby="basic-addon1">
										</div>						
									</td>
								</tr>
								<tr>
									<th class="searchHd">응시자</th>
									<td class="searchArticle">
										<div class="searchReq">
											<input type="text" id="nameInput" 
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
					
					<div class="dashBoardArticle">
						<table>
							<thead>
								<tr>
									<th><input type="checkbox" onclick="checkAll(this) "></th>
									<th><span>no.</span></th>
									<th><span>응시자</span></th>
									<th><span>응시자ID</span></th>
									<th><span>시험</span></th>
									<th><span>응시과목</span></th>
									<th><span>구분</span></th>
									<th><span>시험일</span></th>
									<th><span>결과발표일</span></th>
									<th><span>합격여부</span></th>
									<th><span>처리상태</span></th>
									<th><span></span></th>
								</tr>
							</thead>
							<tbody id="searchResultContainer">
								<c:forEach items="${allExamResultBeans}" var="examResultBean" varStatus="loopStatus">
									<tr>
										<th><input type="checkbox" class="checkList" onclick="updateCounter()" value="${examResultBean.examResult_idx}"/></th>
										<td><span>${loopStatus.index+1}</span></td>
										<td><span>${examResultBean.user_name}</span></td>
										<td><span>${examResultBean.user_id}</span></td>
										<td><span>${examResultBean.exam_name}</span></td>
										<td><span>${examResultBean.exam_subject}</span></td>
										<td><span>${examResultBean.exam_type}</span></td>				
										<td><span>${examResultBean.exam_date}</span></td>					
										<td><span>${examResultBean.exam_resultDate}</span></td>					
										<td><span>${examResultBean.examResult_status}</span></td>		
										<td><span>${examResultBean.examResult_processStatus}</span></td>		
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
				<button type="button" onclick="updateList('합격')" class="btn btn-danger">합격</button>
				<button type="button" onclick="updateList('불합격')" class="btn btn-danger">불합격</button>
				<button type="button" onclick="processList('처리완료')" class="btn btn-danger">처리완료</button>
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