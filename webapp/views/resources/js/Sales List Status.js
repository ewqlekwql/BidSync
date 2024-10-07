// 선택된 항목을 숨기는 함수
function hideSelected(tableId, checkboxClass) {
    const table = document.getElementById(tableId);
    const checkboxes = table.getElementsByClassName(checkboxClass);

    // 체크된 항목을 숨김
    for (let i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
            checkboxes[i].closest('tr').style.display = 'none'; // 해당 행을 숨김
        }
    }
}

// 모든 항목을 선택하는 기능
document.getElementById('select-all-sales').addEventListener('change', function() {
    const checkboxes = document.getElementsByClassName('sales-checkbox');
    for (let checkbox of checkboxes) {
        checkbox.checked = this.checked;
    }
});

document.getElementById('select-all-bidding').addEventListener('change', function() {
    const checkboxes = document.getElementsByClassName('bidding-checkbox');
    for (let checkbox of checkboxes) {
        checkbox.checked = this.checked;
    }
});

// 선택된 항목을 삭제하고 팝업을 띄우는 함수
function deleteSelected(tableId, checkboxClass) {
    const table = document.getElementById(tableId);
    const checkboxes = table.getElementsByClassName(checkboxClass);
    let deletedItems = [];

    // 체크된 항목을 숨김 및 저장
    for (let i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
            let row = checkboxes[i].closest('tr');
            let itemName = row.getElementsByTagName('td')[3].textContent; // 상품명
            deletedItems.push(itemName);
            row.style.display = 'none'; // 행 숨김
        }
    }

    // 팝업 메시지 생성 및 띄우기
    if (deletedItems.length > 0) {
        const message = deletedItems.join(', ') + ' 상품이 삭제되었습니다.';
        document.getElementById('popup-message').textContent = message;
        document.getElementById('popup-overlay').style.display = 'block'; // 팝업 표시
    }
}

// 팝업을 닫는 함수
function closePopup() {
    document.getElementById('popup-overlay').style.display = 'none'; // 팝업 닫기
}