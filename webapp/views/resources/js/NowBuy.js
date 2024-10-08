document.addEventListener('DOMContentLoaded', function () {
    // 팝업 표시 및 숨기기 처리
    const addressPopup = document.getElementById('address-popup-container');
    const addressAddPopup = document.getElementById('address-add-popup-container');
    const requestPopup = document.getElementById('request-popup-container');

    const addressChangeBtn = document.querySelector('.address-change-btn');
    const addAddressBtn = document.querySelector('.add-address-btn');
    const requestButton = document.getElementById('request-button'); // 요청사항 버튼

    const closeButtons = document.querySelectorAll('.close-btn');
    const saveRequestBtn = document.querySelector('.r-save-btn'); // 요청사항 저장 버튼
    const addressSaveBtn = document.querySelector('.address-form .a-save-btn'); // 주소 저장 버튼
    const selectAddressBtn = document.querySelector('.select-address-btn'); // 주소 선택 버튼
    const addressDetails = document.querySelector('.address-details'); // 배송 주소 섹션

    let selectedRequest = '요청사항 없음'; // 기본 요청사항

    // 주소 변경 버튼 클릭 시 주소록 팝업 표시
    if (addressChangeBtn) {
        addressChangeBtn.addEventListener('click', function () {
            addressPopup.style.display = 'flex';
        });
    }

    // 새 주소 추가 버튼 클릭 시 주소 추가 팝업 표시
    if (addAddressBtn) {
        addAddressBtn.addEventListener('click', function () {
            addressPopup.style.display = 'none';
            addressAddPopup.style.display = 'flex';
        });
    }

    // 요청사항 버튼 클릭 시 요청사항 팝업 표시
    if (requestButton) {
        requestButton.addEventListener('click', function () {
            requestPopup.style.display = 'flex';
        });
    }

    // 닫기 버튼 클릭 시 모든 팝업 숨기기
    if (closeButtons.length > 0) {
        closeButtons.forEach(function (btn) {
            btn.addEventListener('click', function () {
                addressPopup.style.display = 'none';
                addressAddPopup.style.display = 'none';
                requestPopup.style.display = 'none';
            });
        });
    }

    // 요청사항 저장 버튼 클릭 시 선택된 값을 반영
    if (saveRequestBtn) {
        saveRequestBtn.addEventListener('click', function () {
            const selectedOption = document.querySelector('input[name="request"]:checked');
            const customTextArea = document.getElementById('customTextArea');

            if (selectedOption) {
                selectedRequest = selectedOption.value === 'custom' ? customTextArea.value : selectedOption.nextSibling.textContent.trim();
            }

            requestButton.textContent = selectedRequest || '요청사항 없음'; // 요청사항 버튼에 반영
            requestPopup.style.display = 'none'; // 팝업 닫기
        });
    }

    // 요청사항 텍스트박스 처리
    const customRequest = document.getElementById('customRequest');
    const customTextArea = document.getElementById('customTextArea');
    const requestOptions = Array.from(document.getElementsByName('request')); // HTMLCollection을 배열로 변환

    if (customRequest) {
        // 직접 입력 옵션 선택 시 텍스트 박스 활성화
        customRequest.addEventListener('change', function () {
            customTextArea.disabled = false;
        });
    }

    if (requestOptions.length > 0) {
        // 다른 옵션 선택 시 텍스트 박스 비활성화
        requestOptions.forEach(function (option) {
            option.addEventListener('change', function () {
                if (this.value !== 'custom') {
                    customTextArea.disabled = true;
                    customTextArea.value = ''; // 비활성화될 때 입력된 내용 제거
                }
            });
        });
    }

    // 주소 추가 팝업에서 저장하기 버튼 클릭 시 새로운 주소 추가
    if (addressSaveBtn) {
        addressSaveBtn.addEventListener('click', function (event) {
            event.preventDefault(); // 폼 제출 방지

            // 주소 추가 폼에서 입력된 정보 가져오기
            const name = document.getElementById('name').value;
            const phone = document.getElementById('phone').value;
            const zipcode = document.getElementById('zipcode').value;
            const address = document.getElementById('address').value;
            const detail = document.getElementById('detail').value;

            // 입력된 정보로 새로운 주소 항목 생성
            const newAddressItem = document.createElement('div');
            newAddressItem.classList.add('address-item');
            newAddressItem.innerHTML = `
                <p>${name}</p>
                <p>[${zipcode}] ${address} ${detail}</p>
                <p>${phone}</p>
                <input type="radio" name="address" value="${name},${phone},[${zipcode}] ${address} ${detail}">
            `;

            // 주소 목록에 추가
            const addressList = document.querySelector('.address-list');
            addressList.appendChild(newAddressItem);

            // 주소 추가 팝업 닫기
            addressAddPopup.style.display = 'none';

            // 주소록 팝업 다시 열기
            addressPopup.style.display = 'flex';

            // 주소 추가 후 폼 초기화
            document.querySelector('.address-form').reset();
        });
    }

    // 체크한 주소를 가져와서 반영
    if (selectAddressBtn) {
        selectAddressBtn.addEventListener('click', function () {
            const selectedAddress = document.querySelector('input[name="address"]:checked');
            if (selectedAddress) {
                const addressParts = selectedAddress.value.split(',');
                addressDetails.querySelector('.row:nth-child(1) .value').innerText = addressParts[0]; // 받는 분
                addressDetails.querySelector('.row:nth-child(2) .value').innerText = addressParts[1]; // 연락처
                addressDetails.querySelector('.row:nth-child(3) .value').innerText = addressParts[2]; // 주소
            }
            addressPopup.style.display = 'none'; // 팝업 닫기
        });
    }

    // 구매하기 버튼 클릭 시 구매 상세 페이지 이동 및 정보 저장
    const purchaseBtn = document.querySelector('.purchase-btn');

    if (purchaseBtn) {
        purchaseBtn.addEventListener('click', function () {
            // 배송 정보 가져오기
            const receiver = document.querySelector('.address-details .row:nth-child(1) .value').innerText;
            const phone = document.querySelector('.address-details .row:nth-child(2) .value').innerText;
            const address = document.querySelector('.address-details .row:nth-child(3) .value').innerText;
            const request = document.getElementById('request-button').textContent;

	
			
            // LocalStorage에 배송 정보 저장
            console.log('Saving data to LocalStorage:', receiver, phone, address, request); // 디버깅용
			localStorage.setItem('nowbuy_receiver', receiver);
			localStorage.setItem('nowbuy_phone', phone);
			localStorage.setItem('nowbuy_address', address);
			localStorage.setItem('nowbuy_request', request);

			
            // 페이지 이동
            window.location.href = '../nowbuy/NowBuyDetail.jsp';
        });
    }
});
