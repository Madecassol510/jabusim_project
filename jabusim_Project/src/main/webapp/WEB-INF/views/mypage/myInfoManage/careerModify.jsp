<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>미니 프로젝트</title>
<!-- Bootstrap CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">



<style>

	/* ==========================페이지 공용================================== */

	body{
		width:100%;
	}
	
	ul{
		list-style:none;
		padding : 5px;
	}
	
	li{
	
	}
	
	.pageContainer{
		position: relative;
	    width: 1250px;
	    min-height: 700px;
	    margin: 0 auto;
	   	padding-top: 80px;
	    border: 1px solid red;
	}
	.module{
		min-height : 600px;
		width:100%;
		border: 1px solid blue;
		text-align:center;
		padding-top: 50px;
		padding-bottom: 50px;
	}
	
	.article{	
		display : inline-block;
	}
	
	/* =========================================================================== */	
	
	#modify_module .article{
		width : 85%;
		border: 1px solid black;
		text-align: left;
	}
	
	#modify_module .article .articleBox{
		width: 100%;
		display: inline-block;
		margin-bottom : 50px;
	}
	
	#modify_module .article .articleBox table{
		text-align:center;
		width: 100%;
		border: 1px solid black;
	}
	
	#modify_module .article .articleBox table tbody, tr{
		width: 100%;
	}
	
	#modify_module .article .articleBox table th{
		width: 30%;
		display: inline-block;
		padding-top: 10px;
		padding-bottom: 10px;
		border: 1px solid black;
		height: 50px;
	}
	
	#modify_module .article .articleBox table td{
		display: inline-block;
		width: 70%;
		padding-top: 10px;
		padding-bottom: 10px;
		border: 1px solid black;
		height: 50px;
	}
	
	#modify_module h3{
		padding-left: 37px;
	}
	
	
	#modify_module h5{
		margin-top : 20px;
		margin-bottom: 20px;
		padding-left: 37px;
	}
	
	
	/* =========================================================================== */
	
	#modify_module .articleBox .present_div, .modify_div {
		width : 500px;
		border: 1px solid red;
		padding-bottom : 20px;
		min-height: 300px;
	}
		
	#modify_module .articleBox .present_div {		
		float: left;
	}
	
	#modify_module .articleBox .modify_div {
		float: right;
		
	}
	
	#modify_module .articleBox .present_div div{		
		margin-left: 36px;
		margin-right: 36px;
	}
	
	#modify_module .articleBox .modify_div > div{
		margin-left: 37px;
		margin-right: 36px;
	}
	
	#modify_module .articleBox .button_div{
		text-align:right;
		padding-top: 20px;
	}
	
	#modify_module .articleBox .button_div button{
		width: 120px;
		height: 45px;
	}
	
	#modify_module .articleBox select {
		width:260px;
		height: 30px;
	}
	
	#modify_module .articleBox .inputDetail {
		width:260px;
		height: 30px;
		margin:0 auto;
		
	}
	
	#modify_module .articleBox .inputDetail input{
		width:180px;
		height: 30px;
		float: left;
		background: gray;
	}
	
	#modify_module .articleBox .inputDetail button{
		width:70px;
		height: 30px;
		font-size: 12px;
		float: right;
	}
	
	#modify_module .articleBox #inputCompany{
		width:260px;
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
		width:500px;
		height:500px;
		position: absolute;
		background: white;
		
	}
	
	.modalContainer .modalContainerHd{
		padding:10px;
		width:100%;
		height:12%;
		border-bottom: 1px solid black;
	}
	
	.modalContainer .modalContainerHd h3{
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
	
	
	
</style>

<script type="text/javascript">

	function openModal(modalId) {
	    var modals = document.getElementsByClassName("modalBackground");
	
	    // HTMLCollection을 배열로 변환
	    var modalArray = Array.from(modals);
	
	    
	    
	    modalArray.forEach(function (modal) {
	    	console.log(modalId);
	    	console.log(modal.id);
	    	
	        if (modalId == modal.id) {
	            modal.style.display = 'flex';
	        } else {
	            modal.style.display = "none";
	            
	        }
	    });
	}
		
	function closeModal(){
		var	modals = document.getElementsByClassName("modalBackground");
		
		// HTMLCollection을 배열로 변환
		var modalArray = Array.from(modals);
		
		modalArray.forEach(function(modal){		
			modal.style.display = 'none';	
		});
	}

	function selectResult(result){	
		var resultVal = result.textContent || result.innerText;
		
		if(result.id == 'selectSchool'){
			var inputSchool = document.getElementById("inputSchool")
			inputSchool.value = resultVal;
		}
		else if(result.id == 'selectMajor'){
			var inputMajor = document.getElementById("inputMajor")
			inputMajor.value = resultVal;
		}		
		closeModal();
	}
	
</script>

</head>
<body>
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />
	<c:import url="/WEB-INF/views/include/mypage_sideMenu.jsp" />


	<div class="pageContainer">
		<div class="module" id="modify_module">
			<div class="article">
				<div class="articleBox" id="edu_articleBox">
					<h3>학력 수정</h3>
					<div class="present_div">
						<h5>현재 학력</h5>
						<div>
							<table>
								<tr>
									<th>학력구분</th>
									<td>평생교육진흥원 인정학점(106학점 이상)</td>
								</tr>
								<tr>
									<th>학력(기관)명</th>
									<td>서울대학교</td>					
								</tr>
								<tr>
									<th>학과/전공</th>
									<td>컴퓨터공학</td>
								</tr>
							</table>					
						</div>
										
						<!-- 
						학력구분
							고졸 검정고시
							고등학교 졸업 이하
							평생교육진흥원 인정학점(81학점 이상)
							평생교육진흥원 인정학점(106학점 이상)
							2년제대학
							4년제대학
							석학학위
							박사학위 
						-->
					</div>
					<div class="modify_div">
						<h5>학력 추가</h5>
						<div>
							<form method="post" onsubmit="educationAdd()">
								<table>
									<tr>
										<th>학력구분</th>
										<td><select name="eduDivision" id="selectEdu">
												<option>선택해주세요</option>
												<option>고등학교 졸업 이하</option>
												<option>고졸 검정고시</option>
												<option>평생교육진흥원 인정학점(81학점 이상)</option>
												<option>평생교육진흥원 인정학점(106학점 이상)</option>
												<option>2년제대학</option>
												<option>4년제대학</option>
												<option>석학학위</option>
												<option>박사학위</option>
										</select></td>
									</tr>
									<tr>
										<th>학교(기관)명</th>
										<td>
											<div class="inputDetail">
												<input type="text" name="schoolName" id="inputSchool" disabled/>
												<button type="button" onclick="openModal('schoolModalBackground')">학교선택</button>
											</div>
										</td>
									</tr>
									<tr>
										<th>학과/전공</th>
										<td>
											<div class="inputDetail">
												<input type="text" name="majorName" id="inputMajor" disabled />
												<button type="button" onclick="openModal('majorModalBackground')">전공선택</button>
											</div>
										</td>
									</tr>
								</table>
								<div class="button_div">
									<button>신청</button>
								</div>
							</form>					
						</div>
						
					</div>
							
				</div>

				<div class="articleBox" id="carrer_articleBox">
					<h3>경력 수정</h3>
					<div class="present_div">
						<h5>현재 경력</h5>
						<div>
							<table>
								<tr>
									<th>경력구분</th>
									<td>평생교육진흥원 인정학점(106학점 이상)</td>
								</tr>
								<tr>
									<th>직무분야</th>
									<td>사무관리</td>
								</tr>
								<tr>
									<th>업체명</th>
									<td>솔데스크</td>
								</tr>
							</table>
						</div>
						<!-- 
						경력구분
							고졸 검정고시
							고등학교 졸업 이하
							평생교육진흥원 인정학점(81학점 이상)
							평생교육진흥원 인정학점(106학점 이상)
							2년제대학
							4년제대학
							석학학위
							박사학위 
						-->
					</div>
					<div class="modify_div">
						<h5>경력 추가</h5>
						<div>
							<form method="post" onsubmit="careerAdd()">
								<table>
									<tr>
										<th>경력구분</th>
										<td><select name="careerDivision" id="selectCareer">
												<option>선택해주세요</option>
												<option>2년 이상</option>
												<option>2년 이상</option>
												<option>2년 이상</option>
												<option>2년 이상</option>
										</select></td>
									</tr>
									<tr>
										<th>직무분야</th>
										<td><select name="jobField" id="selectJob">
												<option>선택해주세요</option>
												<option>사무관리</option>
												<option>사무관리</option>
												<option>사무관리</option>
												<option>사무관리</option>
										</select></td>
									</tr>
									<tr>
										<th>업체명</th>
										<td>
											<input type="text" name="companyName" id="inputCompany" />
										</td>
									</tr>
								</table>
								<div class="button_div">
									<button type="submit">신청</button>
								</div>
							</form>
						</div>		
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 모달창 -->
	
	<!-- 학교선택 모달창 -->
	<div class="modalBackground" id="schoolModalBackground">
		<div class="modalContainer" id="">
			<div class="modalContainerHd">
				<h3>학교(기관)검색</h3>
				<button type="button" onclick="closeModal()">닫기</button>
			</div>
			<div class="modalContent">
				<div class="searchHd">
					<form action="" onsubmit="">
						<span>학교(기관)명</span>
						<input type="text"/>
						<button type="submit">검색</button>
					</form>
				</div>
				<div class="searchResult">
					<ul class="resultResult">
						<li><span onclick="selectResult(this)" id="selectSchool">서울대학교</span></li>
						<li><span onclick="selectResult(this)" id="selectSchool">서울대학교</span></li>
						<li><span onclick="selectResult(this)" id="selectSchool">서울대학교</span></li>
						<li><span onclick="selectResult(this)" id="selectSchool">서울대학교</span></li>
						<li><span onclick="selectResult(this)" id="selectSchool">서울대학교</span></li>
						<li><span onclick="selectResult(this)" id="selectSchool">서울대학교</span></li>
						<li><span onclick="selectResult(this)" id="selectSchool">서울대학교</span></li>
						<li><span onclick="selectResult(this)" id="selectSchool">서울대학교</span></li>
						<li><span onclick="selectResult(this)" id="selectSchool">서울대학교</span></li>
						<li><span onclick="selectResult(this)" id="selectSchool">서울대학교</span></li>
						<li><span onclick="selectResult(this)" id="selectSchool">서울대학교</span></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 학교선택 모달창 -->
	<div class="modalBackground" id="majorModalBackground">
		<div class="modalContainer" id="">	
			<div class="modalContainerHd">
				<h3>학과/전공 검색</h3>
				<button type="button" onclick="closeModal()">닫기</button>
			</div>
			<div class="modalContent">
				<div class="searchHd">
					<form action="" onsubmit="">
						<span>학과/전공명</span>
						<input type="text"/>
						<button type="submit">검색</button>
					</form>
				</div>
				<div class="searchResult">
					<ul class="resultResult">
						<li><span onclick="selectResult(this)" id="selectMajor">서울대학교</span></li>
						<li><span onclick="selectResult(this)" id="selectMajor">서울대학교</span></li>
						<li><span onclick="selectResult(this)" id="selectMajor">서울대학교</span></li>
						<li><span onclick="selectResult(this)" id="selectMajor">서울대학교</span></li>
						<li><span onclick="selectResult(this)" id="selectMajor">서울대학교</span></li>
						<li><span onclick="selectResult(this)" id="selectMajor">서울대학교</span></li>
						<li><span onclick="selectResult(this)" id="selectMajor">서울대학교</span></li>
						<li><span onclick="selectResult(this)" id="selectMajor">서울대학교</span></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/include/buttom_info.jsp" />
</body>
</html>