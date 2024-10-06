// 팝업 열기/닫기 기능
document.getElementById('openPopupBtn').addEventListener('click', function () {
    document.getElementById('ratingPopup').style.display = 'flex';
});

document.querySelector('.close-btn').addEventListener('click', function () {
    document.getElementById('ratingPopup').style.display = 'none';
});

// 별점 선택 기능
const starRatings = {
    trustRating: 0,
    qualityRating: 0,
    communicationRating: 0,
    shippingRating: 0
};

// 별점을 클릭하여 선택하는 함수
function selectStar(ratingId, stars, ratingValue) {
    starRatings[ratingId] = ratingValue;
    stars.forEach(star => star.classList.remove('selected'));
    for (let i = 0; i < ratingValue; i++) {
        stars[i].classList.add('selected');
    }
    calculateAverageRating();
}

// 각 평점 섹션에 이벤트 리스너 추가
['trustRating', 'qualityRating', 'communicationRating', 'shippingRating'].forEach(ratingId => {
    const stars = document.querySelectorAll(`#${ratingId} .star`);
    stars.forEach(star => {
        star.addEventListener('click', function() {
            const ratingValue = this.getAttribute('data-rating');  // 선택된 별점 값
            selectStar(ratingId, stars, ratingValue);
        });
    });
});

// 평균 평점을 계산하는 함수
function calculateAverageRating() {
    const total = Object.values(starRatings).reduce((sum, rating) => sum + parseInt(rating), 0);
    const average = total / 4;
    document.getElementById('averageRating').textContent = average.toFixed(1);
}

// 평점 제출
document.querySelector('.submit-rating').addEventListener('click', function () {
    alert(`판매자 평점을 제출했습니다.`);
    document.getElementById('ratingPopup').style.display = 'none';
});
