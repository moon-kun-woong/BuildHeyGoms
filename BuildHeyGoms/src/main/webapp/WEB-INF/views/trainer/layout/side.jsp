<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <link href="https://cdn.tailwindcss.com/2.2.16/tailwind.min.css" rel="stylesheet">
    <style>
        /* Custom Styles */
        .submenu {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            z-index: 10;
            background-color: #fff;
            border: 1px solid #e5e7eb;
            border-radius: 4px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .video-list-link:hover .submenu {
            display: block;
        }

        .submenu-item {
            padding: 8px 16px;
            color: #333;
            text-decoration: none;
            display: block;
            transition: background-color 0.2s;
        }

        .submenu-item:hover {
            background-color: #f5f7fa;
        }
    </style>

</head>
<body>

	<c:choose>
		<c:when test="${not empty sessionScope.memberId}">
            <aside class="w-full md:w-1/4 px-4 mb-4 md:mb-0">
                <nav class="bg-white shadow rounded-lg p-4">
                    <h2 class="font-semibold text-lg mb-4">Menu</h2>
                    <ul>
                        <li class="mb-2 cursor-pointer hover:bg-gray-100 p-2 rounded">나의 트레이너</li>
                        <li class="mb-2 cursor-pointer hover:bg-gray-100 p-2 rounded">트레이너와 매칭</li>
                        <li class="mb-2 cursor-pointer hover:bg-gray-100 p-2 rounded">개인 식단 플래너</li>
                        <li class="mb-2 cursor-pointer hover:bg-gray-100 p-2 rounded video-list-link"><a href="${contextPath}/member/videoList">운동 영상 목록</a></li>
				            <ul class="hidden video-list-submenu">
				                <!-- 작은 리스트 아이템들을 여기에 추가하세요 -->
				                <li class="mb-2 cursor-pointer hover:bg-gray-100 p-2 rounded"><a href="#">상체</a></li>
				                <li class="mb-2 cursor-pointer hover:bg-gray-100 p-2 rounded"><a href="#">등, 광배</a></li>
				                <li class="mb-2 cursor-pointer hover:bg-gray-100 p-2 rounded"><a href="#">하체</a></li>
				                <li class="mb-2 cursor-pointer hover:bg-gray-100 p-2 rounded"><a href="#">코어</a></li>
				                <!-- 필요한 만큼 작은 리스트 아이템을 추가하세요 -->
				            </ul>
                    </ul>
                </nav>
            </aside>
		</c:when>
		
		<c:when test="${not empty sessionScope.trainerId}">
            <aside class="w-full md:w-1/4 px-4 mb-4 md:mb-0">
                <nav class="bg-white shadow rounded-lg p-4">
                    <h2 class="font-semibold text-lg mb-4">Menu</h2>
                    <ul>
                        <li class="mb-2 cursor-pointer hover:bg-gray-100 p-2 rounded"><a href="${contextPath}/trainer/mainTrainer">회원 관리</a></li>
                        <li class="mb-2 cursor-pointer hover:bg-gray-100 p-2 rounded">P.T 모집하기</li>
                        <li class="mb-2 cursor-pointer hover:bg-gray-100 p-2 rounded">개인 식단 플래너</li>
                        <li class="mb-2 cursor-pointer hover:bg-gray-100 p-2 rounded video-list-link"><a href="${contextPath}/trainer/videoList">운동 영상 목록</a></li>
				            <ul class="hidden video-list-submenu">
				                <!-- 작은 리스트 아이템들을 여기에 추가하세요 -->
				                <li class="mb-2 cursor-pointer hover:bg-gray-100 p-2 rounded"><a href="#">상체</a></li>
				                <li class="mb-2 cursor-pointer hover:bg-gray-100 p-2 rounded"><a href="#">등, 광배</a></li>
				                <li class="mb-2 cursor-pointer hover:bg-gray-100 p-2 rounded"><a href="#">하체</a></li>
				                <li class="mb-2 cursor-pointer hover:bg-gray-100 p-2 rounded"><a href="#">코어</a></li>
				                <!-- 필요한 만큼 작은 리스트 아이템을 추가하세요 -->
				            </ul>
                    </ul>
                </nav>
            </aside>
		</c:when>
		
		<c:otherwise> 
            <aside class="w-full md:w-1/4 px-4 mb-4 md:mb-0">
                <nav class="bg-white shadow rounded-lg p-4">
                    <h2 class="font-semibold text-lg mb-4">Menu</h2>
                    <ul>
                        <li class="mb-2 cursor-pointer hover:bg-gray-100 p-2 rounded">트레이너 조회</li>
                        <li class="mb-2 cursor-pointer hover:bg-gray-100 p-2 rounded">회원님들의 평가</li>
                        <li class="mb-2 cursor-pointer hover:bg-gray-100 p-2 rounded video-list-link"><a href="${contextPath}/member/videoList">운동 영상 목록</a></li>
				            <ul class="hidden video-list-submenu">
				                <!-- 작은 리스트 아이템들을 여기에 추가하세요 -->
				                <li class="mb-2 cursor-pointer hover:bg-gray-100 p-2 rounded"><a href="#">상체</a></li>
				                <li class="mb-2 cursor-pointer hover:bg-gray-100 p-2 rounded"><a href="#">등, 광배</a></li>
				                <li class="mb-2 cursor-pointer hover:bg-gray-100 p-2 rounded"><a href="#">하체</a></li>
				                <li class="mb-2 cursor-pointer hover:bg-gray-100 p-2 rounded"><a href="#">코어</a></li>
				                <!-- 필요한 만큼 작은 리스트 아이템을 추가하세요 -->
				            </ul>
                    </ul>
                </nav>
            </aside>		               
		</c:otherwise>
	</c:choose>
	
	
            
	<script>
		document.addEventListener("DOMContentLoaded", function () {
		    const videoListLink = document.querySelector(".video-list-link");
		    const videoListSubMenu = document.querySelector(".video-list-submenu");
	
		    videoListLink.addEventListener("mouseenter", function () {
		        videoListSubMenu.classList.remove("hidden");
		    });
	
		    videoListSubMenu.addEventListener("mouseleave", function () {
		        videoListSubMenu.classList.add("hidden");
		    });
		});
	
	</script>  
</body>
</html>