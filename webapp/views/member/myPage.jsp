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
		<!-- 회원 정보 -->
		<section>
			<form action="update.me" method="post">
				<table>
					<thead>
						<tr>
							<th>회원 정보</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>아이디<th>
							<td><input type="text" name="userId" value="${loginUser.getUserId()}" readonly></td>
						</tr>
						<tr>
							<th>비밀번호 확인<th>
							<td><input type="password" name="userPwd" required></td>
						</tr>
						<tr>
							<th>성별<th>
							<td>
								<select name="gender">
			                		<option value="">비공개</option>
			                		<option value="남">남성</option>
			                		<option value="여">여성</option>
			                	</select>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<th colspan="2"><input type="submit" value="수정"></th>
						</tr>
					</tfoot>
				</table>
				<br>
				<button type="button" onclick="window.location.href='${pageContext.request.contextPath}/views/sale/SalesPage.jsp'">일반상품 등록하기</button>
				<button type="button" onclick="window.location.href='${pageContext.request.contextPath}/views/sale/ActionPage.jsp'">경매상품 등록하기</button>
				</form>
		</section>
	</main>

	<!-- 푸터 -->
	<jsp:include page="/views/common/footer.jsp" />
</body>
</html>