<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 상세 페이지 레이아웃</title>
    <!-- CSS 파일 경로를 JSP 방식으로 동적으로 처리 -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/views/resources/css/BidPopUp.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/views/resources/css/prdinfoBID.css">
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
                <div class="product-details">
                    <!-- 카테고리 -->
                    <div class="category-info">
                        <p>카테고리: 패션 > 악세서리</p>
                    </div>

                    <!-- 판매자 정보 -->
                    <div class="seller-info">
                        <div class="seller-profile">
                            <img src="https://cdn-icons-png.flaticon.com/512/3106/3106773.png" alt="판매자 프로필">
                            <span>판매자명</span>
                        </div>
                        <div class="seller-rating">
                            ★★★☆☆
                            <span>(20)</span>
                        </div>
                    </div>

                    <!-- 입찰 정보 및 가격 -->
                    <div class="auction-info">
                        <h3>현재 입찰가</h3>
                        <h1>3,000,000 원</h1>
                        <div class="auction-details">
                            <p><span>BID</span> 입찰 8건 | 12일 3시간 18분 후 종료</p>
                        </div>
                        <ul>
                            <li>시작가: <span>10,000 원</span></li>
                            <li>즉시 구매가: <span>100,000,000 원</span></li>
                            <li>배송비: <span>50,000 원</span></li>
                        </ul>
                    </div>

                    <!-- 버튼 섹션 -->
                    <div class="action-buttons">
                        <button class="buy-now">즉시 구매</button>
                        <button class="place-bid">입찰하기</button>
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

    <!-- JavaScript 파일 경로 JSP 처리 -->
    <script src="<%= request.getContextPath() %>/views/resources/js/prdinfoBID.js"></script>
</body>
</html>
