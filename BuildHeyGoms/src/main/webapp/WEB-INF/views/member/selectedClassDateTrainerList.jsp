<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"     uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>강사님 선택</title>

<style>
    body {
        font-family: 'Noto Sans KR', sans-serif;
    }
    .border-b {
        border-bottom: 1px solid #e2e8f0;
    }
    .grid-cols-7 > div {
        border-right: 1px solid #e2e8f0;
    }
    .date-cell:hover {
        background-color: #f0f4f8;
        cursor: pointer;
    }
    .profile-upload {
        background-color: #f9fafb;
        border: 2px dashed #d1d5db;
        border-radius: 50%; /* Circular shape */
        width: 100px; /* Adjusted size */
        height: 100px; /* Adjusted size */
        display: flex;
        align-items: center;
        justify-content: center;
        margin: auto;
        cursor: pointer;
    }
    .profile-upload:hover {
        background-color: #f3f4f6;
    }
    .submit-button {
        width: 100%;
        background-color: #4CAF50; /* Green background */
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    .submit-button:hover {
        background-color: #45a049; /* Darker green */
    }
    
            .cancel-button {
        background-color: #f3f4f6;
        color: #333;
    }
    .cancel-button:hover {
        background-color: #e2e8f0;
    }
    .delete-button {
        background-color: #f44336;
        color: white;
        width: 50%;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    .delete-button:hover {
        background-color: #d32f2f;
    }
    .action-button {
        width: calc(50% - 4px);
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        width: 100%;
        border-radius: 4px;
        cursor: pointer;
    }
</style>
    
    
    <script>
        // URL에서 selectedDate 파라미터 값을 읽어옵니다.
        function getQueryParameter(param) {
            var urlParams = new URLSearchParams(window.location.search);
            return urlParams.get(param);
        }

        // selectedDate 파라미터 값을 가져와서 페이지에 표시합니다.
        document.addEventListener('DOMContentLoaded', function() {
            var selectedDate = getQueryParameter('selectedDate');
            if (selectedDate) {
                document.getElementById('selectedDate').textContent = selectedDate;
                // 시간을 표시하려면 다음과 같이 시간 값을 가져와서 표시할 수 있습니다.
                var currentTime = new Date().toLocaleTimeString();
                document.getElementById('currentTime').textContent = currentTime;
            }
        });
    </script>
    
	<script>
			function selectedClassDateTrainerList(){
				if (confirm("수업일 : "+"${selectedDate }"+ "을 선택하시겠습니까?")) {
					return true;		
				}
				else {
					return false;
				}
			}
	</script>    

</head>
<body>

	    <div class="bg-white p-4 rounded-lg shadow-md w-full md:w-3/5">
	        <div class="mb-4">
	            <h2 class="text-xl font-semibold">${selectedDate } 에 수업 가능한 트레이너</h2>
	        </div>
	    	<section class="grid grid-cols-1 md:grid-cols-3 gap-4">
	    
		        <!-- Trainer Card 1 -->
				<c:choose>
				    <c:when test="${not empty classDTO}">
				        <!-- classList가 비어있지 않은 경우 -->
				        <c:forEach items="${classDTO}" var="classDTO">
				        	<form id="selectedClassDateTrainerList_${classDTO.classId}" action="${contextPath}/member/selectedClassDateTrainerList" method="post" enctype="multipart/form-data" onsubmit="return selectedClassDateTrainerList();">
				        		
				        		<input type="hidden" id="classMemberId" name="classMemberId" value="${memberId}${classDTO.classId }"/>
				        		<input type="hidden" id="classId" name="classId" value="${classDTO.classId }"/>
				        		<input type="hidden" id="memberId" name="memberId" value="${memberId }"/>
				        		<input type="hidden" id="selectedDateClassMember" name="selectedDateClassMember" value="${selectedDate }"/>
				        		<input type="hidden" id="question" name="question" value=""/>
					            <div class="trainer-card bg-white p-4 rounded-lg shadow transition duration-300 ease-in-out">
					                <!-- Trainer 정보 표시 카드 -->
					                <h2 class="font-semibold mb-2">${classDTO.trainerId} 트레이너 님</h2>
					                <img src="https://source.unsplash.com/random/300x200?fitness" alt="트레이너 사진" class="rounded-lg mb-4">
					                <h3 class="font-semibold mb-2">${classDTO.classNm}</h3>
					                <div class="mb-2">
					                    <p class="text-gray-600">강의 내용</p>
					                    <div class="bg-gray-200 p-2 rounded-lg text-gray-600">${classDTO.classContent}</div>
					                </div>
					                <p class="text-gray-600 mb-2">가능날짜: ${classDTO.selectedDate}</p>
					                <p class="text-gray-600 mb-2">가격 : 1회 -  30,000￦</p>
					                <button type="submit" onsubmit="selectedClassDateTrainerList();" class="mt-4 px-4 py-2 rounded bg-blue-500 text-white font-semibold hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-300">매칭하기</button>
					            </div>
					            
				            </form>
				        </c:forEach>
				    </c:when>
				    <c:otherwise>
				        <!-- classList가 비어있는 경우 -->
				        <p>검색된 클래스가 없습니다.</p>
				    </c:otherwise>
				</c:choose>
	
			</section>
            <div class="mb-4">
                <button class="action-button cancel-button" onclick="location.href='${contextPath}/member/memberSideMatchingScheduler'">취소하기</button>
            </div>
		</div>

</body>
</html>