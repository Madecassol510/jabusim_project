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
	
	/* =========================================================================== */

	
	
	
	#myInfo_module .article{
		width : 94%;
		border: 1px solid black;
		
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
		border: 1px solid black;
		text-align:left;
		float:left;
		padding: 30px 40px;
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
		
	}
	
	
	#myInfo_module .left_div .input_box{
		display: inline-block;	
		width: 62%;
		min-height: 60px;
		margin-bottom: 10px;
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
		width:35%;
		float:right;
		padding-top: 14px;
	}
	
	#myInfo_module .left_div .photo_box .photo_input{
		height:100%;
		width:75%;
		float: right;
		margin-right: 25px;
	}
	
	#myInfo_module .photo_box .photo{
		width:100%;
		height: 180px;
		border: 1px solid black;
		display: block;
	}
	
	#myInfo_module .photo_box button{
		width:100%;
		height: 40px;
		margin-top: 10px; 
	}
	
	
	/*mypage_module 활동 정보*/
	#myInfo_module .right_div{
		width : 38%;
		height : 460px;
		border: 1px solid black;
		float:right;
	}
	
	#myInfo_module .act_div{
		width : 100%;
		display:inline-block;
		height : 67%;
		border: 1px solid black;
		text-align:left;
		padding: 30px 40px;
	}
	
	#myInfo_module .act_div h5{
		margin:0;
		height:16%;
		
	}

	#myInfo_module .act_div .act_infoBox{
		display: grid;
		grid-template-columns: repeat(2, 1fr); /* 2열 설정 */
    	grid-template-rows: repeat(2, 1fr);
    	gap: 10px; 
    	width:100%;
    	height:84%;
	}
	
	#myInfo_module .act_div .act_info{
		border: 1px solid black;
	}
	

	
	/*mypage_module 자격증 정보*/
	
	#myInfo_module .right_footer{
		width:100%;
		border: 1px solid black;
		height : 33%;
		padding: 30px 40px;
		text-align: left;
	}	
	
	#myInfo_module .right_footer h5{
		margin:0;
		height:30%;
	}
	
	#myInfo_module .right_footer div{
		width:100%;
		height:70%;
	}
	
		/* =========================================================================== */

	/*myLicense_module*/
	
	#myLicense_module .hd h3{
		text-align: left;
		padding-left: 37px;
	}
	
	
	#myLicense_module .article{
		width : 94%;
		min-height : 460px;
		display: inline-block;
		border: 1px solid black;
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
		/* border: 1px solid blue; */
		padding:30px;
		display: inline-table;
	} 
	
	#myLicense_module .licenseBox .licenseCardList{
		height: 150px;
		width: 25%;
		/* border: 1px solid green; */
		float: left;
	} 
	
	#myLicense_module .licenseBox .licenseCardList .card{		
		width: 95%;
		height: 95%;
		margin: auto;
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
					<form:form  class="join_input" modelAttribute="myPageUserBean">
						<div class="input_box">
							<div class="input_name">
								<span>이름</span>
							</div>						
							<div class="input_place">
								<div class="input_placeTop">
									<form:input path="user_name" readonly="true" />
								</div>
								<div class="input_placeBottom"></div>
							</div>
						</div>
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
					</form:form>
				</div>
				<div class="right_div">
					<div class="act_div">
						<h5>활동 정보</h5>
						<form action="#" class="act_infoBox">
							<%-- <form:label path=""></form:label> 사용--%>
							<div class="act_info">
								<div class="act_infotitle">가입일</div>
								<div>
									${myPageUserBean.getUser_joinDate()}
									<br />
									가입했습니다.
								</div>
							</div>
							<div class="act_info">
								<div class="act_infotitle">방문횟수</div>
								<div>
									${myPageUserBean.getUser_visitCount()}회
								</div>
							</div>
							<div class="act_info">
								<div class="act_infotitle">관심분야</div>
								<div>
									
								</div>
							</div>
							<div class="act_info">
								<div class="act_infotitle">자격증</div>
								<div>
									보유 자격증 0개 <br />
									관심 자격증 0개
								</div>
							</div>
						</form>
					</div>
					<div class="right_footer">
						<h5>자격증 정보</h5>
						<div>
							소유하신 보유 자격증 0개 <br />
							소유하신 관심 자격증 0개
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="module" id="myLicense_module">
			<div class="article">
				<div class="licenseBox" id="own_licenseBox">
					<div class="licenseHd">
						<h5>보유자격증</h5>
						<span>고객님의 관심 자격증은 0개입니다</span>
					</div>
					<div class="licenseList" id="own_licenseList">
						<div class="licenseCardList">
							<div class="card text-bg-light">
								<div class="card-header">Header</div>
								<div>
								
								</div>
							</div>
						</div>			
						<div class="licenseCardList">
							<div class="card text-bg-light">
								<div class="card-header">Header</div>
								<div>
								
								</div>
							</div>
						</div>
						
						<div class="licenseCardList">
							<div class="card text-bg-light">
								<div class="card-header">Header</div>
								<div>
								
								</div>
							</div>
						</div>
						
						<div class="licenseCardList">
							<div class="card text-bg-light">
								<div class="card-header">Header</div>
								<div>
								
								</div>
							</div>
						</div>	
						<div class="licenseCardList">
							<div class="card text-bg-light">
								<div class="card-header">Header</div>
								<div>
								
								</div>
							</div>
						</div>
						<div class="licenseCardList">
							<div class="card text-bg-light">
								<div class="card-header">Header</div>
								<div>
								
								</div>
							</div>
						</div>
						<div class="licenseCardList">
							<div class="card text-bg-light">
								<div class="card-header">Header</div>
								<div>
								
								</div>
							</div>
						</div>
						<div class="licenseCardList">
							<div class="card text-bg-light">
								<div class="card-header">Header</div>
								<div>
								
								</div>
							</div>
						</div>
						<div class="licenseCardList">
							<div class="card text-bg-light">
								<div class="card-header">Header</div>
								<div>
								
								</div>
							</div>
						</div>
						<div class="licenseCardList">
							<div class="card text-bg-light">
								<div class="card-header">Header</div>
								<div>
								
								</div>
							</div>
						</div>
						<div class="licenseCardList">
							<div class="card text-bg-light">
								<div class="card-header">Header</div>
								<div>
								
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- <div class="licenseBox" id="interest_licenseBox">
					<div class="licenseHd">
						<h5>관심 자격증</h5>
						<span>고객님의 관심 자격증은 0개입니다</span>
					</div>
					<div class="licenseList" id="interest_licenseList">
						<div class="licenseCardList">
							<div class="card text-bg-light">
								<div class="card-header">Header</div>
								<div>
								
								</div>
							</div>
						</div>
						<div class="licenseCardList">
							<div class="card text-bg-light">
								<div class="card-header">Header</div>
								<div>							
								</div>
							</div>
						</div>								
					</div>
				</div> -->
			</div>
		</div>	
	</div>


	<c:import url="/WEB-INF/views/include/buttom_info.jsp" />
</body>
</html>