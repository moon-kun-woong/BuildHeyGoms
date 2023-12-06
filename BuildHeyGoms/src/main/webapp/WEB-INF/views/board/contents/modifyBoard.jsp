<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify board</title>
</head>
<body>

	<div align="center">
		<h3>게시글 수정하기</h3>
		<form action="modifyBoard" method="post">
			<table border="1">
				<tr>
					<td>작성자</td>
					<td>${boardDTO.writer }</td>
				</tr>
				<tr>
					<td>작성일</td>
					<td><fmt:formatDate value="${boardDTO.enrollDt }" pattern="yyyy-MM-dd"/></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="subject" value="${boardDTO.subject }"></td>
				</tr>
				<tr>
					<td>글내용</td>
					<td><textarea rows="10" cols="60" name="content">${boardDTO.content }</textarea></td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<input type="hidden" name="boardId" value="${boardDTO.boardId }"/>
						<input type="submit" value="수정하기" />
						<input type="button" value="목록보기" onclick="location.href='boardList'" />
					</td>
				</tr>
			</table>
		</form>
	</div>
	
</body>
</html>