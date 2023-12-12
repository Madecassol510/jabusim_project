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
            // 성공적으로 응답을 받았을 때의 처리
            console.log(response);
            updateTableContent(response);
        },
        error: function(xhr, status, error) {
            // 오류 발생 시 처리
            console.error("조회 요청 실패:", status, error);
        }
    });
});

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
