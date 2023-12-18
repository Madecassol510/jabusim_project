document.getElementById('regionButton').addEventListener('click', function() {
    var regionSelectValue = document.getElementById('regionSelect').value;
    console.log(regionSelectValue);

    $.ajax({
        url: '/jabusim_Project/receipt/receipt_selectRegion', // 요청을 보낼 URL
        type: 'GET',
        data: {
            region: regionSelectValue // 선택된 지역 값
        },
        dataType: 'json', // 서버로부터 받을 데이터 타입
        success: function(response) {
			console.log(response);
			console.log(response.pageBean.currentPage);
            // 성공적으로 응답을 받았을 때의 처리
	        updateTableContent(response.data, response.pageBean.currentPage);
	        // 페이지네이션 링크 업데이트
	        loadPageWithRegionSearch(response.pageBean, regionSelectValue);
        },
        error: function(xhr, status, error) {
            // 오류 발생 시 처리
            console.error("조회 요청 실패:", status, error);
        }
    });
});

/*
function updateTableContent(data) {
    var tbody = document.querySelector('#bottom_module_inner tbody');
    tbody.innerHTML = ''; // 기존 테이블 내용을 초기화

    data.forEach(function(item, index) {
        var tr = document.createElement('tr');
        var tableHtml = '';

        tableHtml += '<td>' + (index + 1) + '</td>';
        tableHtml += '<td>' + item.examPlace_region + '</td>';
        tableHtml += '<td>' + item.examPlace_address + '</td>';
        tableHtml += '<td>' + item.examPlace_name + '</td>';
        tableHtml += '<td>' + item.examPlace_maximum + '</td>';
        tableHtml += '<td>';
        tableHtml += '<form action="' + rootContextPath + 'receipt/receipt_pro" method="post">';
        tableHtml += '<input type="hidden" name="examPlaceName" value="' + item.examPlace_name + '" />';
        tableHtml += '<button type="submit">선택</button>';
        tableHtml += '</form>';
        tableHtml += '</td>';

        tr.innerHTML = tableHtml;
        tbody.appendChild(tr);
    });
}
*/



function loadPage(pageNumber) {
    $.ajax({
        url: '/jabusim_Project/receipt/ajax_paging_place',
        type: 'GET',
        data: {
            'page': pageNumber,
        },
        success: function(response) {
            // 페이지의 특정 부분 업데이트
	        updateTableContent(response.data, pageNumber);
	
	        // 페이지네이션 링크 업데이트
	        updatePaginationLinks(response.pageBean);
        },
        error: function(error) {
            console.error('Error:', error);
        }
    });
}

