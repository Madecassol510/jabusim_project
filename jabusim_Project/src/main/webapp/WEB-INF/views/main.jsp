<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JaBuSim</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<style>
	body{
		width:100%;
		heigth : 1200px;
	}
	
	.pageContainer{
		position: relative;
	    width: 1250px;
	    min-height: 700px;
	    margin: 0 auto;
	   	padding-top: 80px;
	    background-color: red;
	}
	
	.pageContainer > div{
		padding-top: 50px;
		padding-bottom: 50px;
	}
	
	.pageContainer .first_module{
		min-height : 600px;
		width:100%;
		background-color: blue;
		
	}
	
	.pageContainer .first_module .article{
		margin: 0 auto;
	}
	
	.pageContainer .first_module .article > div{
		float : left;
		margin-right: 60px
	}
	
	.schedule{
		border: 1px solid black;
		width : 450px;
		height : 450px;
		background-color: yellow;
		
	}
	
	.notice{
		border: 1px solid black;
		width : 450px;
		height : 450px;
		background-color: gray;
	}
	
	.schedule .hd{
		display : flex;
		width : 220px;
		align: center;
		margin : 0 auto;
		justify-content :space-between;
		height : 10%;
		
		padding-top: 5px;
		padding-bottom: 5px;
	}
		
	.calendar{
		width : 100%;
		height: 90%;
		background-color: white;
	}
	
	.pageContainer .second_module{
		min-height : 200px;
		width:100%;
		background-color: green;
	}
	
	.pageContainer .second_module .article{
		display : inline-block
		margin : 0 auto;
	}
	
	
	.pageContainer .second_module .article .card{
		marrgin : 0 auto;
	}
	
</style>
	

</head>
<body>


<c:import url="/WEB-INF/views/include/top_menu.jsp"/>




<%-- 
<div class="container text-center">
  <div class="row">
    <div class="col-md-4">
      <div class="card" >
  <img src="${root }image/image1.jpg" class="card-img-top" alt="이미지 1">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
    </div>
    
    
    <div class="col-md-4">      
<div class="card" >
  <img src="${root }image/image1.jpg" class="card-img-top" alt="이미지 1">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
    </div>
    
    <div class="col-md-4">    
     <div class="card" >
  <img src="${root }image/image1.jpg" class="card-img-top" alt="이미지 1">
  <div class="card-body">
    <h5 class="card-title"></h5>
    <p class="card-text"></p>
    <a href="#" class="btn btn-primary">접수하기</a>
  </div>
</div>

    </div>
  </div>
</div>


<!-- ================================== -->

<div class="container text-center">
  <div class="row">
    <div class="col-md-6">
      <div class="card" >
  <img src="${root }image/image1.jpg" class="card-img-top" alt="이미지 1">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
    </div>
    
    
    <div class="col-md-6">      
<div class="card" >
  <img src="${root }image/image1.jpg" class="card-img-top" alt="이미지 1">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
    </div>
    
    

  </div>
</div>
 --%>


	<div class="pageContainer">
		<div class="first_module">
			<div class="article">
				<div class="schedule">
					<div class="hd">
						<button type="button">&lt;</button>
						<h3>2023.11</h3>
						<button type="button">&gt;</button>
					</div>
					<div class="calendar"></div>
				</div>
				<div class="notice">
					<div>
						<h3>공지사항</h3>

						<button type="button">더보기</button>
					</div>
				</div>

			</div>

		</div>
		<div class="second_module">
			<div class="article">
				<div>
					<h3>오늘의 자격증</h3>
				</div>
				
				<div class="row row-cols-1 row-cols-md-3 g-4">
					<div class="col">
						<div class="card border-dark mb-3" style="max-width: 18rem;">
							<div class="card-header">Header</div>
							<div class="card-body">
								<h5 class="card-title">Dark card title</h5>
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card's content.</p>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card border-dark mb-3" style="max-width: 18rem;">
							<div class="card-header">Header</div>
							<div class="card-body">
								<h5 class="card-title">Dark card title</h5>
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card's content.</p>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card border-dark mb-3" style="max-width: 18rem;">
							<div class="card-header">Header</div>
							<div class="card-body">
								<h5 class="card-title">Dark card title</h5>
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card's content.</p>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card border-dark mb-3" style="max-width: 18rem;">
							<div class="card-header">Header</div>
							<div class="card-body">
								<h5 class="card-title">Dark card title</h5>
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card's content.</p>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card border-dark mb-3" style="max-width: 18rem;">
							<div class="card-header">Header</div>
							<div class="card-body">
								<h5 class="card-title">Dark card title</h5>
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card's content.</p>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card border-dark mb-3" style="max-width: 18rem;">
							<div class="card-header">Header</div>
							<div class="card-body">
								<h5 class="card-title">Dark card title</h5>
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card's content.</p>
							</div>
						</div>
					</div>
				</div>
				<div>
					<h3>오늘의 자격증</h3>
				</div>
			</div>
		</div>
	</div>



	<c:import url="/WEB-INF/views/include/buttom_info.jsp"/>

 <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
   
</body>
</html>