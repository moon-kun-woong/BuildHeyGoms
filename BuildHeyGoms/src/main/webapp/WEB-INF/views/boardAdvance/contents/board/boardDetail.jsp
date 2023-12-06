<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board detail</title>
</head>
</head>
<body>

	<div align="center" style="padding-top: 100px">
		<h2>게시글 상세</h2>
		<table style="width: 700px; text-align: center" border="1">
			<colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>
			<tr>
				<td>제목</td>
				<td>${mainBoardDTO.subject }</td>
			</tr>
			<tr>
				<td>조회수</td>
				<td>${mainBoardDTO.readCnt }</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${mainBoardDTO.writer }</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><fmt:formatDate value="${mainBoardDTO.enrollDt}" pattern="yyyy-MM-dd"/> </td>
			</tr>
			<tr>
				<td>글 내용</td>
				<td>${mainBoardDTO.content }</td>
			</tr>
			<tr align="right">
				<td colspan="2">
					<input type="button" value="수정"  onclick="location.href='${contextPath }/boardAdvance/boardAuthentication?boardId=${mainBoardDTO.boardId }&menu=update'">
					<input type="button" value="삭제"  onclick="location.href='${contextPath }/boardAdvance/boardAuthentication?boardId=${mainBoardDTO.boardId }&menu=delete'">
					<input type="button" value="목록보기"  onclick="location.href='${contextPath }/boardAdvance/boardList'">
				</td>
			</tr>
		</table>
		
		<br>
		<hr>
		<br>
		
		<h4>댓글 리스트 (${allReplyCnt })</h4>
		<table style="width: 700px;" border="1">
			<c:forEach var="replyDTO" items="${replyList }">
				<tr>
					<td>
						작성자 : ${replyDTO.writer } / 작성일 : <fmt:formatDate value="${replyDTO.enrollDt }" pattern="yyyy-MM-dd"/> <br>
						${replyDTO.content }
						<input type="button" value="수정" onclick="location.href='${contextPath }/boardAdvance/modifyReply?replyId=${replyDTO.replyId}'">
						<input type="button" value="삭제" onclick="location.href='${contextPath }/boardAdvance/removeReply?replyId=${replyDTO.replyId }'">
					</td>
				</tr>			
			</c:forEach>
			<tr>
				<td align="right">
					<input type="button" value="댓글작성" onclick="location.href='${contextPath }/boardAdvance/addReply?boardId=${mainBoardDTO.boardId }'">
				</td>
			</tr>
		</table>
		
	</div>
</body>
</html>