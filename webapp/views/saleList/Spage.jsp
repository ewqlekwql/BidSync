<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>BidSync Shop</title>
        <link rel="stylesheet" href="<%= request.getContextPath() %>/views/resources/css/Spage.css">
        <link rel="stylesheet" href="<%= request.getContextPath() %>/views/resources/css/index.css">
        <link rel="stylesheet" href="<%= request.getContextPath() %>/views/resources/css/index.css">
    </head>
    <body>

        <jsp:include page="/views/common/header.jsp" />
    
        <div class="main-layout">
            <aside class="sidebar">
                <h3>카테고리</h3>
                <ul>
                    <li><a href="#">패션</a></li>
                    <li><a href="#">디지털·가전</a></li>
                    <li><a href="#">스포츠</a></li>
                    <li><a href="#">홈·데코</a></li>
                    <li><a href="#">완구</a></li>
                    <li><a href="#">미술</a></li>
                    <li><a href="#">취미</a></li>
                </ul>
            </aside>
    
            <section class="content-section">
                <header class="section-header">
                    <h2>BID SHOP</h2>
                </header>
    
                <nav class="nav-tabs">
                    <ul>
                        <li><a href="#" class="tab">NEW</a></li>
                        <li><a href="#" class="tab-active">HOT</a></li>
                        <li><a href="#" class="tab">BEST</a></li>
                    </ul>
                </nav>
                
                <div class="product-list">
                    <article class="product-card" onclick="window.location.href='../prdinfo/prdinfoBID.jsp'">
                        <img src="image/자전거.PNG" alt="상품 이미지" class="product-image">
                        <h3 class="product-title">삼춘리 자전거</h3>
                        <p class="product-description">오르비스 700C 14단 그레블 로드 사이클</p>
                        <p class="product-down"> 200,000 원</p>
                        <div class="rating">★★★★ (4.0)</div>
                    </article>
    
                    <article class="product-card">
                        <img src="image/자전거.PNG" alt="상품 이미지" class="product-image">
                        <h3 class="product-title">삼춘리 자전거</h3>
                        <p class="product-description">오르비스 700C 14단 그레블 로드 사이클</p>
                        <p class="product-down"> 200,000 원</p>
                        <div class="rating">★★★★ (4.0)</div>
                    </article>

                    <article class="product-card">
                        <img src="image/자전거.PNG" alt="상품 이미지" class="product-image">
                        <h3 class="product-title">삼춘리 자전거</h3>
                        <p class="product-description">오르비스 700C 14단 그레블 로드 사이클</p>
                        <p class="product-down"> 200,000 원</p>
                        <div class="rating">★★★★ (4.0)</div>
                    </article>

                    <article class="product-card">
                        <img src="image/자전거.PNG" alt="상품 이미지" class="product-image">
                        <h3 class="product-title">삼춘리 자전거</h3>
                        <p class="product-description">오르비스 700C 14단 그레블 로드 사이클</p>
                        <p class="product-down"> 200,000 원</p>
                        <div class="rating">★★★★ (4.0)</div>
                    </article>
                </div>

                <div class="product-list">
    
                    <article class="product-card">
                        <img src="image/자전거.PNG" alt="상품 이미지" class="product-image">
                        <h3 class="product-title">삼춘리 자전거</h3>
                        <p class="product-description">오르비스 700C 14단 그레블 로드 사이클</p>
                        <p class="product-down"> 200,000 원</p>
                        <div class="rating">★★★★ (4.0)</div>
                    </article>
    
                    <article class="product-card">
                        <img src="image/자전거.PNG" alt="상품 이미지" class="product-image">
                        <h3 class="product-title">삼춘리 자전거</h3>
                        <p class="product-description">오르비스 700C 14단 그레블 로드 사이클</p>
                        <p class="product-down"> 200,000 원</p>
                        <div class="rating">★★★★ (4.0)</div>
                    </article>

                    <article class="product-card">
                        <img src="image/자전거.PNG" alt="상품 이미지" class="product-image">
                        <h3 class="product-title">삼춘리 자전거</h3>
                        <p class="product-description">오르비스 700C 14단 그레블 로드 사이클</p>
                        <p class="product-down"> 200,000 원</p>
                        <div class="rating">★★★★ (4.0)</div>
                    </article>

                    <article class="product-card">
                        <img src="image/자전거.PNG" alt="상품 이미지" class="product-image">
                        <h3 class="product-title">삼춘리 자전거</h3>
                        <p class="product-description">오르비스 700C 14단 그레블 로드 사이클</p>
                        <p class="product-down"> 200,000 원</p>
                        <div class="rating">★★★★ (4.0)</div>
                    </article>
                </div>

                <div class="product-list">
    
                    <article class="product-card">
                        <img src="product-image.jpg" alt="상품 이미지" class="product-image">
                        <h3 class="product-title">상품 등록명 (현재 입찰가) 원</h3>
                        <p class="product-description">상품 설명</p>
                        <div class="rating">★★★★★ (4.5)</div>
                    </article>
    
                    <article class="product-card">
                        <img src="product-image.jpg" alt="상품 이미지" class="product-image">
                        <h3 class="product-title">상품 등록명 (현재 입찰가) 원</h3>
                        <p class="product-description">상품 설명</p>
                        <div class="rating">★★★★★ (4.5)</div>
                    </article>

                    <article class="product-card">
                        <img src="product-image.jpg" alt="상품 이미지" class="product-image">
                        <h3 class="product-title">상품 등록명 (현재 입찰가) 원</h3>
                        <p class="product-description">상품 설명</p>
                        <div class="rating">★★★★★ (4.5)</div>
                    </article>

                    <article class="product-card">
                        <img src="product-image.jpg" alt="상품 이미지" class="product-image">
                        <h3 class="product-title">상품 등록명 (현재 입찰가) 원</h3>
                        <p class="product-description">상품 설명</p>
                        <div class="rating">★★★★★ (4.5)</div>
                    </article>
                </div>

                <div class="product-list">
    
                    <article class="product-card">
                        <img src="product-image.jpg" alt="상품 이미지" class="product-image">
                        <h3 class="product-title">상품 등록명 (현재 입찰가) 원</h3>
                        <p class="product-description">상품 설명</p>
                        <div class="rating">★★★★★ (4.5)</div>
                    </article>
    
                    <article class="product-card">
                        <img src="product-image.jpg" alt="상품 이미지" class="product-image">
                        <h3 class="product-title">상품 등록명 (현재 입찰가) 원</h3>
                        <p class="product-description">상품 설명</p>
                        <div class="rating">★★★★★ (4.5)</div>
                    </article>

                    <article class="product-card">
                        <img src="product-image.jpg" alt="상품 이미지" class="product-image">
                        <h3 class="product-title">상품 등록명 (현재 입찰가) 원</h3>
                        <p class="product-description">상품 설명</p>
                        <div class="rating">★★★★★ (4.5)</div>
                    </article>

                    <article class="product-card">
                        <img src="product-image.jpg" alt="상품 이미지" class="product-image">
                        <h3 class="product-title">상품 등록명 (현재 입찰가) 원</h3>
                        <p class="product-description">상품 설명</p>
                        <div class="rating">★★★★★ (4.5)</div>
                    </article>
                </div>

                <div class="product-list">
    
                    <article class="product-card">
                        <img src="product-image.jpg" alt="상품 이미지" class="product-image">
                        <h3 class="product-title">상품 등록명 (현재 입찰가) 원</h3>
                        <p class="product-description">상품 설명</p>
                        <div class="rating">★★★★★ (4.5)</div>
                    </article>
    
                    <article class="product-card">
                        <img src="product-image.jpg" alt="상품 이미지" class="product-image">
                        <h3 class="product-title">상품 등록명 (현재 입찰가) 원</h3>
                        <p class="product-description">상품 설명</p>
                        <div class="rating">★★★★★ (4.5)</div>
                    </article>

                    <article class="product-card">
                        <img src="product-image.jpg" alt="상품 이미지" class="product-image">
                        <h3 class="product-title">상품 등록명 (현재 입찰가) 원</h3>
                        <p class="product-description">상품 설명</p>
                        <div class="rating">★★★★★ (4.5)</div>
                    </article>

                    <article class="product-card">
                        <img src="product-image.jpg" alt="상품 이미지" class="product-image">
                        <h3 class="product-title">상품 등록명 (현재 입찰가) 원</h3>
                        <p class="product-description">상품 설명</p>
                        <div class="rating">★★★★★ (4.5)</div>
                    </article>
                </div>

            </section>
        </div>
    
        <footer class="footer">
            <p>&copy; 2024 BidSync. All rights reserved.</p>
        </footer>
    </body>
    </html>