function loadPage_region(pageNumber, region) {
    $.ajax({
        url: '/jabusim_Project/receipt/ajax_paging_region',
        type: 'GET',
        data: {
            'page': pageNumber,
            'region' : region
        },
        success: function(response) {
			console.log(response.data);
            // 페이지의 특정 부분 업데이트
	        updateTableContent(response.data, pageNumber);
	        // 페이지네이션 링크 업데이트
	        loadPageWithRegionSearch(response.pageBean, region);
        },
        error: function(error) {
            console.error('Error:', error);
        }
    });
}
/*
function updateTableContent(data, currentPage) {
    console.log(data);
    var tableHtml = '';
    for (var i = 0; i < data.length; i++) {
        var row = data[i];
        var no = i + 1 + (currentPage - 1) * 10;

        tableHtml += '<tr>';
        tableHtml += '<td>' + no + '</td>';
        tableHtml += '<td>' + row.examPlace_region + '</td>';
        tableHtml += '<td>' + row.examPlace_address + '</td>';
        tableHtml += '<td>' + row.examPlace_name + '</td>';
        tableHtml += '<td>' + row.currentRegistrations;
        tableHtml += '/';
        tableHtml += row.examPlace_maximum + '</td>';
        tableHtml += '<td>';
        tableHtml += '<form action="' + rootContextPath + 'receipt/receipt_pro" method="post">';
        tableHtml += '<input type="hidden" name="examPlaceName" value="' + row.examPlace_name + '" />';
        tableHtml += '<button type="submit">선택</button>';
        tableHtml += '</form>';
        tableHtml += '</td>';
        tableHtml += '</tr>';
    }
    $('#bottom_module_inner tbody').html(tableHtml);
}
*/
/*
function updateTableContent(data, currentPage) {
    console.log(data);
    var tableHtml = '';
    for (var i = 0; i < data.length; i++) {
        var row = data[i];
        var no = i + 1 + (currentPage - 1) * 10;
        
        var rowStyle = '';
        var buttonDisabled = '';
        
        // 현재 등록 인원 수가 최대 인원 수 이상인 경우
        if (row.currentRegistrations >= row.examPlace_maximum) {
            rowStyle = ' style="background-color: #f0f0f0;"'; // 음영 스타일 적용
            buttonDisabled = ' disabled="disabled"'; // 버튼 비활성화
        }
        
        tableHtml += '<tr' + rowStyle + '>';
        tableHtml += '<td>' + no + '</td>';
        tableHtml += '<td>' + row.examPlace_region + '</td>';
        tableHtml += '<td>' + row.examPlace_address + '</td>';
        tableHtml += '<td>' + row.examPlace_name + '</td>';
        tableHtml += '<td>' + row.currentRegistrations + '/' + row.examPlace_maximum + '</td>';
        tableHtml += '<td>';
        tableHtml += '<form action="' + rootContextPath + 'receipt/receipt_pro" method="post">';
        tableHtml += '<input type="hidden" name="examPlaceName" value="' + row.examPlace_name + '" />';
        tableHtml += '<button type="submit" class="id_btn"' + buttonDisabled + '>선택</button>';
        tableHtml += '</form>';
        tableHtml += '</td>';
        tableHtml += '</tr>';
    }
    $('#bottom_module_inner tbody').html(tableHtml);
}
*/
function updateTableContent(data, currentPage) {
    console.log(data);
    var tableHtml = '';
    for (var i = 0; i < data.length; i++) {
        var row = data[i];
        var no = i + 1 + (currentPage - 1) * 10;

        var rowStyle = '';
        var buttonDisabled = '';
        
        // 망포고등학교일 경우 currentRegistrations 값을 230으로 고정
        if (row.examPlace_name === '망포고등학교') {
            row.currentRegistrations = 230;
        }

        // 현재 등록 인원 수가 최대 인원 수 이상인 경우
        if (row.currentRegistrations >= row.examPlace_maximum) {
            rowStyle = ' style="background-color: #f0f0f0;"'; // 음영 스타일 적용
            buttonDisabled = ' disabled="disabled" style="background-color: grey; color: white;"'; // 버튼 비활성화
        }

        tableHtml += '<tr' + rowStyle + '>';
        tableHtml += '<td>' + no + '</td>';
        tableHtml += '<td>' + row.examPlace_region + '</td>';
        tableHtml += '<td>' + row.examPlace_address + '</td>';
        tableHtml += '<td>' + row.examPlace_name + '</td>';
        tableHtml += '<td>' + row.currentRegistrations + '/' + row.examPlace_maximum + '</td>';
        tableHtml += '<td>';
        tableHtml += '<form action="' + rootContextPath + 'receipt/receipt_pro" method="post">';
        tableHtml += '<input type="hidden" name="examPlaceName" value="' + row.examPlace_name + '" />';
        tableHtml += '<button type="submit" class="id_btn"' + buttonDisabled + '>선택</button>';
        tableHtml += '</form>';
        tableHtml += '</td>';
        tableHtml += '</tr>';
    }
    $('#bottom_module_inner tbody').html(tableHtml);
}


