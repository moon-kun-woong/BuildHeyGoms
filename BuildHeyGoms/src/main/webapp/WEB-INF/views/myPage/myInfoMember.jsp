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
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
        }
        .tab-content {
            display: none;
            padding: 16px;
            border: 1px solid #e5e7eb;
            margin-top: 8px;
        }
        .tab-content.active {
            display: block;
        }
        .icon {
            width: 24px;
            height: 24px;
        }
        .tab-button {
            cursor: pointer;
            padding: 8px 16px;
            border-radius: 9999px;
            border: 1px solid transparent;
        }
        .tab-button.active {
            color: #3b82f6;
            border-color: #3b82f6;
        }
        .tab-button:hover {
            border-color: #e5e7eb;
        }
    </style>
</head>
<body>


	<div class="bg-white p-4 rounded-lg shadow-md mb-4">
        <div class="flex justify-between items-center mb-4">
            <div>
                <h2 class="text-xl font-semibold">My Page</h2>
                <p class="text-gray-600">${myPageService.getEmailById(memberId)}</p>
            </div>
            <div class="flex items-center" style="margin-left: auto;">
                <div>
                    <span class="text-gray-600">새 알림</span>
                    <span class="text-red-600 font-bold">9 개</span>
                </div>
            </div>
        </div>

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

        <div id="edit-info" class="tab-content active">
            <h3 class="font-semibold mb-2">정보 수정</h3>
            <form>
                <div class="mb-4">
                    <label for="username" class="block text-sm font-medium text-gray-700">회원명</label>
                    <input type="text" id="username" name="username" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" placeholder="Your name">
                </div>
                <div class="mb-4">
                    <label for="userid" class="block text-sm font-medium text-gray-700">아이디</label>
                    <input type="text" id="userid" name="userid" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" placeholder="Your ID">
                </div>
                <div class="mb-4">
                    <label for="password" class="block text-sm font-medium text-gray-700">비밀번호</label>
                    <input type="password" id="password" name="password" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" placeholder="Your password">
                </div>
                <div class="mb-4">
                    <label for="address" class="block text-sm font-medium text-gray-700">주소</label>
                    <input type="text" id="address" name="address" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" placeholder="Your address">
                </div>
                <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">저장</button>
            </form>
        </div>
        <div id="my-trainer" class="tab-content">
            <p>My Trainer content goes here...</p>
        </div>
        <div id="my-questions" class="tab-content">
            <p>My Questions content goes here...</p>
        </div>
        <div id="trainers-feedback" class="tab-content">
            <p>Trainer's Feedback content goes here...</p>
        </div>
    </div>








<script>
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
</script>


</body>
</html>