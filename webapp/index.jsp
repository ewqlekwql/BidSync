<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>BidSync - HOME</title>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="/views/common/header.jsp" />
	
	<main id="index-main">
		<!-- 배너 -->
		<section id="index-banner">
		<%-- 임시 이미지 --%>
			<img src="views/resources/images/banner_index.png">
		</section>

		<!-- 서브 메뉴 -->
		<section id="index-menu">
			<ul>
				<li>
					<a href="${pageContext.request.contextPath}/list.bo?ctg=fashion&cpage=1">
						<img src="views/resources/images/btn_indexMenu01.png">
						<h3>패션</h3>
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/list.bo?ctg=digital&cpage=1">
						<img src="views/resources/images/btn_indexMenu02.png">
						<h3>디지털 · 가전</h3>
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/list.bo?ctg=sport&cpage=1">
						<img src="views/resources/images/btn_indexMenu03.png">
						<h3>스포츠</h3>
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/list.bo?ctg=deco&cpage=1">
						<img src="views/resources/images/btn_indexMenu04.png">
						<h3>홈 · 데코</h3>
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/list.bo?ctg=toy&cpage=1">
						<img src="views/resources/images/btn_indexMenu05.png">
						<h3>완구</h3>
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/list.bo?ctg=jewelry&cpage=1">
						<img src="views/resources/images/btn_indexMenu06.png">
						<h3>쥬얼리</h3>
					</a>
				</li>
			</ul>
		</section>
	</main>
	
	<!-- 푸터 -->
	<jsp:include page="/views/common/footer.jsp" />
</body>
</html>