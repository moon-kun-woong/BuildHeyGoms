<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify reply</title>
<script src="${contextPath }/resources/ckeditor/ckeditor.js"></script>
</head>
<body>

	<div align="center" style="padding-top: 100px">
		<h1>댓글 수정</h1>
		<br>
		<form action="${contextPath }/boardAdvance/modifyReply" method="post">
			<table style="width: 700px;" border="1">
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tr>
					<td>작성일</td>
					<td><fmt:formatDate value="${replyDTO.enrollDt}" pattern="yyyy-MM-dd"/></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="writer" value="${replyDTO.writer }"/></td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td><input type="password" name="passwd" size="70"/></td>
				</tr>
				<tr>
					<td>댓글</td>
					<td>
						<textarea rows="10" cols="60" name="content">${replyDTO.content }</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="hidden" name="boardId" value="${replyDTO.boardId }" /> 
						<input type="hidden" name="replyId" value="${replyDTO.replyId }" /> 
						<input type="submit" value="댓글수정" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>