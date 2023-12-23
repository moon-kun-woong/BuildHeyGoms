<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"     uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">
<script src="https://cdn.tailwindcss.com"></script>
<title>수업 삭제</title>
</head>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        var classId = getQueryParameter('classId');
        document.getElementById('classId').textContent = classId;
    });
</script>



<script>
		// 탈퇴 함수
		function removeClass(){
			if (confirm("수업 내용을 삭제하시겠습니까?")) {
				return true;		
				alert('수업을 삭제하였습니다.');
				location.href="${contextPath}/trainer/mainTrainer";
			}
			else {
				return false;
			}
		}
</script>

<body class="bg-gray-50">
	<div class="flex justify-center items-center h-screen">
		<div class="bg-white shadow-lg rounded-lg p-8">
			<h1 class="text-xl font-semibold mb-4">삭제 페이지</h1>
				<p class="mb-6">삭제하시겠습니까?</p>
					<form id="deleteClass" action="${contextPath}/trainer/deleteClass" method="get" enctype="multipart/form-data">
						<input type="hidden" name="classId" value="${classDTO.classId }"/>
							<div class="flex justify-between">
								<button class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" type="submit" onsubmit="removeClass();">
						        	삭제하기
								</button>
								<button onclick="window.history.go(-1);" class="bg-gray-300 hover:bg-gray-400 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" type="button">
									취소하기
								</button>
							</div>
					</form>
		</div>
	</div>
</body>
</html>