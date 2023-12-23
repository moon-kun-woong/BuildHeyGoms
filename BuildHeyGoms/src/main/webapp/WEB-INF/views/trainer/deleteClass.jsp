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
		// 탈퇴 함수
		function removeClass(){
			if (confirm("수업 내용을 삭제하시겠습니까?")) {
				return true;
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
					<form id="" action="${contextPath}/trainer/deleteClass" method="get" enctype="multipart/form-data">
						<input type="hidden" name="classId" value="${classId }"/>
							<div class="flex justify-between">
								<button class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" type="submit" onsubmit="removeClass();">
						        	삭제하기
								</button>
								<button onclick="window.history.go(-1);" class="bg-gray-300 hover:bg-gray-400 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" type="button">
									취소하기
								</button>
							</div>
		</div>
	</div>
</body>
</html>