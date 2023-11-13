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

						<form action="${root }main" method="get">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">아이디</label>
								<input type="email" class="form-control" id="user_id">
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">비밀번호</label>
								<input type="password" class="form-control" id="user_password">
							</div>
							<div class="mb-3 text-right">
								<button type="submit" class="btn btn-primary float-right">로그인</button>
								<a href="${root }user/join" class="btn btn-danger float-right">회원가입</a>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>


	<c:import url="/WEB-INF/views/include/buttom_info.jsp" />



</body>
</html>








