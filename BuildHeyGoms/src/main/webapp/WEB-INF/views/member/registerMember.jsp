<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<title>register</title>
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
<body>
	<form action="${contextPath}/member/registerMember" method="post" enctype="multipart/form-data">
		<h3>회원가입</h3>
		<table border="1">
			<tr>
				<td>아이디</td>
				<td>
		            <input type="text" name="memberId" id="memberId" maxlength="15" placeholder="아이디를 입력하세요." required/>&emsp;
		            <input type="button" id="btnOverlapped" value="중복확인" />
		        </td>
		    </tr>
	        <tr>
		        <td>비밀번호</td>
		        <td><input type="password" name="passwd" placeholder="비밀번호를 입력하세요." required/></td>
	        </tr>
	        <tr>
		        <td>프로필</td>
		        <td><input type="file" name="profile" required/></td>
	        </tr>
	        <tr>
		        <td>이름</td>
		        <td><input type="text" name="memberNm" maxlength="15" placeholder="이름을 입력하세요." required/></td>
	        </tr>                
		    <tr>
		        <td>성별</td>
		        <td>
		        	<input type="radio" name="sex" value="m" checked /> 남성&emsp;&emsp;&emsp;
					<input type="radio" name="sex" value="w" />여성
		        </td>
	        </tr>                              
	        <tr>
		        <td>생년월일</td>
		        <td>
	                <select id="birthY" >
						<c:forEach var="i" begin="0" end="2023">
							<option>${2023 - i}</option>
						</c:forEach>
					</select> 년 
					<select id="birthM">
					  	<c:forEach var="i" begin="1" end="12">
						   <c:choose>
								<c:when test="${i < 10 }">
									<option>0${i}</option>
								</c:when>
								<c:otherwise>
									<option>${i}</option>
								</c:otherwise>
							</c:choose>
					  	</c:forEach>
					</select> 월  
					<select id="birthD">
						<c:forEach var="i" begin="1" end="31">
							<c:choose>
								<c:when test="${i < 10 }">
									<option>0${i}</option>
								</c:when>
								<c:otherwise>
									<option>${i}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select> 일 &emsp;
					<input type="hidden" name="birthDt">
		        </td>
	        </tr>                        
	        <tr>
		        <td>핸드폰 번호</td>
		        <td>
		        	<select id="hp1" >
						<option>없음</option>
						<option selected value="010">010</option>
						<option value="011">011</option>
						<option value="019">019</option>
					</select> - 
					<input size="10px" type="text" id="hp2" required> - 
					<input size="10px" type="text" id="hp3" required>
					<input type="checkbox" id="smsstsYn" name="smsstsYn"  value="Y" checked/>
					<input type="hidden" name="hp">
	                스프링에서 발송하는 SMS 소식을 수신합니다.
		        </td>
	        </tr>                         
	        <tr>
		        <td>이메일</td>
		        <td>
		        	<input type="email" name="email" required>  
	                <input type="checkbox" id="emailstsYn" name="emailstsYn" value="Y" checked/>
	                스프링에서 발송하는 E-mail을 수신합니다.
		        </td>
	        </tr>                              
	        <tr>
		        <td>주소</td>
		        <td>
		        	<input type="text" placeholder="우편번호 입력" id="zipcode" name="zipcode" >
	                <input type="button" onclick="javascript:execDaumPostcode()" value="검색">
	                <br><br>
	                            도로명 주소 : <input type="text" name="roadAddress" id="roadAddress" size="60"> <br>
					지번 주소 : <input type="text"  name="jibunAddress" id="jibunAddress" size="60"> <br>
					나머지 주소: <input type="text" name="namujiAddress" id="namujiAddress" size="60"/>
		        </td>
	        </tr>
	        <tr>
		        <td>기타</td>
		        <td>
		        	<textarea rows="10" cols="10" name="etc"></textarea>
		        	<script>CKEDITOR.replace('etc');</script>
		        </td>
	        </tr>                                     
	        <tr>
		        <td colspan="2" align="center">
		        	<input type="submit" value="회원가입하기"  >
		        </td>
		    </tr>
		    <tr>
		        <td colspan="2" align="center">
		        	이미 회원가입이 되어있다면 ? <a href="${contextPath}/member/loginMember"><strong>로그인하기</strong></a>
		        </td>
	        </tr>                            
	     </table>
     </form>
</body>
</html>