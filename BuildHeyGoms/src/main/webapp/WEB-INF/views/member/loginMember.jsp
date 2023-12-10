<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - buildHeyGo</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .card-shadow:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .register-btn {
            margin-right: 0.5rem; /* Adjust the margin to move the button slightly to the left */
        }
    </style>
</head>
<body class="bg-gray-50">
    <div class="container mx-auto p-4">
        <header class="flex justify-between items-center py-4">
            <h1 class="text-2xl font-bold"><a href="${contextPath }/member/mainMember">buildHeyGo</a></h1>
        </header>

        <div class="flex justify-center items-center min-h-screen">
            <div class="w-full max-w-xs">
                <form class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4" action="${contextPath}/member/loginMember" method="post">
                    <div class="mb-8">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="username">
                            Username
                        </label>
                        <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" name="memberId" id="memberId" type="text" placeholder="아이디를 입력하세요.">
                    </div>
                    <div class="mb-6">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="password">
                            Password
                        </label>
                        <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline" name="passwd" id="password" type="password" placeholder="비밀번호를 입력하세요.">
                    </div>
                    <div class="flex items-center justify-between">
                        <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" type="submit">
                            Sign In
                        </button>
                        <a class="inline-block align-baseline font-bold text-sm text-blue-500 hover:text-blue-800 register-btn" href="${contextPath }/member/registerMember">
                            Register
                        </a>
                    </div>
                </form>
                <p class="text-center text-gray-500 text-xs">
                    &copy;2023 buildHeyGo. All rights reserved.
                </p>
            </div>
        </div>
    </div>

    <script>
        // Any additional JavaScript can be included here
    </script>
</body>
</html>