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
		min-height : 1200px;
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
	
	
	/*mypage_module*/
	
	/* #myInfo_module .article{
		width : 94%;
		min-height : 500px;
		border: 1px solid black;
			
	}


	#myInfo_module .myInfoBox{
		width:700px;
		height: 600px;
		border: 1px solid red;
		float: left;
	} */
	
	#join_module .article{
		width : 60%;
		min-height : 650px;
		border: 1px solid black;
		text-align:left;
		padding: 30px 50px;
	}
	
	
	#join_module .join_hd{
		width:100%;
		display: inline-block;
		padding-bottom : 5px;
		margin-bottom : 20px;
		border-bottom: 1px solid black;
		
	} 
	
	#join_module .join_input{
		display: inline-block;
		width: 100%;
		
	}
	
	
	#join_module .input_box{
		display: inline-block;	
		width: 100%;
		min-height: 60px;
		padding-left : 40px;
	}
	
	#join_module .input_box div{
		padding-left: 10px;
		padding-top: 15px;
	}
	
	
	#join_module .input_box .input_name{
		display: inline-block;
		width : 140px;
		height:100%;
		float: left;
		padding-top: 20px;
	}
	
	#join_module .input_box .input_place{
		display: inline-block;
		min-height:100%;
		float: left;
		width: 60%;
	}
	
	#join_module .input_box .input_place .input_placeTop{
		padding-left:0;
		padding-top:0;
		display:inline-block;
		width:100%;
	}
	
	#join_module .input_box .input_place .input_placeBottom{
		padding-left:0;
		padding-top:0;
		display:inline-block;
		width:100%;
	}
	
	#join_module .input_box .input_place input{
		width:200px;
		height: 35px;
	}
	
	
	#join_module .input_box .input_check{
		width: 100px;
		height: 35px;
	}
	
	#join_module .input_footer{
		margin-top: 30px;
		padding-top:30px;
		width : 100%;
		display: inline-block;
		text-align: center;
		border-top: 1px solid black;
	}
	
	#join_module .input_footer .input_footerDiv{
		display: inline-block;
	} 
	
	
	#join_module .input_footer button{
		width: 100px;
		height: 40px;
	}
	
	
	/*myLicense_module*/
	
	#myLicense_module .hd h3{
		text-align: left;
		padding-left: 37px;
	}
	
	
	#myLicense_module .article{
		width : 94%;
		min-height : 600px;
		display: inline-block;
		border: 1px solid black;
	}
	
	#myLicense_module .licenseBox{
		min-height: 350px;
		width: 100%;
		border: 1px solid red;
		margin-bottom: 30px;
	} 
	
	
	#myLicense_module .licenseBox .licenseHd{
		min-height: 50px;
		width: 100%;
		border: 1px solid blue;
		text-align: left;
		padding-left: 37.5px;
		padding-top: 20px;
	}
	
	#myLicense_module .licenseBox .licenseList{
		min-height: 300px;
		width: 100%;
		border: 1px solid blue;
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

	<div class="pageContainer">
		<div class="module" id="join_module">
			<div class="article">

				<form:form action="${root}user/join_pro" method="get" class="join_input" modelAttribute="joinUserBean">
					<form:hidden path="userIdExist" />
					<div class="input_box">
						<div class="input_name">
							<span>이름</span>
						</div>
						<div class="input_place">
							<div class="input_placeTop">
								<form:input path="user_name" />
							</div>
							<div class="input_placeBottom">
								<form:errors path="user_name" style="color:red" />
							</div>
						</div>
					</div>
					<div class="input_box">
						<div class="input_name">
							<span>아이디</span>
						</div>
						<div class="input_place">
							<div class="input_placeTop">
								<form:input path="user_id" onkeypress="resetUserIdExist()" />
								<button type="button" onclick='checkUserIdExist()'>중복확인</button>
							</div>
							<div class="input_placeBottom">
								<form:errors path="user_id" style="color:red" />
							</div>
						</div>
					</div>
					<div class="input_box">
						<div class="input_name">
							<span>생년월일</span>
						</div>
						<div class="input_place">
							<div class="input_placeTop">
								<form:input path="user_birthdate" />
							</div>
							<div class="input_placeBottom">
								<form:errors path="user_birthdate" style="color:red" />
							</div>
						</div>
					</div>
					<div class="input_box">
						<div class="input_name">
							<span>휴대전화</span>
						</div>
						<div class="input_place">
							<div class="input_placeTop">
								<form:input path="user_phoneNum" placeholder=" ex) 010-0000-0000" />
								<button type="button" class="input_check">본인확인</button>
							</div>
							<div class="input_placeBottom">
								<form:errors path="user_phoneNum" style="color:red" />
							</div>

						</div>
					</div>
				</form:form>
			</div>
		</div>
		<div class="module" id="myLicense_module">
			<div class="article">
				<div class="hd">
					<h3>나의 자격증</h3>
				</div>
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
				<div class="licenseBox" id="interest_licenseBox">
					<div class="licenseHd">
						<h5>관심 자격증</h5>
						<span>고객님의 관심 자격증은 0개입니다</span>
					</div>
					<div class="licenseList" id="interest_licenseList">

								
					</div>
				</div>
				<!-- <div class="licenseBox" id="interest_licenseBox">
					<div class="licenseHd">
						<span>관심 자격증</span>
					</div>	
					<div class="licenseList" id="interest_licenseList">
					
					</div>
				</div> -->
			</div>
		</div>
	</div>


	<c:import url="/WEB-INF/views/include/buttom_info.jsp" />
</body>
</html>