document.getElementById('regionSelect').addEventListener('change', function() {
    var districtSelect = document.getElementById('districtSelect');
    districtSelect.innerHTML = '<option selected disabled value="">소분야를 선택하세요</option>';

    if (this.value === 'seoul') {
        var districts = ['경영', '생산관리'];
        districts.forEach(function(district) {
            var option = document.createElement('option');
            option.value = district;
            option.text = district;
            districtSelect.appendChild(option);
        });
        districtSelect.disabled = false;
    } else {
        districtSelect.disabled = true;
    }
});