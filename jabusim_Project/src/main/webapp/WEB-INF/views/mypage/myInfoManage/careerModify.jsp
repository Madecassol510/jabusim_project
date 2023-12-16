<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	}
	.module{
		min-height : 600px;
		width:100%;
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
		font-family: Arial;
    	font-size: 22px;
    	font-weight: 600;
	}
	
	
	/* =========================================================================== */
	
	#modify_module .articleBox .present_div, .modify_div {
		width : 500px;
		padding-bottom : 20px;
		min-height: 310px;
		border: 1px solid blue;
		box-shadow: 0 .5rem 1rem rgba(0,0,0,.15)!important;
		border-radius: 10px;
	}
		
	#modify_module .articleBox .present_div {		
		float: left;
	}
	
	#modify_module .articleBox .modify_div {
		float: right;
		
	}
	
	#modify_module .articleBox .present_div > div{		
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
	
	#modify_module .articleBox .button_div #applyButton{
		width: 120px;
		height: 45px;
	}
	
	#modify_module .articleBox .button_div .preButton, .nextButton{
		width: 80px;
		height: 35px;
	}
	
	#modify_module .articleBox .button_div .preButton{
		float: left;
	}
	#modify_module .articleBox .button_div .nextButton{
		float: right;
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
		width:260px;
		height: 30px;
		float: left;
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

	var careerNum=0;
	var eduNum=0;
	
	var careerMax = ${fn:length(userCareerBeans)};
	var careerMin = 0;

	var eduMax = ${fn:length(userEduBeans)};
	var eduMin = 0;
	

	
	
	window.onload = function() {
		careerNum=0;
		 eduNum=0;
		
		document.getElementById("edu_preButton").disabled = true;
		document.getElementById("career_preButton").disabled = true;
		
		if(careerNum >= careerMax-1){
			document.getElementById("career_nextButton").disabled = true;
		}
		
		if(eduNum >= eduMax-1){
			document.getElementById("edu_nextButton").disabled = true;
		}
    };
	
	
	function clickPre(field){
		
		if(field=="학력"){
			
			eduNum--;
			
			if(eduNum==eduMin){
				
				document.getElementById("edu_preButton").disabled = true;
			}
			else{
				document.getElementById("edu_preButton").disabled = false;
			}
			
			if(eduNum>=eduMax-1){
				document.getElementById("edu_nextButton").disabled = true;
			}
			else{
				document.getElementById("edu_nextButton").disabled = false;
			}
			
		}
		else if(field=="경력"){
			
			careerNum--;
			
			if(careerNum==careerMin){
				document.getElementById("career_preButton").disabled = true;
			}
			else{
				document.getElementById("career_preButton").disabled = false;
			}
			
			if(careerNum>=careerMax-1){
				document.getElementById("career_nextButton").disabled = true;
			}
			else{
				document.getElementById("career_nextButton").disabled = false;
			}
					
	        document.getElementById("careerType").innerHTML =  "${userCareerBeans[careerNum].career_type}";
	        document.getElementById("careerField").innerHTML =  "${userCareerBeans[careerNum].career_field}";
	        document.getElementById("careerCompany").innerHTML = "${userCareerBeans[careerNum].career_company}";
		}			
	}
	
	function clickNext(field){
				
		if(field=="학력"){
			
			eduNum ++;
			
			if(eduNum==eduMin){
				
				document.getElementById("edu_preButton").disabled = true;
			}
			else{
				document.getElementById("edu_preButton").disabled = false;
			}
			
			if(eduNum>=eduMax-1){
				document.getElementById("edu_nextButton").disabled = true;
			}
			else{
				document.getElementById("edu_nextButton").disabled = false;
			}	
			
		}
		else if(field=="경력"){
			
			careerNum ++;
			
			
			if(careerNum==careerMin){
				document.getElementById("career_preButton").disabled = true;
			}
			else{
				document.getElementById("career_preButton").disabled = false;
			}
			
			if(careerNum>=careerMax-1){
				document.getElementById("career_nextButton").disabled = true;
			}
			else{
				document.getElementById("career_nextButton").disabled = false;
			}
			
			document.getElementById("careerType").innerHTML =  "${userCareerBeans[careerNum].career_type}";
	        document.getElementById("careerField").innerHTML =  "${userCareerBeans[careerNum].career_field}";
	        document.getElementById("careerCompany").innerHTML = "${userCareerBeans[careerNum].career_company}";
			
		}			
	}
	
	
	
	//============================================
	function typeChange() {
		var selectedValue = document.getElementById("selectEdu").value;
		
		if(selectedValue=="고등학교 졸업 이하" || selectedValue=="고졸 검정고시" || selectedValue=="평생교육진흥원 인정학점(81학점 이상)" ||
				selectedValue=="평생교육진흥원 인정학점(106학점 이상)"){
			
			var eduInputs = document.querySelectorAll('.eduInput');

			 // 모든 eduInput 클래스를 가진 input 요소를 반복하면서 입력 불가능하게 만듦
			 eduInputs.forEach(function(input) {
			        input.readonly = true; // 입력 불가능하게 설정
			 });
		}
		else{
			var eduInputs = document.querySelectorAll('.eduInput');

			 // 모든 eduInput 클래스를 가진 input 요소를 반복하면서 입력 불가능하게 만듦
			 eduInputs.forEach(function(input) {
			        input.readonly = false;
			});
		}
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
								<c:choose>
									<c:when test="${empty userEduBeans}">
										<tr>
											<td style="border:none;"></td>								
										</tr>
										<tr>
											<td style="width:100%; border:none;">현재 학력이 없습니다.</td>
										</tr>
										<tr>
											<td style="border:none;"></td>
										</tr>
									</c:when>
									<c:otherwise>
										<tr>
											<th>학력구분</th>
											<td id="eduType">${userEduBeans[eduNum].edu_type}</td>
										</tr>
										<tr>
											<th>학력(기관)명</th>
											<td id="edu_academy">${userEduBeans[eduNum].edu_academy}</td>
										</tr>
										<tr>
											<th>학과/전공</th>
											<td id="edu_major">${userEduBeans[eduNum].edu_major}</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</table>					
						</div>
						<div class="button_div">
							<button class = "preButton" id="edu_preButton" onclick="clickPre('학력')"> &lt;</button>
							<button class = "nextButton" id="edu_nextButton" onclick="CareerClickNext('학력')"> &gt;</button>
						</div>				
					</div>
					<div class="modify_div">
						<h5>학력 추가</h5>
						<div>
							<form method="post" action="${root}mypage/myInfoManage/eduInquiry_pro">
								<table>
									<tr>
										<th>학력구분</th>
										<td><select name="edu_type" id="selectEdu" onchange="typeChange()">
												<option value="">선택해주세요</option>
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
												<input name="edu_academy" class="eduInput"/>
											</div>
										</td>
									</tr>
									<tr>
										<th>학과/전공</th>
										<td>
											<div class="inputDetail">
												<input  name="edu_major" class="eduInput"  />										
											</div>
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

				<div class="articleBox" id="carrer_articleBox">
					<h3>경력 수정</h3>
					<div class="present_div">
						<h5>현재 경력</h5>
						<div>
							<table>
								<c:choose>
									<c:when test="${empty userCareerBeans}">
										<tr>
											<td style="border:none;"></td>								
										</tr>
										<tr>
											<td style="width:100%; border:none;">현재 경력이 없습니다.</td>
										</tr>
										<tr>
											<td style="border:none;"></td>
										</tr>
									</c:when>
									<c:otherwise>
										<tr>
											<th>경력구분</th>
											<td id="careerType">${userCareerBeans[0].career_type}</td>
										</tr>
										<tr>
											<th>직무분야</th>
											<td id="careerField">${userCareerBeans[0].career_field}</td>
										</tr>
										<tr>
											<th>업체명</th>
											<td id="careerCompany">${userCareerBeans[0].career_company}</td>
										</tr>
									</c:otherwise>
								</c:choose>
								
							</table>
						</div>
						<div class="button_div">
							<button class = "preButton" id="career_preButton" onclick="clickPre('경력')">&lt;</button>
							<button class = "nextButton" id="career_nextButton" onclick="clickNext('경력')">&gt;</button>
						</div>
					</div>
					<div class="modify_div">
						<h5>경력 추가</h5>
						<div>
							<form method="post" action="${root}mypage/myInfoManage/careerInquiry_pro" >
								<table>
									<tr>
										<th>경력구분</th>
										<td><select name="career_type" id="selectCareer">
												<option value="">선택해주세요</option>
												<option value="2년이상">2년 이상</option>
												<option value="4년이상">4년 이상</option>
										</select></td>
									</tr>
									<tr>
										<th>직무분야</th>
										<td><select name="career_field" id="selectJob">
												<option value="">선택해주세요</option>
												<option>사무관리</option>
												<option></option>
												<option></option>
												<option></option>
										</select></td>
									</tr>
									<tr>
										<th>업체명</th>
										<td>
											<input name="career_company" id="inputCompany" />
										</td>
									</tr>
								</table>
								<div class="button_div">
									<button type="submit" >신청</button>
								</div>
							</form>
						</div>		
					</div>
				</div>
			</div>
		</div>
	</div>

	
	<c:import url="/WEB-INF/views/include/buttom_info.jsp" />
</body>
</html>