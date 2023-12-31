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
	    /* border: 1px solid red; */
	}
	.module{
		min-height : 540px;
		width:100%;
		/* border: 1px solid blue; */
		text-align:center;
		/* 
		padding-top: 50px;
		padding-bottom: 50px; 
		*/
	}
	
	.article{	
		display : inline-block;
	}
	
	h5{
		font-family: Arial;
		font-size: 23px;
		font-weight: 600;
	}
	
	/* =========================================================================== */

	
	
	
	#myInfo_module .article{
		width : 94%;		
	}
	
	#myInfo_module h3{
		text-align: left;
		padding-left: 37px;
	}
	
	
/* 	#myInfo_module h5{
		margin-bottom: 25px;
	} */
	
	
	/*mypage_module 나의 정보*/
	
	#myInfo_module .left_div{
		width : 60%;
		min-height : 460px;
		text-align:left;
		float:left;
		padding: 30px 40px;
		border: 1px solid blue;
		box-shadow:0 .5rem 1rem rgba(0,0,0,.15)!important;
		border-radius: 10px;
		position: relative;
	}
	
	
	
	
	#myInfo_module .left_div .join_hd{
		width:100%;
		display: inline-block;
		padding-bottom : 5px;
		margin-bottom : 20px;
		border-bottom: 1px solid black;
		
	} 
	
	#myInfo_module .left_div .join_input{
		display: inline-block;
		width: 100%;
		margin-top: 41px;
	}
	
	
	#myInfo_module .left_div .input_box{
		display: inline-block;	
		width: 58%;
		min-height: 60px;
		margin-bottom: 10px;
		float:right;
	}
	
	#myInfo_module .left_div .input_box .input_name{
		display: inline-block;
		width : 140px;
		height:100%;
		float: left;
		padding-top: 22px;
		padding-left: 10px;
	}
	
	#myInfo_module .left_div .input_box .input_place{
		display: inline-block;
		min-height:100%;
		float: left;
		width: 60%;
	}
	
	#myInfo_module .left_div .input_placeTop{
		padding-left:0;
		padding-top:0;
		display:inline-block;
		width:100%;
		padding-left: 10px;
		padding-top: 15px;
	}
	
	
	
	#myInfo_module .left_div .input_box .input_place input{
		width:200px;
		height: 35px;
	}
	
	/*myInfo_module 사진*/
	
	#myInfo_module .left_div .photo_box{
		height:300px;
		width:30%;
		float:left;
		padding-top: 30px;
		margin-left: 15px;
		text-align: center;
	}
	
	#myInfo_module .left_div .photo_box .photo_input{
		height:180px;
		width:100%;
		margin-bottom: 10px;
	}
	
	#myInfo_module .photo_box .photo{
		width:100%;
		height:100%;
		border: 1px solid gray;
		display: block;
		border-radius: 100px;
	}
	
	#myInfo_module .photo_box .userName{
		font-size: 26px;
    	font-weight: 700;
	}
	
	
	.borderBox{
		position: absolute;
		border: 1px solid #A4A4A4;
		border-radius: 10px;
		width: 400px;
		height: 300px;
		top: 96px;
		right: 25px
	}
	
	/*mypage_module 활동 정보*/
	#myInfo_module .right_div{
		width : 38%;
		height : 460px;
		float:right;
		
		border: 1px solid blue;
		box-shadow:0 .5rem 1rem rgba(0,0,0,.15)!important;
		border-radius: 10px;
	}
	
	#myInfo_module .act_div{
		width : 100%;
		display:inline-block;
		height : 100%;
		text-align:left;
		padding: 30px 40px;
	}
	
	#myInfo_module .act_div h5{
		margin:0;
		height:16%;
	}

	#myInfo_module .act_div .act_infoBox{
		display: grid;
		grid-template-columns: repeat(1, 1fr); /* 2열 설정 */
    	grid-template-rows: repeat(4, 1fr);
    	gap: 10px; 
    	width:100%;
    	height:84%;
	}
	
	#myInfo_module .act_div .act_info{
		border: 1px solid #A4A4A4;
		border-radius: 10px;
		padding: 10px;
	}
	
	#myInfo_module .act_div .act_infotitle{
		font-size: 16px;
   		font-weight: 600;
	}
	
	#myInfo_module .act_div .act_infoContent{
		padding-left: 5px;
    	padding-top: 3px
	}
	
		/* =========================================================================== */

	/*myLicense_module*/
	
	#myLicense_module .hd h3{
		text-align: left;
		padding-left: 37px;
	}
	
	
	#myLicense_module .article{
		width : 94%;
		display: inline-block;
		
		border: 1px solid blue;
		box-shadow:0 .5rem 1rem rgba(0,0,0,.15)!important;
		border-radius: 10px;
	}
	
	#myLicense_module .licenseBox{
		min-height: 350px;
		width: 100%;
		/* border: 1px solid red; */
		margin-bottom: 30px;
	} 
	
	
	#myLicense_module .licenseBox .licenseHd{
		min-height: 50px;
		width: 100%;
		/* border: 1px solid blue; */
		text-align: left;
		padding-left: 37.5px;
		padding-top: 20px;
	}
	
	#myLicense_module .licenseBox .licenseList{
		min-height: 300px;
		width: 100%;
		padding:30px;
		
		display: grid;
		grid-template-columns: repeat(4, 1fr); /* 4개의 열을 만듭니다. 각 열의 너비는 동일합니다. */
		gap: 10px;
		
		
		
	} 
	
	#myLicense_module .licenseBox .own_licenseListBox{
		/* width: 1112px; */
		width:100%;
  		min-height: 273px;
   		border: 1px solid #A4A4A4;
		border-radius: 10px;
		display: inline-block;
		padding: 12px;
		
		
	}
	
	
	#myLicense_module .licenseBox  .license-card{		
		height:150px;
		border: 1px solid black;
	}
	
	
	
