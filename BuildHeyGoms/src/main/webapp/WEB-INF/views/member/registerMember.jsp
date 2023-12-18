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
   	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
        
        @media (min-width: 640px) {
    	.form-container {
        max-width: 2xl;
        margin: 0 auto;
        margin-left: 1px; /* 왼쪽으로 20px 이동 */
    	}
}
    </style>
    
    
    
    <!-- loginCheck Script Member -->
    <script>

	var validateMemberId = false;

	$().ready(function() {
		
		$("#btnOverlappedMember").click(function(){
			
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
		
		$("#memberForm").submit(function(){
			
			if (!validateMemberId) {
				alert("아이디를 확인해주세요.");
				return false;
			}
			
			$("[name='hp']").val($("#hp").val());
			$("[name='birthDt']").val($("#birthDt").val());
			
			
			var birthDt = $("#birthY").val() + "-" + $("#birthM").val() + "-" + $("#birthD").val();
			$("[name='birthDt']").val(birthDt);
			
			if ($("#smsstsYn").val() != "Y") {
				$(this).val("N");
			}
			if ($("#emailstsYn").val() != "Y") {
				$(this).val("N")
			}
			
			if ($("#passwd").val() != $("#confirmPasswd").val()) {
				alert("비밀번호를 확인하세요.");
				$("#confirmPasswd").focus();
				return false;
			}
			
			
		});
		
		
	});
	
	
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




	<!-- loginCheck Script Trainer -->
    <script>

	var validateTrainerId = false;

	$().ready(function() {
		
		$("#btnOverlappedTrainer").click(function(){
			
		    var trainerId = $("#trainerId").val();
		    if (trainerId == '') {
		   		alert("ID를 입력하세요.");
		   		return;
		    }
		   
		    $.ajax({
		       type : "post",
		       url : "${contextPath}/trainer/overlappedId",
		       data : {"trainerId" : trainerId},
		       success : function(isOverLapped){
		          if (isOverLapped == "N"){
		          	alert("사용할 수 있는 ID입니다.");
		          	validateTrainerId = true;
		          }
		          else {
		          	alert("사용할 수 없는 ID입니다.");
		          	validateTrainerId = false;
		          }
		       }
		    });
		});	
		
		$("#trainerForm").submit(function(){
			
			if (!validateTrainerId) {
				alert("아이디를 확인해주세요.");
				return false;
			}
			
			$("[name='hp']").val($("#hp").val());
			$("[name='birthDt']").val($("#birthDt").val());
			
			
			var birthDt = $("#birthY").val() + "-" + $("#birthM").val() + "-" + $("#birthD").val();
			$("[name='birthDt']").val(birthDt);
			
			if ($("#smsstsYn").val() != "Y") {
				$(this).val("N");
			}
			if ($("#emailstsYn").val() != "Y") {
				$(this).val("N")
			}
			
			if ($("#passwd").val() != $("#confirmPasswd").val()) {
				alert("비밀번호를 확인하세요.");
				$("#confirmPasswd").focus();
				return false;
			}
			
			
		});
		
		
		
		
	});
	
	function execDaumPostcodeTrainer() {
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
	
	            document.getElementById('zipcodeTrainer').value = data.zonecode; //5자리 새우편번호 사용
	            document.getElementById('roadAddressTrainer').value = fullRoadAddr;
	            document.getElementById('jibunAddressTrainer').value = data.jibunAddress;
	          
	        }
	    }).open();
	}
	
	</script>

