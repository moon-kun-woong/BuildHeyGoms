<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - buildHeyGo Fitness Platform</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Open Sans', sans-serif;
        }
        .form-input:focus {
            outline: none;
            border-color: #93c5fd;
            box-shadow: 0 0 0 1px #93c5fd;
        }
        .form-textarea:focus {
            outline: none;
            border-color: #93c5fd;
            box-shadow: 0 0 0 1px #93c5fd;
        }
    </style>
    
    <!-- loginCheck Script -->
    <script>

	var validateMemberId = false;

	$().ready(function() {
		
		$("#btnOverlapped").click(function(){
			
		    var memberId = $("#memberId").val();
		    if (memberId == '') {
		   		alert("ID를 입력하세요.");
		   		return;
		    }
		   
		    $.ajax({
		       type : "post",
		       url : "${contextPath}/member/overlappedId",
		       data : {"memberId" : memberId},
		       success : function(isOverLapped){
		          if (isOverLapped == "N"){
		          	alert("사용할 수 있는 ID입니다.");
		          	validateMemberId = true;
		          }
		          else {
		          	alert("사용할 수 없는 ID입니다.");
		          	validateMemberId = false;
		          }
		       }
		    });
		});	
		
		$("form").submit(function(){
			
			if (!validateMemberId) {
				alert("아이디를 확인해주세요.");
				return false;
			}
			
			$("[name='hp']").val($("#hp1").val() +"-" + $("#hp2").val() +"-" + $("#hp3").val());
			$("[name='birthDt']").val($("#birthY").val() + "-" + $("#birthM").val() + "-" + $("#birthD").val());
			
		});
		
	});
	
	
	
</script>
</head>
<body class="bg-gray-50">

        <div class="w-full max-w-2xl mx-20 mt-10">
            <form class="bg-white shadow rounded-lg p-6" action="${contextPath}/member/registerMember" method="post" enctype="multipart/form-data">
                <h2 class="text-xl font-semibold mb-6">Sign Up</h2>
                <div class="mb-4">
                    <label for="id" class="block text-sm font-medium text-gray-700 mb-1">ID</label>
                     <input type="button" id="btnOverlapped" class="block text-sm font-medium text-gray-700 mb-1" value="중복확인" />
                    <input type="text" id="memberId" name="memberId" class="form-input w-full px-3 py-2 border rounded-md" required>
                </div>
                <div class="mb-4">
                    <label for="password" class="block text-sm font-medium text-gray-700 mb-1">Password</label>
                    <input type="password" id="passwd" name="passwd" class="form-input w-full px-3 py-2 border rounded-md" required>
                </div>
                <div class="mb-4">
                    <label for="name" class="block text-sm font-medium text-gray-700 mb-1">Name</label>
                    <input type="text" id="name" name="memberNm" class="form-input w-full px-3 py-2 border rounded-md" required>
                </div>
                <div class="mb-4">
                    <label for="sex" class="block text-sm font-medium text-gray-700 mb-1">Sex</label>
	   		        <td class="form-input w-full px-3 py-2 border rounded-md" required>
			        	<input type="radio" name="sex" value="m" checked /> 남성&emsp;&emsp;&emsp;
						<input type="radio" name="sex" value="w" />여성
			        </td>
                </div>
                <div class="mb-4">
                    <label for="birthDt" class="block text-sm font-medium text-gray-700 mb-1">BirthDay</label>
                    <input type="text" id="birthDt" name="birthDt" class="form-input w-full px-3 py-2 border rounded-md" required>
                </div>
                <div class="mb-4">
                    <label for="hp" class="block text-sm font-medium text-gray-700 mb-1">PhoneNumber</label>
                    <input type="text" id="hp" name="hp" class="form-input w-full px-3 py-2 border rounded-md" required>
                </div>
                <div class="mb-4">
                    <label for="email" class="block text-sm font-medium text-gray-700 mb-1">Email</label>
                    <input type="email" id="email" name="email" class="form-input w-full px-3 py-2 border rounded-md" required>
                </div>
                <div class="mb-4">
                    <label for="address" class="block text-sm font-medium text-gray-700 mb-1">Home Address (City, District)</label>
                    <input type="text" id="address" name="address" class="form-input w-full px-3 py-2 border rounded-md" required>
                </div>
                <div class="mb-4">
                    <label for="exercise" class="block text-sm font-medium text-gray-700 mb-1">Preferred Exercise</label>
                    <input type="text" id="exercise" name="exercise" class="form-input w-full px-3 py-2 border rounded-md" required>
                </div>
                <div class="mb-6">
                    <label for="introduction" class="block text-sm font-medium text-gray-700 mb-1">Brief Personal Introduction</label>
                    <textarea id="introduction" name="introduction" rows="4" class="form-textarea w-full px-3 py-2 border rounded-md" required></textarea>
                </div>
                <p hidden="joinDt" id="joinDt"></p>
                <p hidden="activeAccountYN" id="activeAccountYN"></p>
                
                <button type="submit" class="w-full px-4 py-2 rounded bg-blue-500 text-white font-semibold hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-300">Sign Up</button>
            	
            </form>
        </div>

    <script>
        // Any additional JavaScript can be included here
    </script>
</body>
</html>