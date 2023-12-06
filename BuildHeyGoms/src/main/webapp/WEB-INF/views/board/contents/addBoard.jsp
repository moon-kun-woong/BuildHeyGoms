<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add board</title>
</head>
<body>

	<div align="center">
		<h3>게시글 작성하기</h3>
		<form action="addBoard" method="post" >
			<table border="1" >
				<tr>
					<td>작성자</td>
					<td><input type="text" name="writer" /></td>
				</tr>
				<tr >
					<td>제목</td>
					<td><input type="text" name="subject" /></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="passwd" /></td>
				</tr>
				<tr>
					<td>글내용</td>
					<td>
						<textarea rows="10" cols="50" name="content" ></textarea>
					</td>
				</tr>
				<tr >
					<td colspan="2" align="center">
						<input type="submit" value="작성하기" />
						<input type="button" onclick="location.href='boardList'" value="목록보기">
					</td>
				</tr>
			</table>
		</form>
	</div>
	
</body>
</html>