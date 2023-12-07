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
<!-- AJAX -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
	        var licenseCodeData = await getCodeDivision();
	        var licenseType = await getLicenseType();
	        var allLicenseList = await getAllLicenseList();
	        
	        const list_area = document.getElementById('list_area');
	        //전체 페이지 로드
	        createLicenseList(allLicenseList);
	        
	    } catch (error) {
	        console.error('오류 발생:', error);
	    }
	    
	    const listBox1 = document.getElementById('list_box1');
        const listBox2 = document.getElementById('list_box2');
        const listBox3 = document.getElementById('list_box3');

	    /*버튼에 변수 담기*/
	    document.querySelectorAll('button[data-target]').forEach(button => {
			button.addEventListener('click', function() {
				var target = this.getAttribute('data-target');
		    	updateListBoxes(licenseCodeData, target);
				console.log(target);
			});
	    
	    });
	    
	    /*content1일때*/
	    function whenContent1(content1) {
	    	
	    	listBox1.innerHTML = '';
	        listBox2.innerHTML = '';
	        listBox3.innerHTML = '';
	    	
	    	for(const majorCode in licenseCodeData) {
	        	if(licenseCodeData.hasOwnProperty(majorCode)) {
	        		const  majorCodeDesc = codeMapping[majorCode];
	       			const majorButton = document.createElement('button');
	       			majorButton.className = 'major-button w-100 h-100';
	       			const majorItem = document.createElement('li');
	       			majorButton.textContent = majorCodeDesc;
	       			listBox1.appendChild(majorItem);
	                majorItem.appendChild(majorButton);
	                //클릭시 배열방 담음
	                //handleItemSelect(majorButton, majorCode, majorCodeDesc, "majorCode");
	       			
	       			// 대분류 클릭시 이벤트
	       			majorButton.addEventListener('click', function() {
	       				
                       listBox2.innerHTML = '';
                       listBox3.innerHTML = '';
                       
                    // "majorCodeDesc > 전체" 버튼 생성
                       const allButton = document.createElement('button');
                       allButton.className = 'all-button w-100 h-100';
                       allButton.textContent = majorCodeDesc + ' > 전체';
                       const allItem = document.createElement('li');
                       listBox2.appendChild(allItem);
                       allItem.appendChild(allButton);
                       handleItemSelect(allButton, majorCode, majorCodeDesc + ' > 전체', "majorCode");
                       
                       
                       const minorCodes = licenseCodeData[majorCode];
                       const minorButton = document.createElement('button');
                       minorButton.className = 'minor-button w-100 h-100';
                       minorCodes.forEach(minorCode => {
                    	   
		                   const fullMinorCode = majorCode + minorCode;
		                   const minorCodeDesc = codeMapping[fullMinorCode]; // 소분류 코드의 설명
						   const minorButton = document.createElement('button');
		                   minorButton.className = 'minor-button w-100 h-100';
		                   minorButton.textContent = minorCodeDesc;
		
		                   const minorItem = document.createElement('li');
		                   listBox2.appendChild(minorItem);
		                   minorItem.appendChild(minorButton);
			               //클릭시 배열방 담음
			               handleItemSelect(minorButton, fullMinorCode, minorCodeDesc, "fullCode");
			               
                       })
                   })//function
	        	}//if문
   			}//for문
	    }//content1 function
	    
	    /*content2일때*/
	    function whenContent2(content2) {
	    	
	    	whenContent1(content2)
   			
	    	licenseType.forEach(lt => {
   				const ltButton = document.createElement('button');
   				ltButton.className = 'lt-button w-100 h-100';
   				ltButton.textContent = lt;

   				const ltItem = document.createElement('li');
                listBox2.appendChild(ltItem);
                ltItem.appendChild(ltButton);
                //클릭시 배열방 담음
                handleItemSelect(ltButton, lt, lt, "licenseType");
   			})
   			
   			const scheduleArray = ['examDate', 'beRegisting', 'notRegisted', 'closeRegisted'];
	    	
	    	scheduleArray.forEach(sc => {
   				const scButton = document.createElement('button');
   				let scButtonDesc ='';
   				scButton.className = 'lt-button w-100 h-100';
   				if(sc=== 'examDate') {
   					scButtonDesc = '시험일'
   					scButton.textContent = '시험일';
   				} else if(sc === 'beRegisting') {
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
                listBox3.appendChild(scItem);
                scItem.appendChild(scButton);
                //클릭시 배열방 담음
                handleItemSelect(scButton, sc, scButtonDesc, "schedule");
   			})
	    	
	    }//content2 function
	 	
	 	/* 각 버튼 클릭시 이벤트 발생*/
	    function updateListBoxes(licenseCodeData, target) {
      		if(target === 'content1') {
      			whenContent1(target);
              } else if(target === 'content2') {
           	   	whenContent2(target);
              } 
	    }
	    
		    
	}); //document ready
	
	async function createLicenseList(licenseData) {
	    list_area.innerHTML = '';
	 
	    licenseData.forEach(allLi => {
	        const licenseID = allLi.licenseID;
	        const licenseName = allLi.licenseName;
	        const examName = allLi.examName;
	        const registrationPeriod = allLi.registrationPeriod;
	        const examDateStr = allLi.examDate;
	        const examDateObj = new Date(examDateStr);

	        const licenseList = document.createElement('ul');
	        licenseList.className = 'list-item';
	        licenseList.id = 'list-item' + licenseID;

	        const licenseNameLi = document.createElement('li');
	        licenseNameLi.textContent = licenseName;
	        licenseList.appendChild(licenseNameLi);

	        const registrationPeriodLi = document.createElement('li');
	        registrationPeriodLi.textContent = examName;
	        licenseList.appendChild(registrationPeriodLi);

	        const periodLi = document.createElement('li');
	        periodLi.textContent = registrationPeriod;
	        licenseList.appendChild(periodLi);

	        const examDateLi = document.createElement('li');
	        examDateLi.textContent = examDateObj.toLocaleDateString(); // 날짜 형식을 보기 좋게 변환
	        licenseList.appendChild(examDateLi);

	        list_area.appendChild(licenseList);
	    });
	}
	
	
	/*버튼 클릭시 none,flex 이벤트*/
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

	    /*리스트 항목 클릭시 드롭다운*/
	    buttons.forEach(button => {
	        button.addEventListener('click', function() {
	        	const targetContent = this.getAttribute('data-target');

	        	if (activeContent === targetContent) {
	                // 활성화된 내용을 숨깁니다.
	                contentsContainer.style.display = 'none';
	                selectedShow.style.display = 'none';
	                // 활성화된 내용을 리셋합니다.
	                activeContent = null;
	            } else {
	                // 새로운 내용을 보여주기 위해 활성화된 내용을 업데이트합니다.
	                activeContent = targetContent;
	                contentsContainer.style.display = 'flex';
	                selectedShow.style.display = 'flex';
	                
	            }//out if
	        });
	    });
	    /* 리셋 기능 추가*/
	    reset_btn.addEventListener('click', function() {
	        popAllLicenseCodes();
	    });
	    
	    serch_condition.addEventListener('click', function() {
	        selectAnyCategories();
	    });
	});
	
	function handleItemSelect(button, code, codeDesc, type) {
	    button.addEventListener('click', function() {
	        // 여기에 클릭 이벤트에 대한 로직을 구현합니다.
	        pushLicenseCode(type, code, codeDesc);
	        console.log(type);
	    });
	}
	
	
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
		if (selectedCodes.some(item => item.type === 'fullCode')) {
		    dataToSend.fullCode = selectedCodes.filter(item => item.type === 'fullCode').map(item => item.value);
		}
		if (selectedCodes.some(item => item.type === 'licenseType')) {
		    dataToSend.licenseType = selectedCodes.filter(item => item.type === 'licenseType').map(item => item.value);
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


<style>
ul, li {
	list-style-type: none;
	list-style: none;
	padding: 0;
	margin: 0;
}

a, a:hover {
	color: inherit;
	text-decoration: none;
}

.pageContainer {
	position: relative;
	width: 1250px;
	min-height: 700px;
	margin: 0 auto;
	padding-top: 80px;
	border: 1px solid red;
}

.top_module {
	min-height: 600px;
	width: 100%;
	border: 1px solid blue;
	padding-top: 50px;
	padding-bottom: 50px;
	margin-bottom: 50px;
}

.top_module_inner {
	width: 94%;
	margin: 0 auto;
	padding-top: 10px;
	padding-bottom: 10px;
}

.list_serch {
	width: 100%;
	margin: 0 auto;
	text-align: center;
}

.custom-btn button {
	width: 390.41px; /* 버튼의 너비를 100%로 설정 */
}

.selected_show {
	width: 100%;
	margin: 0 auto;
}

.contents_container, .selected_show {
	display: none;
}

.contents_container {
	width: 100%; /* 전체 너비를 차지하도록 설정 */
}

.contents_container>ul {
	width: 33.333%;
}

.list_box {
	max-height: 200px;
	overflow: auto;
	overflow-x: hidden;
}

.list_box>li {
	height: 40px;
}

.selected_show {
	height: 80px;
	max-height: 80px;
}

.seleted_box {
	width: 780.82px;
	padding: 10px 15px;
	overflow: auto;
	overflow-x: hidden;
}

.button_box {
	padding: 20px 20px 20px 0;
	display: flex;
	grid-gap: 20px;
	gap: 20px;
	align-items: center;
	margin-left: auto;
}

.major-button, .minor-button, .lt-button, .sc-button, .all-button {
	background: none;
	border: none;
	cursor: pointer;
	transition: background-color 0.3s;
}

.major-button:hover, .minor-button:hover, .lt-button:hover, .sc-button:hover, .all-button:hover {
	background-color: #e0e0e0;
}

.selected-button {
	background: none;
	border: none;
	cursor: pointer;
}


/* 바텀모듈 */
.bottom_module {
	min-height: 600px;
	width: 100%;
	border: 1px solid blue;
	text-align: center;
	padding-top: 50px;
	padding-bottom: 50px;
}

.bottom_module_inner {
	width: 94%;
	margin: 0 auto;
	padding-top: 10px;
	padding-bottom: 10px;
}

.list-item {
	list-style-type: none; /* 기본 리스트 스타일 제거 */
	padding-left: 0; /* 기본 패딩 제거 */
	border: 1px solid #ddd;
	margin-bottom: 10px;
}

.list-item>li {
	margin-bottom: 5px;
	padding: 5px;
	display: table;
}

.d-day-class {
	padding: 5px;
	margin-right: 10px;
}

.certificate-name-class, .organizer-class, .registration-date-class,
	.exam-date-class {
	padding: 5px;
	margin-right: 10px;
}

/* 각 클래스 별 배경색 */
.certificate-name-class {
	background-color: #d1ecf1;
}

.organizer-class {
	background-color: #fff3cd;
}

.registration-date-class {
	background-color: #cce5ff;
}

.exam-date-class {
	background-color: #f5c6cb;
}
</style>


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
								<li class="flex-fill custom-btn"><button
										class="btn btn-secondary" data-target="content1">분야</button></li>
								<li class="flex-fill custom-btn"><button
										class="btn btn-secondary" data-target="content2">자격증
										종류</button></li>
								<li class="flex-fill custom-btn"><button
										class="btn btn-secondary" data-target="content3">일정
										상태</button></li>
							</ul>
						</div>
						<!-- #2 -->
						<div class="contents_container">
							<ul id="list_box1" class="list_box">
								<!-- content1 내용 -->
							</ul>

							<ul id="list_box2" class="list_box">
								<!-- content2 내용 -->
								2
							</ul>

							<ul id="list_box3" class="list_box">
								<!-- content3 내용 -->
								3
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

	<script>
    	/* 탑 모듈 */
    	/* const contents = {
		    content1: ["항목 1-1", "항목 1-2", "항목 1-3"],
		    content2: ["항목 2-1", "항목 2-2"],
		    content3: ["항목 3-1"]
		  }; 
		  
		  
    	
		let lastClicked = null;
		  
		function updatePreview(targetId) {
			
			if (targetId === 'content1') {
			    $.ajax({
			      url:  "/jabusim_Project/content1",
			      method: 'GET',
			      success: function(response) {
			       console.log(response);
			      },
			      error: function(xhr, status, error) {
			        // 오류 처리
			      }
			    });//ajax
			  } else if (targetId === 'content2') {
			    // content2에 대한 AJAX 요청
			    // 유사한 AJAX 요청 구조...
			  } else if (targetId === 'content3') {
			    // content3에 대한 AJAX 요청
			    // 유사한 AJAX 요청 구조...
			  }//if문 끝
			  
		}//updatePreview
		
		 $('.list_serch_contents .btn').each(function() {
			  $(this).on('click', function() {
			    const targetContent = $(this).data('target');
			    updatePreview(targetContent);
			  });
			}); */
	</script>

</body>

</html>