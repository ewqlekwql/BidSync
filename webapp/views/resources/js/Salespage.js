// 이미지 미리보기 함수
function previewImage(event) {
    const file = event.target.files[0]; // 선택된 파일을 가져옴
    const preview = document.getElementById('product-image'); // 미리보기 이미지를 가져옴

    // 파일이 있는지 확인
    if (file) {
        const reader = new FileReader();

        // 파일 읽기가 완료되면 실행되는 함수
        reader.onload = function(e) {
            preview.src = e.target.result; // 미리보기 이미지 설정
        };

        reader.readAsDataURL(file); // 파일을 읽어서 URL로 변환
    }
}

// 폼 제출을 처리하는 함수
function submitForm(event) {
    event.preventDefault(); // 폼의 기본 제출 동작을 막음
    console.log("폼이 제출되었습니다."); // 로그로 확인

    // 입력된 값들을 가져오기
    const title = document.getElementById('title').value;
    const price = document.getElementById('price').value;
    const duration = document.getElementById('duration').value;
    const category = document.getElementById('category').value;
    const description = document.getElementById('description').value;
    const imageSrc = document.getElementById('product-image').src;

    // 유효성 검사: 가격이 숫자인지 확인
    if (isNaN(price)) {
        alert("가격은 숫자로 입력해 주세요.");
        return;
    }

    // 유효성 검사: 이미지가 업로드되지 않았을 경우
    if (imageSrc.includes('placeholder') || imageSrc === "") {
        alert("이미지를 업로드해 주세요.");
        return;
    }

    // 팝업의 내용 업데이트
    document.getElementById('product-title').textContent = "제목: " + title;
    document.getElementById('product-price').textContent = "가격: " + price;
    document.getElementById('product-duration').textContent = "판매 기간: " + duration;
    document.getElementById('product-category').textContent = "카테고리: " + category;
    document.getElementById('product-description').textContent = "상품 설명: " + description;

    // 팝업 창의 이미지도 설정
    document.getElementById('popup-product-image').src = imageSrc;

    // 팝업을 화면에 표시
    document.getElementById('popup').style.display = 'block';
}

