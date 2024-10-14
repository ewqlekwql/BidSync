<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.ct.bidsync.board.model.vo.Board" %>
<%
    String ctgName = (String)request.getAttribute("ctgName");
	Board b = (Board)request.getAttribute("board");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BidSync ㅣ<%=ctgName%> - <%=b.getBoardTitle()%> </title>

    <!-- 외부 css/js 연결 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/resources/css/board.css">
    <script src="${pageContext.request.contextPath}/views/resources/js/board.js"></script>
</head>
<body>
    <!-- 헤더 -->
    <jsp:include page="/views/common/header.jsp" />

    <div class="container">
        <!-- Product Information -->
        <section class="product-info">
            <!-- Product Name -->
            <div class="product-name">
                <h1><%=b.getBoardTitle()%></h1>
            </div>

            <div class="product-main">
                <!-- 상품 이미지 레이아웃 -->
                <div class="product-image-layout">
                    <div class="main-image">
                        <img id="mainImage" src="${pageContext.request.contextPath}<%=b.getProdImg()%>" alt="상품 이미지" class="large-image">
                    </div>
                    <div class="thumbnail-images">
                        <img src="${pageContext.request.contextPath}<%=b.getProdImg()%>" alt="썸네일 이미지" class="thumbnail">
                        <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/images/170356470743469741.jpg?gif=1&w=480&h=480&c=c&webp=1" alt="썸네일 이미지" class="thumbnail">
                        <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/images/170356471029738068.jpg?gif=1&w=480&h=480&c=c&webp=1" alt="썸네일 이미지" class="thumbnail">
                        <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/images/170356470522098920.jpg?gif=1&w=480&h=480&c=c&webp=1" alt="썸네일 이미지" class="thumbnail">
                        <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/images/162304222182490490.jpg?gif=1&w=480&h=480&c=c&webp=1" alt="썸네일 이미지" class="thumbnail">
                    </div>
                </div>

                <!-- 상품 상세 정보 -->
                <div class="product-details">
                    <!-- 카테고리 -->
                    <div class="category-info">
					    <p>					         
					        <a href="${pageContext.request.contextPath}/list.bo?ctg=<%=b.getBoardCtg()%>&cpage=1">카테고리 &gt; <%=ctgName%></a> 
					    </p>
					</div>

                    <!-- 판매자 정보 -->
                    <div class="seller-info">
                        <div class="seller-profile">
                            <img src="https://cdn-icons-png.flaticon.com/512/3106/3106773.png" alt="판매자 프로필">
                            <span><a href="판매자_페이지_URL"><%=b.getSeller()%></a></span>
                        </div>
                        <div class="seller-rating">
                            ★★★☆☆
                        </div>
                    </div>

					<%-- 경매/중고 분할 --%>
					<% if("경매".equals(b.getBoardType())) { %>
	                    <!-- 입찰 정보 및 가격 -->
	                    <div class="auction-info">
						    <h3>현재 입찰가</h3>
	    					<h1><a href="#current-bid" class="current-bid-link"><%=b.getBidPrice()%> 원</a></h1>
						    <div class="auction-details">
						        <p><a href="#bid-details"><span>BID</span> 입찰 <%=b.getAuctioneer()%>건 | 12일 3시간 18분 후 종료</a></p>
						    </div>
						    <ul>
						        <li>시작가: <a href="#start-price"><span>10,000 원</span></a></li>
						        <li>즉시 구매가: <a href="#buy-now-price"><span><%=b.getPrice()%> 원</span></a></li>
						        <li>배송비: <a href="#shipping-cost"><span>50,000 원</span></a></li>
						    </ul>
						</div>
						
						<!-- 버튼 섹션 -->
	                    <div class="action-buttons">
	                        <button class="buy-now" onclick="buyNow('<%=b.getBoardCtg()%>', '<%=b.getBoardType()%>', <%=b.getBoardNo()%>)">즉시 구매</button>
	                        <button class="place-bid">입찰하기</button>
	                        <button class="add-to-list">관심 목록에 추가</button>
	                    </div>
					<% } else { %>
						<!-- 거래 정보 및 가격 -->
						<div class="used-price">
	                        <h3>중고 거래가</h3>
	                        <h1><a href="#used-price" class="used-price-link"><%=b.getPrice()%> 원</a></h1>
	                    </div>
	                    <div class="trade-options">
	                        <button class="btn-exchange">에누리</button>
	                        <button class="btn-direct">직거래</button>
	                    </div>
	                    <p>배송방법: 직거래, 편의점 택배</p>
						<p>배송비: <a href="#shipping-cost" class="shipping-cost-link">3,000원</a></p>
	
	                    <!-- 수량 선택 -->
	                    <div class="quantity-selector">
	                        <label for="quantity">수량</label>
	                        <button class="btn-decrease">-</button>
	                        <input type="text" id="quantity" value="1">
	                        <button class="btn-increase">+</button>
	                    </div>
	                    
	                    <!-- 버튼 섹션 -->
	                    <div class="used-buttons">
	                        <button class="buy-now" onclick="buyNow('<%=b.getBoardCtg()%>', '<%=b.getBoardType()%>', <%=b.getBoardNo()%>)">구매하기</button>
	                        <button class="add-to-cart" onclick="addCart('<%=b.getBoardCtg()%>', <%=b.getBoardNo()%>)">장바구니에 담기</button>
	                        <button class="add-to-list" onclick="addWish('<%=b.getBoardCtg()%>', <%=b.getBoardNo()%>)">관심 목록에 추가</button>
	                    </div>
					<% } %>
                </div>
            </div>
        </section>

        <!-- Product Description -->
        <section class="product-description">
            <h2>상품 상세 설명</h2>
            <p><%=b.getBoardContent()%></p>
        </section>

        <!-- Seller Information Section -->
        <section class="seller-info-section">
            <div class="seller-profile-info">
                <img src="https://cdn-icons-png.flaticon.com/512/3106/3106773.png" alt="판매자 프로필" class="seller-profile-image">
                <div class="seller-details">
                    <h3><a href="판매자_페이지_URL"><%=b.getSeller()%></a></h3>
                    <p><span>🤍</span> 
                </div>
            </div>
            <div class="seller-actions">
                <button class="visit-store">스토어 방문</button>
                <button class="chat-seller">1:1 채팅</button>
            </div>
        </section>

        <!-- Review Summary Section -->
        <section class="review-summary">
            <div class="rating-summary">
                <h3>3.4</h3>
                <div class="rating-stars">★★★☆☆</div>
            </div>
            <div class="rating-categories">
                <div class="category">
                    <span>신뢰도</span>   
                    <div class="rating-bar">
                        <div class="fill" style="width: 90%;"></div>
                    </div>
                </div>
                <div class="category">
                    <span>품질</span>
                    <div class="rating-bar">
                        <div class="fill" style="width: 70%;"></div>
                    </div>
                </div>
                <div class="category">
                    <span>소통</span>
                    <div class="rating-bar"> 
                        <div class="fill" style="width: 60%;"></div>
                    </div>
                </div>
                <div class="category">
                    <span>배송</span>
                    <div class="rating-bar">
                        <div class="fill" style="width: 50%;"></div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Reviews Section -->
        <section class="reviews">
            <h4>리뷰 (5)</h4>
            <div id="reviewContainer" class="review-container">
                <!-- 리뷰 항목들이 동적으로 추가됩니다. -->
            </div>
            <button id="loadMoreBtn" class="view-more-reviews">모든 리뷰 보기</button>
        </section>
    </div>

    <!-- 팝업 컨테이너 -->
    <div class="popup-container" id="prdinfoBID" style="display:none;">
        <div class="popup">
            <!-- 팝업 헤더 -->
            <div class="popup-header">
                <h2>입찰 하기</h2>
                <span class="close-btn">&times;</span> <!-- 닫기 버튼 -->
            </div>

            <!-- 타이머 -->
            <div class="popup-timer">
                <p>⏰ 12일 3시간 18분 후 종료</p>
            </div>

            <!-- 현재 입찰가 -->
            <div class="popup-current-bid">
                <h3>현재 입찰가</h3>
                <h1>100,000,000 원</h1>
                <p>BID 입찰 8건</p>
            </div>

            <!-- 구매 희망가 입력 -->
            <div class="popup-bid-input">
                <label for="bidAmount">구매 희망가</label>
                <div class="bid-amount-container">
                    <input type="number" id="bidAmount" name="bidAmount" class="bid-amount-input" min="100000000" step="1000" value="100000000" />
                    <span class="currency">원</span>
                </div>
                <p class="bid-info">최종 결제금액은 다음 화면에서 계산됩니다.</p>
            </div>

            <!-- 입찰 버튼 -->
            <button class="bid-btn">입찰하기</button>

            <!-- 경고 메시지 -->
            <p class="popup-warning">입금확인이 되지 않아 미입금 2건이 누적되는 경우, <br>
                사이트 이용이 자동으로 일시제한됩니다. <br>
                상품의 이미지를 상세히 확인하여 신중한 입찰 부탁드립니다.</p>
        </div>
    </div>
    
    <!-- 푸터 -->
	<jsp:include page="/views/common/footer.jsp" />
</body>
</html>