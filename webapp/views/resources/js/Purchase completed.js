// 로컬 스토리지에서 데이터 가져오기
const title = localStorage.getItem('productTitle');
const price = localStorage.getItem('productPrice');
const duration = localStorage.getItem('productDuration');
const category = localStorage.getItem('productCategory');
const description = localStorage.getItem('productDescription');

// 가져온 데이터를 HTML 요소에 표시하기
document.getElementById('product-title').textContent = `제목: ${title}`;
document.getElementById('product-price').textContent = `가격: ${price}원`;
document.getElementById('product-duration').textContent = `판매 기간: ${duration}`;
document.getElementById('product-category').textContent = `카테고리: ${category}`;
document.getElementById('product-description').textContent = `상품 설명: ${description}`;