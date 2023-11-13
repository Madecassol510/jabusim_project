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

	<!-- 컨테이너 -->
	<div class="container" style="margin-top: 56px">
		<!-- 마이페이지메뉴 -->
		<ul class="nav nav-pills">
			<li class="nav-item"><a class="nav-link"
				href="${root }mypage/my_certificate">보유자격증 확인</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${root }mypage/registered_certificate ">접수자격증확인</a></li>
			<li class="nav-item"><a class="nav-link active"
				href="${root }mypage/chk_schedule ">개인일정확인</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${root }mypage/valid_passwd">개인정보변경</a></li>
		</ul>
	</div>
	<c:import url="/WEB-INF/views/include/buttom_info.jsp" />
</body>
</html>