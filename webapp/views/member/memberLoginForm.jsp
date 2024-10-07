<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>BidSync - 로그인</title>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="/views/common/header.jsp" />
	
	<h4>테스트폼</h4>
	<form action="${pageContext.request.contextPath}/login.me" method="post">
		<input type="text" name="userId">
		<input type="text" name="userPwd">
		<input type="submit" value="로그인">
		<br>
		<a href="${pageContext.request.contextPath}/enroll.me">회원가입</a>
	</form>
</body>
</html>