<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.ct.bidsync.member.model.vo.Cart, java.util.ArrayList" %>
<%
	ArrayList<Cart> cartList = (ArrayList)request.getAttribute("cartList");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>BidSync - 장바구니</title>
	
	<!-- 외부 css/js 연결 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/views/resources/css/member.css">
	<script src="${pageContext.request.contextPath}/views/resources/js/member.js"></script>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="/views/common/header.jsp" />
	
	<main id="cart-main">
		<!-- 장바구니 목록 -->
		<section id="cart-section-list">
			<!-- 상단바 -->
			<aside class="allCheckBox">
				<div>
					<label for="cartAll-Check" class="cart-aside-label">
						<input type="checkbox" id="cartAll-Check" onchange="allCheck(this)">
						<span class="span-box"></span>
						<span class="span-text">전체 선택</span>
					</label>
				</div>
				<div>
					<input type="button" id="checkreset" value="&ensp;선택삭제&ensp;">
           			<input type="button" id="soldoutcheck" value="&ensp;품절 / 판매종료 상품 전체삭제&ensp;" onclick="delectSoldOut()">
				</div>
			</aside>
			
			<!-- 상품 목록 -->
			<article id="cart-article-list">
				<% if(cartList.size() == 0) { %>
					<h3>장바구니에 담긴 상품이 없습니다.</h3>
				<% } else { %>
					<% for(Cart c : cartList) { %>
						<div class="cart-card">
						    <label for="<%=c.getCartNo()%>" class="cart-card-label">
						    	<% if("N".equals(c.getStatus())) { %>
						    		<input type="checkbox" id="<%=c.getCartNo()%>" class="cart-card-checkbox" value="<%=c.getCartNo()%>" disabled>
						    	<% } else { %>
						        	<input type="checkbox" id="<%=c.getCartNo()%>" class="cart-card-checkbox" value="<%=c.getCartNo()%>">
						        <% } %>
						        <span class="span-box"></span>
						    </label>
						    <img src="${pageContext.request.contextPath}<%=c.getProdImg()%>">
						    <ul>
						    	<% if("N".equals(c.getStatus())) { %>
						    		<li><h2 class="SoldOut" title="【판매종료】 <%=c.getBoardTitle()%>">【판매종료】 <%=c.getBoardTitle()%></h2></li>
								<% } else { %>
						        	<li><h2 title="<%=c.getBoardTitle()%>"><%=c.getBoardTitle()%></h2></li>
						        <% } %>
						        <li><%=c.getPrice()%> 원</li>
						        <li>배송비 5,000원</li>
						    </ul>
						    <span class="span-stock">
						        <button id="btn1">-</button>
						        <input type="number" value="<%=c.getStock()%>" readonly>
						        <button id="btn2">+</button>
						    </span>
						</div>
					<% } %>
				<% } %>
			</article>
		</section>
		
		<!-- 사이드바 (결제창) -->
		<section id="cart-section-total">
			<aside id="cart-aside">
				<table id="cart-aside-table">
					<thead>
						<tr>
							<th colspan="2">주문 예상 금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>총 상품 가격</th>
							<td>200,000,000원</td>
						</tr>
						<tr>
							<th>총 배송비</th>
							<td>+ 10000원</td>
						</tr>
						<tr>
							<th>할인 금액</th>
							<td>- 0원</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<th>합계</th>
							<td>500,000,000원</td>
						<tr>
					</tfoot>
				</table>
				<button id="btnOrder">구매하기 (0)</button>
			</aside>
		</section>
	</main>
	
	<!-- 푸터 -->
	<jsp:include page="/views/common/footer.jsp" />
</body>
</html>