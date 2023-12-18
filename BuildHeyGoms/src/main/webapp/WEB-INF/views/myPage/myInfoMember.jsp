<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"     uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>buildHeyGo - My Page</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>


	<div class="bg-white p-4 rounded-lg shadow-md mb-4">
        <div class="flex justify-between items-center mb-4">
            <div>
                <h2 class="text-xl font-semibold">My Page</h2>
                <p class="text-gray-600">jeji***@naver.com</p>
            </div>
            <div class="flex items-center" style="margin-left: auto;">
                <div>
                    <span class="text-gray-600">새 알림</span>
                    <span class="text-red-600 font-bold">9 개</span>
                </div>
            </div>
        </div>

		<!-- Tab 리스트 -->
        <div class="flex justify-between items-center mb-4">
            <div class="grid grid-cols-4 gap-4">
                <button class="tab-button active" data-target="edit-info">
                    	나의 정보 수정
                </button>
                <button class="tab-button" data-target="my-trainer">
                    	나의 트레이너
                </button>
                <button class="tab-button" data-target="my-questions">
                    	나의 질문 사항
                </button>
                <button class="tab-button" data-target="trainers-feedback">
                    	트레이너의 피드백
                </button>
            </div>
        </div>
        
		<!-- 나의 정보수정 Tab -->
        <div id="edit-info" class="tab-content active">
            <h3 class="font-semibold mb-2">정보 수정</h3>
            <form>
                <div class="mb-4">
                    <label for="name" class="block text-sm font-medium text-gray-700">회원명</label>
                    <input type="text" id="name" name="memberNm" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" placeholder="Your name">
                </div>
                <div class="mb-4">
                    <label for="memberId" class="block text-sm font-medium text-gray-700">아이디</label>
                    <input type="text" id="memberId" name="memberId" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" placeholder="Your ID">
                </div>
                <div class="mb-4">
                    <label for="passwd" class="block text-sm font-medium text-gray-700">비밀번호</label>
                    <input type="password" id="passwd" name="passwd" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" placeholder="Your password">
                </div>
                <div class="mb-4">
                    <label for="phoneNumber" class="block text-sm font-medium text-gray-700">전화번호</label>
                    <input type="text" id="hp" name="hp" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" placeholder="Your phoneNumber">
                </div>
                <div class="mb-4">
                    <label for="address" class="block text-sm font-medium text-gray-700">주소</label>
                    <input type="text" id="address" name="address" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" placeholder="Your address">
                </div>
                <div class="mb-4">
                    <label for="email" class="block text-sm font-medium text-gray-700">이메일</label>
                    <input type="text" id="email" name="email" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" placeholder="Your email">
                </div>
                <div class="mb-4">
                    <label for="exercise" class="block text-sm font-medium text-gray-700">선호 운동</label>
                    <input type="text" id="exercise" name="exercise" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" placeholder="Your exercise">
                </div>
                <div class="mb-4">
                    <label for="introduction" class="block text-sm font-medium text-gray-700">자기소개</label>
                    <input type="text" id="introduction" name="introduction" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" placeholder="Your introduction">
                </div>
                <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">저장</button>
            </form>
        </div>
        
        <!-- 나의 트레이너 -->
        <div id="my-trainer" class="tab-content">
            <div class="trainer-section">
                <h3>현재 함께하는 트레이너</h3>
                <div class="trainer-card">
                    <img src="https://via.placeholder.com/80" alt="Trainer">
                    <div class="trainer-info">
                        <strong>*** 트레이너</strong>
                        <p>나와 함께한 기간: D-3</p>
                        <p>BuildHeyGo 인증 완료</p>
                        <p>지역: 서울</p>
                        <p>강의 참가 횟수: 2회</p>
                        <p>평점: ⭐⭐⭐⭐</p>
                    </div>
	                <div>
	                    <button class="button-secondary button-logout">탈퇴 요청</button>
	                    <button class="button-secondary button-info">트레이너 정보</button>
	                </div>
                </div>
            </div>
            <div class="trainer-section-border"></div>
            <div class="trainer-section">
                <h3>함께했던 트레이너</h3>
                <div class="trainer-card">
                    <img src="https://via.placeholder.com/80" alt="Trainer">
                    <div class="trainer-info">
                        <strong>*** 트레이너</strong>
                        <p>나와 함께한 기간: D-3</p>
                        <p>BuildHeyGo 인증 완료</p>
                        <p>지역: 서울</p>
                        <p>강의 참가 횟수: 1회</p>
                        <p>평점: ⭐</p>
                    </div>
	                <div>
	                    <button class="button-secondary button-logout">트레이너 평가</button>
	                    <button class="button-secondary button-info">트레이너 정보</button>
	                </div>                    
                </div>
                <!-- Repeat for additional trainers as needed -->
            </div>
        </div>
        
        <!-- 나의 질문 -->
	    <div id="my-questions" class="tab-content">
	        <div class="chat-container" id="chat-container">
	            <!-- Chat messages will be appended here -->
	        </div>
	        <div class="chat-input-container">
	            <input type="text" id="chat-input" class="chat-input" placeholder="대화 내용을 입력하시오.">
	            <button id="chat-send" class="chat-send-button">Send</button>
	        </div>
	    </div>
        
        <!-- 트레이너의 피드백 -->
        <div id="trainers-feedback" class="tab-content">
            <p>Trainer's Feedback content goes here...</p>
        </div>
        
        
        
        
        
    </div>








<script>

	// tag 눌렀을 시 나오는 화면.
    const tabButtons = document.querySelectorAll('.tab-button');
    const tabContents = document.querySelectorAll('.tab-content');

    tabButtons.forEach(button => {
        button.addEventListener('click', () => {
            const target = button.getAttribute('data-target');

            tabContents.forEach(content => {
                content.classList.remove('active');
            });
            tabButtons.forEach(btn => {
                btn.classList.remove('active');
            });

            document.getElementById(target).classList.add('active');
            button.classList.add('active');
        });
    });
    
    
    
    
    // Chat functionality
    const chatContainer = document.getElementById('chat-container');
    const chatInput = document.getElementById('chat-input');
    const chatSend = document.getElementById('chat-send');

    chatSend.addEventListener('click', () => {
        const messageText = chatInput.value.trim();
        if (messageText) {
            const messageElement = document.createElement('div');
            messageElement.classList.add('chat-message', 'user');
            messageElement.textContent = messageText;
            chatContainer.appendChild(messageElement);
            chatInput.value = '';
            chatContainer.scrollTop = chatContainer.scrollHeight;
        }
    });

    chatInput.addEventListener('keypress', (e) => {
        if (e.key === 'Enter') {
            chatSend.click();
        }
    });

    // Simulate receiving a message from another user
    function receiveMessage(text) {
        const messageElement = document.createElement('div');
        messageElement.classList.add('chat-message', 'other');
        messageElement.textContent = text;
        chatContainer.appendChild(messageElement);
        chatContainer.scrollTop = chatContainer.scrollHeight;
    }

    // Example of receiving a message
    setTimeout(() => receiveMessage("Hello! How can I help you today?"), 1000);
    
    
</script>


</body>
</html>