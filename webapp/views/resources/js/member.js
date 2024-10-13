/* cartList js */
// 전체선택을 눌렀을때 상품 전체선택
function allCheck(_allCheckBox) {
    // 전체선택 체크박스의 값
    const checked = _allCheckBox.checked;

    // class가 cart-card-checkbox인 모든 체크박스를 checked로 변경
    const cartCheckBoxList = document.getElementsByClassName("cart-card-checkbox");

    // HTMLCollection을 배열로 변환하여 forEach 사용
    Array.from(cartCheckBoxList).forEach(box => {
        box.checked = checked;
    });

    // 선택된 체크박스 수 업데이트
    updateAllCheckBox();
}

// 체크가 하나라도 해제되면 전체선택 박스도 체크 해제
function updateAllCheckBox() {
    const cartCheckBoxList = document.getElementsByClassName("cart-card-checkbox");
    const allCheckBox = document.getElementById("cartAll-Check");
    
    // 전체 선택 체크박스의 상태를 업데이트
    allCheckBox.checked = Array.from(cartCheckBoxList).every(box => box.checked);
    
    // 선택된 체크박스 수를 btnOrder 버튼에 표시
	const selectedCount = Array.from(cartCheckBoxList).filter(box => box.checked).length;
    const btnOrder = document.getElementById("btnOrder");
    btnOrder.innerText = selectedCount > 0 ? `구매하기 (${selectedCount})` : "구매하기 (0)";
}

// 개별 체크박스에 change 이벤트 리스너 추가
document.addEventListener("DOMContentLoaded", function() {
    const cartCheckBoxList = document.getElementsByClassName("cart-card-checkbox");
    for (let box of cartCheckBoxList) {
        box.addEventListener("change", function() {
            updateAllCheckBox(); // 전체 선택 체크박스 상태 업데이트
        });
    }
});