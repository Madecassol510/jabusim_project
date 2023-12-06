function getCodeDivision() {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: "/jabusim_Project/getLicenseCode",
            method: 'GET',
            success: function(licenseCode) {
                var grouped = {};
                licenseCode.forEach(code => {
                    const majorCategory = code.substring(0, 2);
                    const minorCategory = code.substring(2);

                    if (!grouped[majorCategory]) {
                        grouped[majorCategory] = [];
                    }
                    grouped[majorCategory].push(minorCategory);
                });
                resolve(grouped);
            },
            error: function(xhr, status, error) {
                reject(error);
            }
        });
    });
}

function getLicenseType() {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: "/jabusim_Project/getLicenseType",
            method: 'GET',
            success: function(getLicenseType) {
                resolve(getLicenseType);
            },
            error: function(xhr, status, error) {
                reject(error);
            }
        });
    });
}

function getAllLicenseList() {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: "/jabusim_Project/getAllLicenseList",
            method: 'GET',
            success: function(licenseList) {
                resolve(licenseList);
            },
            error: function(xhr, status, error) {
                reject(error);
            }
        })
    })
}
