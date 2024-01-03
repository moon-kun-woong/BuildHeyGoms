<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>나의 트레이너</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">


    <style>
        .trainer-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .active-link {
            background-color: #e2e8f0; /* Light blue background for active link */
        }
        @media (max-width: 768px) {
            .grid-cols-1 {
                grid-template-columns: repeat(1, minmax(0, 1fr));
            }
        }
    </style>
    
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
        
        /* 스크롤 가능한 DIV의 스타일 설정 */
   		.scrollable-div {
        max-height: 600px; /* 원하는 높이 설정 */
        overflow-y: auto; /* 세로 스크롤을 표시할지 여부 */
        border: 1px solid #ccc; /* 테두리 스타일 설정 */
        padding: 10px; /* 내부 여백 설정 */
        word-wrap: break-word;
    	}
    </style>
    
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
        .trainer-card {
            border: 1px solid #e5e7eb;
            padding: 16px;
            border-radius: 8px;
            margin-bottom: 16px;
            display: flex;
            align-items: center;
        }
        .trainer-card img {
            border-radius: 9999px;
            width: 80px;
            height: 80px;
            object-fit: cover;
            margin-right: 16px;
        }
        .trainer-info {
            flex-grow: 1;
        }
        .trainer-section {
            margin-top: 32px;
        }
        .trainer-section h3 {
            font-size: 1.25rem;
            color: #374151;
            margin-bottom: 16px;
        }
        .trainer-section-border {
            height: 2px;
            background-color: #e5e7eb;
            margin: 32px 0;
        }
        
        
    </style>
    
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
        }
        .tab-content {
            display: none;
            padding: 16px;
            border: 1px solid #e5e7eb;
            margin-top: 8px;
            background-color: #ffffff;
        }
        .tab-content.active {
            display: block;
        }
        .tab-button {
            cursor: pointer;
            padding: 8px 16px;
            border-radius: 9999px;
            border: 1px solid transparent;
            background-color: #f3f4f6;
        }
        .tab-button.active {
            color: #3b82f6;
            border-color: #3b82f6;
        }
        .tab-button:hover {
            border-color: #e5e7eb;
        }
        .trainer-card {
            border: 1px solid #e5e7eb;
            padding: 16px;
            border-radius: 8px;
            margin-bottom: 16px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: #ffffff;
        }
        .trainer-card img {
            border-radius: 9999px;
            width: 80px;
            height: 80px;
            object-fit: cover;
            margin-right: 16px;
        }
        .trainer-info {
            flex-grow: 1;
        }
        .trainer-section {
            margin-top: 32px;
        }
        .trainer-section h3 {
            font-size: 1.25rem;
            color: #374151;
            margin-bottom: 16px;
        }
        .trainer-section-border {
            height: 2px;
            background-color: #e5e7eb;
            margin: 32px 0;
        }
        .button-secondary {
            padding: 6px 12px;
            border: 1px solid #e5e7eb;
            border-radius: 9999px;
            cursor: pointer;
            margin-left: 8px;
            background-color: #f3f4f6;
        }
        .button-logout {
            background-color: #fdba74; /* Light orange */
        }
        .button-info {
            background-color: #bfdbfe; /* Light blue */
        }
    
    </style>
    
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
        }
        .tab-content {
            display: none;
            padding: 16px;
            border: 1px solid #e5e7eb;
            margin-top: 8px;
            background-color: #ffffff;
        }
        .tab-content.active {
            display: block;
        }
        .tab-button {
            cursor: pointer;
            padding: 8px 16px;
            border-radius: 9999px;
            border: 1px solid transparent;
            background-color: #f3f4f6;
        }
        .tab-button.active {
            color: #3b82f6;
            border-color: #3b82f6;
        }
        .tab-button:hover {
            border-color: #e5e7eb;
        }
        .chat-container {
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            padding: 16px;
            background-color: #ffffff;
            max-height: 300px;
            overflow-y: auto;
            display: flex;
            flex-direction: column;
        }
        .chat-message {
            max-width: 70%;
            padding: 8px;
            margin: 8px 0;
            border-radius: 16px;
            background-color: #f3f4f6;
        }
        .chat-message.user {
            background-color: #bfdbfe;
            align-self: flex-end;
        }
        .chat-message.other {
            background-color: #e5e7eb;
            align-self: flex-start;
        }
        .chat-input-container {
            margin-top: 16px;
        }
        .chat-input {
            width: calc(100% - 16px);
            padding: 8px;
            border-radius: 9999px;
            border: 1px solid #e5e7eb;
            margin-bottom: 8px;
            display: inline-block;
        }
        .chat-send-button {
            padding: 8px 16px;
            border-radius: 9999px;
            background-color: #3b82f6;
            color: white;
            cursor: pointer;
            border: none;
            display: inline-block;
        }
         .feedback-card {
            background-color: #f9fafb;
            border-radius: 8px;
            padding: 16px;
            margin-bottom: 16px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            /* 긴 텍스트를 숨기고 스크롤 가능하게 만듭니다. */
		    overflow: hidden;
		    text-overflow: ellipsis;
		    white-space: nowrap;
		    max-height: 1000px; /* 원하는 높이로 설정하세요. */
		    
        	overflow-x: auto;
   			max-width: 800px; /* 원하는 가로 폭으로 설정하세요. */
   			
	    	/* 텍스트 오버플로우를 처리하여 다음 줄로 줄 바꿈 */
   		 	white-space: pre-line;
   		 	overflow: visible; /* 텍스트를 자르지 않음 */
        }
        .feedback-date {
            font-weight: 700;
            margin-bottom: 8px;
        }
        
        /* 스크롤 가능한 DIV의 스타일 설정 */
   		.scrollable-div {
	        max-height: 600px; /* 원하는 높이 설정 */
	        overflow-y: auto; /* 세로 스크롤을 표시할지 여부 */
	        border: 1px solid #ccc; /* 테두리 스타일 설정 */
	        padding: 10px; /* 내부 여백 설정 */
	        word-wrap: break-word;
    	}
    </style>    
    
    
