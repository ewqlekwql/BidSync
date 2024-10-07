<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 등록</title>
    
    <link rel="stylesheet" href="<%= request.getContextPath() %>/views/resources/css/Purchase completed.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/views/resources/css/Sales Page.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>BID SYNC</h1>
            <input type="text" placeholder="검색어를 입력해 주세요..." class="search-bar">
            <button class="search-btn">검색</button>
        </header>

        <nav class="menu">
            <a href="#">패션</a>
            <a href="#">디지털</a>
            <a href="#">스포츠</a>
            <a href="#">친구</a>
            <a href="#">예술</a>
            <a href="#">홈</a>
            <a href="#">건강</a>
            <a href="#">뷰티</a>
            <a href="#">기타</a>
        </nav>

        <main>
            <h2>판매할 상품을 등록해 주세요.</h2>

            <form class="product-form" onsubmit="submitForm(event)">
                <div class="image-upload">
                    <p>등록할 상품의 이미지를 넣어주세요.</p>
                    <img src="image/자전거.png" alt="상품 이미지" id="product-image">
                </div>

                <div class="product-details">
                    <label for="title">제목</label>
                    <input type="text" id="title" placeholder="제목" required>

                    <label for="price">판매가</label>
                    <input type="text" id="price" placeholder="가격을 입력해 주세요." required>

                    <label for="duration">판매 기간</label>
                    <select id="duration" required>
                        <option value="1일">1일</option>
                        <option value="3일">3일</option>
                        <option value="7일">7일</option>
                        <option value="15일">15일</option>
                        <option value="30일">30일</option>
                    </select>

                    <label for="category">구분</label>
                    <select id="category" required>
                        <option value="패션">패션</option>
                        <option value="디지털·가전">디지털·가전</option>
                        <option value="스포츠">스포츠</option>
                        <option value="홈·데코">홈·데코</option>
                        <option value="완구">완구</option>
                        <option value="미술">미술</option>
                        <option value="취미">취미</option>
                    </select>

                    <label for="description">상품 설명</label>
                    <textarea id="description" placeholder="상품 설명을 입력해 주세요." required></textarea>
                </div>

                <button type="submit" class="submit-btn">등록하기</button>
            </form>
        </main>

        <!-- 팝업 창 -->
        <div class="popup-container" id="popup" style="display: none;">
            <h1>BID SYNC</h1>
            <h2>상품이 성공적으로 등록되었습니다!</h2>

            <div class="product-info">
                <h3>등록된 상품 정보</h3>
                <p id="product-title"></p>
                <p id="product-price"></p>
                <p id="product-duration"></p>
                <p id="product-category"></p>
                <p id="product-description"></p>
            </div>
            <br>
            <button class="popup-btn" onclick="closePopup()">확인</button>
        </div>
    </div>

    <script src="<%= request.getContextPath() %>/views/resources/js/Sales Page.js"></script>
    <script src="<%= request.getContextPath() %>/views/resources/js/Purchase completed.js"></script>

</body>
</html>
