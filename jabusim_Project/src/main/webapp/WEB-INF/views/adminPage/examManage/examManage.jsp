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
	margin-bottom : 60px; 
	border-top: none;
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

/* =========================================================================== */
	/* 버튼 창 */
	.footer{
		position: fixed;
        bottom: 0;
       	left: 0;
        width: 100%;
        height:120px;
        display: none;
	    align-items: flex-end; /* 수직 방향으로 가운데 정렬 */
  		justify-content: flex-end;
        background-color: #f1f1f1; /* 배경색 설정 */
        padding: 10px; /* 필요에 따라 여백 설정 */
        text-align: center; /* 텍스트 중앙 정렬 */
	}
	
	
	.footer .footerBox{
		display: grid;
        grid-template-columns: repeat(2, 180px); /* 2개의 동일한 폭의 칸으로 나눔 */
        grid-template-rows: repeat(1, 90px);
        gap: 20px;
        margin-right: 100px;
	}
	
	
	.footer .footerHd{
		display: flex;
		align-items: center;
	    justify-content: center;
	}
	
	.footer span{
		font-size: 30px;
	}
	
	
	.footer .footerButton{
		display: flex;
		align-items: center;
	    justify-content: center;
	}
	
	
	.footer button{
		width : 150px;
		height: 70px;
	}


