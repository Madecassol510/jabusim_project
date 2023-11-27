<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
	<c:import url="/WEB-INF/views/include/mypage_sideMenu.jsp" />


	<div class="pageContainer">		
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
			</div>
		</div>
	</div>


	<c:import url="/WEB-INF/views/include/buttom_info.jsp" />
</body>
</html>