<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자격증 검색</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<style>

   /* ==========================페이지 공용================================== */

   body{
      width:100%;
      min-height : 1200px;
   }
   
   ul{
      list-style:none;
      padding : 5px;
   }
   
   li{
   
   }
   
   .pageContainer{
      position: relative;
       width: 1250px;
       min-height: 700px;
       margin: 0 auto;
         padding-top: 80px;
       border: 1px solid red;
   }
   .module{
      min-height : 600px;
      width:100%;
      border: 1px solid blue;
      text-align:center;
      padding-top: 50px;
      padding-bottom: 50px;
   }
   
   
   
   
   .article{   
      display : inline-block;
      margin: 0 auto;
      
   }
   
   /* =========================================================================== */
   .top_module{
      width:100%;
      height:300px;
   }
   
        

   
   
/* =======검색 서치바============ */
.search {
  position: relative;
  width: 400px;
  padding: 10px;
  margin: 0 10px;
}

input {
  width: 100%;
  border: 1px solid #bbb;
  border-radius: 8px;
  padding: 10px 12px;
  font-size: 14px;
}

img {
  position : absolute;
  width: 20px;
  top: 22px;
  right: 12px;
  margin: 0;
}

   /* =============체크 담는 공간========== */
   .mb-3-row{
      display: flex;
   }
   
   .col-md-10 {
      width: 950px;
      height: 80px;
      padding-left: 150px;
   }
   
   .col-md-2 button{
      width: 150px;
      height: 80px;
   }


/* 검색 파란 목록 */
    
 
    .module_2{
       display: flex;
          flex-wrap: wrap;
       gap: 20px; /* 그룹 간 간격을 필요에 맞게 조정하세요 */
   }
   
   .list-group-4 {
       flex: 1 1 30%; /* 각 그룹의 너비를 필요에 맞게 조정하세요 */
       /* 리스트 그룹에 대한 다른 스타일 */
  }
   .list-group-item{
         text-align: left;
   }
   
   
</style>
   

</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script>


</script>

   <c:import url="/WEB-INF/views/include/top_menu.jsp"/>


<!-- 자격증 검색 틀 -->



<div class="pageContainer">

<div class="module" id="top_module">

<!-- 서치바 -->
<div class="search">
  <input type="text" placeholder="찾고 싶은 자격증명을 입력해주세요.">
  <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
</div>

<!-- 검색분류 -->

<div class="module_2">
<div class="list-group-4">
  <a href="#" class="list-group-item list-group-item-action active" aria-current="true">
    분야
  </a>
  <ul class="list-group">
  <li class="list-group-item">
    <input class="form-check-input me-1" type="checkbox" value="" aria-label="...">
    경영·회계·사무
  </li>
  <li class="list-group-item">
    <input class="form-check-input me-1" type="checkbox" value="" aria-label="...">
    금융·보험
  </li>
  <li class="list-group-item">
    <input class="form-check-input me-1" type="checkbox" value="" aria-label="...">
    교육·자연·사회과학
  </li>
  <li class="list-group-item">
    <input class="form-check-input me-1" type="checkbox" value="" aria-label="...">
    법률·경찰·소방·교도·국방
  </li>
  <li class="list-group-item">
    <input class="form-check-input me-1" type="checkbox" value="" aria-label="...">
    보건·의료
  </li>
  <li class="list-group-item">
    <input class="form-check-input me-1" type="checkbox" value="" aria-label="...">
    환경·에너지·안전
   </li>
</ul>
  </div>

 
<div class="list-group-4">
  <a href="#" class="list-group-item list-group-item-action active" aria-current="true">
    자격증 종류
  </a>
  <ul class="list-group">
  <li class="list-group-item">
    <input class="form-check-input me-1" type="checkbox" value="" aria-label="...">
    국가기술자격
  </li>
  <li class="list-group-item">
    <input class="form-check-input me-1" type="checkbox" value="" aria-label="...">
    국가전문자격
  </li>
  <li class="list-group-item">
    <input class="form-check-input me-1" type="checkbox" value="" aria-label="...">
    능력검정
  </li>
  <li class="list-group-item">
    <input class="form-check-input me-1" type="checkbox" value="" aria-label="...">
    국가공인자격
  </li>
  <li class="list-group-item">
    <input class="form-check-input me-1" type="checkbox" value="" aria-label="...">
    등록민간자격
  </li>
  <li class="list-group-item">
    <input class="form-check-input me-1" type="checkbox" value="" aria-label="...">
    국제자격
  </li>
</ul>
  </div>
  
  
 <div class="list-group-4">
  <a href="#" class="list-group-item list-group-item-action active" aria-current="true">
    일정 상태
  </a>
  <ul class="list-group">
  <li class="list-group-item">
    <input class="form-check-input me-1" type="checkbox" value="" aria-label="...">
    전체
  </li>
  <li class="list-group-item">
    <input class="form-check-input me-1" type="checkbox" value="" aria-label="...">
    접수중
  </li>
  <li class="list-group-item">
    <input class="form-check-input me-1" type="checkbox" value="" aria-label="...">
    접수예정
  </li>
  <li class="list-group-item">
    <input class="form-check-input me-1" type="checkbox" value="" aria-label="...">
    오늘접수마감
  </li>
  <li class="list-group-item">
    <input class="form-check-input me-1" type="checkbox" value="" aria-label="...">
    시험일
  </li>
</ul>
  </div>
 
</div>  
  







<!-- 체크 담는 공간 -->
<div class="mb-3-row">
  <div class="col-md-10">
   <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
  </div>
    <div class="col-md-2">
   <button type="button" class="btn btn-outline-primary">접수하기</button>
  </div>
</div>




</div><!-- 모듈 -->
</div>    <!-- pageContainer -->
   
   
   
   
   
   
   
   
   
   
   
   
   <c:import url="/WEB-INF/views/include/buttom_info.jsp"/>
</body>
</html>