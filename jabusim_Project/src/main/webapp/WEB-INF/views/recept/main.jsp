<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>접수</title>

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
   
   
   /* 자격증 접수 테이블 틀 */
   @import 'https://fonts.googleapis.com/css?family=Open+Sans:600,700';

* {font-family: 'Open Sans', sans-serif;}

.rwd-table {
  margin: auto;
  min-width: 400px;
  max-width: 100%;
  border-collapse: collapse;
}

.rwd-table tr:first-child {
  border-top: none;
  background: #428bca;
  color: #fff;
}

.rwd-table tr {
  border-top: 1px solid #ddd;
  border-bottom: 1px solid #ddd;
  background-color: #f5f9fc;
  
}

.rwd-table tr:nth-child(odd):not(:first-child) {
  background-color: #ebf3f9;
}

.rwd-table th {
  display: none;
}

.rwd-table td {
  display: block;
}

.rwd-table td:first-child {
  margin-top: .5em;
}

.rwd-table td:last-child {
  margin-bottom: .5em;
}

.rwd-table td:before {
  content: attr(data-th) ": ";
  font-weight: bold;
  width: 120px;
  display: inline-block;
  color: #000;
}

.rwd-table th,
.rwd-table td {
  text-align: left;
}

.rwd-table {
  color: #333;
  border-radius: .4em;
  overflow: hidden;
}

.rwd-table tr {
  border-color: #bfbfbf;
}

.rwd-table th,
.rwd-table td {
  padding: .5em 1em;
}
@media screen and (max-width: 601px) {
  .rwd-table tr:nth-child(2) {
    border-top: none;
  }
}
@media screen and (min-width: 600px) {
  .rwd-table tr:hover:not(:first-child) {
    background-color: #d8e7f3;
  }
  .rwd-table td:before {
    display: none;
  }
  .rwd-table th,
  .rwd-table td {
    display: table-cell;
    padding: .25em .5em;
  }
  .rwd-table th:first-child,
  .rwd-table td:first-child {
    padding-left: 0;
  }
  .rwd-table th:last-child,
  .rwd-table td:last-child {
    padding-right: 0;
  }
  .rwd-table th,
  .rwd-table td {
    padding: 1em !important;
  }
}


/* THE END OF THE IMPORTANT STUFF */

/* Basic Styling */
body {
background:  #FFFFFF;

/* background: -webkit-linear-gradient(to left, #4B79A1 , #283E51); */
/* background: linear-gradient(to left, #4B79A1 , #283E51);  */       
}
h1 {
  text-align: center;
  font-size: 2.4em;
  color: #f2f2f2;
}
.container {
  display: block;
  text-align: center;
}
h3 {
  display: inline-block;
  position: relative;
  text-align: center;
  font-size: 1.5em;
  color: #cecece;
}
h3:before {
  content: "\25C0";
  position: absolute;
  left: -50px;
  -webkit-animation: leftRight 2s linear infinite;
  animation: leftRight 2s linear infinite;
}
h3:after {
  content: "\25b6";
  position: absolute;
  right: -50px;
  -webkit-animation: leftRight 2s linear infinite reverse;
  animation: leftRight 2s linear infinite reverse;
}
@-webkit-keyframes leftRight {
  0%    { -webkit-transform: translateX(0)}
  25%   { -webkit-transform: translateX(-10px)}
  75%   { -webkit-transform: translateX(10px)}
  100%  { -webkit-transform: translateX(0)}
}
@keyframes leftRight {
  0%    { transform: translateX(0)}
  25%   { transform: translateX(-10px)}
  75%   { transform: translateX(10px)}
  100%  { transform: translateX(0)}
}
   

#submit {
      background-color: #ADD8E6; /* 연한 파랑색 */
      color: white; /* 글자색을 흰색으로 설정 */
      padding: 10px 20px; /* 내부 여백 설정 */
      border: none; /* 테두리 제거 */
      text-align: center; /* 텍스트 가운데 정렬 */
      text-decoration: none; /* 텍스트에 밑줄 제거 */
      display: inline-block; /* 인라인 블록 요소로 표시 */
      font-size: 16px; /* 글자 크기 설정 */
      cursor: pointer; /* 커서 모양을 포인터로 변경하여 클릭 가능함을 나타냄 */
      border-radius: 5px; /* 버튼 테두리를 둥글게 만듦 */
    }

    /* 버튼에 호버(hover) 효과를 추가하여 마우스를 올렸을 때 스타일 변경 */
    #submit:hover {
      background-color: #87CEEB; /* 파란색으로 변경 */
    }
   
    div {
      text-align: center;
    }
