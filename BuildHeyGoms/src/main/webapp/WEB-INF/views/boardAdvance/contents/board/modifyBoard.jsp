<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify board</title>
<script src="${contextPath }/resousrces/ckeditor/ckeditor.js"></script>
</head>
<body>

	<div align="center" style="padding-top: 100px">
		<h1>게시글 수정하기</h1>
		<br>
		<form action="${contextPath }/boardAdvance/modifyBoard" method="post">
			<table style="width: 700px;" border="1">
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tr>
					<td>작성일</td>
					<td><fmt:formatDate value="${mainBoardDTO.enrollDt}" pattern="yyyy-MM-dd"/></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="writer" value="${mainBoardDTO.writer }" size="70"/></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="subject" value="${mainBoardDTO.subject }" size="70"/></td>
				</tr>
				<tr>
					<td>글내용</td>
					<td>
						<textarea rows="10" cols="60" name="content">${mainBoardDTO.content }</textarea>
						<script>CKEDITOR.replace("content")</script>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="hidden" name="boardId" value="${mainBoardDTO.boardId }" /> 
						<input type="submit" value="수정하기" />
						<input type="button" onclick="location.href='${contextPath }/boardAdvance/boardList'" value="전체글보기" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>