function updatePaginationLinks(pageBean) {
    var currentPage = pageBean.currentPage;
    var maxPage = pageBean.pageCnt;
    var itemsPerPage = 10; // 한 페이지에 표시할 항목 수

    // 현재 페이지 그룹 계산
    var currentGroup = Math.ceil(currentPage / itemsPerPage);
    
    // min과 max 페이지 계산
    var minPage = (currentGroup - 1) * itemsPerPage + 1;
    var maxPageInGroup = currentGroup * itemsPerPage;
    var maxDisplayPage = maxPageInGroup > maxPage ? maxPage : maxPageInGroup;

    // 이전, 다음 페이지 번호 계산
    var prevPage = minPage - 1;
    var nextPage = maxPageInGroup + 1 > maxPage ? maxPage : maxPageInGroup + 1;

    var paginationHtml = '';

    // 이전 페이지 버튼
    paginationHtml += '<li class="page-item ' + (prevPage <= 0 ? 'disabled' : '') + '">';
    paginationHtml += '<a href="#" class="page-link" data-page="' + (prevPage > 0 ? prevPage : '#') + '">이전</a></li>';

    // 페이지 번호 링크 생성
    for (var i = minPage; i <= maxDisplayPage; i++) {
        paginationHtml += '<li class="page-item ' + (i === currentPage ? 'active' : '') + '">';
        paginationHtml += '<a href="#" class="page-link" data-page="' + i + '">' + i + '</a></li>';
    }

    // 다음 페이지 버튼
    paginationHtml += '<li class="page-item ' + (currentPage >= maxPage ? 'disabled' : '') + '">';
    paginationHtml += '<a href="#" class="page-link" data-page="' + (currentPage < maxPage ? nextPage : '#') + '">다음</a></li>';

    // HTML 업데이트 후 이벤트 핸들러 재설정
    $('#pagingSection ul.pagination').html(paginationHtml);
    $('#pagingSection .page-link').on('click', function(e) {
        e.preventDefault();
        var pageNumber = $(this).data('page');
        loadPage(pageNumber);
    });
}

function loadPageWithRegionSearch(pageBean, region) {
    var currentPage = pageBean.currentPage;
    var maxPage = pageBean.pageCnt;
    var itemsPerPage = 10; // 한 페이지에 표시할 항목 수

    // 현재 페이지 그룹 계산
    var currentGroup = Math.ceil(currentPage / itemsPerPage);
    
    // min과 max 페이지 계산
    var minPage = (currentGroup - 1) * itemsPerPage + 1;
    var maxPageInGroup = currentGroup * itemsPerPage;
    var maxDisplayPage = maxPageInGroup > maxPage ? maxPage : maxPageInGroup;

    // 이전, 다음 페이지 번호 계산
    var prevPage = minPage - 1;
    var nextPage = maxPageInGroup + 1 > maxPage ? maxPage : maxPageInGroup + 1;

    var paginationHtml = '';

    // 이전 페이지 버튼
    paginationHtml += '<li class="page-item ' + (prevPage <= 0 ? 'disabled' : '') + '">';
    paginationHtml += '<a href="#" class="page-link" data-page="' + (prevPage > 0 ? prevPage : '#') + '">이전</a></li>';

    // 페이지 번호 링크 생성
    for (var i = minPage; i <= maxDisplayPage; i++) {
        paginationHtml += '<li class="page-item ' + (i === currentPage ? 'active' : '') + '">';
        paginationHtml += '<a href="#" class="page-link" data-page="' + i + '">' + i + '</a></li>';
    }

    // 다음 페이지 버튼
    paginationHtml += '<li class="page-item ' + (currentPage >= maxPage ? 'disabled' : '') + '">';
    paginationHtml += '<a href="#" class="page-link" data-page="' + (currentPage < maxPage ? nextPage : '#') + '">다음</a></li>';

    // HTML 업데이트 후 이벤트 핸들러 재설정
    $('#pagingSection ul.pagination').html(paginationHtml);
    $('#pagingSection .page-link').on('click', function(e) {
        e.preventDefault();
        var pageNumber = $(this).data('page');
        loadPage_region(pageNumber, region);
    });
}