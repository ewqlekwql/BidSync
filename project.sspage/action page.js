function submitForm(event) {
    event.preventDefault();  // 폼의 기본 제출 동작을 막음

    // 입력된 값 가져오기
    const title = document.getElementById('title').value;
    const price = document.getElementById('price').value;
    const hour = document.getElementById('hour').value;
    const minute = document.getElementById('minute').value;
    const ampm = document.getElementById('ampm').value;
    const duration = document.getElementById('duration').value;
    const category = document.getElementById('category').value;
    const description = document.getElementById('description').value;

    // 값이 입력되지 않은 경우 경고 메시지 표시
    if (!title || !price || !description) {
        alert("제목, 가격, 설명을 모두 입력해 주세요.");
        return;
    }

    // 저장하기 (로컬 스토리지 사용)
    localStorage.setItem('productTitle', title);
    localStorage.setItem('productPrice', price);
    localStorage.setItem('productTime', `${hour}:${minute} ${ampm}`);
    localStorage.setItem('productDuration', duration);
    localStorage.setItem('productCategory', category);
    localStorage.setItem('productDescription', description);

    // 등록 완료 후 새로운 페이지로 이동
    window.location.href = "Purchase completed.html";
}