</style>
<script type="text/javascript">

	var checkedCount=0;
	
	//검색 필드
	var examName;
	var examType = [];
	var exmaLicenseType =[];
	var examYear;
	var examRound = [];
	var receiptStart;
	var receiptEnd;
	var examStart;
	var examEnd;
	var examStatus =[];

	
	// 검색 필드에 값넣기
	 function fieldSearch(){
			
		examName = null;		
		examYear = null;	
		receiptStart = null;
		receiptEnd = null;
		examStart = null;
		examEnd = null;
		
		
		examType = [];
		exmaLicenseType = [];
		examRound = [];
		examStatus = [];

		examName = document.getElementById("examNameInput").value;
		examYear = document.getElementById("examYearInput").value;
		receiptStart = document.getElementById("receiptStartInput").value;
		receiptEnd = document.getElementById("receiptEndInput").value;
		examStart = document.getElementById("examStartInput").value;
		examEnd = document.getElementById("examEndInput").value;


		$("input[name='examTypeInput']:checked").each(function(i) {
			examType.push($(this).val());
		});

		$("input[name='exmaLicenseTypeInput']:checked").each(function(i) {
			exmaLicenseType.push($(this).val());
		});
		$("input[name='examRoundInput']:checked").each(function(i) {
			examRound.push($(this).val());
		});
		$("input[name='examStatusInput']:checked").each(function(i) {
			examStatus.push($(this).val());
		});

		var receiptStartDate = new Date(receiptStart); // 여기도 동일하게 수정
		var receiptEndDate = new Date(receiptEnd);

		var examStartDate = new Date(examStart);
		var examEndDate = new Date(examEnd);

		if (receiptStartDate > receiptEndDate) {
			alert("접수기간 범위을 제대로 기입해주세요");
		} else if (examStartDate > examEndDate) {
			alert("시험기간 범위을 제대로 기입해주세요");
		} else {
			//ajax 검색
			tableSearch();
		}
	}


	// Ajax 검색
	function tableSearch() {
		$.ajax({
					type : 'GET',
					url : '/jabusim_Project/admin/examTableSearch/?examName='
							+ examName + '&examType=' + examType
							+ '&exmaLicenseType=' + exmaLicenseType
							+ '&examYear=' + examYear + '&examRound='
							+ examRound + '&receiptStart=' + receiptStart
							+ '&receiptEnd=' + receiptEnd + '&examStart='
							+ examStart + '&examEnd=' + examEnd
							+ '&examStatus=' + examStatus,
					success : function(examBeanList) {
						console.log("왜 안돼?");
						updateModel(examBeanList);
					}
				});
	}

	function updateModel(examBeanList) {
	    // 동적으로 HTML을 변경할 컨테이너 요소를 가져옵니다.
	    var dynamicHtml = document.getElementById('searchResultContainer');
	    // 컨테이너의 내부 HTML을 초기화합니다.
	    dynamicHtml.innerHTML = '';

	    // 시험 빈 목록을 순회하면서 HTML을 동적으로 생성합니다.
	    for (var i = 0; i < examBeanList.length; i++) {
	        var examBean = examBeanList[i];

	        // 생성한 HTML을 dynamicHtml에 추가합니다.
	        dynamicHtml.innerHTML += "<tr>" +
	            "<th><input type='checkbox' class='checkList' onclick='updateCounter()' value='" + examBean.exam_idx + "' ></th>" +
	            "<td><span>" + (i + 1) + "</span></td>" +
	            "<td><span>" + examBean.exam_name + "</span></td>" +
	            "<td><span>" + examBean.exam_year + "</span></td>" +
	            "<td><span>" + examBean.exam_round + "</span></td>" +
	            "<td><span>" + examBean.exam_type + "</span></td>" +
	            "<td><span>" + examBean.exam_licenseType + "</span></td>" +
	            "<td><span>" + examBean.exam_receiptStartDate + "</span></td>" +
	            "<td><span>" + examBean.exam_receiptEndDate + "</span></td>" +
	            "<td><span>" + examBean.exam_date + "</span></td>" +
	            "<td><span>" + examBean.exam_resultDate + "</span></td>" +
	            "<td><span>" + examBean.exam_status + "</span></td></tr>";
	    }

	    // 완성된 HTML을 컨테이너에 적용합니다.
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
		        url: '/jabusim_Project/admin/examTableDelete/?checkedList=' + checkedList,
		        success : function(result) {
		           console.log("성공");
		           alert("삭제했습니다");
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

	<c:import url="/WEB-INF/views/include/admin_sideMenu.jsp" />

	<div class="pageContainer">

		<div class="article">
			<div class="module" id="dashBoardModule">
				<div class="dashBoard">
					<div class="dashBoardHd">
						<h2>시험 관리</h2>
					</div>
					<ul class="nav nav-tabs">
						<li class="nav-item">
							<a class="nav-link active" aria-current="page" href="#">시험관리</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="${root}adminPage/examManage/examPlaceManage">시험장소</a>				
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
									<th class="searchHd">자격증계열</th>
									<td class="searchArticle">
										<div class="searchReq">
											<input type="checkbox" value="기술사"name="exmaLicenseTypeInput" /> 기술사
										</div>
										<div class="searchReq">
											<input type="checkbox" value="기능장" name="exmaLicenseTypeInput" /> 기능장       
										</div>
										<div class="searchReq">
											<input type="checkbox" value="기사" name="exmaLicenseTypeInput" /> 기사       
										</div>
										<div class="searchReq">
											<input type="checkbox" value="기능사" name="exmaLicenseTypeInput" /> 기능사       
										</div>
									</td>
								</tr>
								<tr>
									<th class="searchHd">회차</th>
									<td class="searchArticle">
										<div class="searchReq">
											<input type="checkbox" value="1" name="examRoundInput" /> 1회
										</div>
										<div class="searchReq">
											<input type="checkbox" value="2" name="examRoundInput" /> 2회
										</div>
										<div class="searchReq">
											<input type="checkbox" value="3" name="examRoundInput" /> 3회
										</div>
									</td>
								</tr>
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
									<th class="searchHd">년도</th>
									<td class="searchArticle">
										<div class="searchReq">
											<input type="text" id="examYearInput" min="1900" max="2100"/>
										</div>						
									</td>
								</tr>
								
								<tr>
									<th class="searchHd">접수일</th>
									<td class="searchArticle">
										<div class="searchReq">
											<input type="date" id="receiptStartInput"/> ~
											<input type="date" id="receiptEndInput"/> <!-- max="2077-06-20" -->
										</div>	
									</td>
								</tr>
								<tr>
									<th class="searchHd">시험일</th>
									<td class="searchArticle">
										<div class="searchReq">
											<input type="date" id="examStartInput"/> ~
											<input type="date" id="examEndInput"/> <!-- max="2077-06-20" -->
										</div>	
									</td>
								</tr>
								<tr>
									<th class="searchHd">상태</th>
									<td class="searchArticle">
										<div class="searchReq">
											<input type="checkbox" value="일반" name="examStatusInput" /> 일반
										</div>
										<div class="searchReq">
											<input type="checkbox" value="접수중" name="examStatusInput" /> 접수중
										</div>
										<div class="searchReq">
											<input type="checkbox" value="접수예정" name="examStatusInput" /> 접수예정
										</div>
										<div class="searchReq">
											<input type="checkbox" value="시험예정" name="examStatusInput" /> 시험예정
										</div>
										<div class="searchReq">
											<input type="checkbox" value="시험일" name="examStatusInput" /> 시험일
										</div>
									</td>
								</tr>
								<tr>
									<th class="searchHd">시험명</th>
									<td class="searchArticle">
										<div class="searchReq">
											<input type="text" id="examNameInput"/>
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
									<th><input type="checkbox" onclick="checkAll(this)"></th>
									<th><span>no.</span></th>
									<th><span>시험명</span></th>
									<th><span>연도</span></th>
									<th><span>회차</span></th>
									<th><span>구분</span></th>
									<th><span>계열</span></th>
									<th><span>접수시작일</span></th>
									<th><span>접수마감일</span></th>
									<th><span>시험일</span></th>
									<th><span>결과발표일</span></th>
									<th><span>상태</span></th>
									<th><span></span></th>
								</tr>
							</thead>
							<tbody id="searchResultContainer">
								<c:forEach items="${allExamBeans}" var="examBean" varStatus="loopStatus">
									<tr>
										<th><input type="checkbox"  class="checkList"  onclick="updateCounter()" value="${examBean.getExam_idx()}"/></th>
										<td><span>${loopStatus.index+1}</span></td>
										<td><span>${examBean.getExam_name()}</span></td>
										<td><span>${examBean.getExam_year()}</span></td>
										<td><span>${examBean.getExam_round()}</span></td>
										<td><span>${examBean.getExam_type()}</span></td>
										<td><span>${examBean.getExam_licenseType()}</span></td>
										<td><span>${examBean.getExam_receiptStartDate()}</span></td>
										<td><span>${examBean.getExam_receiptEndDate()}</span></td>					
										<td><span>${examBean.getExam_date()}</span></td>					
										<td><span>${examBean.getExam_resultDate()}</span></td>					
										<td><span>${examBean.getExam_status()}</span></td>		
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
				<button type="button" onclick="deleteList()">삭제</button>
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