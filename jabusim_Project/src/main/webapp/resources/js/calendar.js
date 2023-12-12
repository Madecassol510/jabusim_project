var nowDay;
var nowYear; // 년도  
var nowMonth; // 월 (0~11)
var nowDate; // 일 (0~31)
var nowWeek; // 요일 (0(일)~6(토))

var firstDate; // 이번달 1일
var lastDate; // 이번달 마지막날

var preDate;
var proDate;

var cell;

window.onload = function() {
	nowDate = new Date();
	makeCalendar();
}

function makeCalendar() {
	var dayNum = 0;

	nowDay = nowDate.getDate();
	nowWeek = nowDate.getDay();
	nowMonth = nowDate.getMonth();
	nowYear = nowDate.getFullYear();

	firstDate = new Date(nowYear, nowMonth, 1);
	lastDate = new Date(nowYear, nowMonth + 1, 0);

	preDate = new Date(nowYear, nowMonth, -(firstDate.getDay()));
	preLastMonth = new Date(nowYear, nowMonth, 0);

	proDate = new Date(nowYear, nowMonth + 1, 1);

	document.getElementById("calendarDate").textContent = nowYear + "." + (nowMonth + 1);

	var calendar = document.querySelector(".calendar-body");
	calendar.innerHTML = "";

	for (var date = preDate.getDate() + 1; date <= preLastMonth.getDate(); date++) {
		cell = document.createElement("div");
		cell.classList.add("date");
		cell.classList.add("other-month");
		cell.textContent = date;
		calendar.appendChild(cell);

		dayNum++;
	}

	for (var date = firstDate.getDate(); date <= lastDate.getDate(); date++) {
		cell = document.createElement("div");
		cell.classList.add("date");

		// 오늘 날짜 표시
		if (date === nowDay && nowMonth === nowDate.getMonth() && nowYear === nowDate.getFullYear()) {
			cell.classList.add("today");
		}

		// 이번 달의 주말
		if (dayNum % 7 === 6) {
			cell.classList.add("saturday");
		}

		if (dayNum % 7 === 0) {
			cell.classList.add("sunday");
		}
		
		cell.textContent = date;
		calendar.appendChild(cell);

		dayNum++;
	}

	for (var date = 1; date <= (42 - dayNum); date++) {
		cell = document.createElement("div");
		cell.classList.add("date");
		cell.classList.add("other-month");
		cell.textContent = date;
		calendar.appendChild(cell);
	}
}

function preCalendar() {
	removeTodayClass();
	nowDate = new Date(nowYear, nowMonth - 1, 1);
	makeCalendar();
}

function proCalendar() {
	removeTodayClass();
	nowDate = new Date(nowYear, nowMonth + 1, 1);
	makeCalendar();
}

function removeTodayClass() {
	// 오늘 표시를 가진 셀들을 찾아서 today 클래스를 제거
	var todayCells = document.querySelectorAll('.date');
	todayCells.forEach(function(cell) {
		cell.classList.remove('today');
	});
}