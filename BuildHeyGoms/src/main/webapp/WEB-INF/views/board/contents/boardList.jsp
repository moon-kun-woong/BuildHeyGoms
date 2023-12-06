<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>boardList</title>
</head>
<body>

	<div align="center">
		<h3>커뮤니티 게시글 리스트</h3>
		<table border="1">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:set var="idx" value="1"/>
			<c:forEach var="boardDTO" items="${boardList }">
				<tr>
					<td>${idx }</td>
					<td><a href="boardDetail?boardId=${boardDTO.boardId }">${boardDTO.subject }<a></a></td>
					<td>${boardDTO.writer }</td>
					<td><fmt:formatDate value="${boardDTO.enrollDt }" pattern="yyyy-MM-dd"/></td>
					<td>${boardDTO.readCnt }</td>
				</tr>
				<c:set var="idx" value="${idx = idx + 1 }"/>
			</c:forEach>
			<tr>
				<td colspan="5" align="right">
					<input type="button" onclick="location.href='addBoard'" value="글쓰기">
				</td>
			</tr>
		</table>
	</div>
	
</body>
</html>


