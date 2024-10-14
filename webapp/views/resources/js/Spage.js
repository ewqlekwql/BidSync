// 상품을 동적으로 리스트에 추가하는 함수
function addProduct() {
    // 추가할 상품 정보
    const title = "새 상품";
    const description = "새로운 상품 설명";
    const price = "150,000 원";
    const rating = "★★★★★ (5.0)";
    const imageSrc = "image/product-new.PNG";

    // 상품 카드 HTML 템플릿
    const productCard = `
        <article class="product-card">
            <img src="${imageSrc}" alt="상품 이미지" class="product-image">
            <h3 class="product-title">${title}</h3>
            <p class="product-description">${description}</p>
            <p class="product-down">${price}</p>
            <div class="rating">${rating}</div>
        </article>
    `;

    // 상품 리스트에 추가
    const productList = document.getElementById('product-list');
    productList.innerHTML += productCard;
}