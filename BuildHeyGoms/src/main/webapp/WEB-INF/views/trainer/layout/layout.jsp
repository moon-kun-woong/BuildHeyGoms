<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c"     uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>buildHeyGo Fitness Platform</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .trainer-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .active-link {
            background-color: #e2e8f0; /* Light blue background for active link */
        }
        @media (max-width: 768px) {
            .grid-cols-1 {
                grid-template-columns: repeat(1, minmax(0, 1fr));
            }
        }
    </style>
    
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
        }
        .border-b {
            border-bottom: 1px solid #e2e8f0;
        }
        .grid-cols-7 > div {
            border-right: 1px solid #e2e8f0;
        }
        .date-cell:hover {
            background-color: #f0f4f8;
            cursor: pointer;
        }
        .profile-upload {
            background-color: #f9fafb;
            border: 2px dashed #d1d5db;
            border-radius: 0.375rem; /* 6px */
            padding: 1rem;
            text-align: center;
            cursor: pointer;
        }
        .profile-upload:hover {
            background-color: #f3f4f6;
        }
    </style>
       
	<script src="${contextPath }/resources/bootstrap/js/jquery-3.3.1.min.js"></script>
</head>

<body class="bg-gray-50">

    <div class="container mx-auto p-4">
    
    <!-- Header Section Begin -->
    <tiles:insertAttribute name="header"/>
    <!-- Header Section End -->
		<div class="flex flex-wrap -mx-4">
	<!-- Side Section Begin -->
	<tiles:insertAttribute name="side"/>
	<!-- Side Section End --> 
	
	<!-- Body Section Begin -->
	<tiles:insertAttribute name="body"/>
	<!-- Body Section End --> 
	 
	<!-- Footer Section Begin -->
	<tiles:insertAttribute name="footer"/>
	<!-- Footer Section End -->
	
        </div>
    </div>
<!-- Js Plugins -->

<script src="${contextPath }/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="${contextPath }/resources/bootstrap/js/jquery.magnific-popup.min.js"></script>
<script src="${contextPath }/resources/bootstrap/js/jquery-ui.min.js"></script>
<script src="${contextPath }/resources/bootstrap/js/mixitup.min.js"></script>
<script src="${contextPath }/resources/bootstrap/js/jquery.countdown.min.js"></script>
<script src="${contextPath }/resources/bootstrap/js/jquery.slicknav.js"></script>
<script src="${contextPath }/resources/bootstrap/js/owl.carousel.min.js"></script>
<script src="${contextPath }/resources/bootstrap/js/jquery.nicescroll.min.js"></script>
<script src="${contextPath }/resources/bootstrap/js/main.js"></script>
</body>

</html>    
