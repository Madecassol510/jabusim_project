document.getElementById('majorSelect').addEventListener('change', function() {
    var majorSelect = document.getElementById('majorSelect');
    var minorSelect = document.getElementById('minorSelect');
    minorSelect.innerHTML = '<option selected disabled value="">소분야를 선택하세요</option>';

    var selectedMajor = majorSelect.value;
    var minorItems = [];

    if (selectedMajor == '전체') {
        // codeMapping의 모든 키에 대한 값을 배열에 추가합니다.
        for (var key in codeMapping) {
            if (codeMapping.hasOwnProperty(key)) {
                minorItems = minorItems.concat(codeMapping[key]);
            }
        }
    } else {
        // 선택된 major에 해당하는 minorItems를 가져옵니다.
        minorItems = codeMapping[selectedMajor];
    }

    minorItems.forEach(minorItem => {
        var option = document.createElement('option');
        option.value = minorItem;
        option.text = minorItem;
        minorSelect.appendChild(option);
    });

    minorSelect.disabled = false;
});


document.getElementById('searchButton').addEventListener('click', function() {
    var searchInput = document.getElementById('searchInput').value;
    var licenseType = sessionStorage.getItem('licenseType');
    var currentPage = 1; // 초기 검색은 첫 페이지에서 시작

    $.ajax({
        url: '/jabusim_Project/receipt/receipt_searchInput',
        type: 'GET',
        dataType: 'json',
        data: {
            searchInput: searchInput,
            licenseType: licenseType,
            page: currentPage // 현재 페이지 번호 추가
        },
        success: function(response) {
            // 검색 결과 테이블 업데이트
            updateTableContent(response.data, currentPage);

            // 페이지네이션 링크 업데이트
            updatePaginationLinks(response.pageBean);
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error("검색 요청 실패:", textStatus, errorThrown);
        }
    });
});


document.getElementById('optionButton').addEventListener('click', function() {
    var majorSelectValue = document.getElementById('majorSelect').value;
    var minorSelectValue = document.getElementById('minorSelect').value;
	var licenseType = sessionStorage.getItem('licenseType');
	
    $.ajax({
        url: '/jabusim_Project/receipt/receipt_searchOption',
        type: 'GET',
        data: {
            major: majorSelectValue,
            minor: minorSelectValue,
            licenseType: licenseType
        },
        dataType: 'json', // 서버로부터 받을 데이터 타입
        success: function(response) {
            // 성공적으로 응답을 받았을 때의 처리
            console.log(response); 
            updateTableContent(response, 1);
        },
        error: function(xhr, status, error) {
            // 오류 발생 시 처리
            console.error("조회 요청 실패:", status, error);
        }
    });
});

function loadPage(pageNumber) {
	var licenseType = sessionStorage.getItem('licenseType');
	
    // AJAX 요청을 서버에 보내 페이지 데이터를 로드
    $.ajax({
        url: '/jabusim_Project/receipt/ajax_paging',
        type: 'GET',
        data: {
            'page': pageNumber,
            'licenseType' : licenseType
        },
        success: function(response) {
            console.log(response);
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
        if (pageNumber !== '#') {
            loadPage(pageNumber);
        }
    });
}

function updateTableContent(data, currentPage) {
    var tableHtml = '';
    console.log(currentPage);
    for (var i = 0; i < data.length; i++) {
        var row = data[i];
        var no = i + 1 + (currentPage - 1) * 10;

        tableHtml += '<tr>';
        tableHtml += '<td>' + no + '</td>';
        tableHtml += '<td>' + row.license_name + '</td>';
        tableHtml += '<td>' + row.license_mainCategory + '</td>';
        tableHtml += '<td>' + row.license_subCategory + '</td>';
        tableHtml += '<td>';
        tableHtml += '<form action="' + rootContextPath + 'receipt/selectPlace" method="post">';
        tableHtml += '<input type="hidden" name="licenseName" value="' + row.license_name + '" />';
        tableHtml += '<button type="submit">선택</button>';
        tableHtml += '</form>';
        tableHtml += '</td>';
        tableHtml += '</tr>';
    }
    $('#top_module_inner tbody').html(tableHtml);
}