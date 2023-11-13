<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>자격증 정보 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
    <style>
    
       .navbar {
        position: fixed !important;
        top: 0;
        right: 0;
        left: 0;
        z-index: 1030; /* 다른 요소들 위에 나타나도록 z-index 값을 높임 */
          }
        .container-box {
            border: 1px solid #dee2e6; /* 테두리 색상 */
            background-color: #f8f9fa; /* 배경색 */
            border-radius: 0.25rem; /* 모서리 둥글기 */
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075); /* 그림자 효과 */
            padding: 1rem; /* 내부 여백 */
            margin-top: 1rem; /* 상단 여백 */
            margin-bottom: 1rem; /* 하단 여백 */
        }
        .card {
            margin-bottom: 1rem; /* 각 카드 사이의 여백 */
        }
    </style>
</head>
<body>

<c:import url="/WEB-INF/views/include/top_menu.jsp"/>


<div class="container-box mx-auto my-5">
    <!-- 배너 섹션 -->
    <div class="card mx-auto my-5" style="max-width: 940px;">
        <div class="card-body text-center">
            <img src="자격증_이미지_URL" alt="자격증 이미지" class="img-fluid">
            <h1 class="card-title mt-3">자격증명</h1>
            <a href="시험접수_링크" class="btn btn-primary mt-2">시험 접수</a>
        </div>
    </div>

    <!-- 자격증 정보 섹션 -->
    <div class="card mx-auto my-5" style="max-width: 940px;">
        <div class="card-body">
            <h2 class="card-title">자격증 정보</h2>
            <p class="card-text">자격증 데이터</p>
        </div>
    </div>

    <!-- 시험 합격률 그래프 섹션 -->
    <div class="card mx-auto my-5" style="max-width: 940px;">
        <div class="card-body">
            <h2 class="card-title">시험 합격률</h2>
            <canvas id="passRateChart"></canvas>
        </div>
    </div>

    <!-- 자격증을 우대하는 회사 정보 섹션 -->
    <div class="card mx-auto my-5" style="max-width: 940px;">
        <div class="card-body">
            <h2 class="card-title">자격증을 우대하는 회사</h2>
            <ul class="list-group list-group-flush">
                <li class="list-group-item">회사 1</li>
                <li class="list-group-item">회사 2</li>
                <!-- 여기에 추가 회사 정보를 적습니다 -->
            </ul>
        </div>
    </div>
</div>
    <!-- Bootstrap 및 그래프 구현을 위한 JS -->
    <script>
    const ctx = document.getElementById('passRateChart').getContext('2d');
    const passRateChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['2018년', '2019년', '2020년', '2021년', '2022년'], // 년도
            datasets: [
                {
                    label: '1차',
                    data: [10, 30, 50, 70, 90], // 1차 데이터
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                },
                {
                    label: '2차',
                    data: [20, 40, 60, 80, 100], // 2차 데이터(2차가 없는 시험의 경우 이 항목은 제외 예정)
                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                    borderColor: 'rgba(255, 99, 132, 1)',
                    borderWidth: 1
                }
            ]
        },
        options: {
            scales: {
                x: {
                    // 바의 간격 조정
                    barPercentage: 0.4,
                    categoryPercentage: 0.8
                },
                y: {
                    beginAtZero: true
                }
            },
            plugins: {
                legend: {
                    position: 'top', // 범례 위치 조정
                }
            }
        }
    });
    </script>
    
    <c:import url="/WEB-INF/views/include/buttom_info.jsp"/>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
    
    
</body>
</html>