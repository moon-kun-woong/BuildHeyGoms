<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Trainer Profile Design</title>
	<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">
	<script src="https://cdn.tailwindcss.com"></script>

	<style>
		.profile-card {
		  max-width: 600px;
		  margin: 2rem auto;
		  padding: 2rem;
		  box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
		  border-radius: 8px;
		}
		.profile-header {
		  margin-bottom: 1.5rem;
		}
		.profile-header h1 {
		  font-size: 1.75rem;
		  margin-bottom: 0.5rem;
		}
		.profile-header p {
		  color: #6b7280;
		}
		.profile-section {
		  margin-bottom: 1rem;
		}
		.profile-section h2 {
		  font-size: 1.25rem;
		  margin-bottom: 0.5rem;
		}
		.profile-section p {
		  color: #4b5563;
		}
		.profile-image {
		  width: 100px;
		  height: 100px;
		  background-color: #e5e7eb;
		  margin-bottom: 1rem;
		}
	</style>


</head>
<body class="bg-gray-50">
	<div class="profile-card bg-white">
		<div class="profile-header">
			<h1 class="font-semibold">트레이너 정보</h1>
		</div>
		<div class="profile-image" src="https://source.unsplash.com/random/300x200?fitness"></div>
		<div class="profile-section">
			<h2 class="font-semibold">${trainerDTO.trainerNm }</h2>
			<p><strong>ID:</strong> ${trainerDTO.trainerId }</p>
			<p><strong>성별:</strong> ${trainerDTO.sex }</p>
			<p><strong>Birth Date:</strong> ${trainerDTO.birthDt }</p>
			<p><strong>Phone:</strong> ${trainerDTO.hp }</p>
			<p><strong>Email:</strong> ${trainerDTO.email }</p>
		</div>
		<div class="profile-section">
			<h2 class="font-semibold">트레이너 경력란</h2>
			<p><strong>Career Book:</strong>${trainerDTO.careerBook }</p>
		</div>
		<div class="profile-section">
			<h2 class="font-semibold">트레이너 소개</h2>
			<p>${trainerDTO.introduction }</p>
		</div>
	</div>
</body>
</html>
