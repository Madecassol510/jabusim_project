<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value='${pageContext.request.contextPath}/' />

<!-- Bootstrap CSS -->
<link href="/docs/5.3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">

<!-- Bootstrap JavaScript Bundle -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<style>
.sideMenubar {
	position: fixed;
}
</style>

<div class="flex-shrink-0 p-3 sideMenubar" style="width: 280px;">
	<ul class="list-unstyled">
		<li class="mb-1"><a href="${root}mypage/main"
			class="link-body-emphasis d-inline-flex text-decoration-none rounded">마이페이지</a>
		</li>
		<li class="mb-1">
			<button
				class="btn btn-toggle d-inline-flex align-items-center rounded border-0"
				data-bs-toggle="collapse" data-bs-target="#detail-collapse"
				aria-expanded="false">나의 내역 관리</button>
			<div class="collapse" id="detail-collapse">
				<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
					<li><a href="${root}mypage/myDetailManage/exam_result"
						class="link-body-emphasis d-inline-flex text-decoration-none rounded">자격증
							시험 결과</a></li>
					<li><a href="${root}mypage/myDetailManage/receiptDetail"
						class="link-body-emphasis d-inline-flex text-decoration-none rounded">자격증
							접수 내역</a></li>
					<li><a href="${root}mypage/myDetailManage/inquiryDetail"
						class="link-body-emphasis d-inline-flex text-decoration-none rounded">문의
							결과 내역</a></li>
				</ul>
			</div>
		</li>
		<li class="mb-1">
			<button
				class="btn btn-toggle d-inline-flex align-items-center rounded border-0"
				data-bs-toggle="collapse" data-bs-target="#info-collapse"
				aria-expanded="false">나의 정보 관리</button>
			<div class="collapse" id="info-collapse">
				<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
					<li><a
						href="${root}mypage/myInfoManage/checkPw?myInfoManagePage=1"
						class="link-body-emphasis d-inline-flex text-decoration-none rounded">
							비밀번호 변경
							</a></li>
					<li><a
						href="${root}mypage/myInfoManage/checkPw?myInfoManagePage=2"
						class="link-body-emphasis d-inline-flex text-decoration-none rounded">학력/경력
							수정</a></li>
					<li><a
						href="${root}mypage/myInfoManage/checkPw?myInfoManagePage=3"
						class="link-body-emphasis d-inline-flex text-decoration-none rounded">자격증
							보유 신청</a></li>
				</ul>
			</div>
		</li>

	</ul>
</div>