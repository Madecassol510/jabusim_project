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

		<div class="container" style="margin-top: 50px">
			<div class="row">
				<div class="col-sm-3"></div>
				<div class="col-sm-6">
					<div class="card shadow">
						<div class="card-body">
							<h4 class="mb-3">개인정보변경</h4>

							<form action="${root}mypage/compledted_modify" method="get">
								<div class="form-group">
									<label for="user_name">이름</label> <input type="text"
										id="user_name" name="user_name" class="form-control" />
								</div>
								<div class="form-group">
									<label for="user_id">아이디</label>
									<div class="input-group">
										<input type="text" id="user_id" name="user_id"
											class="form-control" />
									</div>
								</div>
								<div class="form-group">
									<label for="user_pw">비밀번호</label> <input type="password"
										id="user_pw" name="user_pw" class="form-control" />
								</div>
								<div class="form-group">
									<label for="user_pw2">비밀번호 확인</label> <input type="password"
										id="user_pw2" name="user_pw2" class="form-control" />
								</div>

								<!-- 추가된 이메일 항목 -->
								<div class="form-group">
									<label for="email">이메일</label> <input type="email" id="email"
										name="email" class="form-control" />
								</div>

								<!-- 추가된 주소 항목 -->
								<div class="form-group">
									<label for="address">주소</label> <input type="text" id="address"
										name="address" class="form-control" />
								</div>

								<!-- 추가된 전화번호 항목 -->
								<div class="form-group">
									<label for="tel">전화번호</label> <input type="tel" id="tel"
										name="tel" class="form-control" />
								</div>

								<!-- 추가된 소유 자격증 항목 -->
								<div class="form-group">
									<label for="license">소유 자격증</label> <select class="form-select"
										aria-label="Default select example">
										<option selected>자격증을 선택하세요</option>
										<option value="1">One</option>
										<option value="2">Two</option>
										<option value="3">Three</option>
									</select>
								</div>

								<!-- 추가된 개인사진 항목 -->
								<div class="form-group">
									<label for="photo">개인사진</label> <input type="file" id="photo"
										name="photo" class="form-control-file" />
								</div>

								<div class="form-group">
								<div class="text-right">
									<button type="submit" class="btn btn-primary">변경하기</button>
								</div>
							</div>
							</form>

						</div>
					</div>
				</div>
				<div class="col-sm-3"></div>
			</div>
		</div>

	</div>

	<c:import url="/WEB-INF/views/include/buttom_info.jsp" />
</body>
</html>