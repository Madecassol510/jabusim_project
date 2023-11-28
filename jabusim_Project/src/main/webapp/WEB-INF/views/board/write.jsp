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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<!-- SummerNote CSS 파일 -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.css"
	rel="stylesheet">
<!-- SummerNote JavaScript 파일 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.min.js"></script>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
</head>
<body>


	<c:import url="/WEB-INF/views/include/top_menu.jsp" />


	<div class="container" style="margin-top: 100px">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
						<form:form action='${root }board/write_pro' method='post'
							modelAttribute="writeContentBean" enctype="multipart/form-data">
							<div class="form-group">
								<form:label path="content_subject">제목</form:label>
								<form:input path="content_subject" class='form-control' />
								<form:errors path='content_subject' style='color:red' />
							</div>
							<div class="form-group">
								<form:label path="content_text">내용</form:label>
								<form:textarea path="content_text" class="form-control"
									rows="10" style="resize: none" id="content_text" />
								<form:errors path='content_text' style='color:red' />
							</div>
							<div class="form-group">
								<form:label path="upload_file">첨부 이미지</form:label>
								<form:input type='file' path='content_file' class="form-control"
									accept="image/*" />
							</div>
							<div class="form-group">
								<div class="text-right">
									<form:button class='btn btn-primary'>작성하기</form:button>
								</div>
							</div>

						</form:form>
					</div>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$('#content_text').summernote({
				height : 300, // 에디터의 높이
				minHeight : null, // 최소 높이
				maxHeight : null, // 최대 높이
				focus : true
			// 에디터 로딩 후 포커스를 맞출지 여부
			});
		});
	</script>


	<c:import url="/WEB-INF/views/include/buttom_info.jsp" />

</body>
</html>
