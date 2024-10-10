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
                accountChangePopup.style.display = 'none';
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
            const name = document.getElementById('popup-name').value;
            const phone = document.getElementById('popup-phone').value;
            const zipcode = document.getElementById('popup-zipcode').value;
            const address = document.getElementById('popup-address').value;
            const detail = document.getElementById('popup-detail').value;

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

    // 구매하기 버튼 클릭 시 저장된 배송 정보를 LocalStorage에 저장
    if (purchaseBtn) {
        purchaseBtn.addEventListener('click', function () {
            // 배송 정보 가져오기
            const receiver = document.querySelector('.address-details .row:nth-child(1) .value').innerText;
            const phone = document.querySelector('.address-details .row:nth-child(2) .value').innerText;
            const address = document.querySelector('.address-details .row:nth-child(3) .value').innerText;
            const request = document.getElementById('request-button').textContent;

            // LocalStorage에 배송 정보 저장
            console.log('Saving to LocalStorage:', { receiver, phone, address, request }); // 디버깅용
            localStorage.setItem('bid_receiver', receiver);
            localStorage.setItem('bid_phone', phone);
            localStorage.setItem('bid_address', address);
            localStorage.setItem('bid_request', request);

            // BidDetail 페이지로 이동 (경로 확인 필요)
            window.location.href = '../bid/BidDetail.jsp';
        });
    }

    // 카드 정보 변경 관련 변수들
    const cardInfoButton = document.querySelector('.card-info'); // 카드 정보 버튼
    const accountChangePopup = document.getElementById('account-change-popup-container'); // 계좌 정보 팝업
    const accountDisplay = document.querySelector('.card-info span'); // 계좌 정보가 표시되는 영역

    // 카드 정보 버튼 클릭 시 팝업 표시 - 카드 간편결제 상태에서만 변경 가능
    if (cardInfoButton) {
        cardInfoButton.addEventListener('click', function () {
            const selectedPaymentOption = document.querySelector('input[name="payment"]:checked');
            if (selectedPaymentOption && selectedPaymentOption.value === 'card') {
                accountChangePopup.style.display = 'flex'; // 팝업 표시
            }
        });
    }

    // 닫기 버튼 클릭 시 팝업 닫기 및 초기화
    if (closeButtons.length > 0) {
        closeButtons.forEach(function (btn) {
            btn.addEventListener('click', function () {
                accountChangePopup.style.display = 'none'; // 팝업 닫기
                // 폼 초기화
                document.getElementById('bank').value = 'kb'; // 기본값으로 초기화 (value 값을 'kb'로 설정)
                document.getElementById('accountNumber').value = '';  // 계좌번호 초기화
            });
        });
    }

    // 계좌 정보 저장 버튼 클릭 시 처리
    const saveBtn = document.querySelector('.account-save-btn');
    if (saveBtn) {
        saveBtn.addEventListener('click', function () {
            const bankSelect = document.getElementById('bank');
            const bank = bankSelect.options[bankSelect.selectedIndex].text; // 선택된 은행의 텍스트 값
            const accountNumber = document.getElementById('accountNumber').value; // 입력된 계좌번호

            // 계좌 정보 저장 및 유효성 검사
            if (bank && accountNumber) {
                // 메인 화면의 카드 정보 텍스트를 변경
                accountDisplay.textContent = `${bank} ${accountNumber}`; // 예: "KB 국민 1234-1234-1234-1234"

                // 팝업 닫기
                accountChangePopup.style.display = 'none';
            } else {
                alert("모든 필드를 입력해주세요.");
            }
        });
    }

    // 결제 옵션에 따른 카드 정보 업데이트 (선택에 따라 변경)
    const paymentOptions = document.querySelectorAll('.payment-options input[name="payment"]');
    if (paymentOptions.length > 0) {
        paymentOptions.forEach(function (option) {
            option.addEventListener('change', function () {
                if (this.checked) {
                    switch (this.value) {
                        case 'card':
                            accountDisplay.textContent = 'KB 국민 XXXX-XXXX-XXXX-XXXX';
                            break;
                        case 'kakao':
                            accountDisplay.textContent = '카카오페이 결제하기';
                            break;
                        case 'bank':
                            accountDisplay.textContent = '예금주: BidSync / 계좌번호: 국민 KB 국민 XXXX-XXXX-XXXX-XXXX';
                            break;
                        default:
                            break;
                    }
                }
            });
        });
    }

    // 우편번호 검색 함수 정의 및 전역으로 노출
    window.execDaumPostcodePopup = function () {
        new daum.Postcode({
            oncomplete: function (data) {
                var addr = ''; // 주소
                var extraAddr = ''; // 참고항목

                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }

                if (data.userSelectedType === 'R') {
                    if (data.bname !== '') {
                        extraAddr += data.bname;
                    }
                    if (data.buildingName !== '') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if (extraAddr !== '') {
                        addr += ' (' + extraAddr + ')';
                    }
                }

                // 팝업 내부의 입력 필드에 값 설정
                document.getElementById('popup-zipcode').value = data.zonecode;
                document.getElementById('popup-address').value = addr;

                // 상세주소 필드로 포커스 이동
                document.getElementById('popup-detail').focus();
            }
        }).open();
    };

});
