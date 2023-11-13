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
	    border: 1px solid red;
	}
	
	.pageContainer > div{
		padding-top: 50px;
		padding-bottom: 10px;
	}
	
	.pageContainer .module{
		min-height : 600px;
		width:100%;
		border: 1px solid blue;
		text-align:center;
	}
	
	.pageContainer .module .article{
		
		display : inline-block;
		margin: 0 auto;
	}
	
	
	.schedule{
		border: 1px solid black;
		width : 550px;
		height : 550px;
		margin-right: 60px;
		float: left;
	}
	
	.notice{
		border: 1px solid black;
		width : 550px;
		height : 550px;
		float: left;
	}
	
	.schedule .hd{
		display : inline-block;
		align: center;
		width : 100%;
		margin : auto;
		justify-content :space-between;
		height : 10%;
		
		padding-top: 5px;
		padding-bottom: 5px;
	}
		
	.calendar{
		width : 100%;
		height: 90%;
		border: 1px solid black;	
	}

	ul{
		padding : 0px;
		display : inline-block;
	}
	

	li{
		display : inline-block;
		list-style:none;
		margin: 10px auto;
	}
	
	.article .hd h3{
		display : inline-block;
		width:100px;
		heigh:100%;
		
	}
	
	.article .hd button{
		width:30px;
		heigh:20px;
	}
	
	.articleBtn{
		text-align: center;
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
		<div class="module" style="min-height:150px; padding-top: 10">
			<form class="d-flex" style="width:650px; height:65px; margin:0 auto; border: 1px solid black;">
			   <input type="text" class="form-control me-2" style=" outline:none">
			   <button type="submit" class="btn btn-primary">Search</button>
			</form>
		</div>	
		<div class="module">
			<div class="article">
				<div class="schedule">
					<div class="hd">
						<button type="button">&lt;</button>
						<h3 >2023.11</h3>
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
		<div class="module">
			<div class="article">
				<!-- <h3>오늘의 자격증</h3> -->
				<ul>
					<li>
						<div class="card border-dark mb-3" style="max-width: 18rem;">
							<div class="card-header">Header</div>
							<div class="card-body">
								<h5 class="card-title">Dark card title</h5>
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card's content.</p>
							</div>
						</div>
					</li>
					<li>
						<div class="card border-dark mb-3" style="max-width: 18rem;">
							<div class="card-header">Header</div>
							<div class="card-body">
								<h5 class="card-title">Dark card title</h5>
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card's content.</p>
							</div>
						</div>
					</li>
					<li>
						<div class="card border-dark mb-3" style="max-width: 18rem;">
							<div class="card-header">Header</div>
							<div class="card-body">
								<h5 class="card-title">Dark card title</h5>
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card's content.</p>
							</div>
						</div>
					</li>
					<li>
						<div class="card border-dark mb-3" style="max-width: 18rem;">
							<div class="card-header">Header</div>
							<div class="card-body">
								<h5 class="card-title">Dark card title</h5>
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card's content.</p>
							</div>
						</div>
					</li>
					<li>
						<div class="card border-dark mb-3" style="max-width: 18rem;">
							<div class="card-header">Header</div>
							<div class="card-body">
								<h5 class="card-title">Dark card title</h5>
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card's content.</p>
							</div>
						</div>
					</li>
					<li>
						<div class="card border-dark mb-3" style="max-width: 18rem;">
							<div class="card-header">Header</div>
							<div class="card-body">
								<h5 class="card-title">Dark card title</h5>
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card's content.</p>
							</div>
						</div>
					</li>
					<li>
						<div class="card border-dark mb-3" style="max-width: 18rem;">
							<div class="card-header">Header</div>
							<div class="card-body">
								<h5 class="card-title">Dark card title</h5>
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card's content.</p>
							</div>
						</div>
					</li>
					<li>
						<div class="card border-dark mb-3" style="max-width: 18rem;">
							<div class="card-header">Header</div>
							<div class="card-body">
								<h5 class="card-title">Dark card title</h5>
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card's content.</p>
							</div>
						</div>
					</li>
				</ul>
				<div class="articleBtn">
					<button type="button">이전</button>
					<button type="button">다음</button>
				</div>
			</div>
		</div>
	</div>



	<c:import url="/WEB-INF/views/include/buttom_info.jsp"/>

 <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
   
</body>
</html>