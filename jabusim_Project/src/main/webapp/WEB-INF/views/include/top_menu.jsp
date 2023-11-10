<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value='${pageContext.request.contextPath}/'/>

<!-- <nav class="navbar navbar-expand-sm navbar-light bg-light">
<a href="#" class="navbar-brand mb-0 h1">
<img class="d-inline-block align-top" src="https://getbootstrap.com/docs/4.0/assets/brand/bootstrap-solid.svg"
width="30" height="30" />
JaBuSim
</a> -->

<style>
	.navbar{
	    position: fixed;
	    width : 100%;
	    z-index: 1;   
	}
</style>


 <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
        <a href="#" class="navbar-brand mb-0 h1">
            <img class="d-inline-block align-top" src="https://getbootstrap.com/docs/4.0/assets/brand/bootstrap-solid.svg"
                width="30" height="30" />
            JaBuSim
        </a>


<div class="collapse navbar-collapse" id="navbarNav">
	<ul class="navbar-nav">
		<li class="nav-item active">
			<a href="#" class="nav-link">
			자격증 정보
			</a>
		</li>
		
		<li class="nav-item active">
			<a href="${root }search/main" class="nav-link">
			자격증 검색
			</a>
		</li>
		
		<li class="nav-item active">
			<a href="${root }schedule/main" class="nav-link">
			자격증 달력
			</a>
		</li>
		
		<li class="nav-item active">
			<a href="#" class="nav-link">
			자격증 접수
			</a>
		</li>
	</ul>
</div>

 <form class="d-flex">
	<input type="text" class="form-control me-2">
	<button type="submit" class="btn btn-primary">Search</button>
</form>

<!-- <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
 -->
 
<ul class="navbar-nav ml-auto">
			<li class="nav-item">
				<a href="${root }user/login" class="nav-link">로그인</a>
			</li>
			<li class="nav-item">
				<a href="${root }user/join" class="nav-link">회원가입</a>
			</li>
			<li class="nav-item">
				<a href="${root }user/modify" class="nav-link">정보수정</a>
			</li>
			<li class="nav-item">
				<a href="${root }user/logout" class="nav-link">로그아웃</a>
			</li>
		</ul>

</nav>