.license-card {
	width: 280px;
	height: 150px;
	border: 1px solid #222;
	border-radius: 20px;
	margin : 10px 5px;
}

.license-card:hover {
	overflow: visible;
	
}

.license-card:hover .main-card-body{
	/* display:inline-block;
	white-space:nowrap; */
	position: absolute;
	z-index: 2;
	background-color: white;
	width: 278px;
	border: 1px solid #33333380;
	
}

.main-card-header {
	padding: 5px 0;
	text-align: center;
	font-size: 16pt;
	font-weight: bold;
	border-top-left-radius: 20px;
	border-top-right-radius: 20px;
	border-bottom: 1px solid #000;
	box-shadow: 0 3px 3px 0 #ccc;
	background-color: #F0F2FF;
}

.main-card-body {
	text-align: center;
	padding: 5px;
}

.main-card-title {
	margin: 0;
	margin-bottom: 3px;
	font-size: 12pt;
	font-weight: bold;
}

.main-card-text {
	margin: 0;
	padding: 0;
	font-size: 10pt;
	font-weight: lighter;
	text-align: center;
}

.license-button {
	display: flex;
	justify-content: center;
}

.license-button>button {
	width: 50px;
	height: 30px;
	margin: 0 10px;
	background-color: #F0F2FF;
	font-weight: bold;
	border-radius: 3px;
}

.license-button>button:active {
	background-color: #B2B7D5;
}
	
</style>

</head>
<body>
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />
	<c:import url="/WEB-INF/views/include/mypage_sideMenu.jsp" />


	<div class="pageContainer">
		<div class="module" id="myInfo_module">
			<div class="article">
				<h3>나의 정보</h3>
				<div class="left_div">
					<h5>계정 정보</h5>
					<form:form class="join_input" modelAttribute="myPageUserBean">
						<div class="photo_box">
							<div class="photo_input">
								<img src="${root}image/default.png" class="photo" />								
							</div>
							<div class="userName">
								${myPageUserBean.user_name}
							</div>
						</div>
						<%-- <div class="input_box">
							<div class="input_name">
								<span>이름</span>
							</div>
							<div class="input_place">
								<div class="input_placeTop">
									<form:input path="user_name" readonly="true" />
								</div>
								<div class="input_placeBottom"></div>
							</div>
						</div> --%>
						<div class="input_box">
							<div class="input_name">
								<span>아이디</span>
							</div>
							<div class="input_place">
								<div class="input_placeTop">
									<form:input path="user_id" readonly="true" />
								</div>
								<div class="input_placeBottom"></div>
							</div>
						</div>

						<div class="input_box">
							<div class="input_name">
								<span>생년월일</span>
							</div>
							<div class="input_place">
								<div class="input_placeTop">
									<form:input path="user_birthdate" readonly="true" />
								</div>
								<div class="input_placeBottom"></div>
							</div>
						</div>
						<div class="input_box">
							<div class="input_name">
								<span>휴대전화</span>
							</div>
							<div class="input_place">
								<div class="input_placeTop">
									<form:input path="user_phoneNum" readonly="true" />
								</div>
								<div class="input_placeBottom"></div>
							</div>
						</div>
						<div class="input_box">
							<div class="input_name">
								<span>가입일</span>
							</div>
							<div class="input_place">
								<div class="input_placeTop">
									<form:input path="user_joinDate" readonly="true" />
								</div>
								<div class="input_placeBottom"></div>
							</div>
						</div>
					</form:form>
					
					<div class="borderBox">
					
					</div>
				</div>
				
				
				<div class="right_div">
					<div class="act_div">
						<h5>활동 정보</h5>
						<form action="#" class="act_infoBox">
							<%-- <form:label path=""></form:label> 사용--%>
							<div class="act_info">
								<div class="act_infotitle">방문횟수</div>
								<div class="act_infoContent">
									${myPageUserBean.getUser_visitCount()}회
								</div>
							</div>
							<div class="act_info">
								<div class="act_infotitle">문의횟수</div>
								<div class="act_infoContent">
									${inquiryCount}회
								</div>
							</div>
							<div class="act_info">
								<div class="act_infotitle">최근시험</div>
								<div class="act_infoContent">
									${lastExam}
								</div>
							</div>
							<div class="act_info">
								<div class="act_infotitle">자격증</div>
								<div class="act_infoContent">
									보유 자격증 ${licenseCount}개
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="module" id="myLicense_module">
			<div class="article">
				<div class="licenseBox" id="own_licenseBox">
					<div class="licenseHd">
						<h5>보유자격증</h5>
						<span>${myPageUserBean.getUser_name()}님의 관심 자격증은 ${licenseCount}개입니다</span>
					</div>
					<div class="licenseList" id="own_licenseList">
						<c:forEach items="${userOwnLicenseBeans}" var="userOwnLicenseBean">
							<div class="license-card" onclick="location.href='${root}info/main?licenseID=${userOwnLicenseBean.license_idx}'" style="transition: transform 0.3s ease-in-out;" data-original-text="마우스를 올리면 상세내용이 뜹니다." data-hover-text="${userOwnLicenseBean.license_info}">
								<div class="main-card-header">${userOwnLicenseBean.license_name}</div>
								<div class="main-card-body">
									<p class="main-card-title">${userOwnLicenseBean.license_mainCategory}</p>
									<p class="main-card-text">마우스를 올리면 상세내용이 뜹니다.</p>
								</div>
							</div>
						</c:forEach>
					</div>
					
					
				</div>
			</div>
		</div>	
	</div>
	<c:import url="/WEB-INF/views/include/buttom_info.jsp" />
</body>
</html>