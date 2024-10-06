<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>BidSnyc - 회원가입</title>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="/views/common/header.jsp" />
	
	<!-- 테스트폼 -->
	<form action="${pageContext.request.contextPath}/insert.me" method="post">
		아이디 : <input type="text" name="userId"><br>
		비밀번호 : <input type="text" name="userPwd"><br>
		이름 : <input type="text" name="userName"><br>
		성별 : <input type="radio" name="gender" value="남">남 <input type="radio" name="gender" value="여"> 여 <input type="radio" name="gender" value=""> 비공개 <br>
		생년월일 : <input type="date" name="birthday"><br>
		전화번호: <input type="text" name="phone"><br>
		이메일 : <input type="text" name="email"><br>
		
		<input type="submit" value="가입">
	</form>
</body>
</html>