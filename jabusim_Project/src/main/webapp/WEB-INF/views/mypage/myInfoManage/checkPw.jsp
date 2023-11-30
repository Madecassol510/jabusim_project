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
		margin: 0 auto;
		
	}
	
	/* =========================================================================== */
	
	/*top_module*/
	
	#check_module .article{
		width : 60%;
		min-height : 400px;
		border: 1px solid black;
		text-align:left;
		padding: 30px 50px;
	}
	
	
	#check_module .check_hd{
		width:100%;
		display: inline-block;
		padding-bottom : 5px;
		margin-bottom : 60px;
		border-bottom: 1px solid black;
	}
	
	
	#check_module .input_footer{
		margin-top: 70px;
		padding-top:30px;
		width : 100%;
		display: inline-block;
		text-align: center;
		border-top: 1px solid black;
	}
	
	
	#check_module .input_footer .input_footerDiv{
		display: inline-block;
	} 
	
	
	#check_module .input_footer button{
		width: 100px;
		height: 40px;
	}
	
		
	
	
	#check_module .check_input{
		display: inline-block;
		width: 100%;
		text-align: center;
		
	}
	

	#check_module .input_box{
		display: inline-block;	
		width: 62%;
		min-height: 60px;
		margin-bottom: 10px;
	}
	
	#check_module .input_box .input_name{
		display: inline-block;
		width : 140px;
		height:100%;
		float: left;
		padding-top: 22px;
		padding-left: 10px;
	}
	
	#check_module .input_box .input_place{
		display: inline-block;
		min-height:100%;
		float: left;
		width: 60%;
	}
	
	#check_module .input_placeTop{
		padding-left:0;
		padding-top:0;
		display:inline-block;
		width:100%;
		padding-left: 10px;
		padding-top: 15px;
	}
	
	
	
	#check_module .input_box .input_place input{
		width:200px;
		height: 35px;
	}
	
	
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />


	<div class="pageContainer">
		<div class="module" id="check_module">
			<div class="article">
				<div class="check_hd">
					<h3>비밀번호 확인</h3>
					<span>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 한번 더 확인합니다</span>
				</div>
				<form:form action="${root}mypage/myInfoManage/checkPw_pro" method="post" class="check_input" modelAttribute="checkPwUserBean">
					<input type="hidden" name="myInfoManagePage" value="${myInfoManagePage}" />
					<div class="input_box">
						<div class="input_name">
							<span>아이디</span>
						</div>
						<div class="input_place">
							<div class="input_placeTop">
								<form:input path="user_id" readonly="true" />
							</div>
							<div class="input_placeBottom">
								<form:errors path="user_id" style="color:red" />
							</div>
						</div>
					</div>
					<div class="input_box">
						<div class="input_name">
							<span>패스워드</span>
						</div>
						<div class="input_place">
							<div class="input_placeTop">
								<form:input path="user_pw" type="password" />
							</div>
							<div class="input_placeBottom">
								<form:errors path="user_pw" style="color:red" />
							</div>
						</div>
					</div>			
					<div class="input_footer">
						<div class="input_footerDiv">
							<button type="button" onClick="location.href='${root}mypage/main'">취소</button>
							<form:button type="submit" style="margin-left: 20px;">확인</form:button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>