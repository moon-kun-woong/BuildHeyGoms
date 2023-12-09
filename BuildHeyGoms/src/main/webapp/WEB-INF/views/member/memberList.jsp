<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<html>
<head>
<meta charset="UTF-8">
<title>member list</title>
<script>

	$().ready(function() {
		
		$("[name='searchWord']").keyup(function(){
			
			var param = {
				"searchKeyword" : $("[name='searchKeyword']").val(),
				"searchWord" : $("[name='searchWord']").val(),
			}
		   
		    $.ajax({
		       type : "get",
		       url : "${contextPath}/member/searchMemberList",
		       data : param,
		       success : function(data){
		          
		    	   var memberList = "";
		    	   if (data.length == 0) {
		    		   memberList += "<tr align='center'>";
		    		   memberList += "<td colspan='6'><strong>조회된 회원이 없습니다.</strong></td>";
	    			   memberList += "</tr>";
		    	   }
		    	   else {
		    		   
			    	   $(data).each(function(){
			    		   
			    		   memberList += "<tr>";
			    		   memberList += "<td><img src='${contextPath }/member/thumbnails?fileName=" + this.profile +"' width='50' height='50' alt='사진'></td>";
			    		   memberList += "<td>"+ this.memberId + "</td>";
			    		   memberList += "<td>"+ this.memberNm + "</td>";
			    		   memberList += "<td>"+ this.hp + "</td>";
			    		   memberList += "<td>";
			    		   memberList += this.roadAddress +"<br>"; 
			    		   memberList += this.jibunAddress +"<br>";
			    		   memberList += this.namujiAddress +"<br>";
			    		   memberList += "</td>";
			    		   
			    		   var joinDt = new Date(this.joinDt);
			    		   var year = joinDt.getFullYear();
			    		   var month = joinDt.getMonth() + 1;
			    		   if (month < 10) month = "0" + month;
			    		   var date = joinDt.getDate();
			    		   if (date < 10) date = "0" + date;
			    		   
			    		   memberList += "<td>"+ year + "-" + month + "-" + date + "</td>";
			    		   memberList += "</tr>";
			    		   
			    	   });
		    		   
		    	   }
		    	   
		    	   
		    	  $("#memberList").html(memberList);
		    	   
		       }
		    });
		});	
		
		
	});
	
</script>
</head>
<body>
	
	<h3>회원 리스트</h3>
	<table border="1" style="align-content: center">
			<tr>
				<td>프로필</td>
				<td>회원아이디</td>
				<td>회원이름</td>
				<td>휴대폰번호</td>
				<td>주소</td>
				<td>가입일</td>
			</tr>
			<tbody id="memberList">
				<c:choose>
					<c:when test="${empty memberList}">
						<tr align="center">
							<td colspan="6"><strong>조회된 회원이 없습니다.</strong></td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="memberDTO" items="${memberList}">
							<tr>
								<td><img src="${contextPath }/member/thumbnails?fileName=${memberDTO.profile}" width="50" height="50" alt="사진"></td>
								<td>${memberDTO.memberId}</td>
								<td>${memberDTO.memberNm}</td>
								<td>${memberDTO.hp}</td>
								<td>
									${memberDTO.roadAddress}<br> 
									${memberDTO.jibunAddress}<br>
									${memberDTO.namujiAddress}<br>
								</td>
								<td><fmt:formatDate value="${memberDTO.joinDt}" pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
			<tr>
				<td colspan="6" align="center">
					<select name="searchKeyword">
						<option value="memberId">회원아이디</option>
						<option value="memberNm">회원명</option>
						<option value="hp">휴대폰번호</option>
						<option value="address">주소</option>
					</select>
					<input type="text" name="searchWord" />
				</td>
			</tr>
	</table>
	<div>
		<input type="button" value="Excel Export" onclick="location.href='${contextPath}/member/memberExcelExport'" />
		<input type="button" value="메인으로" onclick="location.href='${contextPath}/member/mainMember'" />
	</div>
	
</body>
</html>