/* ===========버튼 틀 ============= */
.button-container {
      display: flex;
      justify-content: center;
      gap: 20px; /* 간격 설정 */
      margin-top: 10px; /* 상단 여백 설정 */
    }


.myButton {
   box-shadow: 1px -1px 0px 0px #ffffff;
   background:linear-gradient(to bottom, #1c1f26 5%, #5085c7 100%);
   background-color:#1c1f26;
   border-radius:33px;
   border:1px solid #ffffff;
   display:inline-block;
   cursor:pointer;
   color:#ffffff;
   font-family:Arial;
   font-size:28px;
   font-weight:bold;
   padding:20px 46px;
   text-decoration:none;
   text-shadow:0px -1px 0px #b6bfd4;
}
.myButton:hover {
   background:linear-gradient(to bottom, #5085c7 5%, #1c1f26 100%);
   background-color:#5085c7;
   color:#000000;
}
.myButton:active {
   position:relative;
   top:1px;
}
   
   
   
</style>


</head>
<body>


<script>






</script>

<c:import url="/WEB-INF/views/include/top_menu.jsp"/>


<!-- 버튼 틀 -->   

<div class="pageContainer">

<div class="module" id="top_module">

<div class="button-container">
<a href="#" class="myButton">자격증 선택</a>
<a href="#" class="myButton">응시 자격 확인</a>
<a href="#" class="myButton">장소 선택</a>
<a href="#" class="myButton">접수 완료</a>
</div>
  
  

<div class="module" id="top_module2">
<!-- 테이블 틀 -->   
<div class="container">

  <table class="rwd-table">
    <tbody>
      <tr>
        <th>지역</th>
        <th>시험 일자</th>
        <th>시험 회차</th>
        <th>입실 시간</th>
        <th>시험 장소</th>
        <th>접수마감 일자</th>
        <th>정원</th>
        <th colspan="2">현재 접수 가능 인원</th>
      </tr>
      <tr>
        <td data-th="Supplier Code">
          서울 특별시
        </td>
        <td data-th="Supplier Name">
          2023.01.01(월)
        </td>
        <td data-th="Invoice Number">
          2차 실기
        </td>
        <td data-th="Invoice Date">
          10:00
        </td>
        <td data-th="Due Date">
          서울 남부 국가 자격 시험장(영등포구)
        </td>
        <td data-th="Net Amount">
          2022.12.01
        </td>
        <td data-th="Person">
          30명
        </td>
        <td data-th="Poss Person">
          15명
        </td>
          <td data-th="Submit">
          <button id="submit">접수하기</button>

        </td>
      </tr>
      <tr>
        <td data-th="Supplier Code">
          서울 특별시
        </td>
        <td data-th="Supplier Name">
          2023.01.01(월)
        </td>
        <td data-th="Invoice Number">
          2차 실기
        </td>
        <td data-th="Invoice Date">
          10:00
        </td>
        <td data-th="Due Date">
          서울 남부 국가 자격 시험장(영등포구)
        </td>
        <td data-th="Net Amount">
          2022.12.01
        </td>
        <td data-th="Person">
          30명
        </td>
        <td data-th="Poss Person">
          15명
        </td>
          <td data-th="Submit">
          <button id="submit">접수하기</button>
      </tr>
      <tr>
        <td data-th="Supplier Code">
          서울 특별시
        </td>
        <td data-th="Supplier Name">
          2023.01.01(월)
        </td>
        <td data-th="Invoice Number">
          2차 실기
        </td>
        <td data-th="Invoice Date">
          10:00
        </td>
        <td data-th="Due Date">
          서울 남부 국가 자격 시험장(영등포구)
        </td>
        <td data-th="Net Amount">
          2022.12.01
        </td>
        <td data-th="Person">
          30명
        </td>
        <td data-th="Poss Person">
          15명
        </td>
          <td data-th="Submit">
          <button id="submit">접수하기</button>
      </tr>
      <tr>
        <td data-th="Supplier Code">
          서울 특별시
        </td>
        <td data-th="Supplier Name">
          2023.01.01(월)
        </td>
        <td data-th="Invoice Number">
          2차 실기
        </td>
        <td data-th="Invoice Date">
          10:00
        </td>
        <td data-th="Due Date">
          서울 남부 국가 자격 시험장(영등포구)
        </td>
        <td data-th="Net Amount">
          2022.12.01
        </td>
        <td data-th="Person">
          30명
        </td>
        <td data-th="Poss Person">
          15명
        </td>
          <td data-th="Submit">
          <button id="submit">접수하기</button>
      </tr>
    </tbody>
  </table>
  <h3>접수하기</h3>
</div>
</div>
</div>







</div> <!-- pageContainer -->


















<c:import url="/WEB-INF/views/include/buttom_info.jsp" />



</body>
</html>