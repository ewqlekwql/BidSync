document.addEventListener('DOMContentLoaded', function () {
    // LocalStorage에서 저장된 배송 정보 불러오기
	const receiver = localStorage.getItem('bid_receiver');
	const phone = localStorage.getItem('bid_phone');
	const address = localStorage.getItem('bid_address');
	const request = localStorage.getItem('bid_request');

    // 배송 정보 반영
    if (receiver && phone && address && request) {
        document.querySelector('.shipping-detail-list .receiver-value').innerText = receiver;
        document.querySelector('.shipping-detail-list .phone-value').innerText = phone;
        document.querySelector('.shipping-detail-list .address-value').innerText = address;
        document.querySelector('.shipping-detail-list .request-value').innerText = request;
    } else {
        alert('배송 정보를 불러오지 못했습니다. 로컬 스토리지에서 값을 확인하세요.'); // 사용자에게 알림 추가
        console.error('배송 정보를 불러오지 못했습니다.');
    }


	// 별점을 클릭하면 selected 클래스를 추가하고 데이터 저장

		    // 별점을 클릭하면 selected 클래스를 추가하고 데이터 저장
		    document.querySelectorAll('.star-rating .star').forEach(function (star) {
		        star.addEventListener('click', function () {
		            const ratingSection = this.parentElement;
		            const ratingType = ratingSection.id;
		            const ratingValue = parseInt(this.dataset.rating);

		            // 별점 초기화 후 선택된 별점 적용
		            ratingSection.querySelectorAll('.star').forEach(function (s) {
		                s.classList.remove('selected');
		            });
		            for (let i = 1; i <= ratingValue; i++) {
		                ratingSection.querySelector(`.star[data-rating="${i}"]`).classList.add('selected');
		            }

		            // 선택한 평점을 localStorage에 저장
		            localStorage.setItem(ratingType, ratingValue);

		            // 별점이 변경될 때마다 레이팅 바 업데이트
		            updateRatingBars();
		        });
		    });

		    // 레이팅 바 업데이트 함수
		    function updateRatingBars() {
		        const trustRating = parseInt(localStorage.getItem('trustRating')) || 0;
		        const qualityRating = parseInt(localStorage.getItem('qualityRating')) || 0;
		        const communicationRating = parseInt(localStorage.getItem('communicationRating')) || 0;
		        const shippingRating = parseInt(localStorage.getItem('shippingRating')) || 0;

		        const trustBar = document.querySelector('.rating-categories .category:nth-child(1) .fill');
		        if (trustBar) trustBar.style.width = (trustRating / 5) * 100 + '%';

		        const qualityBar = document.querySelector('.rating-categories .category:nth-child(2) .fill');
		        if (qualityBar) qualityBar.style.width = (qualityRating / 5) * 100 + '%';

		        const communicationBar = document.querySelector('.rating-categories .category:nth-child(3) .fill');
		        if (communicationBar) communicationBar.style.width = (communicationRating / 5) * 100 + '%';

		        const shippingBar = document.querySelector('.rating-categories .category:nth-child(4) .fill');
		        if (shippingBar) shippingBar.style.width = (shippingRating / 5) * 100 + '%';
		    }

		    // 페이지 로드 시 기존 저장된 별점으로 레이팅 바 초기화
		    updateRatingBars();
		});

