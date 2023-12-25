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
	
        <header class="flex justify-between items-center py-4">
            <h1 class="text-2xl font-bold"><a href="${contextPath }/member/mainMember">buildHeyGo</a></h1>

			<c:choose>
				<c:when test="${sessionScope.memberId eq null }">
					<div>
						<button
							class="px-4 py-2 rounded bg-blue-500 text-white font-semibold hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-300 mr-2">
							<a href="${contextPath }/member/loginMember">login</a>
						</button>
						<button
							class="px-4 py-2 rounded border border-blue-500 text-blue-500 font-semibold hover:bg-blue-50 focus:outline-none focus:ring-2 focus:ring-blue-300">
							<a href="${contextPath }/member/registerMember">회원가입</a>
						</button>
					</div>
					
				</c:when>
				<c:otherwise>
					<div>
						<button
							class="px-4 py-2 rounded bg-blue-500 text-white font-semibold hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-300 mr-2">
							<a href="${contextPath }/myPage/myInfoMember">MyPage</a>
						</button>
						<button class="px-4 py-2 rounded border border-blue-500 text-blue-500 font-semibold hover:bg-blue-50 focus:outline-none focus:ring-2 focus:ring-blue-300">
							<a href="${contextPath }/member/logoutMember">logout</a>
						</button>
					</div>
				</c:otherwise>
			</c:choose>
		</header>
</body>
</html>