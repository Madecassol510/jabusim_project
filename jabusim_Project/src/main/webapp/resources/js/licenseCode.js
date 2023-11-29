
function codeDivision(callback) {
	var grouped = {}; // 지역 변수로 선언
	
	$.ajax({
		url: "/jabusim_Project/getLicenseCode",
		method: 'GET',
		success: function(licenseCode) {
			licenseCode.forEach(licenseCode => {
				const majorCategory = licenseCode.substring(0, 2); // 대분류 코드 추출
				const minorCategory = licenseCode.substring(2); // 소분류 코드 추출
	
				if (!grouped[majorCategory]) {
					grouped[majorCategory] = [];
				}
				grouped[majorCategory].push(minorCategory);
			});
			
			
			if (callback) {
                callback(grouped);
            }
		},
		error: function(xhr, status, error) {
			// 오류 처리
		}
	});//ajax
}