<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>미니 프로젝트</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>


<c:import url="/WEB-INF/views/include/top_menu.jsp"/>

<!-- 게시글 리스트 -->
<div class="container" style="margin-top:100px">
   <div class="card shadow">
      <div class="card-body">
         <h4 class="card-title">공지사항</h4>
         <table class="table table-hover" id='board_list'>
            <thead>
               <tr>
                  <th class="text-center d-none d-md-table-cell">글번호</th>
                  <th class="w-50">제목</th>
                  <th class="text-center d-none d-md-table-cell">작성자</th>
                  <th class="text-center d-none d-md-table-cell">작성날짜</th>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <td class="text-center d-none d-md-table-cell">27</td>
                  <td><a href='${root }board/read'>2023년 기술사 제131회 면접시험 최종합격자 공고</a></td>
                  <td class="text-center d-none d-md-table-cell">관리자</td>
                  <td class="text-center d-none d-md-table-cell">2023.12.15</td>
               </tr>
               <tr>
                  <td class="text-center d-none d-md-table-cell">26</td>
                  <td><a href='${root }board/read'>전기기능장 수험자 지참준비물 및 유의사항 안내</a></td>
                  <td class="text-center d-none d-md-table-cell">관리자</td>
                  <td class="text-center d-none d-md-table-cell">2023.12.14</td>
               </tr>
               <tr>
                  <td class="text-center d-none d-md-table-cell">25</td>
                  <td><a href='${root }board/read'>2024년도 조리기능사 실기시험 안내</a></td>
                  <td class="text-center d-none d-md-table-cell">관리자</td>
                  <td class="text-center d-none d-md-table-cell">2023.12.12</td>
               </tr>
               <tr>
                  <td class="text-center d-none d-md-table-cell">24</td>
                  <td><a href='${root }board/read'>2023년도 정기 기능사 제3회 필기시험 최종 합격자(1차 발표 종목) 공고</a></td>
                  <td class="text-center d-none d-md-table-cell">관리자</td>
                  <td class="text-center d-none d-md-table-cell">2023.12.12</td>
               </tr>
               <tr>
                  <td class="text-center d-none d-md-table-cell">23</td>
                  <td><a href='${root }board/read'>KS 기계제도 규격(Data Book) 안내</a></td>
                  <td class="text-center d-none d-md-table-cell">관리자</td>
                  <td class="text-center d-none d-md-table-cell">2023.12.12</td>
               </tr>
               <tr>
                  <td class="text-center d-none d-md-table-cell">22</td>
                  <td><a href='${root }board/read'>2024년도 떡제조기능사 실기시험 안내(2024년도 신규과제 수정)</a></td>
                  <td class="text-center d-none d-md-table-cell">관리자</td>
                  <td class="text-center d-none d-md-table-cell">2023.12.08</td>
               </tr>
               <tr>
                  <td class="text-center d-none d-md-table-cell">21</td>
                  <td><a href='${root }board/read'>【동일유사교과목】여성가족부령이 정하는 ‘상담관련분야’ 동일(유사)교과목</a></td>
                  <td class="text-center d-none d-md-table-cell">관리자</td>
                  <td class="text-center d-none d-md-table-cell">2023.12.07</td>
               </tr>
               <tr>
                  <td class="text-center d-none d-md-table-cell">20</td>
                  <td><a href='${root }board/read'>상시 중장비 종목(굴착기,지게차운전기능사) 시험장별 소재지 및 기종 안내</a></td>
                  <td class="text-center d-none d-md-table-cell">관리자</td>
                  <td class="text-center d-none d-md-table-cell">2023.12.07</td>
               </tr>
               <tr>
                  <td class="text-center d-none d-md-table-cell">19</td>
                  <td><a href='${root }board/read'>국가기술자격 응시자격서류 제출 유의사항 안내</a></td>
                  <td class="text-center d-none d-md-table-cell">관리자</td>
                  <td class="text-center d-none d-md-table-cell">2023.12.05</td>
               </tr>
               <tr>
                  <td class="text-center d-none d-md-table-cell">18</td>
                  <td><a href='${root }board/read'>국가기술자격 응시자격 관련학과 지정 신청 등 안내</a></td>
                  <td class="text-center d-none d-md-table-cell">관리자</td>
                  <td class="text-center d-none d-md-table-cell">2023.12.05</td>
               </tr>
            </tbody>
         </table>
         
         <div class="d-none d-md-block">
            <ul class="pagination justify-content-center">
               <li class="page-item">
                  <a href="#" class="page-link">이전</a>
               </li>
               <li class="page-item">
                  <a href="#" class="page-link">1</a>
               </li>
               <li class="page-item">
                  <a href="#" class="page-link">2</a>
               </li>
               <li class="page-item">
                  <a href="#" class="page-link">3</a>
               </li>
               <!-- <li class="page-item">
                  <a href="#" class="page-link">4</a>
               </li>
               <li class="page-item">
                  <a href="#" class="page-link">5</a>
               </li>
               <li class="page-item">
                  <a href="#" class="page-link">6</a>
               </li>
               <li class="page-item">
                  <a href="#" class="page-link">7</a>
               </li>
               <li class="page-item">
                  <a href="#" class="page-link">8</a>
               </li>
               <li class="page-item">
                  <a href="#" class="page-link">9</a>
               </li>
               <li class="page-item">
                  <a href="#" class="page-link">10</a>
               </li> -->
               <li class="page-item">
                  <a href="#" class="page-link">다음</a>
               </li>
            </ul>
         </div>
         
         <div class="d-block d-md-none">
            <ul class="pagination justify-content-center">
               <li class="page-item">
                  <a href="#" class="page-link">이전</a>
               </li>
               <li class="page-item">
                  <a href="#" class="page-link">다음</a>
               </li>
            </ul>
         </div>
         
         <div class="text-right">
            <a href="${root }board/write" class="btn btn-primary">글쓰기</a>
         </div>
         
      </div>
   </div>
</div>


<c:import url="/WEB-INF/views/include/buttom_info.jsp"/>

</body>
</html>