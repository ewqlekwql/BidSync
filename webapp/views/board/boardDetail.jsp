<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // 서블릿에서 넘겨 받을 값
    String type = request.getParameter("type");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BidSync</title>

    <!-- 외부 css/js 연결 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/resources/css/board.css">
</head>
<body>
    <!-- 헤더 -->
    <jsp:include page="/views/common/header.jsp" />

    <!-- 메인 -->
    <main id="detail-main">
        <!-- 상품 정보 -->
        <article id="">
            <%--
                상품 이미지는 공통
                경매랑 중고 거래에 따라 오른쪽 정렬

                type값 받아서 처리하기


            --%>
        </article>
    </main>

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
                        <%--img URL DB에서 url 필드로 연결 --%>
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
</body>
</html>