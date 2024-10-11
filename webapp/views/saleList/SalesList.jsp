<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>판매중 및 입찰중인 물품 목록</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/views/resources/css/SalesList.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/views/resources/css/index.css">
</head>
<body>
     <div class="container">
        
        <jsp:include page="/views/common/header.jsp" />

        <main>
            <h2>판매중인 물품 목록</h2>
            <table class="product-list" id="sales-list">
                <thead>
                    <tr>
                        <th><input type="checkbox" id="select-all-sales" onclick="toggleCheckboxes(this)"></th>
                        <th>구분</th>
                        <th>이미지</th>
                        <th>물품명</th>
                        <th>가격</th>
                        <th>마감일</th>
                        <th>판매 여부</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="checkbox" class="sales-checkbox"></td>
                        <td>뷰티</td>
                        <td><img src="lipstick.jpg" alt="립스틱" class="product-image"></td>
                        <td>립스틱</td>
                        <td>50,000</td>
                        <td>2024-10-10</td>
                        <td>판매중</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" class="sales-checkbox"></td>
                        <td>스포츠</td>
                        <td><img src="badminton_racket.jpg" alt="배드민턴 채" class="product-image"></td>
                        <td>배드민턴 채</td>
                        <td>120,000</td>
                        <td>2024-10-20</td>
                        <td>판매 완료</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" class="sales-checkbox"></td>
                        <td>패션</td>
                        <td><img src="pants.jpg" alt="바지" class="product-image"></td>
                        <td>바지</td>
                        <td>15,000</td>
                        <td>2024-10-30</td>
                        <td>판매 실패</td>
                    </tr>
                </tbody>
            </table>

            <div class="action-buttons">
			    <button onclick="deleteSelected('sales-list', 'sales-checkbox')">삭제하기</button>
			    <button onclick="window.location.href='../sale/SalesPage.jsp'">등록하기</button>
			
            </div>

            
<h2>입찰중인 물품 목록</h2>
<table class="product-list" id="bidding-list">
    <thead>
        <tr>
            <th><input type="checkbox" id="select-all-bidding"></th>
            <th>구분</th>
            <th>이미지</th>
            <th>물품명</th>
            <th>판매가</th>
            <th>입찰</th>
            <th>마감일</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><input type="checkbox" class="bidding-checkbox"></td>
            <td>뷰티</td>
            <td><img src="lipstick.jpg" alt="립스틱" class="product-image"></td>
            <td>립스틱</td>
            <td>50,000</td>
            <td>2024-10-10</td>
            <td>진행중</td>
        </tr>
        <tr>
            <td><input type="checkbox" class="bidding-checkbox"></td>
            <td>스포츠</td>
            <td><img src="badminton_racket.jpg" alt="배드민턴 채" class="product-image"></td>
            <td>배드민턴 채</td>
            <td>120,000</td>
            <td>2024-10-20</td>
            <td>입찰 완료</td>
        </tr>
        <tr>
            <td><input type="checkbox" class="bidding-checkbox"></td>
            <td>패션</td>
            <td><img src="pants.jpg" alt="바지" class="product-image"></td>
            <td>바지</td>
            <td>15,000</td>
            <td>2024-10-30</td>
            <td>입찰 실패</td>
        </tr>
    </tbody>
</table>

<div class="action-buttons">
    <button onclick="deleteSelected('bidding-list', 'bidding-checkbox')">삭제하기</button>
    <button onclick="window.location.href='../sale/ActionPage.jsp'">등록하기</button>
</div>

</main>
</div>

            <!-- 팝업 오버레이 -->
            <div class="popup-overlay" id="popup-overlay">
                <div class="popup-content">
                    <h3 id="popup-message">삭제되었습니다.</h3>
                    <button class="popup-btn" onclick="closePopup()">확인</button>
                </div>
            </div>

        </main>
    </div>

    <script src="<%= request.getContextPath() %>/views/resources/js/SalesList.js"></script>
</body>
</html>
