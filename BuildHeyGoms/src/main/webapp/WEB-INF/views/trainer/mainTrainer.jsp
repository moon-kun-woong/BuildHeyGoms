<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<%
    // 오늘의 날짜 정보 가져오기
    java.util.Calendar cal = java.util.Calendar.getInstance();
    int currentYear = cal.get(java.util.Calendar.YEAR);
    int currentMonth = cal.get(java.util.Calendar.MONTH) + 1; // 월은 0부터 시작하므로 1을 더합니다.
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calendar Application</title>
    <script src="https://cdn.tailwindcss.com"></script>
    
    
    <style>
        /* 추가적인 스타일링 */
        .border-b {
            border-bottom: 1px solid #e2e8f0;
        }
    
        /* 추가적인 스타일링 */
        .grid-cols-7 > div {
            border-right: 1px solid #e2e8f0;
        }
    
        /* 날짜 셀에 호버 효과 추가 */
        .date-cell:hover {
            background-color: #f0f4f8; /* 호버 시 배경색 변경 */
            cursor: pointer; /* 호버 시 커서 모양 변경 */
        }
    </style>

    
    
</head>


<body class="bg-gray-100">

<div class="bg-white p-4 rounded-lg shadow-md w-full md:w-3/4">
    <div class="flex justify-between items-center mb-4">
        <h2 class="text-xl font-semibold" id="currentYearMonth"></h2>
        <div>
			<button id="prevMonth" class="text-gray-600 hover:text-gray-800" onclick="goToPrevMonth()">
			    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24"
			         stroke="currentColor">
			        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"/>
			    </svg>
			</button>
            <button id="nextMonth" class="text-gray-600 hover:text-gray-800" onclick="goToNextMonth()">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24"
                     stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"/>
                </svg>
            </button>
        </div>
    </div>
    <div class="grid grid-cols-7 gap-4 mb-4">
        <div class="font-bold text-center border-b">일</div>
        <div class="font-bold text-center border-b">월</div>
        <div class="font-bold text-center border-b">화</div>
        <div class="font-bold text-center border-b">수</div>
        <div class="font-bold text-center border-b">목</div>
        <div class="font-bold text-center border-b">금</div>
        <div class="font-bold text-center border-b">토</div>
        <!-- 나머지 날짜 셀을 추가합니다. -->
    </div>
    <div class="border-t pt-4 mt-4 bg-gray-50 p-4 rounded-lg shadow-md">
        <h3 class="text-xl font-semibold mb-2">회원님의 질문</h3>
        <div class="bg-white p-4 rounded-lg shadow-md mb-2">
            <p>안녕하세요 강사님, 이러한 상황이었을 때 질문 드립니다.</p>
        </div>
        <div class="bg-white p-4 rounded-lg shadow-md mb-2">
            <p>안녕하세요 강사님, 대회영상 관련해 문자 드립니다.</p>
        </div>
        <div class="bg-white p-4 rounded-lg shadow-md mb-2">
            <p>헬스맨~.</p>
        </div>
    </div>
</div>
<script>
    // 월의 일수 계산
    function daysInMonth(year, month) {
        return new Date(year, month + 1, 0).getDate();
    }

    // 현재 월과 연도 설정
    let currentYear = <%= currentYear %>;
    let currentMonth = <%= currentMonth %> - 1;

    // 스케줄 데이터 객체 설정 (현재는 더미 데이터 사용)
    const scheduleData = {
        11: {
            10: ["스케줄 1", "스케줄 2"],
            15: ["스케줄 3"],
            // 월별 스케줄 데이터를 추가할 수 있습니다.
        },
        // 연도별 스케줄 데이터를 추가할 수 있습니다.
    };

    // 캘린더 그리드 선택
    const calendarGrid = document.querySelector('.grid');

 // 스케줄 업데이트 함수
    function updateSchedule() {
        // 현재 월의 일수 얻기
        const daysInThisMonth = daysInMonth(currentYear, currentMonth);

        // 스케줄을 업데이트하기 전에 캘린더 그리드 내용 초기화
        calendarGrid.innerHTML = '';

        // 해당 월의 첫째 날의 요일 계산 (0은 일요일, 6은 토요일)
        const firstDayOfWeek = new Date(currentYear, currentMonth, 1).getDay();

        // 요일 이름 배열
        const dayNames = ['일', '월', '화', '수', '목', '금', '토'];

        // 요일 표시
        for (let i = 0; i < 7; i++) {
            const dayNameCell = document.createElement('div');
            dayNameCell.textContent = dayNames[i];
            dayNameCell.classList.add('text-center', 'py-1', 'font-bold', 'border-b');
            calendarGrid.appendChild(dayNameCell);
        }

        // 빈 공간 채우기
        for (let i = 0; i < firstDayOfWeek; i++) {
            const emptyDay = document.createElement('div');
            calendarGrid.appendChild(emptyDay);
        }

        // 날짜와 스케줄 추가
        for (let day = 1; day <= daysInThisMonth; day++) {
            const calendarDay = document.createElement('div');
            const dateCell = document.createElement('div');
            dateCell.textContent = day;
            dateCell.classList.add('text-center', 'py-1', 'date-cell');

            // 해당 날짜의 스케줄 가져오기
            const daySchedule = scheduleData[currentMonth] && scheduleData[currentMonth][day];

            if (daySchedule) {
                daySchedule.forEach(schedule => {
                    const scheduleElement = document.createElement('div');
                    scheduleElement.textContent = schedule;
                    scheduleElement.classList.add('text-sm', 'text-gray-600', 'mb-1');
                    dateCell.appendChild(scheduleElement);
                });
            }

            dateCell.addEventListener('click', () => {
                // 날짜를 클릭했을 때 할 작업을 여기에 추가하세요.
                alert(`날짜 ${day} 클릭!`);
            });

            calendarDay.appendChild(dateCell);
            calendarGrid.appendChild(calendarDay);
        }
    }
 
    // 초기 스케줄 업데이트
    updateCurrentMonth(); // 추가
    updateSchedule();

    
    function updateCurrentMonth() {
        const currentMonthElement = document.getElementById('currentYearMonth');
        const displayedMonth = currentMonth + 1; // 월을 1을 더해서 표시
        currentMonthElement.textContent = `${currentYear}-${displayedMonth < 10 ? '0' : ''}${displayedMonth}`;
    }
    
    
 	// 이전 월로 이동하는 함수
    function goToPrevMonth() {
        currentMonth -= 1;
        if (currentMonth < 0) {
            currentYear -= 1;
            currentMonth = 11;
        }
        updateCurrentMonth(); // 수정
        updateSchedule();
    }

    // 다음 월로 이동하는 함수
    function goToNextMonth() {
        currentMonth += 1;
        if (currentMonth > 11) {
            currentYear += 1;
            currentMonth = 0;
        }
        updateCurrentMonth(); // 수정
        updateSchedule();
    }

</script>
    
</body>
</html>
