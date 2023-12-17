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
	float: left;
	margin-left: 250px;
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
}

.dashBoard .dashBoardHd {
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
	
	margin-bottom : 60px; 
	border-top: none;
	/* box-shadow: 5px 5px 5px; */
	border: 1px solid #dfe1e5;
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
	max-height: 560px;
  	overflow-y: auto; 
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

/* =========================================================================== */
	/* 버튼 창 */
	.footer {
	position: fixed;
	bottom: 0;
	left: 0;
	width: 100%;
	height: 120px;
	display: none;
	align-items: flex-end; /* 수직 방향으로 가운데 정렬 */
	justify-content: flex-end;
	background-color: #DCDCDC; /* 배경색 설정 */
	padding: 10px; /* 필요에 따라 여백 설정 */
	text-align: center; /* 텍스트 중앙 정렬 */
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
	var licenseName;
	var licenseType = [];
	var licenseMainCategory;
	var licenseSubCategory;
	
	//검색 필드에 값넣기
	function fieldSearch(){
		
		/* var myform = document.form */
		
		licenseName = null;		
		licenseMainCategory = null;
		licenseSubCategory = null;
		
		licenseType = [];
		
		licenseName = document.getElementById("licenseNameInput").value;
		
		// select 태그의 DOM 요소 가져오기
	    var mainCategoryElement = document.getElementById("mainCategoryInput");
	    licenseMainCategory = mainCategoryElement.value;
	    
	    var subCategoryElement = document.getElementById("subCategoryInput");
	    licenseSubCategory = subCategoryElement.value;
      
		
		$("input[name='licenseTypeInput']:checked").each(function(i) {
			licenseType.push($(this).val());	    
		});
		
	
		//ajax 검색
		tableSearch();
		
	}
		
	// ajax 검색
	
	function tableSearch(){
		$.ajax({
	        type : 'GET',
	        url: '/jabusim_Project/admin/licenseTableSearch/?licenseName=' + licenseName + 
	        		'&licenseType=' + licenseType + 
	        		'&licenseMainCategory=' + licenseMainCategory + 
	        		'&licenseSubCategory=' + licenseSubCategory,
	        success : function(licenseBeanList) {
	           console.log("왜 안돼?");
	           updateModel(licenseBeanList);
	        }
	     });
	}
	
	function updateModel(licenseBeanList) {
	    var dynamicHtml = document.getElementById('searchResultContainer');
	    dynamicHtml.innerHTML = '';

	    for (var i = 0; i < licenseBeanList.length; i++) {
	        var licenseBean = licenseBeanList[i];

	        dynamicHtml.innerHTML += "<tr>" +
	            "<th><input type='checkbox' class='checkList' onclick='updateCounter()' value='" + licenseBean.license_idx + "' ></th>" +
	            "<td><span>" + (i + 1) + "</span></td>" +
	            "<td><span>" + licenseBean.license_name + "</span></td>" +
	            "<td><span>" + licenseBean.license_type + "</span></td>" +
	            "<td><span>" + licenseBean.license_mainCategory + "</span></td>" +
	            "<td><span>" + licenseBean.license_subCategory + "</span></td>" +
	            "<td><span>" + licenseBean.license_info + "</span></td></tr>";
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
		
		var deleteConfirmed = confirm("해당 자격증을 삭제하시겠습니까?");
		
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
		        url: '/jabusim_Project/admin/LicenseTableDelete/?checkedList=' + checkedList,
		        success : function(result) {
		           console.log("성공");
		           alert("해당 자격증을 성공적으로 삭제했습니다");
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
						<h2>자격증 관리</h2>
					</div>
					<div class="dashBoardSearch">
						<form action="">
							<table class="searchTable">
								<tr>
									<th class="searchHd">대분야</th>
									<td class="searchArticle">
										<div class="searchReq">
											<select id="mainCategoryInput">
												<option value="">선택해주세요</option>
												<option value="재료">재료</option>
												<option value="경영.회계.사무">경영.회계.사무</option>
												<option value="음식서비스">음식서비스</option>
												<option value="화학">화학</option>
												<option value="보건.의료">보건.의료</option>
												<option value="영업.판매">영업.판매</option>
												<option value="섬유.의복">섬유.의복</option>
												<option value="사회복지.종교">사회복지.종교</option>
												<option value="안전관리">안전관리</option>
												<option value="환경.에너지">환경.에너지</option>
												<option value="농림어업">농림어업</option>
												<option value="운전.운송">운전.운송</option>
												<option value="기계">기계</option>
												<option value="인쇄.목재.가구.공예">인쇄.목재.가구.공예</option>
												<option value="광업자원">광업자원</option>
												<option value="정보통신">정보통신</option>
												<option value="문화.예술.디자인.방송">문화.예술.디자인.방송</option>
												<option value="전기.전자">전기.전자</option>
												<option value="건설">건설</option>
												<option value="이용.숙박.여행.오락.스포츠">이용.숙박.여행.오락.스포츠</option>
												<option value="식품.가공">식품.가공</option>
												<option value="교육.자연.과학.사회과학">교육.자연.과학.사회과학</option>
											</select>
										</div>
									</td>
								</tr>
								<tr>
									<th class="searchHd">세부분야</th>
									<td class="searchArticle">
										<div class="searchReq">
											<select id="subCategoryInput">
												<option value="">선택해주세요</option>
												<option value="금속.재료">금속.재료</option>
												<option value="판금.제관.새시">판금.제관.새시</option>
												<option value="단조.주조">단조.주조</option>
												<option value="용접">용접</option>
												<option value="도장.도금">도장.도금</option>
												<option value="경영">경영</option>
												<option value="생산관리">생산관리</option>
												<option value="조리">조리</option>
												<option value="화공">화공</option>
												<option value="위험물">위험물</option>
												<option value="보건.의료">보건.의료</option>
												<option value="영업.판매">영업.판매</option>
												<option value="섬유">섬유</option>
												<option value="의복">의복</option>
												<option value="사회복지.종교">사회복지.종교</option>
												<option value="안전관리">안전관리</option>
												<option value="비파괴검사">비파괴검사</option>
												<option value="환경">환경</option>
												<option value="에너지.기상">에너지.기상</option>
												<option value="농업">농업</option>
												<option value="축산">축산</option>
												<option value="임업">임업</option>
												<option value="어업">어업</option>
												<option value="운전.운송">운전.운송</option>
												<option value="기계제작">기계제작</option>
												<option value="기계장비설비.설치">기계장비설비.설치</option>
												<option value="철도">철도</option>
												<option value="조선">조선</option>
												<option value="항공">항공</option>
												<option value="자동차">자동차</option>
												<option value="금형.공작기계">금형.공작기계</option>
												<option value="인쇄.사진">인쇄.사진</option>
												<option value="목재.가구.공예">목재.가구.공예</option>
												<option value="채광">채광</option>
												<option value="정보기술">정보기술</option>
												<option value="디자인">디자인</option>
												<option value="전기">전기</option>
												<option value="전자">전자</option>
												<option value="건축">건축</option>
												<option value="토목">토목</option>
												<option value="조경">조경</option>
												<option value="도시.교통">도시.교통</option>
												<option value="건설배관">건설배관</option>
												<option value="건설기계운전">건설기계운전</option>
												<option value="이용.미용">이용.미용</option>
												<option value="숙박.여행.오락.스포츠">숙박.여행.오락.스포츠</option>
												<option value="식품">식품</option>
												<option value="제과.제빵">제과.제빵</option>
												<option value="교육.자연.과학.사회과학">교육.자연.과학.사회과학</option>
											</select>
										</div>
									</td>
								</tr>
								<tr>
									<th class="searchHd">자격증계열</th>
									<td class="searchArticle">
										<div class="searchReq">
											<input type="checkbox" value="기술사"name="licenseTypeInput" /> 기술사
										</div>
										<div class="searchReq">
											<input type="checkbox" value="기능장" name="licenseTypeInput" /> 기능장       
										</div>
										<div class="searchReq">
											<input type="checkbox" value="기사" name="licenseTypeInput" /> 기사       
										</div>
										<div class="searchReq">
											<input type="checkbox" value="기능사" name="licenseTypeInput" /> 기능사       
										</div>
									</td>
								</tr>				
								<tr>
									<th class="searchHd">자격증명</th>
									<td class="searchArticle">
										<div class="searchReq">
											<input type="text" id="licenseNameInput" 
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
									<th style="width: 2%"><input type="checkbox" onclick="checkAll(this)"></th>
									<th><span>no.</span></th>
									<th><span>자격증명</span></th>
									<th><span>계열</span></th>
									<th><span>대분야</span></th>
									<th><span>세부분야</span></th>
									<th style="width: 50%"><span>상세정보</span></th>
								</tr>
							</thead>
							<tbody id="searchResultContainer">
								<c:forEach items="${allLicenseBeans}" var="licenseBean" varStatus="loopStatus">
									<tr>
										<th><input type="checkbox" class="checkList"  onclick="updateCounter()" value="${licenseBean.getLicense_idx()}"/></th>
										<td><span>${loopStatus.index+1}</span></td>
										<td><span>${licenseBean.getLicense_name()}</span></td>
										<td><span>${licenseBean.getLicense_type()}</span></td>
										<td><span>${licenseBean.getLicense_mainCategory()}</span></td>
										<td><span>${licenseBean.getLicense_subCategory()}</span></td>
										<td><span>${licenseBean.getLicense_info()}</span></td>					
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