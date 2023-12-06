<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500</title>
</head>
<body>
	<div align="center">
		<h2>Server Problem</h2>
		<img src="${contextPath }/resources/img/500.PNG" alt="500에러 이미지"><br>
		<h4>관리자에게 연락주세요.</h4>
		<h4>관리자 이메일 : spring@gmail.com</h4>
	</div>
</body>
</html>