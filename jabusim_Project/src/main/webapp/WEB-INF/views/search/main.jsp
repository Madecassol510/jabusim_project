<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<!-- 외부스크립트파일 -->
<script type="text/javascript" src="${root}js/licenseCode.js"></script>
<script type="text/javascript" src="${root}js/codeMapping.js"></script>

<meta charset="UTF-8">
<title>자격증 검색</title>
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="${root}css/search_main/search_main.css" />
<!-- AJAX -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	<%request.setCharacterEncoding("UTF-8");%>
	
	/* 자바스크립트 el태그 변수 */
	var rootContextPath = "<c:out value='${root}'/>";
	
	$(document).ready(async function(){
		/* Ajax 셋업!! */
		$.ajaxSetup({
			success:function(result){					
				alert(result);
			},
			error: function (jqXHR) {
                alert("jqXHR status code:"+jqXHR.status+" message:"+jqXHR.responseText);
            }
		});//ajax setup
		
		/*ajax 함수 요청*/
	    try {
	        var licenseType = await getLicenseType();
	        console.log(licenseType);
	        var allLicenseList = await getAllLicenseList();
	        console.log(allLicenseList);
	        const listBox1 = document.getElementById('list_box1');
	        const listBox2 = document.getElementById('list_box2');
	        const listBox3 = document.getElementById('list_box3');
	        const listBox4 = document.getElementById('list_box4');
	        console.log(allLicenseList.length);
	        
	        /*대분류버튼 생성*/
	        licenseType.forEach(lt => {
	        	var majorCodeDesc = lt;
	        	const majorButton = document.createElement('button');
	        	majorButton.className = 'major-button w-100 h-100';
	   			const majorItem = document.createElement('li');
	   			
	   			majorButton.textContent = majorCodeDesc;
	   			listBox1.appendChild(majorItem);
	            majorItem.appendChild(majorButton);
				
	            handleItemSelect(majorButton, majorCodeDesc, majorCodeDesc, "majorCode");
  
	            /*대분류버튼 클릭시 해당 소분류 생성*/
	            majorButton.addEventListener('click', function() {
	            	//클릭시 배열방 담음
       				
                    listBox2.innerHTML = '';
                    const minorCodes = codeMapping[majorCodeDesc];
                    minorCodes.forEach(minorCode => {
                 	   
						   const minorButton = document.createElement('button');
		                   minorButton.className = 'minor-button w-100 h-100';
		                   minorButton.textContent = minorCode;
		
		                   const minorItem = document.createElement('li');
		                   listBox2.appendChild(minorItem);
		                   minorItem.appendChild(minorButton);
			               //클릭시 배열방 담음
			               handleItemSelect(minorButton, minorCode, minorCode, "minorCode");
                    })
                })//대분류 클릭이벤트
	        });//대분류생성
	        
	        /*소분류 전체 생성*/
	        licenseType.forEach(fmOne => {
	        	const firstMinorCode = codeMapping[fmOne];
	        	firstMinorCode.forEach(fmTwo => {
	        		
					const firstMinorButton = document.createElement('button');
					firstMinorButton.className = 'minor-button w-100 h-100';
					firstMinorButton.textContent = fmTwo;
					
					const firstMinorItem = document.createElement('li');
					listBox2.appendChild(firstMinorItem);
					firstMinorItem.appendChild(firstMinorButton);
					//클릭시 배열방 담음
					handleItemSelect(firstMinorButton, fmTwo, fmTwo, "minorCode");
	        	})
	        })
	        
	        /*자격증 종류 버튼 생성*/
	        const licenseKind = ['기능사', '기사', '기술사', '기능장'];
	        licenseKind.forEach(kind => {
   				const kindButton = document.createElement('button');
   				let kindButtonDesc ='';
   				kindButton.className = 'lt-button w-100 h-100';
   				if(kind === '기능사') {
   					kindButtonDesc = '기능사'
					kindButton.textContent = '기능사';
   				} else if(kind === '기사') {
   					kindButtonDesc = '기사'
					kindButton.textContent = '기사';
   				} else if(kind === '기술사') {
   					kindButtonDesc = '기술사'
					kindButton.textContent = '기술사';
   				} else if(kind === '기능장') {
   					kindButtonDesc = '기능장'
					kindButton.textContent = '기능장';
   				}

   				const kindItem = document.createElement('li');
                listBox3.appendChild(kindItem);
                kindItem.appendChild(kindButton);
                //클릭시 배열방 담음
                handleItemSelect(kindButton, kind, kindButtonDesc, "kind");
   			})
	        
	        
	        /*일정 버튼 생성*/
			const scheduleArray = ['beRegisting', 'notRegisted', 'closeRegisted'];
	    	scheduleArray.forEach(sc => {
   				const scButton = document.createElement('button');
   				let scButtonDesc ='';
   				scButton.className = 'lt-button w-100 h-100';
   				if(sc === 'beRegisting') {
   					scButtonDesc = '접수중'
   					scButton.textContent = '접수중';
   				} else if(sc === 'notRegisted') {
   					scButtonDesc = '접수예정'
   					scButton.textContent = '접수예정';
   				} else if(sc === 'closeRegisted') {
   					scButtonDesc = '접수마감'
   					scButton.textContent = '접수마감';
   				}
   				const scItem = document.createElement('li');
                listBox4.appendChild(scItem);
                scItem.appendChild(scButton);
                //클릭시 배열방 담음
                handleItemSelect(scButton, sc, scButtonDesc, "schedule");
   			})
	        		
	        /*자격증 로드 함수 실행*/
	        createLicenseList(allLicenseList);
	    	const list_area = document.getElementById('list_area');
	    } catch (error) {
	        console.error('오류 발생:', error);
	    }
	    
	}); //document ready
	
	/*페이지 로드시 자격증 버튼 생성*/
	async function createLicenseList(licenseData) {
    list_area.innerHTML = '';

    licenseData.forEach(allLi => {
        const licenseID = allLi.license_idx;
        const licenseName = allLi.license_name;
        const examName = allLi.exam_name;
        const registrationPeriod = allLi.registrationPeriod;
        const examDateStr = allLi.examDate;
        const examDateObj = new Date(examDateStr);

        const licenseList = document.createElement('ul');
        licenseList.className = 'list-item';
        licenseList.id = 'list-item' + licenseID;

        const licenseLink = document.createElement('a');
        licenseLink.href = rootContextPath + "info/main?licenseID=" + licenseID;

        // Append all list items to the anchor tag
        const licenseNameLi = document.createElement('li');
        licenseNameLi.textContent = licenseName;
        licenseLink.appendChild(licenseNameLi);

        const registrationPeriodLi = document.createElement('li');
        registrationPeriodLi.textContent = examName;
        licenseLink.appendChild(registrationPeriodLi);

        const periodLi = document.createElement('li');
        periodLi.textContent = registrationPeriod;
        licenseLink.appendChild(periodLi);

        const examDateLi = document.createElement('li');
        examDateLi.textContent = examDateObj.toLocaleDateString();
        licenseLink.appendChild(examDateLi);

        // Append the anchor tag to the list
        licenseList.appendChild(licenseLink);

        list_area.appendChild(licenseList);
    });
}
	
	
	/*버튼 클릭시 기능 추가*/
    document.addEventListener('DOMContentLoaded', function() {
	    // 초기 상태에서는 아무것도 활성화되지 않았다고 가정합니다.
	    let activeContent = null;

	    // 버튼 요소를 가져옵니다.
	    const buttons = document.querySelectorAll('.list_serch_contents button');
	    const contentsContainer = document.querySelector('.contents_container');
	    const selectedShow = document.querySelector('.selected_show');
	    const serch_condition= document.getElementById('required_btn');
	    const reset_btn = document.getElementById('reset_btn');
	    const searchButton = document.getElementById('searchButton');

	    /* 리셋 기능 추가*/
	    reset_btn.addEventListener('click', function() {
	        popAllLicenseCodes();
	    });
	    /*여러 종류 조건 검색*/
	    serch_condition.addEventListener('click', function() {
	        selectAnyCategories();
	    });
	})
	
	/*종류 버튼 클릭시 선택 박스에 담김*/
	function handleItemSelect(button, code, codeDesc, type) {
	    button.addEventListener('click', function() {
	        // 여기에 클릭 이벤트에 대한 로직을 구현합니다.
	        pushLicenseCode(type, code, codeDesc);
	    });
	}
	
	/*종류 버튼 클릭시 선택 박스에 담김2*/
	function pushLicenseCode(type, code, codeDesc) {
		let condition = { type: type, value: code };
		if (!selectedCodes.some(c => c.type === type && c.value === code)) {
			selectedCodes.push(condition);
		    //버튼생성
			const seleted_box = document.getElementById('seleted_box');
		    
		    const selectedButton = document.createElement('button');
	        selectedButton.className = 'selected-button';
	        selectedButton.id = 'selected-button-' + code;
	        selectedButton.textContent = codeDesc;
	        selectedButton.onclick = function() { popLicenseCode(type, code); };
	
	        seleted_box.appendChild(selectedButton);
	     // dataToSend 추가
	        updateDataToSend(type, code);
		}
				
	}
	
	/*선택 항목 배열*/
	let selectedCodes = [];
	let dataToSend = {};
	
	function popLicenseCode(type, code) {
		const index = selectedCodes.findIndex(c => c.value === code);
	    if (index > -1) {
	    	const removedType = selectedCodes[index].type; // 제거된 항목의 타입
	        selectedCodes.splice(index, 1); // 배열에서 제거
	        const buttonId = 'selected-button-' + code;
	        const buttonToRemove = document.getElementById(buttonId);
	        if (buttonToRemove) {
	            buttonToRemove.parentElement.removeChild(buttonToRemove); // 버튼 삭제
	        }
	        
	        deleteDataToSend(type, code);
	    }
	}
	
	function updateDataToSend(type, code) {
		if (selectedCodes.some(item => item.type === 'majorCode')) {
		    dataToSend.majorCode = selectedCodes.filter(item => item.type === 'majorCode').map(item => item.value);
		}
		if (selectedCodes.some(item => item.type === 'minorCode')) {
		    dataToSend.minorCode = selectedCodes.filter(item => item.type === 'minorCode').map(item => item.value);
		}
		if (selectedCodes.some(item => item.type === 'kind')) {
		    dataToSend.kind = selectedCodes.filter(item => item.type === 'kind').map(item => item.value);
		}
		if (selectedCodes.some(item => item.type === 'schedule')) {
		    dataToSend.schedule = selectedCodes.filter(item => item.type === 'schedule').map(item => item.value);
		}
		console.log("현재 배열 : ", dataToSend);
	}
	
	function deleteDataToSend(type, code) {
		// 특정 타입의 코드를 필터링하여 삭제
	    dataToSend[type] = dataToSend[type].filter(c => c !== code);

	    // 해당 타입의 코드가 더 이상 없으면 해당 키를 삭제
	    if (dataToSend[type].length === 0) {
	        delete dataToSend[type];
	    }

	    console.log("삭제 후 배열: ", dataToSend);
	}
	
	function popAllLicenseCodes() {
	    selectedCodes = []; // selectedCodes 배열 비우기
	    dataToSend = {};
	    const seleted_box = document.getElementById('seleted_box');
	    seleted_box.innerHTML = ''; // seleted_box 내 모든 버튼 제거
	}
	
	
	/*카테고리 찾기*/
	function selectAnyCategories() {
		$.ajax({
	        url: '/jabusim_Project/selectAnyCategories',
	        type: 'POST',
	        contentType: 'application/json', 
	        data: JSON.stringify(dataToSend),
	        success: function(response) {
	        	console.log(response);
	            createLicenseList(response);
	        },
	        error: function(xhr, status, error) {
	            // 에러 처리
	            console.error(error);
	        }
	    });
	}
	/*
	$("#searchButton").click(function() {
        var query = $("#searchInput").val(); // 검색어 가져오기
        $.ajax({
            url: '/jabusim_Project/searchLicenseName',
            data: { query: query },
            success: function(response) {
            	createLicenseList(licenseList);
            },
            error: function(error) {
                console.error("Error: ", error);
            }
        });//검색 ajax
    }); //search 버튼 클릭시
*/
	
