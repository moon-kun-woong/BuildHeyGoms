<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board list</title>
<style>
	ul {
	    list-style:none;
	    margin:0;
	    padding:0;
	}
	
	li {
	    margin: 0 0 0 0;
	    padding: 0 0 0 0;
	    border : 0;
	    float: left;
	}
</style>
<script src="${contextPath }/resources/jquery/jquery-3.6.1.min.js"></script>
<script>

	$().ready(function(){
		
		$("#onePageViewCnt").val("${onePageViewCnt}");
		$("#searchKeyword").val("${searchKeyword}");
		
	});

	function getBoardList() {
		
		var url = "${contextPath }/boardAdvance/boardList"
		    url += "?searchKeyword=" +  $("#searchKeyword").val();
		    url += "&searchWord=" + $("#searchWord").val() 
		    url += "&onePageViewCnt=" + $("#onePageViewCnt").val();
		
		location.href = url;
	
	}
	
</script>
</head>
<body>

	<p align="right">
		<input type="button" value="테스트 데이터 생성" onclick="location.href='${contextPath }/boardAdvance/addBoardDummy'">
	</p>

	<div align="center" style="padding-top: 100px" >
		<h2> 커뮤니티 게시글 리스트 </h2>
		<table border="1">
			<colgroup>
				<col width="10%">
				<col width="40%">
				<col width="20%">
				<col width="20%">
				<col width="10%">
			</colgroup>
			<tr>
				<td> 
					조회 : <span style="color:red">${allBoardCnt}</span>개
				</td>
				<td colspan="4" align="right" >
					<select id="onePageViewCnt" onchange="getBoardList()" >
						<option>5</option>
						<option>7</option>
						<option>10</option>
					</select>
				</td>
			</tr>
			<tr align="center">
					<td>번호</td>
					<td>제목</td>
					<td>작성자</td>
					<td>작성일</td>
					<td>조회수</td>
			</tr>
			<tbody id="boardList">
				<c:forEach var="mainBoardDTO" items="${boardList }">
					<tr align="center">
						<c:set var="startBoardIdx" value="${startBoardIdx = startBoardIdx + 1}"/>
						<td>${startBoardIdx }</td>
						<td align="left">
							<a href="${contextPath }/boardAdvance/boardDetail?boardId=${mainBoardDTO.boardId }">${mainBoardDTO.subject }</a>
						</td>
						<td>${mainBoardDTO.writer }</td>
						<td><fmt:formatDate value="${mainBoardDTO.enrollDt }" pattern="yyyy-MM-dd"/></td>
						<td>${mainBoardDTO.readCnt }</td>
					</tr>
				</c:forEach>
			</tbody>
			<tr align="right">
				<td colspan="5">
					<input type="button" value="글쓰기" onclick="location.href='${contextPath }/boardAdvance/addBoard'">
				</td>
			</tr>
			<tr>
				<td colspan="5" align="center">			
					<select id="searchKeyword">
						<option value="total">전체검색</option>
						<option value="writer">작성자</option>
						<option value="subject">제목</option>
					</select>
					<input type="text" id="searchWord" name="searchWord" value="${searchWord }">
					<input type="button" value="검색" onclick="getBoardList()">
				</td>
			</tr>
		</table>
		<div style="display: table; margin-left: auto; margin-right: auto">
			<ul>
				<c:if test="${startPage > 10}">
					<li>
						<a href="${contextPath }/boardAdvance/boardList?currentPageNumber=${startPage - 10}&onePageViewCnt=${onePageViewCnt  }&searchKeyword=${searchKeyword }&searchWord=${searchWord}" >이전 </a>
					</li> 
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<li>
						<a href="${contextPath }/boardAdvance/boardList?currentPageNumber=${i }&onePageViewCnt=${onePageViewCnt  }&searchKeyword=${searchKeyword }&searchWord=${searchWord}">${i } &nbsp;</a>
					</li>
				</c:forEach>
				<c:if test="${endPage != allPageCnt && endPage >= 10}">
					<li>
						<a href="${contextPath }/boardAdvance/boardList?currentPageNumber=${startPage + 10}&onePageViewCnt=${onePageViewCnt  }&searchKeyword=${searchKeyword }&searchWord=${searchWord}"> 다음 </a>
					</li> 
				</c:if>
			</ul>
		</div>
	</div>
	
</body>
</html>