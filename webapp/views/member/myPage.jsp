<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>BidSync - 마이페이지</title>
	
	<!-- 외부 css/js 연결 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/views/resources/css/member.css">
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="/views/common/header.jsp" />

	<main id="mypage-main">
		<%-- 테스트 중 --%>
		
		로그인 정보
		<ul>
			<li>${loginUser.getUserId()}</li>
			<li>${loginUser.getUserPwd()}</li>
			<li>${loginUser.getUserName()}</li>
			<li>${loginUser.getGender()}</li>
			<li>${loginUser.getEmail()}</li>
			<li>${loginUser.getBirthday()}</li>
			<li>${loginUser.getPhone()}</li>
		</ul>
	</main>

	<!-- 푸터 -->
	<jsp:include page="/views/common/footer.jsp" />
</body>
</html>