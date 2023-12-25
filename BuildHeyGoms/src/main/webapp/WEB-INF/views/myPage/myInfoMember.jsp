<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>buildHeyGo - My Page Member</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
</head>

<script>
		// 탈퇴 함수
		function removeMember(){
			if (confirm("정말로 탈퇴하시겠습니까?")) {
				location.href = "${contextPath}/myPage/removeMember?memberId=" + $("#memberId").val();
			}
		}
		
		
		$("#modifyInfoForm").submit(function(){
			
			if ($("#smsstsYn").val() != "Y") {
				$(this).val("N");
			}
			if ($("#emailstsYn").val() != "Y") {
				$(this).val("N")
			}
</script>


<body>

	<c:if test="${sessionScope.memberId eq null}">
		<script>
			alert("로그인을 먼저 진행해주세요.");
			location.href = "${contextPath}/member/loginMember";
		</script>
	</c:if>

<!-- Begin -->
	<div class="bg-white p-10 rounded-lg shadow-md mb-4">
        <div class="flex justify-between items-center mb-4">
            <div>
                <h2 class="text-xl font-semibold">회원님의 마이페이지</h2>
                <p class="text-gray-600">${memberDTO.email }</p>
            </div>
            <div class="flex items-center" style="margin-left: auto;">
                <div>
                    <span class="text-gray-600">새 알림</span>
                    <span class="text-red-600 font-bold">9 개</span>
                </div>
            </div>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="cart__btn update__btn d-flex justify-content-end" align="right">
                <button onclick="removeMember();"  class="button-secondary button-logout mb-2"><span class="icon_trash_alt"></span>탈퇴</button>
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
                <button class="tab-button" data-target="trainers-feedback">
                    	트레이너의 피드백
                </button>
                <button class="tab-button" data-target="my-questions">
                    	나의 질문 사항
                </button>
            </div>
        </div>
        
		<!-- 나의 정보수정 Tab -->
        <div id="edit-info" class="tab-content active">
            <h3 class="font-semibold mb-2">정보 수정</h3>
            <form action="${contextPath }/myPage/modifyInfo" id="modifyInfoForm" method="post" enctype="multipart/form-data">
                <div class="mb-4">
                    <label for="memberId" class="block text-sm font-medium text-gray-700">아이디</label>
                    <input type="text" id="memberId" name="memberId" value="${memberDTO.memberId }" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" placeholder="Your ID" readonly>
                </div>
                <div class="mb-4">
                    <label for="passwd" class="block text-sm font-medium text-gray-700">비밀번호 ( 보안화 되어있습니다. )</label>
                    <input type="password" id="passwd" name="passwd" value="${memberDTO.passwd }" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" placeholder="Your password">
                </div>
                <div class="mb-4">
                    <label for="memberNm" class="block text-sm font-medium text-gray-700">회원명</label>
                    <input type="text" id="memberNm" name="memberNm" value="${memberDTO.memberNm }" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" placeholder="Your Name" readonly>
                </div>
                
                
				<div class="mb-4">
				    <div class="checkout__form__input">
				        <label for="hp" class="block text-sm font-medium text-gray-700">PhoneNumber</label>
				        <input type="text" name="hp" id="hp" placeholder="-를 포함해서 입력하세요." value="${memberDTO.hp }" class="mt-2 block w-full border-gray-300 rounded-md shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" readonly required>
				        <div class="checkout__order__widget">
				         <label for="smsstsYn">
				             BMS에서 발송하는 SMS 소식을 수신합니다.
					        <input type="checkbox" id="smsstsYn" name="smsstsYn" value="Y" 
					               <c:if test="${memberDTO.smsstsYn == 'Y'}">checked</c:if>> <!-- 체크박스 -->
				             <span class="checkmark"></span>
				         </label>
				        </div>
				    </div>
				</div>
                
                <div class="mb-4">
                    <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
                    <input type="email" id="email" name="email" value="${memberDTO.email }" placeholder="Email..." class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" required>
					<div class="checkout__order__widget">
					    <label for="emailstsYn">
					        BMS에서 발송하는 E-mail을 수신합니다.
					        <input type="checkbox" id="emailstsYn" name="emailstsYn" value="Y" 
					               <c:if test="${memberDTO.emailstsYn == 'Y'}">checked</c:if>>
					        <span class="checkmark"></span>
					    </label>
					    </div>
                </div>
              
				<div class="mb-4">
				    <div class="checkout__form__input">
				        <label for="zipcode" class="block text-sm font-medium text-gray-700">우편 번호</label>
				        <input type="text" id="zipcode" name="zipcode" style="width: 20%;" value="${memberDTO.zipcode }" placeholder="우편 번호" class="mt-2 block w-full border-gray-300 rounded-md shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" required>
				        <input type="button" value="검색" onclick="execDaumPostcode();" style="width: 10%; padding-left: 0" class="mt-2 block w-full border-gray-300 rounded-md shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" required>
				    </div>
				    <div class="checkout__form__input">
				        <label for="roadAddress" class="mt-2 block text-sm font-medium text-gray-700">도로명 주소</label>
				        <input type="text" id="roadAddress" name="roadAddress" value="${memberDTO.roadAddress }" placeholder="도로명 주소를 입력하세요." class="mt-2 block w-full border-gray-300 rounded-md shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" required>
				    </div>
				    <div class="checkout__form__input">
				        <label for="jibunAddress" class="mt-2 block text-sm font-medium text-gray-700">지번 주소</label>
				        <input type="text" id="jibunAddress" name="jibunAddress" value="${memberDTO.jibunAddress }" placeholder="지번 주소를 입력하세요." class="mt-2 block w-full border-gray-300 rounded-md shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" required>
				    </div>
				    <div class="checkout__form__input">
				        <label for="namujiAddress" class="mt-2 block text-sm font-medium text-gray-700">나머지 주소</label>
				        <input type="text" id="namujiAddress" name="namujiAddress" value="${memberDTO.namujiAddress }" placeholder="나머지 주소를 입력하세요." class="mt-2 block w-full border-gray-300 rounded-md shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" required>
				    </div>
				</div>
				
				
				
                <div class="mb-4">
                    <label for="exercise" class="block text-sm font-medium text-gray-700">선호 운동</label>
                    <input type="text" id="exercise" name="exercise" value="${memberDTO.exercise }" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" placeholder="Your exercise">
                </div>
                <div class="mb-4">
                    <label for="introduction" class="block text-sm font-medium text-gray-700">자기소개</label>
                    <input type="text" id="introduction" name="introduction" value="${memberDTO.introduction }" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" placeholder="Your introduction">
                </div>
                <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">회원 정보 수정</button>
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