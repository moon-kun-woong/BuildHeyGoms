<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board detail</title>
</head>
<body> 

	<div align="center">
		<h3>게시글 상세조회</h3>
		<table border="1">
			<tr>
				<td>조회수</td>
				<td>${boardDTO.readCnt }</td>
			</tr>
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
				<td>${boardDTO.subject }</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${boardDTO.content }</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="수정" onclick="location.href='authentication?boardId=${boardDTO.boardId}&menu=update'">
					<input type="button" value="삭제" onclick="location.href='authentication?boardId=${boardDTO.boardId}&menu=delete'">
					<input type="button" value="목록보기" onclick="location.href='boardList'">
				</td>
			</tr>
		</table>
	</div>
	
</body>
</html>