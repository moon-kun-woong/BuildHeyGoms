<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add reply</title>
</head>
<body>

	<div align="center" style="padding-top: 100px">
		<form action="${contextPath }/boardAdvance/addReply" method="post" >
			<h2>댓글 입력하기</h2>
			<br>
			<table style="width: 700px;" border="1">
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="writer" /></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password"  name="passwd" /></td>
				</tr>
				<tr>
					<td>글내용</td>
					<td>
						<textarea rows="10" cols="50" name="content" placeholder="200자 이내로 작성하세요."></textarea>
					</td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<input type="hidden" name="boardId" value="${boardId }">
						<input type="submit" value="댓글쓰기">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>