</script>


</head>

<body>

	<c:import url="/WEB-INF/views/include/top_menu.jsp" />
	<div class="pageContainer">

		<section id="top_module" class="top_module">
			<article id="top_module_inner"
				class="top_module_inner d-flex flex-column">
				<!-- #1 제목 -->
				<h1 class="">자격증 정보 검색</h1>

				<!-- #2 검색 컨테이너 -->
				<div class="search_container">
					<!-- #2-1 -->
					<div class="text_search d-flex">
						<div class="search_box col-4">
							<input type="text" id="searchInput" class="form-control"
								placeholder="자격증 검색">
						</div>
						<button class="btn btn-primary col-1 ms-2" id="searchButton"
							type="button">검색</button>
					</div>

					<!--  선택박스 -->
					<div class="list_serch">
						<!-- #1 -->
						<div class="list_serch_contents">
							<ul class="d-flex flex-row">
								<li class="flex-fill custom-btn">
									<button class="btn btn-secondary">대분야</button>
									<ul id="list_box1" class="list_box">
										<!-- content1 내용 -->
									</ul>
								</li>
								<li class="flex-fill custom-btn">
									<button class="btn btn-secondary">소분야</button>
									<ul id="list_box2" class="list_box">
										<!-- content2 내용 -->
									</ul>
								</li>
								<li class="flex-fill custom-btn">
									<button class="btn btn-secondary">종류</button>
									<ul id="list_box3" class="list_box">
										<!-- content2 내용 -->
									</ul>
								</li>
								<li class="flex-fill custom-btn">
									<button class="btn btn-secondary">시간</button>
									<ul id="list_box4" class="list_box">
										<!-- content3 내용 -->
									</ul>
								</li>
							</ul>
						</div>

					</div>
					<!-- //선택박스 -->


					<!-- 선택 보여주는 박스 -->
					<div id="selected_show" class="selected_show">
						<div id="seleted_box" class="seleted_box"></div>

						<div id="button_box" class="button_box">
							<div id="reset_box" class="reset_box">
								<button id="reset_btn" class="reset_btn">img 초기화</button>
							</div>
							<div id="required_box" class="required_box">
								<button id="required_btn" class="required_btn">선택 항목 검색</button>
							</div>
						</div>
					</div>
					<!-- 선택 보여주는 박스 -->


				</div>
				<!-- //serch container -->


			</article>
		</section>


		<!-- bottom module -->
		<div id="bottom_module" class="bottom_module">
			<div id="bottom_module_inner" class="bottom_module_inner">
				<div id="list_area" class="list_area">
					<!-- 리스트 항목들이 여기에 추가됩니다 -->
					<p>${sessionScope.getLicenseCodeMeanings.size()}</p>
				</div>

				<nav aria-label="페이지 네비게이션">
					<ul class="pagination justify-content-center" id="pagination">
						<!-- 페이지네이션 버튼들이 여기에 추가됩니다 -->
					</ul>
				</nav>
			</div>
		</div>
	</div>

	<c:import url="/WEB-INF/views/include/buttom_info.jsp" />

</body>

</html>