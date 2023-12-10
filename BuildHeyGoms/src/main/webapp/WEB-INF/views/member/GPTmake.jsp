<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>buildHeyGo Fitness Platform</title>
    <script src="https://cdn.tailwindcss.com"></script>
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
</head>
<body class="bg-gray-50">
    <div class="container mx-auto p-4">
        <header class="flex justify-between items-center py-4">
            <h1 class="text-2xl font-bold"><a href="GPTmake.jsp">buildHeyGo</a></h1>

			<c:choose>
				<c:when test="${sessionScope.memberId eq null }">
					<div>
						<button
							class="px-4 py-2 rounded bg-blue-500 text-white font-semibold hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-300 mr-2">
							<a href="${contextPath }/member/loginMember">login</a>
						</button>
						<button
							class="px-4 py-2 rounded border border-blue-500 text-blue-500 font-semibold hover:bg-blue-50 focus:outline-none focus:ring-2 focus:ring-blue-300">
							<a href="${contextPath }/member/register">회원가입</a>
						</button>
					</div>
				</c:when>
				<c:otherwise>
					<div class="header__right__auth">
						<a href="${contextPath }/member/logoutMember">logout</a>
					</div>
				</c:otherwise>
			</c:choose>
		</header>

        <div class="flex flex-wrap -mx-4">
            <aside class="w-full md:w-1/4 px-4 mb-4 md:mb-0">
                <nav class="bg-white shadow rounded-lg p-4">
                    <h2 class="font-semibold text-lg mb-4">Menu</h2>
                    <ul>
                        <li class="mb-2 cursor-pointer active-link p-2 rounded">My trainer</li>
                        <li class="mb-2 cursor-pointer hover:bg-gray-100 p-2 rounded">matching trainer</li>
                        <li class="mb-2 cursor-pointer hover:bg-gray-100 p-2 rounded">private diet planner</li>
                        <li class="cursor-pointer hover:bg-gray-100 p-2 rounded">부위별 운동</li>
                    </ul>
                </nav>
            </aside>

            <main class="w-full md:w-3/4 px-4">
                <section class="grid grid-cols-1 md:grid-cols-3 gap-4">
                
                    <!-- Trainer Card 1 -->
                    <div class="trainer-card bg-white p-4 rounded-lg shadow transition duration-300 ease-in-out">
                        <img src="https://source.unsplash.com/random/300x200?fitness" alt="트레이너 사진" class="rounded-lg mb-4">
                        <h3 class="font-semibold mb-2">트레이너 이름, 회원수</h3>
                        <p class="text-gray-600 mb-2">소개</p>
                        <p class="text-gray-600 mb-2">가능날짜</p>
                        <p class="text-gray-600 mb-2">가격</p>
                        <button class="mt-4 px-4 py-2 rounded bg-blue-500 text-white font-semibold hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-300">영상</button>
                    </div>

                    <!-- Trainer Card 2 -->
                    <div class="trainer-card bg-white p-4 rounded-lg shadow transition duration-300 ease-in-out">
                        <img src="https://source.unsplash.com/random/300x200?fitness" alt="트레이너 사진" class="rounded-lg mb-4">
                        <h3 class="font-semibold mb-2">트레이너 이름, 회원수</h3>
                        <p class="text-gray-600 mb-2">소개</p>
                        <p class="text-gray-600 mb-2">가능날짜</p>
                        <p class="text-gray-600 mb-2">가격</p>
                        <button class="mt-4 px-4 py-2 rounded bg-blue-500 text-white font-semibold hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-300">영상</button>
                    </div>

                    <!-- Trainer Card 3 -->
                    <div class="trainer-card bg-white p-4 rounded-lg shadow transition duration-300 ease-in-out">
                        <img src="https://source.unsplash.com/random/300x200?fitness" alt="트레이너 사진" class="rounded-lg mb-4">
                        <h3 class="font-semibold mb-2">트레이너 이름, 회원수</h3>
                        <p class="text-gray-600 mb-2">소개</p>
                        <p class="text-gray-600 mb-2">가능날짜</p>
                        <p class="text-gray-600 mb-2">가격</p>
                        <button class="mt-4 px-4 py-2 rounded bg-blue-500 text-white font-semibold hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-300">영상</button>
                    </div>
                    
                    <!-- Trainer Card 4 -->
                    <div class="trainer-card bg-white p-4 rounded-lg shadow transition duration-300 ease-in-out">
                        <img src="https://source.unsplash.com/random/300x200?fitness" alt="트레이너 사진" class="rounded-lg mb-4">
                        <h3 class="font-semibold mb-2">트레이너 이름, 회원수</h3>
                        <p class="text-gray-600 mb-2">소개</p>
                        <p class="text-gray-600 mb-2">가능날짜</p>
                        <p class="text-gray-600 mb-2">가격</p>
                        <button class="mt-4 px-4 py-2 rounded bg-blue-500 text-white font-semibold hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-300">영상</button>
                    </div>
                    
                    <!-- Trainer Card 5 -->
                    <div class="trainer-card bg-white p-4 rounded-lg shadow transition duration-300 ease-in-out">
                        <img src="https://source.unsplash.com/random/300x200?fitness" alt="트레이너 사진" class="rounded-lg mb-4">
                        <h3 class="font-semibold mb-2">트레이너 이름, 회원수</h3>
                        <p class="text-gray-600 mb-2">소개</p>
                        <p class="text-gray-600 mb-2">가능날짜</p>
                        <p class="text-gray-600 mb-2">가격</p>
                        <button class="mt-4 px-4 py-2 rounded bg-blue-500 text-white font-semibold hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-300">영상</button>
                    </div>
                    
                    <!-- Trainer Card 6 -->
                    <div class="trainer-card bg-white p-4 rounded-lg shadow transition duration-300 ease-in-out">
                        <img src="https://source.unsplash.com/random/300x200?fitness" alt="트레이너 사진" class="rounded-lg mb-4">
                        <h3 class="font-semibold mb-2">트레이너 이름, 회원수</h3>
                        <p class="text-gray-600 mb-2">소개</p>
                        <p class="text-gray-600 mb-2">가능날짜</p>
                        <p class="text-gray-600 mb-2">가격</p>
                        <button class="mt-4 px-4 py-2 rounded bg-blue-500 text-white font-semibold hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-300">영상</button>
                    </div>
                    
                </section>
            </main>
        </div>
    </div>

    <script>
        // Any additional JavaScript can be included here
    </script>
</body>
</html>