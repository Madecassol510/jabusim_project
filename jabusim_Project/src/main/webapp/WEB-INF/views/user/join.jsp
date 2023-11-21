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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
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
	

	
	
</style>	
	

</head>
<body>
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />


	<div class="pageContainer">
		<div class="module" id="join_module">
			<div class="article">
				<div class="join_hd">
					<h3>회원가입</h3>
					<!-- <span>*필수입력사항</span> -->
				</div>
					<form:form action="${root}user/join_pro" method="post" class="join_input" modelAttribute="joinUserBean">
						<div class="input_box"> 
							<div class="input_name">
								<span>이름</span>
							</div>
							<div class="input_place">
								<div class="input_placeTop">
									<form:input path="user_name" />
								</div>
								<div class="input_placeBottom">
									<form:errors path="user_name" style="color:red"/>
								</div>
							</div>
						</div>
						<div class="input_box"> 
							<div class="input_name">
								<span>아이디</span>
							</div>
							<div class="input_place">
								<div class="input_placeTop">
									<form:input path="user_id" />
								</div>
								<div class="input_placeBottom">
									<form:errors path="user_id" style="color:red"/>
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
									<form:errors path="user_pw" style="color:red"/>
								</div>
							</div> 
						</div>
						<div class="input_box"> 
							<div class="input_name">
								<span>패스워드 확인</span>
							</div>
							<div class="input_place">
								<div class="input_placeTop">
									<form:input path="user_pw2" type="password" />
								</div>
								<div class="input_placeBottom">
									<form:errors path="user_pw2" style="color:red"/>
									
								</div>				
							</div>
						</div>
						<div class="input_box"> 
							<div class="input_name">
								<span>성별</span>
							</div>
							<div class="input_place">
								<div class="input_placeTop">
									<form:input path="user_gender"/>
								</div>
								<div class="input_placeBottom">
									<form:errors path="user_gender" style="color:red"/>
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
									<form:errors path="user_birthdate" style="color:red"/>
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
									<form:errors path="user_phoneNum" style="color:red"/>
								</div>
								
							</div>
						</div>
						
						<div class = "input_footer">
							<div class="input_footerDiv">
								<button type="button" onClick="location.href='${root}main'">취소</button>
								<form:button type="submit" style="margin-left: 20px;">회원가입</form:button>
							</div>
						</div>
					</form:form>									
			</div>
		</div>
	</div>


	<%-- 
	<div class="container" style="margin-top: 100px">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
					<h4 class="mb-3">회원가입</h4>
					
						<form action="${root }main" method="get">
							<div class="form-group">
								<label for="user_name">이름</label> <input type="text"
									id="user_name" name="user_name" class="form-control" />
							</div>
							<div class="form-group">
								<label for="user_id">아이디</label>
								<div class="input-group">
									<input type="text" id="user_id" name="user_id" class="form-control" />
									<div class="input-group-append">
										<button type="button" class="btn btn-primary">중복확인</button>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="user_pw">비밀번호</label> <input type="password" id="user_password" name="user_pw" class="form-control" />
							</div>
							<div class="form-group">
								<label for="user_pw2">비밀번호 확인</label> <input type="password" id="user_password2" name="user_pw2" class="form-control" />
							</div>

							<div class="form-group">
								<label for="email">이메일</label> <input type="email" id="user_email" name="email" class="form-control" />
							</div>

							<div class="form-group">
								<label for="address">주소</label> <input type="text" id="user_address" name="address" class="form-control" />
							</div>

							<div class="form-group">
								<label for="tel">전화번호</label> <input type="tel" id="user_tel" name="tel" class="form-control" />
							</div>

							<div class="form-group">
								<label for="education">학력</label> <input type="text" id="user_education" name="education" class="form-control" />
							</div>

							<div class="form-group">
								<label for="career">경력</label> <input type="text" id="user_career" name="career" class="form-control" />
							</div>

							
							<!-- 추가된 개인사진 항목 -->
							<div class="form-group">
								<label for="photo">개인사진</label> 
								<input type="file" id="photo" name="photo" class="form-control-file" />
							</div>

							<div class="form-group">
								<div class="text-right">
									<button type="submit" class="btn btn-primary">회원가입</button>
								</div>
							</div>
						</form>
						
					</div>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div> --%>

	<c:import url="/WEB-INF/views/include/buttom_info.jsp" />


</body>
</html>









