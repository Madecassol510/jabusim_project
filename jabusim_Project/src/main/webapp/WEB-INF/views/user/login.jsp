<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">


<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>미니 프로젝트</title>

<style>

	/* ==========================페이지 공용================================== */

	body{
		width:100%;
		min-height : 500px;
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
	
	#login_module .article{
		width : 65%;
		/* height : 500px; */
		border: 1px solid black;
		padding: 30px 50px;
	}
	
	#login_module .login_hd{
		text-align: left;
		border-bottom: 1px solid black;
	}
	
	#login_module .login_hd span{
		display: inline-block;
		margin-bottom: 5px;
	}
	
	#login_module .login_input{
		float : left;
		margin-top: 10px;
		padding-left: 15px;
	}
	
	#login_module .login_input input{
		width : 360px;
		height: 60px;
		padding-left: 10px;
		margin-top : 15px;
		border-top: none;
        border-right: none;
        border-left: none;
        border-bottom: 1px soild black;
        outline: none;
	}
	
	#login_module .login_input button{
		margin-top : 20px;
		width : 360px;
		height: 70px;
	}
	
	#login_module .div{
		margin-top:10px;
		margin-right:15px;
		height : 240px;
		width : 280px;
		float: right;
		border: 1px solid red;
	}
	
	#login_module .login_footer{
		margin-top: 15px;
	}
	
	
	
</style>


<!-- Bootstrap CDN -->
</head>
<body>


	<c:import url="/WEB-INF/views/include/top_menu.jsp" />


	<div class="pageContainer">
		<div class="module" id="login_module">
			<div class="article">
				<div class="login_box">
					<div class="login_hd">
						<h3>로그인</h3>
						<span>로그인이 필요한 서비스입니다</span>
					</div>		
					<div class="login_input">
						<form>
							<input type="text" placeholder="아이디 입력" /> <br /> 
							<input type="password" placeholder="비밀번호 입력" /> <br />
							<button type="submit">로그인</button>
						</form>
						<div class="login_footer">
								<a href="#">아이디찾기</a>&nbsp | &nbsp
								<a href="#">비밀번호찾기</a>&nbsp | &nbsp
								<a href="#">회원가입</a>
						</div>
					</div>
					<div class="div">
						임시
					</div>
				</div>
			</div>
		</div>
	</div>

	<c:import url="/WEB-INF/views/include/buttom_info.jsp" />

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








