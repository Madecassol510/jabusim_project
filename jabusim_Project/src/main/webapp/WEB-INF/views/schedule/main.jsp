<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자격증 달력</title>

<style>
	body{
		width:1113.6px;
		height:2230px;
	}
	
	.pageContainer{
		width : 900px;
		height : 1800px;
		background-color: red;
		margin:auto;
	}

</style>
	
	

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
	<c:import url="/WEB-INF/views/include/top_menu.jsp"/>
	
	<div class="pageContainer" >
		<div>
		
		
		</div>
	</div>
		
	
	<c:import url="/WEB-INF/views/include/buttom_info.jsp"/>

</body>
</html>