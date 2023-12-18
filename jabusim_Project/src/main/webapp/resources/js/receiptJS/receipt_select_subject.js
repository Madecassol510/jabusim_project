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

    $.ajax({
        url: '/jabusim_Project/receipt/receipt_searchInput',
        type: 'GET',
        dataType: 'json',
        data: {
            searchName: searchInput,
            licenseType: licenseType,
        },
        success: function(response) {
			console.log(response);
			console.log(searchInput);
            // 검색 결과 테이블 업데이트
            updateTableContent(response.data, response.pageBean.currentPage);

            // 페이지네이션 링크 업데이트
 			loadPageWithNameSearch(response.pageBean, searchInput);
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
            // 검색 결과 테이블 업데이트
            updateTableContent(response.data, response.pageBean.currentPage);

            // 페이지네이션 링크 업데이트
            loadPageWithOptionSearch(response.pageBean, majorSelectValue, minorSelectValue);
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
function loadPage_name(pageNumber, searchName) {
	var licenseType = sessionStorage.getItem('licenseType');
	
    // AJAX 요청을 서버에 보내 페이지 데이터를 로드
    $.ajax({
        url: '/jabusim_Project/receipt/ajax_paging_name',
        type: 'GET',
        data: {
            page: pageNumber,
            licenseType : licenseType,
            searchInput : searchName
        },
        success: function(response) {
            // 페이지의 특정 부분 업데이트
	        updateTableContent(response.data, pageNumber);
	
	        // 페이지네이션 링크 업데이트
	        loadPageWithNameSearch(response.pageBean, searchName);
        },
        error: function(error) {
            console.error('Error:', error);
        }
    });
}
function loadPage_option(pageNumber, major, minor) {
	var licenseType = sessionStorage.getItem('licenseType');
	
    // AJAX 요청을 서버에 보내 페이지 데이터를 로드
    $.ajax({
        url: '/jabusim_Project/receipt/ajax_paging_option',
        type: 'GET',
        data: {
            'page': pageNumber,
            'licenseType' : licenseType,
            'major' : major,
            'minor' : minor
        },
        success: function(response) {
			console.log(response);
            // 페이지의 특정 부분 업데이트
	        updateTableContent(response.data, pageNumber);
	        // 페이지네이션 링크 업데이트
	        loadPageWithOptionSearch(response.pageBean, major, minor);
        },
        error: function(error) {
            console.error('Error:', error);
        }
    });
}

function updateTableContent(data, currentPage) {
	console.log('클릭이벤트'+currentPage);
    var tableHtml = '';
    for (var i = 0; i < data.length; i++) {
        var row = data[i];
        var no = i + 1 + (currentPage - 1) * 10;
        tableHtml += '<tr">';
        tableHtml += '<td>' + no + '</td>';
        tableHtml += '<td>' + row.license_name + '</td>';
        tableHtml += '<td>' + row.license_mainCategory + '</td>';
        tableHtml += '<td>' + row.license_subCategory + '</td>';
        tableHtml += '<td>';
        tableHtml += '<form action="' + rootContextPath + 'receipt/selectPlace" method="post">';
        tableHtml += '<input type="hidden" name="licenseName" value="' + row.license_name + '" />';
        tableHtml += '<button type="submit" class="id_btn">선택</button>';
        tableHtml += '</form>';
        tableHtml += '</td>';
        tableHtml += '</tr>';
    }
    $('#list_module tbody').html(tableHtml);
}

function updatePaginationLinks(pageBean) {
	console.log(pageBean);
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

function loadPageWithNameSearch(pageBean, searchInput) {
	console.log(searchInput + '페이징 검색이벤트');
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
	var paginationContainer = document.querySelector('#pagingSection ul.pagination');
	if (paginationContainer) {
	    paginationContainer.innerHTML = paginationHtml;
	
	    var pageLinks = paginationContainer.querySelectorAll('.page-link');
	    pageLinks.forEach(function(link) {
	        link.addEventListener('click', function(e) {
	            e.preventDefault();
	            var pageNumber = this.getAttribute('data-page');
	            console.log(pageNumber);
	            loadPage_name(pageNumber, searchInput);
	        });
	    });
	}
}

function loadPageWithOptionSearch(pageBean, majorOption, minorOption) {
	console.log(pageBean);
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

    // HTML 업데이트
    var paginationSection = document.getElementById('pagingSection');
    if (paginationSection) {
        var ulPagination = paginationSection.querySelector('ul.pagination');
        if (ulPagination) {
            ulPagination.innerHTML = paginationHtml;
        }

        // 이벤트 핸들러 재설정
        var pageLinks = ulPagination.getElementsByClassName('page-link');
        Array.from(pageLinks).forEach(function(link) {
            link.addEventListener('click', function(e) {
                e.preventDefault();
                var pageNumber = this.getAttribute('data-page');
                console.log(pageNumber);
                loadPage_option(pageNumber, majorOption, minorOption);
            });
        });
    }
}