<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CDN -->
<!-- Bootstrap CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />

	<div class="container" style="margin-top: 56px">

		<!-- 마이페이지메뉴 -->
		<ul class="nav nav-pills">
			<li class="nav-item"><a class="nav-link"
				href="${root }mypage/my_certificate">보유자격증 확인</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${root }mypage/registered_certificate ">접수자격증확인</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${root }mypage/chk_schedule ">개인일정확인</a></li>
			<li class="nav-item"><a class="nav-link active"
				href="${root }mypage/valid_passwd">개인정보변경</a></li>
		</ul>

		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
						<form action="${root }mypage/modify_info" method="get">
							<div class="form-group">
								<label for="chk_passwd">비밀번호확인</label> <input type="password"
									id="user_name" name="chk_passwd" class="form-control" />
							</div>
							<div class="form-group text-right">
								<button type="submit" class="btn btn-primary">확인</button>
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