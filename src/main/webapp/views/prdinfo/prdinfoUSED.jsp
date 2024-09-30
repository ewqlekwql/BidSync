<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 상세 페이지 레이아웃</title>
    <!-- CSS 파일 경로를 JSP 방식으로 동적으로 처리 -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/views/resources/css/prdinfoUSED.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/views/resources/css/index.css">
</head>
<body>
    <div class="container">
        <!-- Header (header.jsp 포함) -->
        <jsp:include page="/views/common/header.jsp" />

    

        <!-- Product Information -->
        <section class="product-info">
            <!-- Product Name -->
            <div class="product-name">
                <h1>상품등록명</h1>
            </div>

            <div class="product-main">
                <!-- 상품 이미지 레이아웃 -->
                <div class="product-image-layout">
                    <div class="main-image">
                        <img id="mainImage" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/170356472022385905.jpg?gif=1&w=640&h=640&c=c&webp=1" alt="상품 이미지" class="large-image">
                    </div>
                    <div class="thumbnail-images">
                        <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/170356472022385905.jpg?gif=1&w=480&h=480&c=c&webp=1" alt="썸네일 이미지" class="thumbnail">
                        <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/images/170356470743469741.jpg?gif=1&w=480&h=480&c=c&webp=1" alt="썸네일 이미지" class="thumbnail">
                        <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/images/170356471029738068.jpg?gif=1&w=480&h=480&c=c&webp=1" alt="썸네일 이미지" class="thumbnail">
                        <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/images/170356470522098920.jpg?gif=1&w=480&h=480&c=c&webp=1" alt="썸네일 이미지" class="thumbnail">
                        <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/images/162304222182490490.jpg?gif=1&w=480&h=480&c=c&webp=1" alt="썸네일 이미지" class="thumbnail">
                    </div>
                </div>

                <!-- 상품 상세 정보 -->
                <div class="used-price-info">
                    <div class="category-info">
                        <p>카테고리: 패션 > 악세서리</p>
                    </div>
                    <div class="seller-info">
                        <div class="seller-profile">
                        <img src="https://cdn-icons-png.flaticon.com/512/3106/3106773.png" alt="판매자 프로필" 
                        class="seller-profile">
                        <span>판매자명</span>
                    </div>
                        <div class="seller-rating">
                           ★★★☆☆ 
                           <span>(20)</span>
                        </div>
                    </div>
                    <div class="used-price">
                        <h3>중고 거래가</h3>
                        <h1>15,000 원</h1>
                    </div>
                    <div class="trade-options">
                        <button class="btn-exchange">에누리</button>
                        <button class="btn-direct">직거래</button>
                    </div>
                    <p>배송방법: 직거래, 편의점 택배</p>
                    <p>배송비: 3,000원</p>

                    <!-- 수량 선택 -->
                    <div class="quantity-selector">
                        <label for="quantity">수량</label>
                        <button class="btn-decrease">-</button>
                        <input type="text" id="quantity" value="1">
                        <button class="btn-increase">+</button>
                    </div>

                    <!-- 수정된 버튼 섹션 -->
                    <div class="action-buttons">
                        <button class="buy-now">구매하기</button>
                        <button class="add-to-cart">장바구니에 담기</button>
                        <button class="add-to-list">관심 목록에 추가</button>
                    </div>
                </div>
            </div>
        </section>

        <!-- Product Description -->
        <section class="product-description">
            <h2>상품 상세 설명 영역</h2>
            <p>여기에 텍스트 설명이 들어갑니다. 상품의 주요 특징, 사용법, 장점 등을 설명하는 내용입니다.</p>
        </section>

        <!-- Seller Information Section -->
        <section class="seller-info-section">
            <div class="seller-profile-info">
                <img src="https://cdn-icons-png.flaticon.com/512/3106/3106773.png" alt="판매자 프로필" class="seller-profile-image">
                <div class="seller-details">
                    <h3>판매자명</h3>
                    <p><span>🤍</span> 팔로우 189</p>
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

    <!-- Footer -->
    <footer class="footer">
        <p>&copy; 2024 BidSync. All rights reserved.</p>
    </footer>

    <!-- JavaScript 파일 경로 JSP 처리 -->
    <script src="<%= request.getContextPath() %>/views/resources/js/prdinfoUsed.js"></script>
</body>
</html>
