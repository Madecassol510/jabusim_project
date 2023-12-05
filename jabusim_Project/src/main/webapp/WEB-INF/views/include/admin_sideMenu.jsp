<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value='${pageContext.request.contextPath}/'/>


<style>
.topMenu {
	position: fixed;
	width: 100%;
	height: 100px;
	border: 1px solid green;
}

.sideMenu {
	border: 1px solid blue;
	position: fixed;
	width: 250px;
	height: 100%;
	text-align: center;
	z-index: 3;
}

.sideMenu ul {
	height: 100%;
}

.sideMenu li {
	width: 100%;
	height: 80px;
	display: flex;
	align-items: center;
	justify-content: center;
	border: 1px solid blue;
}

.sideMenu li:first-child {
	height: 100px;
	margin-bottom: 100px;
}
</style>


<div class="sideMenu">
	<ul>
		<li onclick="location.href='${root}main'"><div >자부심</div></li>
		<li onclick="location.href='${root}adminPage/main'"><div>HOME</div></li>
		<li onclick="location.href='${root}adminPage/memberManage'"><div>회원관리</div></li>
		<li onclick="location.href='${root}adminPage/inquiryManage'"><div>문의관리(일반)</div></li>
		<li onclick="location.href='${root}adminPage/inquiryManage'"><div>문의관리(학력)</div></li>
		<li onclick="location.href='${root}adminPage/inquiryManage'"><div>문의관리(경력)</div></li>
		<li onclick="location.href='${root}adminPage/licenseManage'"><div>자격증관리</div></li>
		<li onclick="location.href='${root}adminPage/licenseManage'"><div>우대회사관리</div></li>
		<li onclick="location.href='${root}adminPage/examManage'"><div>시험관리</div></li>
		<li onclick="location.href='${root}adminPage/examManage'"><div>장소관리</div></li>
		<li onclick="location.href='${root}adminPage/examManage'"><div>접수관리</div></li>
	</ul>
</div>

<div class="topMenu"></div>