<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>구매 입찰 페이지</title>
    <!-- CSS 파일 경로를 JSP 방식으로 동적으로 처리 -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/views/resources/css/BidDetail.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/views/resources/css/index.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/views/resources/css/ratingPopup.css">
    
</head>
<body>
    <!-- 메인 컨테이너 -->
    <div class="container">
        <!-- Header (header.jsp 포함) -->
        <jsp:include page="/views/common/header.jsp" />


        <!-- 구매 입찰 중 섹션 -->
        <section class="bid-section">
            <h2>구매 입찰 중</h2>
            <!-- 상품 정보 섹션 -->
            <section class="product-info">
                <!-- 상품 이미지 -->
                <img class="product-image" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/170356472022385905.jpg?gif=1&w=640&h=640&c=c&webp=1" alt="상품 이미지">
                
                <!-- 상품 세부 정보 -->
                <div class="product-details">
                    <p class="product-name">상품명</p>
                    <p class="product-price">100,000,000원</p>
                    <p class="product-shipping">배송비 100원</p>
                    <p class="product-delivery">X~X일 내 도착 예정</p>
                </div>
            </section>
        </section>

        <!-- 구매 입찰 내역 섹션 -->
        <section class="bid-detail-section">
            <h3>구매 입찰 내역</h3>
            <ul class="bid-detail-list">
                <li>
                    <span class="label">입찰 희망가</span>
                    <span class="value">100,000,000 원</span>
                </li>
                <li>
                    <span class="label">배송비</span>
                    <span class="value">100 원</span>
                </li>
                <li>
                    <span class="label">입찰일</span>
                    <span class="value">XX/XX/XX</span>
                </li>
                <li>
                    <span class="label">입찰 마감기한</span>
                    <span class="value">XX일 X시간 XX분 후 종료</span>
                </li>
                <hr>
                <li>
                    <span class="label">총 결제 금액</span>
                    <span class="value" >100,000,100 원</span>
                </li>
            </ul>
            </section>
          
            
            


        <!-- 배송 정보 섹션 -->
        <section class="shipping-section">
            <h3>배송</h3>
            <ul class="shipping-detail-list">
                <!-- 배송 상세 항목 값 스타일 -->
				<li>
				    <span class="label">받는 분</span>
				    <span class="value receiver-value">홍길동</span>
				</li>
				<li>
				    <span class="label">연락처</span>
				    <span class="value phone-value">010-XXXX-XXXX</span>
				</li>
				<li>
				    <span class="label">주소</span>
				    <span class="value address-value">[000000] XX XX시 XX구 XX로 00-0 XXX아파트 X동 X호</span>
				</li>
				<li>
				    <span class="label">요청사항</span>
				    <span class="value request-value">요청사항 없음</span>
				</li>
			</ul>

             <!-- 평점 매기기 버튼 -->
        <button id="openPopupBtn">판매자 평점 매기기</button>

        <!-- 평점 팝업 -->
        <div class="rating-popup" id="ratingPopup" style="display: none;">
            <div class="popup-content">
                <div class="popup-header">
                    <h2>평점 매기기</h2>
                    <span class="close-btn">&times;</span>
                </div>

                <!-- 신뢰도 평점 -->
                <div class="rating-section">
                    <h2>신뢰도</h2>
                    <div class="star-rating" id="trustRating">
                        <span class="star" data-rating="1">★</span>
                        <span class="star" data-rating="2">★</span>
                        <span class="star" data-rating="3">★</span>
                        <span class="star" data-rating="4">★</span>
                        <span class="star" data-rating="5">★</span>
                    </div>
                </div>

                <!-- 품질 평점 -->
                <div class="rating-section">
                    <h2>품질</h2>
                    <div class="star-rating" id="qualityRating">
                        <span class="star" data-rating="1">★</span>
                        <span class="star" data-rating="2">★</span>
                        <span class="star" data-rating="3">★</span>
                        <span class="star" data-rating="4">★</span>
                        <span class="star" data-rating="5">★</span>
                    </div>
                </div>

                <!-- 소통 평점 -->
                <div class="rating-section">
                    <h2>소통</h2>
                    <div class="star-rating" id="communicationRating">
                        <span class="star" data-rating="1">★</span>
                        <span class="star" data-rating="2">★</span>
                        <span class="star" data-rating="3">★</span>
                        <span class="star" data-rating="4">★</span>
                        <span class="star" data-rating="5">★</span>
                    </div>
                </div>

                <!-- 배송 평점 -->
                <div class="rating-section">
                    <h2>배송</h2>
                    <div class="star-rating" id="shippingRating">
                        <span class="star" data-rating="1">★</span>
                        <span class="star" data-rating="2">★</span>
                        <span class="star" data-rating="3">★</span>
                        <span class="star" data-rating="4">★</span>
                        <span class="star" data-rating="5">★</span>
                    </div>
                </div>

                <!-- 평균 평점 출력 -->
                <p class="average-rating">평균 평점: <span id="averageRating">0</span> 점</p>

				<div class="review-section">
		            <h5>리뷰 남기기</h5>
		            <textarea id="reviewText" rows="4" placeholder="리뷰 내용을 작성하세요"></textarea>
		        </div>
		        
                <!-- 평점 제출 버튼 -->
                <button class="submit-rating">제출</button>
            </div>
        </div>
            
        

        </section>



    </div>

    <!-- JavaScript 파일 경로 JSP 처리 -->
    <script src="<%= request.getContextPath() %>/views/resources/js/BidDetail.js"></script>
    <script src="<%= request.getContextPath() %>/views/resources/js/ratingPopup.js"></script>

</body>
</html>
