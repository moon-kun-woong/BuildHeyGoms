<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - buildHeyGo</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .card-shadow:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .register-btn {
            margin-right: 0.5rem; /* Adjust the margin to move the button slightly to the left */
        }
    </style>
    
    <script src="${contextPath }/resources/jquery/jquery-3.6.1.min.js"></script>
    
    
    <script>

		$().ready(function(){
			$("#memberLoginBtn").click(function(){
				
				var param = { // 파라메타
						"memberId" : $("[name='memberId']").val(),
						"passwd" : $("[name='passwd']").val(),
				};
				$.ajax({
					url : "${contextPath}/member/loginMember",
					type : "post",
					data : param,
					success : function(data) {
						
						if (data == "fail") {
							$("#msg").html("<span style='color:red;'>아이디와 비밀번호를 확인하세요.</span>");
							$("[name='memberId']").prop("disabled" , false);
							$("[name='passwd']").prop("disabled" , false);
						}
						else {
							location.href="${contextPath}/member/mainMember"
							$("[name='memberId']").prop("disabled" , true);
							$("[name='passwd']").prop("disabled" , true);
						}
					}
					
				});
			});	
			
		});
	
	</script>
    
    
    
    <script>

		$().ready(function(){
			$("#trainerLoginBtn").click(function(){
				
				var param = { // 파라메타
						"trainerId" : $("[name='trainerId']").val(),
						"passwd" : $("[name='passwdTrainer']").val(),
				};
				$.ajax({
					url : "${contextPath}/trainer/loginTrainer",
					type : "post",
					data : param,
					success : function(data) {
						
						if (data == "fail") {
							$("#msg2").html("<span style='color:red;'>아이디와 비밀번호를 확인하세요.</span>");
							$("[name='trainerId']").prop("disabled" , false);
							$("[name='passwdTrainer']").prop("disabled" , false);
						}
						else {
							location.href="${contextPath}/trainer/mainTrainer"
							$("[name='trainerId']").prop("disabled" , true);
							$("[name='passwdTrainer']").prop("disabled" , true);
						}
					}
					
				});
			});	
			
		});
	
	</script>
    
    
    
    
</head>
<body class="bg-gray-50">
    <div class="container mx-auto p-4">
        <header class="flex justify-between items-center py-4">
            <h1 class="text-2xl font-bold"><a href="${contextPath }/member/mainMember">buildHeyGo</a></h1>
        </header>

		
        <div class="flex justify-center items-center min-h-screen">
            <div class="w-full max-w-xs">
            
            
       		<div class="form-container w-full max-w-2xl mx-auto mt-10">
		        <div class="flex justify-center space-x-4 mb-6">
		            <button id="memberBtn" class="px-4 py-2 rounded bg-blue-500 text-white font-semibold hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-300 active">Member</button>
		            <button id="trainerBtn" class="px-4 py-2 rounded bg-gray-300 text-gray-700 font-semibold hover:bg-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-300">Trainer</button>
		        </div>
		        
		        
	        <!-- memberLogin -->
                <form class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4" id="memberForm">
                    <div class="mb-8">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="username">
                            Username
                        </label>
                        <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" name="memberId" id="memberId" type="text" placeholder="아이디를 입력하세요.">
                    </div>
                    <div class="mb-6">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="password">
                            Password
                        </label>
                        <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline" name="passwd" id="password" type="password" placeholder="비밀번호를 입력하세요.">
                    </div>
                    
                    <p class="mb-2" id="msg"></p>
                    
                    <div class="flex items-center justify-between">
                        <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" type="button" id="memberLoginBtn" >
                            Sign In
                        </button>
                        <a class="inline-block align-baseline font-bold text-sm text-blue-500 hover:text-blue-800 register-btn" href="${contextPath }/member/registerMember">
                            Register
                        </a>
                    </div>
                </form>
            </div>
            
            
            
            <!-- trainerLogin -->
                <form class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4" id="trainerForm">
                    <div class="mb-8">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="username">
                            Username
                        </label>
                        <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" name="trainerId" id="trainerId" type="text" placeholder="아이디를 입력하세요.">
                    </div>
                    <div class="mb-6">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="password">
                            Password
                        </label>
                        <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline" name="passwdTrainer" id="passwordTrainer" type="password" placeholder="비밀번호를 입력하세요.">
                    </div>
                    
                    <p class="mb-2" id="msg2"></p>
                    
                    <div class="flex items-center justify-between">
                        <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" type="button" id="trainerLoginBtn" >
                            Sign In
                        </button>
                        <a class="inline-block align-baseline font-bold text-sm text-blue-500 hover:text-blue-800 register-btn" href="${contextPath }/member/registerMember">
                            Register
                        </a>
                    </div>
                </form>
            
           <p class="text-center text-gray-500 text-xs">
               &copy;2023 buildHeyGo. All rights reserved.
           </p>
        </div>
    </div>

    <script>
        // Any additional JavaScript can be included here
    </script>
    
   	<script>
	    const memberBtn = document.getElementById('memberBtn');
	    const trainerBtn = document.getElementById('trainerBtn');
	    const memberForm = document.getElementById('memberForm');
	    const trainerForm = document.getElementById('trainerForm');
		
	    // 페이지 로드 시, Member 버튼을 선택한 상태로 설정
	    memberForm.classList.remove('hidden');
	    trainerForm.classList.add('hidden');
	    memberBtn.classList.replace('bg-gray-300', 'bg-blue-500');
	    memberBtn.classList.replace('text-gray-700', 'text-white');
	    trainerBtn.classList.replace('bg-blue-500', 'bg-gray-300');
	    trainerBtn.classList.replace('text-white', 'text-gray-700');
	
	    memberBtn.addEventListener('click', function() {
	        memberForm.classList.remove('hidden');
	        trainerForm.classList.add('hidden');
	        memberBtn.classList.replace('bg-gray-300', 'bg-blue-500');
	        memberBtn.classList.replace('text-gray-700', 'text-white');
	        trainerBtn.classList.replace('bg-blue-500', 'bg-gray-300');
	        trainerBtn.classList.replace('text-white', 'text-gray-700');
	    });
	
	    trainerBtn.addEventListener('click', function() {
	        trainerForm.classList.remove('hidden');
	        memberForm.classList.add('hidden');
	        trainerBtn.classList.replace('bg-gray-300', 'bg-blue-500');
	        trainerBtn.classList.replace('text-gray-700', 'text-white');
	        memberBtn.classList.replace('bg-blue-500', 'bg-gray-300');
	        memberBtn.classList.replace('text-white', 'text-gray-700');
	    });
	</script>
    
</body>
</html>