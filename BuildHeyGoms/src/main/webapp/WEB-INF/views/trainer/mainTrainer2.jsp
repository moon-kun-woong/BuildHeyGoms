<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="en">

<body class="bg-gray-100">

<div class="container mx-auto p-4">
    <div class="flex justify-between items-center mb-6">
        <h1 class="text-3xl font-bold">buildHeyGo</h1>
        <div>
            <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded mr-2">login</button>
            <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">회원가입</button>
        </div>
    </div>

    <div class="flex flex-col md:flex-row">
        <div class="bg-white p-4 rounded-lg shadow-md w-full md:w-1/4 mb-4 md:mb-0 md:mr-4">
            <h2 class="text-xl font-semibold mb-4">My trainer</h2>
            <ul class="space-y-2">
                <li class="bg-blue-100 text-blue-700 p-2 rounded">matching trainer</li>
                <li class="hover:bg-blue-100 p-2 rounded cursor-pointer">private diet planner</li>
                <li class="hover:bg-blue-100 p-2 rounded cursor-pointer">부위별 운동</li>
            </ul>
        </div>

        <div class="bg-white p-4 rounded-lg shadow-md w-full md:w-3/4">
            <div class="flex justify-between items-center mb-4">
                <h2 class="text-xl font-semibold" id="currentMonth"></h2>
                <div>
                    <button id="prevMonth" class="text-gray-600 hover:text-gray-800">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24"
                             stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"/>
                        </svg>
                    </button>
                    <button id="nextMonth" class="text-gray-600 hover:text-gray-800">
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
            </div>
            <div class="grid grid-cols-7 gap-4" id="calendarGrid"></div>
            <div class="border-t pt-4">
                <h3 class="text-lg font-semibold mb-2">회원님의 질문</h3>
                <p class="question">안녕하세요 강사님 이러한 상황이었을 때 질문 드립니다.</p>
                <p class="question">안녕하세요 강사님, 다음과 같은 질문이 있습니다.</p>
                <p class="question">회원님의 질문 내용을 누를 수 있게 해줘</p>
            </div>
        </div>
    </div>
</div>

<script>

    const scheduleData = {
        // Example schedule data
        2023: {
            3: { 15: ["Meeting with team", "Lunch with client"] },
            4: { 10: ["Project deadline"] }
        }
    };

    function daysInMonth(year, month) {
        return new Date(year, month + 1, 0).getDate();
    }

    function updateCurrentMonth() {
        const currentMonthElement = document.getElementById('currentMonth');
        currentMonthElement.textContent = `${currentYear} - ${String(currentMonth + 1).padStart(2, '0')}`;
    }

    function updateSchedule() {
        const calendarGrid = document.getElementById('calendarGrid');
        calendarGrid.innerHTML = '';

        const daysInThisMonth = daysInMonth(currentYear, currentMonth);
        const firstDayOfWeek = new Date(currentYear, currentMonth, 1).getDay();

        for (let i = 0; i < firstDayOfWeek; i++) {
            calendarGrid.innerHTML += '<div></div>';
        }

        for (let day = 1; day <= daysInThisMonth; day++) {
            const dateCell = document.createElement('div');
            dateCell.classList.add('text-center', 'py-2', 'date-cell');
            dateCell.textContent = day;

            const daySchedule = scheduleData[currentYear] && scheduleData[currentYear][currentMonth] && scheduleData[currentYear][currentMonth][day];
            if (daySchedule) {
                daySchedule.forEach(event => {
                    const eventElement = document.createElement('div');
                    eventElement.textContent = event;
                    eventElement.classList.add('text-sm', 'text-gray-600', 'mt-1');
                    dateCell.appendChild(eventElement);
                });
            }

            calendarGrid.appendChild(dateCell);
        }
    }

    function goToPrevMonth() {
        currentMonth--;
        if (currentMonth < 0) {
            currentMonth = 11;
            currentYear--;
        }
        updateSchedule();
        updateCurrentMonth();
    }

    function goToNextMonth() {
        currentMonth++;
        if (currentMonth > 11) {
            currentMonth = 0;
            currentYear++;
        }
        updateSchedule();
        updateCurrentMonth();
    }

    document.getElementById('prevMonth').addEventListener('click', goToPrevMonth);
    document.getElementById('nextMonth').addEventListener('click', goToNextMonth);

    updateCurrentMonth();
    updateSchedule();
</script>

</body>
</html>
