<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"     uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Video List</title>
</head>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const urlParams = new URLSearchParams(window.location.search);
        const selectedDate = urlParams.get('selectedDate');

        if (selectedDate) {
            // 선택한 날짜가 있는 경우, 제목 엘리먼트에 표시
            document.querySelector("#selectDate").textContent = selectedDate;
        }
    });
</script>

<body>

	<c:if test="${sessionScope.trainerId eq null}">
		<script>
			alert("로그인을 먼저 진행해주세요.");
			location.href = "${contextPath}/member/loginMember";
		</script>
	</c:if>
	
        <div class="bg-white p-4 rounded-lg shadow-md w-full md:w-3/4">
            <div class="mb-4">
                <h2 class="text-xl font-semibold" id="selectDate"></h2>
            </div>
            <div class="mb-4">
                <div class="profile-upload">
                    <p>Click to upload profile picture</p>
                </div>
            </div>
            <div class="mb-4">
                <textarea class="w-full p-2 border rounded" placeholder="Brief description of the exercises"></textarea>
            </div>
            <div class="mb-4">
                <input type="text" class="w-full p-2 border rounded" placeholder="Location" />
            </div>
            <div class="mb-4">
                <input type="text" class="w-full p-2 border rounded" placeholder="Items to bring" />
            </div>
        </div>

</body>
</html>