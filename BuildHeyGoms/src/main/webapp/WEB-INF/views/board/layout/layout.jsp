<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<title><tiles:insertAttribute name="title"/></title>
<script src="${contextPath }/resources/jquery/jquery-3.6.1.min.js"></script>
<script src="${contextPath }/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
	<div style="height: 50px; background-color: skyblue;" align="center">
		<tiles:insertAttribute name="header"/>
	</div>
	<div style="height: 800px" align="center">
		<tiles:insertAttribute name="body"/>
	</div>
	<div style="height: 50px; background-color: yellow;" align="center">
		<tiles:insertAttribute name="footer"/>
	</div>
</body>
</html>