<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.ct.bidsync.sub.model.vo.Wish, java.util.ArrayList" %>
<%
	ArrayList<Wish> wishList = (ArrayList)request.getAttribute("wishList");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>BidSync - 관심상품</title>
	
	<!-- 외부 css/js 연결 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/views/resources/css/member.css">
	<script src="${pageContext.request.contextPath}/views/resources/js/member.js"></script>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="/views/common/header.jsp" />

	<main id="wish-main">
		<!-- 관심상품 목록 -->
		<section id="wish-section">
			<h1>관심상품 (<%=wishList.size()%>)</h1>
			<!-- 상단바 -->
			<aside class="allCheckBox">
				<div>
					<label for="wishAll-Check" class="wish-aside-label">
						<input type="checkbox" id="wishAll-Check" onchange="allCheckWish(this)">
						<span class="span-box"></span>
						<span class="span-text">전체 선택</span>
					</label>
				</div>
				<div>
					<input type="button" id="checkreset" value="&ensp;선택삭제&ensp;">
           			<input type="button" id="soldoutcheck" value="&ensp;품절 / 판매종료 상품 전체삭제&ensp;" onclick="delectWishSoldOut()">
				</div>
			</aside>
			
			<!-- 상품 목록 -->
			<article id="wish-article">
				<% if(wishList.size() == 0) { %>
					<h3>관심목록에 담긴 상품이 없습니다.</h3>
				<% } else { %>
					<% for(Wish w : wishList) { %>
						<div class="wish-card">
						    <label for="<%=w.getWishNo()%>" class="wish-card-label">
						    	<% if("N".equals(w.getStatus())) { %>
						    		<input type="checkbox" id="<%=w.getWishNo()%>" class="wish-card-checkbox" value="<%=w.getWishNo()%>" disabled>
						    	<% } else { %>
						        	<input type="checkbox" id="<%=w.getWishNo()%>" class="wish-card-checkbox" value="<%=w.getWishNo()%>">
						        <% } %>
						        <span class="span-box"></span>
						    </label>
						    <img src="${pageContext.request.contextPath}<%=w.getProdImg()%>">
						    <ul>
						    	<% if("N".equals(w.getStatus())) { %>
						    		<li><h2 class="SoldOut" title="【판매종료】 <%=w.getBoardTitle()%>">【판매종료】 <%=w.getBoardTitle()%></h2></li>
								<% } else { %>
						        	<li><h2 title="<%=w.getBoardTitle()%>"><%=w.getBoardTitle()%></h2></li>
						        <% } %>
						        <li><%=w.getPrice()%> 원</li>
						    </ul>
						    <div>
						    	<button id="btnWishToCart" onclick="wishToCart(<%=w.getWishNo()%>)">장바구니로 이동</button>
						    	<button id="btnDelWish" onclick="deleteWish(<%=w.getWishNo()%>)">목록에서 삭제</button>
						    </div>
						</div>
					<% } %>
				<% } %>
			</article>
		</section>
    </main>

	<!-- 푸터 -->
	<jsp:include page="/views/common/footer.jsp" />
</body>
</html>