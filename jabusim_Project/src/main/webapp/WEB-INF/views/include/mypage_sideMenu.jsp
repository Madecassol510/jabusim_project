<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value='${pageContext.request.contextPath}/'/>

<style>
	.sideMenubar{
		position: fixed;
		z-index: 10;
	}
</style>

<div class="sideMenubar">
	<ul>
		<li><a href="${root}mypage/main">마이페이지</a></li>
		<%-- <li><a href="${root}mypage/licenseSchedule">나의 일정</a></li> --%>
		<li><a href="#">나의 내역 관리</a>
			<ul>
				<li><a href="${root}mypage/myDetailManage/exam_result">자격증 시험 결과</a></li>
				<li><a href="${root}mypage/myDetailManage/receiptDetail">자격증 접수 내역</a></li>
				<li><a href="${root}mypage/myDetailManage/inquiryDetail">문의 결과 내역</a></li>
			</ul></li>
		<li><a href="#">나의 정보 관리</a>
			<ul>
				<li><a href="${root}mypage/myInfoManage/checkPw?myInfoManagePage=1">개인 정보 수정</a></li>
				<li><a href="${root}mypage/myInfoManage/checkPw?myInfoManagePage=2">학력/경력 수정</a></li>
				<li><a href="${root}mypage/myInfoManage/checkPw?myInfoManagePage=3">자격증 보유 신청</a></li>
			</ul></li>
	</ul>
</div>