</head>
<body class="bg-gray-50">

	<div class="form-container w-full max-w-2xl mx-auto mt-10">
        <div class="flex justify-center space-x-4 mb-6">
            <button id="memberBtn" class="px-4 py-2 rounded bg-blue-500 text-white font-semibold hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-300 active">Member</button>
            <button id="trainerBtn" class="px-4 py-2 rounded bg-gray-300 text-gray-700 font-semibold hover:bg-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-300" style="margin-right: -140px;">Trainer</button>
        </div>
        
        
        
        <!-- Member_Login_Side -->
        
        <div class="w-full max-w-2xl mx-20 mt-10">
            <form class="bg-white shadow rounded-lg p-6" id="memberForm" action="${contextPath}/member/registerMember" method="post" enctype="multipart/form-data">
                <h2 class="text-xl font-semibold mb-6">회원님의 Sign Up</h2>
                <div class="mb-4">
                    <label for="id" class="block text-sm font-medium text-gray-700 mb-1">Member ID</label>
                    <input type="text" id="memberId" name="memberId" class="form-input w-full px-3 py-2 border rounded-md" required>
                    <input type="button" id="btnOverlappedMember" class="block text-sm rounded bg-gray-300 font-medium text-gray-700 mt-2 hover:bg-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-300" value="중복확인" />
                </div>
                
                <div class="mb-4">
                    <label for="password" class="block text-sm font-medium text-gray-700 mb-1">Password</label>
                    <input type="password" id="passwd" name="passwd" class="form-input w-full px-3 py-2 border rounded-md" required>
                </div>
                
                <div class="mb-4">
                    <label for="confirmPasswd" class="block text-sm font-medium text-gray-700 mb-1">PasswordCheck</label>
                    <input type="password" id="confirmPasswd" name="confirmPasswd" class="form-input w-full px-3 py-2 border rounded-md" placeholder="비밀번호를 확인하세요." required>
                </div>
                
                <div class="mb-4">
                    <label for="name" class="block text-sm font-medium text-gray-700 mb-1">Member Name</label>
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
                   	<label for="birthDt" class="block text-sm font-medium text-gray-700 mb-1">BirthDt</label>
                    <div class="form-input w-full px-3 py-2 border rounded-md" required>
                        <select id="birthY">
                        	<c:forEach var="i" begin="0" end="2023" >
                        		<option>${2023 - i}</option>
                        	</c:forEach>
                        </select>년 
                        <select id="birthM">
                        	<c:forEach var="i" begin="1" end="12" >
                        		<c:choose>
                         		<c:when test="${i < 10 }">
                          		<option>0${i}</option>
                         		</c:when>
                         		<c:otherwise>
                          		<option>${i}</option>
                         		</c:otherwise>
                        		</c:choose>
                        	</c:forEach>
                        </select>월
                        <select id="birthD">
                        	<c:forEach var="i" begin="1" end="31" >
                        		<c:choose>
                         		<c:when test="${i < 10 }">
                          		<option>0${i}</option>
                         		</c:when>
                         		<c:otherwise>
                          		<option>${i}</option>
                         		</c:otherwise>
                        		</c:choose>
                        	</c:forEach>
                        </select>일	
                        <input type="hidden" id="birthDt" name="birthDt"/>
                    </div>
                </div>
                
				<div class="mb-4">
				    <div class="checkout__form__input">
				        <label for="hp" class="block text-sm font-medium text-gray-700 mb-1">PhoneNumber</label>
				        <input type="text" name="hp" id="hp" placeholder="-를 포함해서 입력하세요." class="form-input w-full px-3 py-2 border rounded-md" required>
				        <div class="checkout__order__widget">
				         <label for="smsstsYn">
				             BMS에서 발송하는 SMS 소식을 수신합니다.
				             <input type="checkbox" id="smsstsYn" name="smsstsYn" value="Y">
				             <span class="checkmark"></span>
				         </label>
				        </div>
				    </div>
				</div>
                
                <div class="mb-4">
                    <label for="email" class="block text-sm font-medium text-gray-700 mb-1">Email</label>
                    <input type="email" id="email" name="email" class="form-input w-full px-3 py-2 border rounded-md" required>
					<div class="checkout__order__widget">
					    <label for="emailstsYn">
					        BMS에서 발송하는 E-mail을 수신합니다.
					        <input type="checkbox" id="emailstsYn" name="emailstsYn" value="Y">
					        <span class="checkmark"></span>
					    </label>
					    </div>
                </div>
              
				<div class="mb-4">
				    <div class="checkout__form__input">
				        <label for="zipcode" class="block text-sm font-medium text-gray-700 mb-1">우편 번호</label>
				        <input type="text" id="zipcode" name="zipcode" style="width: 20%;" class="form-input w-full px-3 py-2 border rounded-md" required>
				        <input type="button" value="검색" onclick="execDaumPostcode();" style="width: 10%; padding-left: 0" class="form-input w-full px-3 py-2 border rounded-md" required>
				    </div>
				    <div class="checkout__form__input">
				        <label for="roadAddress" class="block text-sm font-medium text-gray-700 mb-1">도로명 주소</label>
				        <input type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소를 입력하세요." class="form-input w-full px-3 py-2 border rounded-md" required>
				    </div>
				    <div class="checkout__form__input">
				        <label for="jibunAddress" class="block text-sm font-medium text-gray-700 mb-1">지번 주소</label>
				        <input type="text" id="jibunAddress" name="jibunAddress" placeholder="지번주소를 입력하세요." class="form-input w-full px-3 py-2 border rounded-md" required>
				    </div>
				    <div class="checkout__form__input">
				        <label for="namujiAddress" class="block text-sm font-medium text-gray-700 mb-1">나머지 주소</label>
				        <input type="text" id="namujiAddress" name="namujiAddress" placeholder="나머지주소를 입력하세요." class="form-input w-full px-3 py-2 border rounded-md" required>
				    </div>
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
                <p hidden="activeAccountYN" id="activeAccountYN">Y</p>
                
                <button type="submit" class="w-full px-4 py-2 rounded bg-blue-500 text-white font-semibold hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-300">Sign Up</button>
            	
            </form>
        </div>
        
        
        
        
        
        
        <!-- Trainer_Login_Side -->
        
        <div class="w-full max-w-2xl mx-20 mt-10">
            <form class="bg-white shadow rounded-lg p-6" id="trainerForm" action="${contextPath}/trainer/registerTrainer" method="post" enctype="multipart/form-data">
                <h2 class="text-xl font-semibold mb-6">강사님의 Sign Up</h2>
                <div class="mb-4">
                    <label for="id" class="block text-sm font-medium text-gray-700 mb-1">Trainer ID</label>
                    <input type="text" id="trainerId" name="trainerId" class="form-input w-full px-3 py-2 border rounded-md" required>
                    <input type="button" id="btnOverlappedTrainer" class="block text-sm rounded bg-gray-300 font-medium text-gray-700 mt-2 hover:bg-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-300" value="중복확인" />
                </div>
                
                <div class="mb-4">
                    <label for="password" class="block text-sm font-medium text-gray-700 mb-1">Password</label>
                    <input type="password" id="passwd" name="passwd" class="form-input w-full px-3 py-2 border rounded-md" required>
                </div>
                
               	<div class="mb-4">
                    <label for="confirmPasswd" class="block text-sm font-medium text-gray-700 mb-1">PasswordCheck</label>
                    <input type="password" id="confirmPasswd" name="confirmPasswd" class="form-input w-full px-3 py-2 border rounded-md" placeholder="비밀번호를 확인하세요." required>
                </div>
                
                <div class="mb-4">
                    <label for="name" class="block text-sm font-medium text-gray-700 mb-1">Trainer Name</label>
                    <input type="text" id="name" name="trainerNm" class="form-input w-full px-3 py-2 border rounded-md" required>
                </div>
                <div class="mb-4">
                    <label for="sex" class="block text-sm font-medium text-gray-700 mb-1">Sex</label>
	   		        <td class="form-input w-full px-3 py-2 border rounded-md" required>
			        	<input type="radio" name="sex" value="m" checked /> 남성&emsp;&emsp;&emsp;
						<input type="radio" name="sex" value="w" />여성
			        </td>
                </div>
                
                <div class="mb-4">
                   	<label for="birthDt" class="block text-sm font-medium text-gray-700 mb-1">BirthDt</label>
                    <div class="form-input w-full px-3 py-2 border rounded-md" required>
                        <select id="birthY">
                        	<c:forEach var="i" begin="0" end="2023" >
                        		<option>${2023 - i}</option>
                        	</c:forEach>
                        </select>년 
                        <select id="birthM">
                        	<c:forEach var="i" begin="1" end="12" >
                        		<c:choose>
                         		<c:when test="${i < 10 }">
                          		<option>0${i}</option>
                         		</c:when>
                         		<c:otherwise>
                          		<option>${i}</option>
                         		</c:otherwise>
                        		</c:choose>
                        	</c:forEach>
                        </select>월
                        <select id="birthD">
                        	<c:forEach var="i" begin="1" end="31" >
                        		<c:choose>
                         		<c:when test="${i < 10 }">
                          		<option>0${i}</option>
                         		</c:when>
                         		<c:otherwise>
                          		<option>${i}</option>
                         		</c:otherwise>
                        		</c:choose>
                        	</c:forEach>
                        </select>일	
                        <input type="hidden" id="birthDt" name="birthDt"/>
                    </div>
                </div>
                
				<div class="mb-4">
				    <div class="checkout__form__input">
				        <label for="hp" class="block text-sm font-medium text-gray-700 mb-1">PhoneNumber</label>
				        <input type="text" name="hp" id="hp" placeholder="-를 포함해서 입력하세요." class="form-input w-full px-3 py-2 border rounded-md" required>
				        <div class="checkout__order__widget">
				         <label for="smsstsYn">
				             BMS에서 발송하는 SMS 소식을 수신합니다.
				             <input type="checkbox" id="smsstsYn" name="smsstsYn" value="Y">
				             <span class="checkmark"></span>
				         </label>
				        </div>
				    </div>
				</div>
                
                <div class="mb-4">
                    <label for="email" class="block text-sm font-medium text-gray-700 mb-1">Email</label>
                    <input type="email" id="email" name="email" class="form-input w-full px-3 py-2 border rounded-md" required>
					<div class="checkout__order__widget">
					    <label for="emailstsYn">
					        BMS에서 발송하는 E-mail을 수신합니다.
					        <input type="checkbox" id="emailstsYn" name="emailstsYn" value="Y">
					        <span class="checkmark"></span>
					    </label>
					    </div>
                </div>
              
				<div class="mb-4">
				    <div class="checkout__form__input">
				        <label for="zipcodeTrainer" class="block text-sm font-medium text-gray-700 mb-1">우편 번호</label>
				        <input type="text" id="zipcodeTrainer" name="zipcodeTrainer" style="width: 20%;" class="form-input w-full px-3 py-2 border rounded-md" required>
				        <input type="button" value="검색" onclick="execDaumPostcodeTrainer();" style="width: 10%; padding-left: 0" class="form-input w-full px-3 py-2 border rounded-md" required>
				    </div>
				    <div class="checkout__form__input">
				        <label for="roadAddressTrainer" class="block text-sm font-medium text-gray-700 mb-1">도로명 주소</label>
				        <input type="text" id="roadAddressTrainer" name="roadAddressTrainer" placeholder="도로명주소를 입력하세요." class="form-input w-full px-3 py-2 border rounded-md" required>
				    </div>
				    <div class="checkout__form__input">
				        <label for="jibunAddressTrainer" class="block text-sm font-medium text-gray-700 mb-1">지번 주소</label>
				        <input type="text" id="jibunAddressTrainer" name="jibunAddressTrainer" placeholder="지번주소를 입력하세요." class="form-input w-full px-3 py-2 border rounded-md" required>
				    </div>
				    <div class="checkout__form__input">
				        <label for="namujiAddress" class="block text-sm font-medium text-gray-700 mb-1">나머지 주소</label>
				        <input type="text" id="namujiAddress" name="namujiAddress" placeholder="나머지주소를 입력하세요." class="form-input w-full px-3 py-2 border rounded-md" required>
				    </div>
				</div>

                <div class="mb-4">
                    <label for="careerBook" class="block text-sm font-medium text-gray-700 mb-1">CareerBook</label>
                    <textarea id="careerBook" name="careerBook" class="form-textarea w-full px-3 py-2 border rounded-md" required></textarea>
                </div>
                <div class="mb-6">
                    <label for="introduction" class="block text-sm font-medium text-gray-700 mb-1">Brief Personal Introduction</label>
                    <textarea id="introduction" name="introduction" rows="5" class="form-textarea w-full px-3 py-2 border rounded-md" required></textarea>
                </div>
                <p hidden="joinDt" id="joinDt"></p>
                <p hidden="activeAccountYN" id="activeAccountYN"></p>
                
                <button type="submit" class="w-full px-4 py-2 rounded bg-blue-500 text-white font-semibold hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-300">Sign Up</button>
            	
            </form>
        </div>
	</div>        
        
        
        
        

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

    <script>
        // Any additional JavaScript can be included here
    </script>
</body>
</html>