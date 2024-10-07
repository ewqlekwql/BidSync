function submitForm(event) {
    event.preventDefault(); // 폼의 기본 제출 동작을 막음

    // 입력된 값들을 가져오기
    const title = document.getElementById('title').value;
    const price = document.getElementById('price').value;
    const duration = document.getElementById('duration').value;
    const category = document.getElementById('category').value;
    const description = document.getElementById('description').value;

    // 팝업의 내용 업데이트
    document.getElementById('product-title').textContent = "제목: " + title;
    document.getElementById('product-price').textContent = "가격: " + price;
    document.getElementById('product-duration').textContent = "판매 기간: " + duration;
    document.getElementById('product-category').textContent = "카테고리: " + category;
    document.getElementById('product-description').textContent = "상품 설명: " + description;

    // 팝업을 화면에 표시
    document.getElementById('popup').style.display = 'block';
}

// 팝업을 닫는 함수
function closePopup() {
    document.getElementById('popup').style.display = 'none';
}