</head>


<body>

	<c:if test="${sessionScope.trainerId eq null}">
		<script>
			alert("로그인을 먼저 진행해주세요.");
			location.href = "${contextPath}/member/loginMember";
		</script>
	</c:if>

<!-- Begin -->
	<div class="bg-white p-10 rounded-lg shadow-md mb-4 w-full md:w-3/5">
        <div class="flex justify-between items-center mb-4">
            <div>
                <h2 class="text-xl font-semibold">나의 회원</h2>
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
                <button class="tab-button active" data-target="my-trainer">
                    	나의 회원 목록
                </button>
                <button class="tab-button" data-target="trainers-feedback">
                    	피드백
                </button>
            </div>
        </div>

        
        <!-- 나의 트레이너 -->
        <div id="my-trainer" class="tab-content active">
	        <div class="trainer-section">
	            <h3>현재 함께하는 회원</h3>
				<c:choose>
				    <c:when test="${not empty memberDTO}">
			            <c:forEach var="memberDTO" items="${memberDTO}">
			                <div class="trainer-card">
			                    <img src="https://source.unsplash.com/random/300x200?fitness" alt="Trainer">
			                    <div class="member-info">
			                        <strong>${memberDTO.memberNm} 회원</strong>
			                        <p class="bg-gray-100">BuildHeyGo 인증 완료</p>
			                    </div>
			                    <div>
			                        <button class="button-secondary button-logout" onclick="event.stopPropagation(); removeClassMember('${classDTO.classId}');">수업취소 요청</button>
			                        <button class="button-secondary button-info" onclick="viewTrainerInfo('${classDTO.trainerId}');">코멘트 쓰기</button>
			                    </div>
			                </div>
			            </c:forEach>
				    </c:when>
				    <c:otherwise>
				        <p>수강하신 강의가 없습니다.</p>
				    </c:otherwise>
				</c:choose>			            
	        </div>
            <div class="trainer-section-border"></div>
        </div>
        
        <!-- 트레이너의 피드백 -->
        <div id="trainers-feedback" class="tab-content">
        	<!-- 스크롤링 div -->
        	<div class="scrollable-div">
		        <!-- Example feedback card -->
		        <div class="feedback-card" id="feedback-card">
		            <div class="feedback-date">2023-04-01</div>
		            <div class="feedback-card">
	               		aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
		            </div>
		        </div>
		        <div class="feedback-card" id="feedback-card2">
		            <div class="feedback-date">2023-04-01</div>
		            <div class="feedback-card">
	               		aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
		            </div>
		        </div>
		        <div class="feedback-card" id="feedback-card3">
		            <div class="feedback-date">2023-04-01</div>
		            <div class="feedback-card">
	               		aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
		            </div>
		        </div>
	        </div>
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
    
    
</script>


</body>
</html>