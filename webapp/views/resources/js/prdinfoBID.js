document.addEventListener('DOMContentLoaded', function() {
    // 팝업 표시 및 숨기기 처리
    const placeBidButton = document.querySelector('.place-bid');
    const closeButton = document.querySelector('.close-btn');
    const popup = document.getElementById('prdinfoBID');

    if (placeBidButton) {
        placeBidButton.addEventListener('click', function() {
            popup.style.display = 'flex';
        });
    }

    if (closeButton) {
        closeButton.addEventListener('click', function() {
            popup.style.display = 'none';
        });
    }

    // "입찰하기" 버튼 클릭 시 결제 페이지로 이동
    const bidButton = document.querySelector('.bid-btn');
    if (bidButton) {
        bidButton.addEventListener('click', function() {
            const bidAmount = document.getElementById('bidAmount').value; // 사용자가 입력한 금액
            if (bidAmount) {
                // 입력한 금액으로 결제 페이지로 이동 또는 다른 처리
                console.log(`입력한 입찰 금액: ${bidAmount}원`);
                window.location.href = `../bid/Bid.jsp?bidAmount=${bidAmount}`; // 결제 페이지로 이동
            } else {
                alert('입찰 금액을 입력하세요.');
            }
        });
    }

    // "즉시 구매" 버튼 클릭 시 NowBuy 페이지로 이동
    const buyNowButton = document.querySelector('.buy-now');
    if (buyNowButton) {
        buyNowButton.addEventListener('click', function() {
            window.location.href = '../nowbuy/NowBuy.jsp'; // NowBuy 페이지로 이동
        });
    }

    // 썸네일을 클릭하면 메인 이미지를 바꾸는 함수
    const thumbnails = document.querySelectorAll('.thumbnail');
    thumbnails.forEach(function(thumbnail) {
        thumbnail.addEventListener('click', function() {
            const mainImage = document.getElementById('mainImage');
            mainImage.src = thumbnail.src.replace('480', '640'); // 썸네일 크기를 메인 이미지 크기로 적용
        });
    });

    // 리뷰 데이터를 미리 정의
    const reviews = [
        { id: 1, user: '구매자 아이디1', date: '2024-09-01', content: '리뷰 내용 1' },
        { id: 2, user: '구매자 아이디2', date: '2024-09-02', content: '리뷰 내용 2' },
        { id: 3, user: '구매자 아이디3', date: '2024-09-03', content: '리뷰 내용 3' },
        { id: 4, user: '구매자 아이디4', date: '2024-09-04', content: '리뷰 내용 4' },
        { id: 5, user: '구매자 아이디5', date: '2024-09-05', content: '리뷰 내용 5' },
    ];

    let visibleReviews = 2; // 처음에 보여줄 리뷰 개수
    const reviewContainer = document.getElementById('reviewContainer');
    const loadMoreBtn = document.getElementById('loadMoreBtn');

    // 리뷰를 로드하는 함수
    function loadReviews(start, count) {
        for (let i = start; i < Math.min(start + count, reviews.length); i++) {
            const review = reviews[i];
            const reviewItem = document.createElement('div');
            reviewItem.classList.add('review-item');
            reviewItem.innerHTML = `
                <p><strong>${review.user}</strong> | ${review.date}</p>
                <p>${review.content}</p>
                <hr class="dotted-line" />
            `;
            reviewContainer.appendChild(reviewItem);
        }
    }

    // 초기 2개의 리뷰 로드
    loadReviews(0, visibleReviews);

    // "모든 리뷰 보기" 버튼 클릭 시 남은 모든 리뷰 로드
    if (loadMoreBtn) {
        loadMoreBtn.addEventListener('click', function() {
            const remainingReviews = reviews.length - visibleReviews;
            loadReviews(visibleReviews, remainingReviews); // 남은 모든 리뷰 로드
            visibleReviews += remainingReviews;

            // 모든 리뷰가 로드되면 버튼 숨기기
            if (visibleReviews >= reviews.length) {
                loadMoreBtn.style.display = 'none';
            }
        });
    }

    // "관심 목록에 추가" 버튼 클릭 시 관심 목록 페이지로 이동
    const addToListButton = document.querySelector('.add-to-list');
    if (addToListButton) {
        addToListButton.addEventListener('click', function() {
            window.location.href = '../Wishlist/Wishlist.html'; // 관심 목록 페이지로 이동
        });
    }

    // "스토어 방문" 버튼 클릭 시 스토어 페이지로 이동
    const visitStoreButton = document.querySelector('.visit-store');
    if (visitStoreButton) {
        visitStoreButton.addEventListener('click', function() {
            window.location.href = '../saleList/SalesList.jsp'; // 스토어 페이지로 이동
        });
    }

    // "1:1 채팅" 버튼 클릭 시 1:1 채팅 페이지로 이동
    const chatSellerButton = document.querySelector('.chat-seller');
    if (chatSellerButton) {
        chatSellerButton.addEventListener('click', function() {
            window.location.href = '../Chat/Chat.html'; // 1:1 채팅 페이지로 이동
        });
    }

    // 팔로우 버튼 클릭 시 하트 변경 및 팔로우 수 변경 처리
    const followButton = document.querySelector('.seller-details p span');
    let isFollowed = false;
    let followCount = 0;

    if (followButton) {
        // 초기 팔로우 상태 표시
        followButton.textContent = '🤍 follow ' + followCount;
        followButton.style.color = 'black';

        followButton.addEventListener('click', function() {
            if (!isFollowed) {
                // 🤍에서 빨간 하트로 변경, 팔로우 수 증가
                followButton.textContent = '❤️ follow ' + (followCount + 1);
                followCount += 1;
                isFollowed = true;
            } else {
                // 빨간 하트에서 🤍로 변경, 팔로우 수 감소
                followButton.textContent = '🤍 follow ' + (followCount - 1);
                followCount -= 1;
                isFollowed = false;
            }
        });
    }

    // 무한 스크롤 처리
    /*
    window.addEventListener('scroll', function() {
        const { scrollTop, scrollHeight, clientHeight } = document.documentElement;
        if (scrollTop + clientHeight >= scrollHeight - 5 && visibleReviews < reviews.length) {
            loadReviews(visibleReviews, 2); // 스크롤할 때 2개씩 더 로드
            visibleReviews += 2;

            if (visibleReviews >= reviews.length) {
                loadMoreBtn.style.display = 'none'; // 모든 리뷰가 로드되면 버튼을 숨김
            }
        }
    });
    */

	document.addEventListener('DOMContentLoaded', function() {
	    // 별점을 클릭하면 selected 클래스를 추가하고 데이터 저장
	    document.querySelectorAll('.star-rating .star').forEach(function(star) {
	        star.addEventListener('click', function() {
	            const ratingSection = this.parentElement;
	            const ratingType = ratingSection.id; // 신뢰도, 품질 등 항목의 ID
	            const ratingValue = parseInt(this.dataset.rating);

	            // 별점 초기화 후 선택된 별점 적용
	            ratingSection.querySelectorAll('.star').forEach(function(s) {
	                s.classList.remove('selected');
	            });
	            for (let i = 1; i <= ratingValue; i++) {
	                ratingSection.querySelector(`.star[data-rating="${i}"]`).classList.add('selected');
	            }

	            // 선택한 평점을 localStorage에 저장
	            localStorage.setItem(ratingType, ratingValue);
	        });
	    });
	});

});
