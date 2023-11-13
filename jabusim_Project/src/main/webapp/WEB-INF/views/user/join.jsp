<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />


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

</head>
<body>

	<c:import url="/WEB-INF/views/include/top_menu.jsp" />


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

							<!-- 추가된 소유 자격증 항목 -->
							<div class="form-group">
								<label for="license">소유 자격증</label>
									
									<select class="form-select" aria-label="Default select example">
									<option selected>자격증을 선택하세요</option>
									<option value="1">One</option>
									<option value="2">Two</option>
									<option value="3">Three</option>
								</select>
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
	</div>

	<c:import url="/WEB-INF/views/include/buttom_info.jsp" />


</body>
</html>









