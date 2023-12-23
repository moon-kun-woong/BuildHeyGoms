<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"     uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수업 수정하기</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
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
    	function submitForm() {
            var selectedDate = "${classDTO.selectedDate }";
            var userConfirmed = confirm(selectedDate + "로 수업을 수정하시겠습니까?");
            
            if (userConfirmed) {
                return true;
            } else {
    			return false;
            }
        }
    </script>

	<script>
	    function removeClass(classId) {
            window.location.href = "${contextPath}/trainer/deleteClass?classId=" + classId;
	    }
	</script>

</head>



<body>

	<c:if test="${sessionScope.trainerId eq null}">
		<script>
			alert("로그인을 먼저 진행해주세요.");
			location.href = "${contextPath}/member/loginMember";
		</script>
	</c:if>
	
        <div class="bg-white p-4 rounded-lg shadow-md w-full md:w-3/5">
	        <div class="mb-4">
	            <h2 class="text-xl font-semibold">${classDTO.selectedDate }</h2>
	        </div>
	        
            <form id="classForm" action="${contextPath}/trainer/mainTrainerMakeScheduleModify" method="post" enctype="multipart/form-data" onsubmit="return submitForm();">
	            <div class="mb-4">
	                <label for="profile-upload" class="profile-upload">
	                    <input id="profile-upload" type="file" style="display: none;" />
	                    <p>📷</p>
	                </label>
	            </div>
            	<div class="mb-4">
            		<label class="py-2">강의 이름</label>
	                <input type="text" class="w-full p-2 border rounded" id="classNm" name="classNm" value="${classDTO.classNm }" placeholder="class name" />
	            </div>
	            <div class="mb-4">
	            	<label class="py-2">강의 내용</label>
	                <textarea class="w-full p-2 border rounded" id="classContent" name="classContent" placeholder="Brief description of the exercises">${classDTO.classContent }</textarea>
	            </div>
	            <div class="mb-4">
	            	<label class="py-2">트레이닝 장소</label>
	                <input type="text" class="w-full p-2 border rounded" id="classLocation" name="classLocation" value="${classDTO.classLocation }" placeholder="Location" />
	            </div>
					<input type="hidden" name="classId" id="classId" value="${classDTO.classId }" />
					<input type="hidden" name="trainerId" id="trainerId" value="${classDTO.trainerId }" />
					<input type="hidden" name="selectedDate" id="selectedDate" value="${classDTO.selectedDate }" />
					<p hidden="createClassDt" id="createClassDt"></p>
					<input type="hidden" name="activeAccountYN" id="activeAccountYN" value="${classDTO.activeAccountYN }" />
	            <div class="mb-4">
	                <button class="submit-button">submit</button>
	            </div>
            </form>
	        <div class="mb-4">
                <button class="delete-button" onclick="removeClass('${classDTO.classId }')">삭제하기</button>
                <button class="action-button cancel-button" onclick="location.href='${contextPath}/trainer/mainTrainer'">취소하기</button>
            </div>
		</div>
</body>
</html>