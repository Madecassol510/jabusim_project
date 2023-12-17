<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value='${pageContext.request.contextPath}/'/>

<link rel="stylesheet" href="${root }/css/top_menu.css" />

<div class="top-wrapped">
	<div class="top-menu-container">
		
		<!-- top menu title section -->
		<div class="top-title-section">
			<a href="${root }main" class="title-logo"> JaBuSim </a>
		</div>

		<!-- top menu section start -->
		<div class="top-menu-section">
			<ul class="top-menu-content">
				<li class="top-menu-item"><a href="${root }search/main" class="top-menu-link"> 자격증 검색 </a></li>
				<span> | </span>
				<li class="top-menu-item"><a href="${root }receipt/main" class="top-menu-link"> 자격증 접수 </a></li>
				<span> | </span>
				<li class="top-menu-item"><a href="${root }board/main" class="top-menu-link"> 공지사항 </a></li>
			</ul>
		</div> <!-- top menu section end -->

		<!-- top login section start -->
		<ul class="top-login-section">
			<c:choose>
				<c:when test="${loginUserBean.isUserLogin() == true }">
					<c:choose>
						<c:when test="${loginUserBean.getUser_role() == '회원' }">
							<li class="login-item"><a href="${root }user/logout"
								class="login-item-link">로그아웃</a></li>
							<li class="login-item"><a href="${root }mypage/main"
								class="login-item-link">마이페이지</a></li>
						</c:when>
						<c:otherwise>
							<li class="login-item"><a href="${root }user/logout"
								class="login-item-link">로그아웃</a></li>
							<li class="login-item"><a
								href="${root }adminPage/memberManage" class="login-item-link">관리자페이지</a></li>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<li class="login-item"><a href="${root }user/login" class="login-item-link">로그인</a></li>
					<li class="login-item"><a href="${root }user/join" class="login-item-link">회원가입</a></li>
					<li class="login-item"><a href="${root }adminPage/memberManage" class="login-item-link">관리자페이지</a></li>
				</c:otherwise>
			</c:choose>
		</ul> <!-- top login section end -->
	</div>
</div>




