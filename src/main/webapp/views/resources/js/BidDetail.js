document.addEventListener('DOMContentLoaded', function () {
    // LocalStorage에서 저장된 배송 정보 불러오기
    const receiver = localStorage.getItem('receiver');
    const phone = localStorage.getItem('phone');
    const address = localStorage.getItem('address');
    const request = localStorage.getItem('request');

    // 페이지에 불러온 값 반영
    document.querySelector('.shipping-detail-list li:nth-child(1) .value').innerText = receiver;
    document.querySelector('.shipping-detail-list li:nth-child(2) .value').innerText = phone;
    document.querySelector('.shipping-detail-list li:nth-child(3) .value').innerText = address;
    document.querySelector('.shipping-detail-list li:nth-child(4) .value').innerText = request;
});
