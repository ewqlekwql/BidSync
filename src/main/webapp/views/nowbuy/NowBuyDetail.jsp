<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>구매 완료 페이지</title>
    <!-- CSS 파일 경로를 JSP 방식으로 동적으로 처리 -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/views/resources/css/NowBuyDetail.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/views/resources/css/index.css">
</head>
<body>
    <div class="container">
        <!-- Header (header.jsp 포함) -->
        <jsp:include page="/views/common/header.jsp" />
    

        <!-- 구매 완료 섹션 -->
        <section class="bid-section">
            <h2>구매 완료</h2>
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

        <!-- 구매 내역 섹션 -->
        <section class="bid-detail-section">
            <h3>구매 내역</h3>
            <ul class="bid-detail-list">
                <li>
                    <span class="label">구매가</span>
                    <span class="value">100,000,000 원</span>
                </li>
                <li>
                    <span class="label">배송비</span>
                    <span class="value">100 원</span>
                </li>
                <li>
                    <span class="label">구매일</span>
                    <span class="value">XX/XX/XX</span>
                </li>
            </ul>

            <!-- 총 결제 금액 섹션 -->
            <div class="total-amount">
                <span>총 결제 금액</span>
                <span>100,000,100 원</span>
            </div>
        </section>

        <!-- 배송 정보 섹션 -->
        <section class="shipping-section">
            <h3>배송</h3>
            <ul class="shipping-detail-list">
                <li>
                    <span class="label">받는 분</span>
                    <span class="value">홍길동</span>
                </li>
                <li>
                    <span class="label">연락처</span>
                    <span class="value">010-XXXX-XXXX</span>
                </li>
                <li>
                    <span class="label">주소</span>
                    <span class="value">[000000] XX XX시 XX구 XX로 00-0 XXX아파트 X동 X호</span>
                </li>
                <li>
                    <span class="label">요청사항</span>
                    <span class="value">요청사항 없음</span>
                </li>
            </ul>
        </section>

        <!-- Footer -->
    <footer class="footer">
        <p>&copy; 2024 BidSync. All rights reserved.</p>
    </footer>
    </div>

    <!-- JavaScript 파일 경로 JSP 처리 -->
    <script src="<%= request.getContextPath() %>/views/resources/js/NowBuyDetail.js"></script>
</body>
</html>
