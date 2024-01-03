<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"     uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Video List</title>
</head>
<body>

    <main class="w-full md:w-3/4 px-4">
        <section class="grid grid-cols-1 md:grid-cols-3 gap-4">
            <!-- 동영상 데이터 반복 -->
            <c:forEach items="${videoDTO}" var="videoDTO">
                <div class="video-card bg-white p-4 rounded-lg shadow transition duration-300 ease-in-out">
                    <img src="${videoDTO.thumbnailUrl}" alt="Thumbnail" class="rounded-lg mb-4">
                    <h3 class="font-semibold mb-2">${videoDTO.title}</h3>
                    <!-- YouTube 동영상 링크를 수정해야 합니다 -->
                    <a href="https://www.youtube.com/watch?v=${videoDTO.videoId}" target="_blank" class="mt-4 px-4 py-2 rounded bg-blue-500 text-white font-semibold hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-300">Watch Video</a>
                </div>
            </c:forEach>
        </section>
    </main>

</body>
</html>