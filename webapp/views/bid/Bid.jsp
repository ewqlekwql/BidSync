<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/views/resources/css/Bid.css"> <!-- 메인 스타일 -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/views/resources/css/AddressPopUp.css"> <!-- 주소 팝업 스타일 -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/views/resources/css/AddressAddPopUp.css"> <!-- 주소 추가 팝업 스타일 -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/views/resources/css/RequestPopUp.css"> <!-- 요청 사항 팝업 스타일 -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/views/resources/css/AccountChangePopUp.css"> <!-- 카드 변경 팝업 스타일 -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/views/resources/css/index.css">
</head>
<body>
    <div class="container">
        
        <jsp:include page="/views/common/header.jsp" />

        <!-- 주문 상품 Section -->
        <div class="order-product">
            <div class="product-image">
                <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/170356472022385905.jpg?gif=1&w=640&h=640&c=c&webp=1" alt="상품 이미지">
            </div>
            <div class="product-details">
                <h2>상품명</h2>
                <p><strong>100,000,100원</strong></p>
                <p>배송비 5,000원</p>
            </div>
        </div>

         <!-- 배송 주소 Section -->
         <div class="shipping-info">
            <div class="info-header">
                <h2>배송 주소</h2>
                <button class="address-change-btn">주소 변경</button>
            </div>
            <div class="address-details">
                <div class="row">
                    <p class="label"><strong>받는 분</strong></p>
                    <p class="value">홍길동</p>
                </div>
                <div class="row">
                    <p class="label"><strong>연락처</strong></p>
                    <p class="value">010-XXXX-XXXX</p>
                </div>
                <div class="row">
                    <p class="label"><strong>주소</strong></p>
                    <p class="value">[000000] XX XX시 XX구 XX로 00-0 XXX아파트 X동 X호</p>
                </div>
            </div>
            <div class="request-popup-trigger">
                <button id="request-button" class="custom-button">요청사항 없음</button>
            </div>
        </div>

         <!-- 결제 방법 Section -->
        <div class="payment-method">
            <h2>결제 방법</h2>
           <div class="payment-options">
			    <label>
			        <input type="radio" name="payment" value="card" checked>
			        카드 간편결제
			    </label>
			    <label>
			        <input type="radio" name="payment" value="kakao">
			        카카오페이
			    </label>
			    <label>
			        <input type="radio" name="payment" value="bank">
			        무통장입금
			    </label>
			</div>
            <div class="card-info">
			    <span>KB 국민 XXXX-XXXX-XXXX-XXXX</span> <!-- 이 부분이 업데이트됨 -->
			    <span class="arrow">▼</span>
			</div>
            <p class="notice">
                구매 입찰은 일시불만 지원합니다. 체결 후 결제 정보 변경은 불가하며 분할 납부 변경은 카드사 문의 바랍니다. <br>
                단, 카드사별 정책에 따라 분할 납부 변경 시 수수료가 발생할 수 있습니다.
            </p>
        </div>

        <!-- 최종 주문 정보 섹션 -->
        <div class="final-order-info">
            <h3>최종 주문정보</h3>
            <!-- 입찰 희망가와 가격 정보 -->
            <div class="price-summary">
                <span>입찰 희망가</span>
                <span class="price">100,000,100 원</span>
            </div>

            <!-- 구분선 -->
            <hr class="dotted-line">
            
            <!-- 배송비 -->
            <div class="price-summary">
                <span>배송비</span>
                <span class="price">+ 5,000 원</span>
            </div>
            
            <!-- 수수료 -->
            <div class="price-summary">
                <span>수수료</span>
                <span class="price">+ 1,000 원</span>
            </div>

            <!-- 총 결제금액 -->
            <div class="total-amount">
                <span>총 결제금액</span>
                <span class="total-price">100,006,100 원</span>
            </div>
        </div>


        <!-- 구매하기 Button -->
        <button class="purchase-btn">구매 하기</button>

        <!-- 팝업 -->
        <div id="address-popup-container" class="popup-container" style="display: none;">
            <!-- 주소 팝업 내용 -->
            <div class="popup">
                <div class="popup-header">
                    <h2>주소록</h2>
                    <span class="close-btn">&times;</span>
                </div>
                <button class="add-address-btn">+ 새 주소 추가하기</button>
                <div class="address-list">
                    <!-- 추가적인 주소 목록들 -->
                </div>
                <button class="select-address-btn">주소 선택</button>
            </div>
        </div>

        <div id="address-add-popup-container" class="popup-container" style="display: none;">
            <div class="popup">
                <div class="popup-header">
                    <span class="back-btn">←</span>
                    <h2>주소 추가하기</h2>
                    <span class="close-btn">&times;</span>
                </div>
        
                <form class="address-form">
                    <label for="name">이름</label>
                    <input type="text" id="name" name="name" placeholder="이름을 입력하세요">
        
                    <label for="phone">휴대폰 번호</label>
                    <input type="tel" id="phone" name="phone" placeholder="휴대폰 번호를 입력하세요">
        
                    <label for="zipcode">우편번호</label>
                    <input type="text" id="zipcode" name="zipcode" placeholder="우편번호를 입력하세요">
        
                    <label for="address">주소</label>
                    <input type="text" id="address" name="address" placeholder="주소를 입력하세요">
        
                    <label for="detail">상세주소</label>
                    <input type="text" id="detail" name="detail" placeholder="상세주소를 입력하세요">
        
                    <button type="button" class="a-save-btn">저장 하기</button>
                </form>
            </div>
        </div>

        <!-- 요청사항 팝업 내용 -->
        <div id="request-popup-container" class="popup-container" style="display: none;">
            <div class="popup">
                <div class="popup-header">
                    <h2>배송 요청사항</h2>
                    <span class="close-btn">&times;</span>
                </div>
                <div class="request-options">
                    <label><input type="radio" name="request" value="none"> 요청사항 없음</label>
                    <label><input type="radio" name="request" value="door"> 문 앞에 놓아주세요</label>
                    <label><input type="radio" name="request" value="security"> 경비실에 맡겨 주세요</label>
                    <label><input type="radio" name="request" value="fragile"> 파손 위험 상품입니다. 배송 시 주의해주세요</label>
                    <label><input type="radio" name="request" value="custom" id="customRequest"> 직접 입력</label>
                </div>
                <textarea id="customTextArea" class="custom-input" placeholder="요청사항을 입력하세요..." disabled></textarea>

                <!-- 저장하기 버튼에 명확하게 type="button" 추가 -->
                <button class="r-save-btn" type="button">저장 하기</button>
            </div>
        </div>
    </div>
    
    <!-- 계좌 정보 변경 팝업 -->
        <div id="account-change-popup-container" class="popup-container" style="display: none;">
            <div class="popup">
                <div class="popup-header">
                    <h2>계좌 정보 변경</h2>
                    <span class="close-btn">&times;</span>
                </div>
                <form class="account-change-form">
                    <label for="bank">은행 선택</label>
                    <select id="bank" name="bank">
                        <option value="kb">KB 국민은행</option>
                        <option value="shinhan">신한은행</option>
                        <option value="woori">우리은행</option>
                        <option value="kakao">카카오뱅크</option>
                    </select>

                    <label for="accountNumber">계좌 번호</label>
                    <input type="text" id="accountNumber" name="accountNumber" placeholder="XXXX-XXXX-XXXX-XXXX">

                    <button type="button" class="account-save-btn">저장 하기</button>
                </form>
            </div>
        </div>

    </div>

    <!-- JavaScript 파일 연결 -->
    <script src="<%= request.getContextPath() %>/views/resources/js/Bid.js"></script>

</body>
</html>
