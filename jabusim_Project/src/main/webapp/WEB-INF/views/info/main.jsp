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
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        .sidebar-styling {
            width: 100px;
            position: fixed;
            top: 30%;
            right: 150px;
            height: 18%;
            background-color: transparent;
            border-left: 1px solid grey;
        }

        .sidebar-styling ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .sidebar-btn {
            display: block;
            width: 100%;
            padding: 10px;
            border: none;
            background-color: transparent;
            color: grey;
            text-align: left;
            transition: color 0.3s, background-color 0.3s;
            cursor: pointer;
        }

        .sidebar-btn.active,
        .sidebar-btn:hover {
            color: black;
            background-color: rgba(255, 255, 255, 0.1);
        }

        .navbar {
            position: fixed;
            top: 0;
            right: 0;
            left: 0;
            z-index: 1030;
        }

        .container-box {
            position: relative;
            width: 1250px;
            min-height: 700px;
            margin: 0 auto;
            padding-top: 80px;
            border: 1px solid red;
        }

        .card {
        	width: 1000px;
        	min-height: 700px;
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>

    <c:import url="/WEB-INF/views/include/top_menu.jsp"/>

    <!-- 사이드바 -->
    <div class="sidebar-styling">
        <ul>
            <li><button class="sidebar-btn" data-bs-target="#banner-section">배너</button></li>
            <li><button class="sidebar-btn" data-bs-target="#info-section">정보</button></li>
            <li><button class="sidebar-btn" data-bs-target="#passrate-section">합격률</button></li>
            <li><button class="sidebar-btn" data-bs-target="#companies-section">우대회사</button></li>
        </ul>
    </div>

    <div class="container-box mx-auto my-5">
        <div id="banner-section" class="card mx-auto my-5">
            <div class="card-body text-center">
                <img src="자격증_이미지_URL" alt="자격증 이미지" class="img-fluid">
                <!-- <h1 class="card-title mt-3">자격증명</h1> -->
                <h1 class="card-title mt-3">${infoLicenseBean.getLicense_name()}</h1>
                <a href="시험접수_링크" class="btn btn-primary mt-2">시험 접수</a>
            </div>
        </div>

        <div id="info-section" class="card mx-auto my-5">
            <div class="card-body">
                <h2 class="card-title">자격증 정보</h2>
                <!-- <p class="card-text">자격증 데이터</p> -->
                <p class="card-text">${infoLicenseBean.getLicense_info()}</p>
            </div>
        </div>

        <div id="passrate-section" class="card mx-auto my-5">
            <div class="card-body">
                <h2 class="card-title">시험 합격률</h2>
                <canvas id="passRateChart"></canvas>
            </div>
        </div>
    </div>

    <script>
        const ctx = document.getElementById('passRateChart').getContext('2d');
        const passRateChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['2018년', '2019년', '2020년', '2021년', '2022년'],
                datasets: [{
                    label: '1차',
                    data: [10, 30, 50, 70, 90],
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }, {
                    label: '2차',
                    data: [20, 40, 60, 80, 100],
                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                    borderColor: 'rgba(255, 99, 132, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    x: {
                        barPercentage: 0.4,
                        categoryPercentage: 0.8
                    },
                    y: {
                        beginAtZero: true
                    }
                },
                plugins: {
                    legend: {
                        position: 'top',
                    }
                }
            }
        });

        document.querySelectorAll('.sidebar-btn').forEach(item => {
            item.addEventListener('click', event => {
                event.preventDefault();
                const section = document.querySelector(item.getAttribute('data-bs-target'));
                section.scrollIntoView({ behavior: 'smooth' });
            });
        });

        window.addEventListener('scroll', function() {
            var scrollPosition = window.scrollY || document.documentElement.scrollTop;

            document.querySelectorAll('.container-box > div[id]').forEach(function(section) {
                if (section.offsetTop <= scrollPosition && (section.offsetTop + section.offsetHeight) > scrollPosition) {
                    document.querySelectorAll('.sidebar-btn').forEach(function(btn) {
                        btn.classList.remove('active');
                        if (section.getAttribute('id') === btn.getAttribute('data-bs-target').substring(1)) {
                            btn.classList.add('active');
                        }
                    });
                }
            });
        });
    </script>

    <c:import url="/WEB-INF/views/include/buttom_info.jsp"/>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
</body>
</html>