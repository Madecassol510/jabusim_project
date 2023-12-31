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
<link rel="stylesheet" href="${root}css/search_main/search_main.css?ver=16" />
<link rel="stylesheet" href="${root}css/custom_scrollBar.css" />
<!-- AJAX -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<style>

	.btn-primary {
		background-color: #6495ED;
	} 

	.top_module_inner>h1{
		font-size: 30px;
   		font-weight: 700;
	}

	.contents_name_ul>li {
    	border-radius: 0px;
	}
	.list_serch_contents{
		border-radius: 0px;
	}
</style>

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
	        licenseType.forEach((lt, index) => {
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
	            	
                    /* 소분야 전체 보기 버튼 */
                    const allMinorButton = document.createElement('button');
                    allMinorButton.className = 'all-minor-button w-100 h-100';

	                 const img = document.createElement('img');
	                 img.src = rootContextPath + "image/tpdyd/box-arrow-in-left.svg";
	                 allMinorButton.appendChild(img);
	
	                 const buttonText = document.createTextNode(' 소분야 전체보기');
	                 allMinorButton.appendChild(buttonText);
	
	                 const allMinorItem = document.createElement('li');
	                 listBox2.appendChild(allMinorItem);
	                 allMinorItem.appendChild(allMinorButton);
                    
                    
                    
                    allMinorButton.addEventListener('click', function() {
                        listBox2.innerHTML = ''; // 기존 리스트 초기화

                        licenseType.forEach(fmOne => {
                            const firstMinorCode = codeMapping[fmOne];
                            firstMinorCode.forEach(fmTwo => {
                                const firstMinorButton = document.createElement('button');
                                firstMinorButton.className = 'minor-button w-100 h-100';
                                firstMinorButton.textContent = fmTwo;
                                
                                const firstMinorItem = document.createElement('li');
                                listBox2.appendChild(firstMinorItem);
                                firstMinorItem.appendChild(firstMinorButton);
                                
                                // 각 소분류 버튼에 대한 클릭 이벤트 리스너
                                firstMinorButton.addEventListener('click', function() {
                                    pushMinorCodeHasNone(fmTwo, fmTwo);
                                    console.log(minorCodesNoneMajor);
                                });
                            });
                        });
                    });
	            	
                    const minorCodes = codeMapping[majorCodeDesc];
                    minorCodes.forEach(minorCodeDesc => {
                 	   
						   const minorButton = document.createElement('button');
		                   minorButton.className = 'minor-button w-100 h-100';
		                   minorButton.textContent = minorCodeDesc;
		
		                   const minorItem = document.createElement('li');
		                   listBox2.appendChild(minorItem);
		                   minorItem.appendChild(minorButton);
		                   
							// 클릭 이벤트 리스너 추가
							minorButton.addEventListener('click', function() {
							    if (isValueInCodeMapping(minorCodeDesc)) {
							        console.log(minorCodeDesc + "은(는) " + lt +"에 포함되어 있습니다.");
							        //lt->대분류, minorCodeDesc->소분류 이름, 
							        pushMinorKey_value(lt, minorCodeDesc, minorCodeDesc);
							    } else {
							        console.log(minorCodeDesc + "은(는) " + lt +"에 포함되어 있지 않습니다.");
							    }
							})
                    })
                })//대분류 클릭이벤트
	        });//대분류생성
	        
	        /*소분류 전체 생성*/
	        licenseType.forEach(fmOne => {
	        	const firstMinorCode = codeMapping[fmOne];
	        	firstMinorCode.forEach((fmTwo, index) => {
	        		
					const firstMinorButton = document.createElement('button');
					firstMinorButton.className = 'minor-button w-100 h-100';
					firstMinorButton.textContent = fmTwo;
					
					const firstMinorItem = document.createElement('li');
					listBox2.appendChild(firstMinorItem);
					firstMinorItem.appendChild(firstMinorButton);
					
					// 클릭 이벤트 리스너 추가
					firstMinorButton.addEventListener('click', function() {
						
						pushMinorCodeHasNone(fmTwo, fmTwo);
						console.log(minorCodesNoneMajor);
					});
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
                
                kindButton.addEventListener('click', function() {
                	SelectedKindValue(kind, kind);
                })
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
	        const licenseType = allLi.license_type;
	        const majorCode = allLi.majorCode;
	        const minorCode = allLi.minorCode;
	        const codesContainer1 = document.createElement('div');
	        codesContainer1.className = 'container-margin';
	        const codesContainer2 = document.createElement('div');
	        codesContainer2.className = 'container-margin';

	
	        const licenseList = document.createElement('ul');
	        licenseList.className = 'list-item';
	        licenseList.id = 'list-item' + licenseID;
	
	        const licenseLink = document.createElement('a');
	        licenseLink.href = rootContextPath + "info/main?licenseID=" + licenseID;
	
	        // Append license name and type to codesContainer1
	        const licenseNameLi = document.createElement('li');
	        licenseNameLi.className = 'license-name';
	        licenseNameLi.textContent = licenseName;
	        codesContainer1.appendChild(licenseNameLi);
	
	        const licenseTypeLi = document.createElement('li');
	        licenseTypeLi.className = 'license-type';
	        licenseTypeLi.textContent = licenseType;
	        codesContainer1.appendChild(licenseTypeLi);
	
	        // Append major and minor codes to codesContainer2
	        const majorCodeLi = document.createElement('li');
	        majorCodeLi.className = 'major-code';
	        majorCodeLi.textContent = majorCode;
	        codesContainer2.appendChild(majorCodeLi);
	
	        const minorCodeLi = document.createElement('li');
	        minorCodeLi.className = 'minor-code';
	        minorCodeLi.textContent = minorCode;
	        codesContainer2.appendChild(minorCodeLi);
	
	        // Append the containers to the anchor tag
	        licenseLink.appendChild(codesContainer1);
	        licenseLink.appendChild(codesContainer2);
	
	        // Append the anchor tag to the list
	        licenseList.appendChild(licenseLink);
	
	        list_area.appendChild(licenseList);
	    });
	    
	    const itemCount = countItems(licenseData);

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
	    const searchInput = document.getElementById('searchInput');
	    const searchButton = document.getElementById('searchButton');
	    const bottomModule = document.getElementById('bottom_module_inner');

	    /* 리셋 기능 추가*/
	    reset_btn.addEventListener('click', function() {
	        popAllLicenseCodes();
	    });
	    /*여러 종류 조건 검색*/
	    serch_condition.addEventListener('click', function() {
	    	searchInput.value = '';
	        selectAnyCategories();
	        bottomModule.scrollIntoView({ behavior: 'smooth' });
	    });
	    /*input enter 기능 추가*/
	    searchInput.addEventListener('keypress', function(event) {
	        if (event.key === 'Enter') {
	            searchButton.click(); // Triggers the search button's click event
	        }
	    });
	    
	    /*자격증 이름 검색*/
	    searchButton.addEventListener('click', function() {
	    	popAllLicenseCodes();
	    	searchLicenseName(searchInput);
	    	bottomModule.scrollIntoView({ behavior: 'smooth' });
	    });
	    
	})
	
	
	/*나중에 대분류일때만이랑 다른거 먼저 선택했을때도 나누어야됨*/
	function handleItemSelect(button, code, codeDesc, type) {
	    button.addEventListener('click', function() {
	        // 여기에 클릭 이벤트에 대한 로직을 구현합니다.
	        pushMajorCodeKey(code, codeDesc);
	    });
	}
	
    let minorCodesNoneMajor = [];
	
    function pushMinorCodeHasNone(code, minorValue) {
        let existsInMajor = false;

        Object.values(selectedMajorCategories).forEach(major => {
            // major는 이제 List<String> 형태이므로, minorValue가 리스트에 포함되어 있는지 확인
            if (major.includes(minorValue)) {
                existsInMajor = true;
            }
        });

        if (!existsInMajor && !minorCodesNoneMajor.includes(minorValue)) {
            minorCodesNoneMajor.push(minorValue);
            createButton(code, minorValue);
        }
    }

	
	let selectedMajorCategories = {};
	function pushMajorCodeKey(code, majorCategory) {
	    // 이미 선택된 대분류가 아니라면 추가
		if (!selectedMajorCategories.hasOwnProperty(majorCategory)) {
        selectedMajorCategories[majorCategory] = []; // 빈 객체 할당
        createButton(code, majorCategory);
    	}
	    console.log(selectedMajorCategories);
	    console.log(selectedKind);
	}
	
	/*해당 소분류 대분류에 있는지 확인 함수*/
	function isValueInCodeMapping(selectedValue) {
	   let found = false;
	   Object.values(codeMapping).forEach(values => {
	       if (values.includes(selectedValue)) {
	           found = true;
	       }
	   });
	   return found;
	}
	
	function pushMinorKey_value(majorKey, code, minorValue) {
	    // 해당 majorKey에 대한 리스트가 존재하는지 확인하고, 없으면 초기화
	    if (!selectedMajorCategories.hasOwnProperty(majorKey) || !Array.isArray(selectedMajorCategories[majorKey])) {
	        selectedMajorCategories[majorKey] = [];
	    }

	    // minorValue가 해당 리스트에 없으면 추가
	    if (!selectedMajorCategories[majorKey].includes(minorValue)) {
	        selectedMajorCategories[majorKey].push(minorValue);
	        createButton(code, minorValue);
	    }

	    // 동시에 minorCodesNoneMajor 배열에서 해당 minorValue 제거
	    const index = minorCodesNoneMajor.indexOf(minorValue);
	    if (index > -1) {
	        minorCodesNoneMajor.splice(index, 1);
	    }

	    console.log(selectedMajorCategories);
	    console.log(minorCodesNoneMajor);
	}

	
	/*자격증 종류선택1*/
	let selectedKind = null;
	/*자격증 종류선택2*/
	function SelectedKindValue(code, kindValue) {
		// 이전에 선택된 종류가 있다면 해당 버튼 제거
	    if (selectedKind !== null) {
	        const existingButton = document.getElementById('selected-button-' + selectedKind);
	        if (existingButton) {
	            existingButton.remove();
	        }
	    }
		
	    selectedKind = kindValue;
	    createButton(code, kindValue);
	    console.log(selectedKind);
	}

	/*선택한 항목 버튼생성 함수*/
	function createButton(code, codeDesc) {
	    const selectedBox = document.getElementById('seleted_box');
	    const existingButton = document.getElementById('selected-button-' + code);
	
	    if (!existingButton) {
	        const selectedButton = document.createElement('button');
	        selectedButton.className = 'selected-button';
	        selectedButton.id = 'selected-button-' + code;
	        selectedButton.textContent = codeDesc;
	        
	        const img = document.createElement('img');
	        img.src = rootContextPath + "image/tpdyd/x.svg";
	        selectedButton.appendChild(img);
	        
	        selectedButton.onclick = function() { popLicenseCode(code, codeDesc); };
	
	        selectedBox.appendChild(selectedButton);
	    }
	}

	/*버튼 자신누르면 삭제, 배열에서도 삭제*/
	function popLicenseCode(code, codeDesc) {
	    // 버튼 삭제
	    const buttonToRemove = document.getElementById('selected-button-' + code);
	    if (buttonToRemove) {
	        buttonToRemove.remove();
	    }

	    // majorCategories에서 값 제거
	    if (selectedMajorCategories[code]) {
	        const index = selectedMajorCategories[code].indexOf(codeDesc);
	        if (index > -1) {
	            selectedMajorCategories[code].splice(index, 1);
	        }
	        if (selectedMajorCategories[code].length === 0) {
	            delete selectedMajorCategories[code];
	        }
	    }

	    // minorCodes에서 값 제거
	    const minorIndex = minorCodesNoneMajor.indexOf(codeDesc);
	    if (minorIndex > -1) {
	        minorCodesNoneMajor.splice(minorIndex, 1);
	    }

	    // kind에서 값 제거
	    if (selectedKind === codeDesc) {
	        selectedKind = null;
	    }

	    console.log(selectedMajorCategories);
	    console.log(minorCodesNoneMajor);
	    console.log(selectedKind);
	}

	function popAllLicenseCodes() {
	    // selectedMajorCategories 초기화
	    for (let key in selectedMajorCategories) {
	        if (selectedMajorCategories.hasOwnProperty(key)) {
	            delete selectedMajorCategories[key];
	        }
	    }

	    // minorCodesNoneMajor 배열 초기화
	    minorCodesNoneMajor.length = 0;

	    // selectedKind 초기화
	    selectedKind = null;

	    // seleted_box 내의 모든 버튼 삭제
	    const selectedBox = document.getElementById('seleted_box');
	    while (selectedBox.firstChild) {
	        selectedBox.removeChild(selectedBox.firstChild);
	    }

	    console.log("모든 선택 항목이 초기화됨:");
	    console.log(selectedMajorCategories);
	    console.log(minorCodesNoneMajor);
	    console.log(selectedKind);
	}

	
	
	/******ajax********/
	/*카테고리 찾기*/
	function selectAnyCategories() {
		$.ajax({
	        url: '/jabusim_Project/selectAnyCategories',
	        type: 'POST',
	        contentType: 'application/json', 
	        data: JSON.stringify({
	        	majorCategories: selectedMajorCategories,
	            minorCodes: minorCodesNoneMajor,
	            kind: selectedKind
	        }),
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
	/*검색*/
	function searchLicenseName(searchInput) {
		$.ajax({
	        url: '/jabusim_Project/searchLicenseName',
	        type: 'GET',
	        dataType: 'json',
	        data: {
	            searchInput: searchInput.value,
	        },
	        success: function(response) {
				console.log(response);
	        	createLicenseList(response);
	        },
	        error: function(jqXHR, textStatus, errorThrown) {
	            console.error("검색 요청 실패:", textStatus, errorThrown);
	        }
	    })
	}
	
	/*가져온개 몇개인가*/
	function countItems(count) {
		var searchResultCountElement = document.getElementById('searchResultCount');
	    searchResultCountElement.textContent = count.length + '건입니다';
	}

	
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
						
						<div class="contents_name">
							<ul class="d-flex flex-row contents_name_ul">
								<li>대분야</li>
								<li>소분야</li>
								<li>종 류</li>
							</ul>
						</div>
						
						<!-- #1 -->
						<div class="list_serch_contents">
							<ul class="d-flex flex-row list_serch_ul">
								<li class="flex-fill content1">
									<ul id="list_box1" class="list_box pretty-scrollbar">
										<!-- content1 내용 -->
									</ul>
								</li>
								<li class="flex-fill content2">
									<ul id="list_box2" class="list_box pretty-scrollbar">
										<!-- content2 내용 -->
									</ul>
								</li>
								<li class="flex-fill content3">
									<ul id="list_box3" class="list_box">
										<!-- content3 내용 -->
									</ul>
								</li>
							</ul>
						</div>

					</div>
					<!-- //선택박스 -->


					<!-- 선택 보여주는 박스 -->
					<div id="selected_show" class="selected_show">
						<div id="seleted_box" class="seleted_box pretty-scrollbar"></div>

						<div id="button_box" class="button_box">
							<div id="reset_box" class="reset_box">
								<button id="reset_btn" class="reset_btn btn btn-primary">
									선택항목 초기화&nbsp;<img src="${root }image/tpdyd/arrow-clockwise.svg" />
								</button>
							</div>
							<div id="required_box" class="required_box">
								<button id="required_btn" class="required_btn btn btn-primary">
									선택항목 검색&nbsp;<img src="${root }image/tpdyd/search.svg" />
								</button>
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
				
				<div id="howResultSearhed" class="howResultSearhed">
				    <div>검색결과 : </div>
				    <div id="searchResultCount"></div>
				</div>
					
				<div id="list_area" class="list_area">
					<!-- 리스트 항목들이 여기에 추가됩니다 -->
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