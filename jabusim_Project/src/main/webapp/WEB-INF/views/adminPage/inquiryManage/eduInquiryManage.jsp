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
        grid-template-columns: repeat(2, 200px); /* 2개의 동일한 폭의 칸으로 나눔 */
        grid-template-rows: repeat(1, 90px);
        gap: 5px;
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
	var name;
	var inquriyStart;
	var inquriyEnd;

	var eudList = [];
	var processStatus =[];
	
	//검색 필드에 값넣기
	function fieldSearch(){
		
		/* var myform = document.form */
		name = null;
		inquriyStart = null;
		inquriyEnd = null;

		eudList = [];
		processStatus =[];
		
		
		name = document.getElementById("nameInput").value;
		inquriyStart = document.getElementById("inquriyStartInput").value;
		inquriyEnd = document.getElementById("inquriyEndInput").value;

				
		$("input[name='processStatusInput']:checked").each(function(i) {
			processStatus.push($(this).val());
			console.log("현재 인덱스: " + i);
		});
		
		
		$("input[name='eudListInput']:checked").each(function(i) {
			eudList.push($(this).val());	    
		});
		
		

		//ajax 검색
		tableSearch();

	}
		
	// ajax 검색
	
	function tableSearch(){
		$.ajax({
	        type : 'GET',
	        url: '/jabusim_Project/admin/userEduTableSearch/?name=' + name + 
	        		'&inquriyStart=' + inquriyStart + 
	        		'&inquriyEnd=' + inquriyEnd + 
	        		'&processStatus=' + processStatus +
	        		'&eudList=' + eudList,
	        success : function(userEduBeanList) {
	           console.log("왜 안돼?");
	           updateModel(userEduBeanList);
	        }
	     });
	}
	
	function updateModel(userEduBeanList){
		
		var dynamicHtml  = document.getElementById('searchResultContainer');
		dynamicHtml .innerHTML = '';
		
		for (var i = 0; i < userEduBeanList.length; i++) {
			var userEduBean = userEduBeanList[i];

			 dynamicHtml.innerHTML += "<tr>" +
		        "<th><input type='checkbox' class='checkList' onclick='updateCounter()' value='" + userEduBean.userEdu_idx + "' ></th>" +
		        "<td><span>" + (i + 1) + "</span></td>" +
		        "<td><span>" + userEduBean.user_name + "</span></td>" +
		        "<td><span>" + userEduBean.user_id + "</span></td>" +
		        "<td><span>" + userEduBean.userEdu_type + "</span></td>" +
		        "<td><span>" + (userEduBean.userEdu_academy ? userEduBean.userEdu_academy : "없음") + "</span></td>" +
		        "<td><span>" + (userEduBean.userEdu_major ? userEduBean.userEdu_major : "없음") + "</span></td>" +
		        "<td><span>" + userEduBean.userEdu_inquiryDate + "</span></td>" +
		        "<td><span>" + userEduBean.userEdu_processStatus + "</span></td></tr>";
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
		        url: '/jabusim_Project/admin/userEduTableDelete/?checkedList=' + checkedList,
		        success : function(result) {
		           console.log("성공");
		           alert("삭제했습니다");
		           resetCheck();
		           fieldSearch();
		        }
		     });		
		}				
	}
	
	
	function updateList(status){
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
		        url: '/jabusim_Project/admin/userEduTableUpdate/?checkedList=' + checkedList + 
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
						<a class="nav-link active" aria-current="page" href="#">학력문의</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="${root}adminPage/inquiryManage/carrerInquiryManage">경력문의</a>				
						</li>
					</ul>
					<div class="dashBoardSearch">
						<form action="">
							<table class="searchTable">
								<tr>
									<th class="searchHd">학력구분</th>
									<td class="searchArticle">
										<div class="searchReq">
											<input type="checkbox" value="고등학교 졸업 이하" name="eudListInput" /> 고등학교 졸업 이하
										</div>
										<div class="searchReq">
											<input type="checkbox" value="고졸 검정고시" name="eudListInput" /> 고졸 검정고시
										</div> <br>
										<div class="searchReq">
											<input type="checkbox" value="평생교육진흥원 인정학점(81학점 이상)" name="eudListInput" /> 평생교육진흥원 인정학점(81학점 이상)
										</div>
										<div class="searchReq">
											<input type="checkbox" value="평생교육진흥원 인정학점(106학점 이상)" name="eudListInput" /> 평생교육진흥원 인정학점(106학점 이상)
										</div> <br>
										<div class="searchReq">
											<input type="checkbox" value="학사학위" name="eudListInput" /> 학사학위
										</div>
										<div class="searchReq">
											<input type="checkbox" value="석사학위" name="eudListInput" /> 석사학위
										</div>
										<div class="searchReq">
											<input type="checkbox" value="박사학위" name="eudListInput" /> 박사학위
										</div>
									</td>
								</tr>
								<tr>
									<th class="searchHd">문의날짜</th>
									<td class="searchArticle">
										<div class="searchReq">
											<input type="date" id="inquriyStartInput"/> ~ 
											<input type="date" id="inquriyEndInput"/>
											<!-- max="2077-06-20" -->
										</div>
									</td>
								</tr>
								<tr>
									<th class="searchHd">처리상태</th>
									<td class="searchArticle">
										<div class="searchReq">
											<input type="checkbox" value="수락완료"  name="processStatusInput" /> 수락완료
										</div>
										<div class="searchReq">
											<input type="checkbox" value="거절완료" name="processStatusInput" /> 거절완료
										</div>
										<div class="searchReq">
											<input type="checkbox" value="대기" name="processStatusInput" /> 대기
										</div>
									</td>
								</tr>
								<tr>
									<th class="searchHd">이름검색</th>
									<td class="searchArticle">
										<div class="searchReq">
											<input type="text" id="nameInput"/>
										</div>
									</td>
								</tr>

							</table>
							<div class="searchButton">
								<button type="button" onclick="fieldSearch()">검색</button>
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
									<th><span>이름</span></th>
									<th><span>아이디</span></th>
									<th><span>학력구분</span></th>									
									<th><span>학교기관명</span></th>									
									<th><span>학과/전공</span></th>
									<th><span>문의날짜</span></th>
									<th><span>처리상태</span></th>						
								</tr>
							</thead>
							<tbody id="searchResultContainer">
								<c:forEach items="${allUserEduBeans}" var="userEduBean" varStatus="loopStatus">
									<tr>
										<th><input type="checkbox" class='checkList' onclick="updateCounter()" value="${userEduBean.getUserEdu_idx()}" ></th>
										<td><span>${loopStatus.index + 1}</span></td>
										<td><span>${userEduBean.getUser_name()}</span></td>
										<td><span>${userEduBean.getUser_id()}</span></td>
										<td><span>${userEduBean.getUserEdu_type()}</span></td>
																		
										<c:choose>
											<c:when test="${userEduBean.getUserEdu_academy()==null}">
												<td><span>없음</span></td>
											</c:when>
											<c:otherwise>
												<td><span>${userEduBean.getUserEdu_academy()}</span></td>
											</c:otherwise>
										</c:choose>	
										<c:choose>
											<c:when test="${userEduBean.getUserEdu_major()==null}">
												<td><span>없음</span></td>
											</c:when>
											<c:otherwise>
												<td><span>${userEduBean.getUserEdu_major()}</span></td>
											</c:otherwise>
										</c:choose>	
										
										<td><span>${userEduBean.getUserEdu_inquiryDate()}</span></td>										
										
										<td><span>${userEduBean.getUserEdu_processStatus()}</span></td> 		
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="dashBoardFooter">
						
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
				<button type="button" onclick="updateList('수락완료')">수락</button>
				<button type="button" onclick="updateList('거절완료')">거절</button>
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