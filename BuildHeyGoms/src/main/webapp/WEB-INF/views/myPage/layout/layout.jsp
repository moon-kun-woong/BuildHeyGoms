<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c"     uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>buildHeyGo Fitness Platform</title>
    <script src="https://cdn.tailwindcss.com"></script>
  	<script src="${contextPath }/resources/jquery/jquery-3.6.1.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
    <script>
	function execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	
	            var fullRoadAddr = data.roadAddress; 
	            var extraRoadAddr = ''; 
	
	            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            if (data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            if (extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	            if (fullRoadAddr !== ''){
	                fullRoadAddr += extraRoadAddr;
	            }
	
	            document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
	            document.getElementById('roadAddress').value = fullRoadAddr;
	            document.getElementById('jibunAddress').value = data.jibunAddress;
	          
	        }
	    }).open();
	}
    </script>
    
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
        .tab-content {
            display: none;
            padding: 16px;
            border: 1px solid #e5e7eb;
            margin-top: 8px;
        }
        .tab-content.active {
            display: block;
        }
        .icon {
            width: 24px;
            height: 24px;
        }
        .tab-button {
            cursor: pointer;
            padding: 8px 16px;
            border-radius: 9999px;
            border: 1px solid transparent;
        }
        .tab-button.active {
            color: #3b82f6;
            border-color: #3b82f6;
        }
        .tab-button:hover {
            border-color: #e5e7eb;
        }
        
        /* 스크롤 가능한 DIV의 스타일 설정 */
   		.scrollable-div {
        max-height: 600px; /* 원하는 높이 설정 */
        overflow-y: auto; /* 세로 스크롤을 표시할지 여부 */
        border: 1px solid #ccc; /* 테두리 스타일 설정 */
        padding: 10px; /* 내부 여백 설정 */
        word-wrap: break-word;
    	}
    </style>
    
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
        }
        .tab-content {
            display: none;
            padding: 16px;
            border: 1px solid #e5e7eb;
            margin-top: 8px;
        }
        .tab-content.active {
            display: block;
        }
        .tab-button {
            cursor: pointer;
            padding: 8px 16px;
            border-radius: 9999px;
            border: 1px solid transparent;
        }
        .tab-button.active {
            color: #3b82f6;
            border-color: #3b82f6;
        }
        .tab-button:hover {
            border-color: #e5e7eb;
        }
        .trainer-card {
            border: 1px solid #e5e7eb;
            padding: 16px;
            border-radius: 8px;
            margin-bottom: 16px;
            display: flex;
            align-items: center;
        }
        .trainer-card img {
            border-radius: 9999px;
            width: 80px;
            height: 80px;
            object-fit: cover;
            margin-right: 16px;
        }
        .trainer-info {
            flex-grow: 1;
        }
        .trainer-section {
            margin-top: 32px;
        }
        .trainer-section h3 {
            font-size: 1.25rem;
            color: #374151;
            margin-bottom: 16px;
        }
        .trainer-section-border {
            height: 2px;
            background-color: #e5e7eb;
            margin: 32px 0;
        }
        
        
    </style>
    
    
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
        }
        .tab-content {
            display: none;
            padding: 16px;
            border: 1px solid #e5e7eb;
            margin-top: 8px;
            background-color: #ffffff;
        }
        .tab-content.active {
            display: block;
        }
        .tab-button {
            cursor: pointer;
            padding: 8px 16px;
            border-radius: 9999px;
            border: 1px solid transparent;
            background-color: #f3f4f6;
        }
        .tab-button.active {
            color: #3b82f6;
            border-color: #3b82f6;
        }
        .tab-button:hover {
            border-color: #e5e7eb;
        }
        .trainer-card {
            border: 1px solid #e5e7eb;
            padding: 16px;
            border-radius: 8px;
            margin-bottom: 16px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: #ffffff;
        }
        .trainer-card img {
            border-radius: 9999px;
            width: 80px;
            height: 80px;
            object-fit: cover;
            margin-right: 16px;
        }
        .trainer-info {
            flex-grow: 1;
        }
        .trainer-section {
            margin-top: 32px;
        }
        .trainer-section h3 {
            font-size: 1.25rem;
            color: #374151;
            margin-bottom: 16px;
        }
        .trainer-section-border {
            height: 2px;
            background-color: #e5e7eb;
            margin: 32px 0;
        }
        .button-secondary {
            padding: 6px 12px;
            border: 1px solid #e5e7eb;
            border-radius: 9999px;
            cursor: pointer;
            margin-left: 8px;
            background-color: #f3f4f6;
        }
        .button-logout {
            background-color: #fdba74; /* Light orange */
        }
        .button-info {
            background-color: #bfdbfe; /* Light blue */
        }
    
    </style>
    
    
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
        }
        .tab-content {
            display: none;
            padding: 16px;
            border: 1px solid #e5e7eb;
            margin-top: 8px;
            background-color: #ffffff;
        }
        .tab-content.active {
            display: block;
        }
        .tab-button {
            cursor: pointer;
            padding: 8px 16px;
            border-radius: 9999px;
            border: 1px solid transparent;
            background-color: #f3f4f6;
        }
        .tab-button.active {
            color: #3b82f6;
            border-color: #3b82f6;
        }
        .tab-button:hover {
            border-color: #e5e7eb;
        }
        .chat-container {
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            padding: 16px;
            background-color: #ffffff;
            max-height: 300px;
            overflow-y: auto;
            display: flex;
            flex-direction: column;
        }
        .chat-message {
            max-width: 70%;
            padding: 8px;
            margin: 8px 0;
            border-radius: 16px;
            background-color: #f3f4f6;
        }
        .chat-message.user {
            background-color: #bfdbfe;
            align-self: flex-end;
        }
        .chat-message.other {
            background-color: #e5e7eb;
            align-self: flex-start;
        }
        .chat-input-container {
            margin-top: 16px;
        }
        .chat-input {
            width: calc(100% - 16px);
            padding: 8px;
            border-radius: 9999px;
            border: 1px solid #e5e7eb;
            margin-bottom: 8px;
            display: inline-block;
        }
        .chat-send-button {
            padding: 8px 16px;
            border-radius: 9999px;
            background-color: #3b82f6;
            color: white;
            cursor: pointer;
            border: none;
            display: inline-block;
        }
         .feedback-card {
            background-color: #f9fafb;
            border-radius: 8px;
            padding: 16px;
            margin-bottom: 16px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            /* 긴 텍스트를 숨기고 스크롤 가능하게 만듭니다. */
		    overflow: hidden;
		    text-overflow: ellipsis;
		    white-space: nowrap;
		    max-height: 1000px; /* 원하는 높이로 설정하세요. */
		    
        	overflow-x: auto;
   			max-width: 590px; /* 원하는 가로 폭으로 설정하세요. */
   			
	    	/* 텍스트 오버플로우를 처리하여 다음 줄로 줄 바꿈 */
   		 	white-space: pre-line;
   		 	overflow: visible; /* 텍스트를 자르지 않음 */
        }
        .feedback-date {
            font-weight: 700;
            margin-bottom: 8px;
        }
        
        /* 스크롤 가능한 DIV의 스타일 설정 */
   		.scrollable-div {
	        max-height: 600px; /* 원하는 높이 설정 */
	        overflow-y: auto; /* 세로 스크롤을 표시할지 여부 */
	        border: 1px solid #ccc; /* 테두리 스타일 설정 */
	        padding: 10px; /* 내부 여백 설정 */
	        word-wrap: break-word;
    	}
    </style>
       
	
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
