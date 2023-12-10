<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

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
</body>
</html>