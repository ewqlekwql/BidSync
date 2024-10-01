let btn1 = document.querySelector(".all > button");

// 전체선택을 눌렀을때 상품 전체선택
function allCheck(_allCheckBox) {
    // 전체선택 체크박스의 값
    let checked = _allCheckBox.checked;

    // class가 one-product인 모든 체크박스를 checked로 변경
    const productCheckBoxList = document.getElementsByClassName("one-product");
    for (let box of productCheckBoxList) {
        box.checked = checked;
    }
}

// 체크 하나라도 빠지면 상품전체 checkbox 해제
function isAllproductChecked() {
    // 모든 체크박스가 체크되어 있는지 검사 후
    // 모두 체크 -> return true;
    // 하나라도 아니라면 -> return false;
    const productCheckBoxList = document.getElementsByClassName("one-product");
    for (let box of productCheckBoxList) {
        if (!box.checked) {
            return false;
        }
    }
    return true;
}


const productCheckBoxList = document.getElementsByClassName("one-product");
for (let box of productCheckBoxList) {
    box.onchange = function () {
        const allCheckbox = document.getElementById('productAll-Check');
        allCheckbox.checked = isAllproductChecked();
    }
}

// 선택삭제를 눌렀을 때 체크되어있는 checkbox를 해제
function allCheckCancel() {
    let checkCancel = document.getElementById("checkreset");
    checkCancel.addEventListener('click', function () {
        const productCheckBoxList = document.getElementsByClassName("one-product");
        const allCheckbox = document.getElementById('productAll-Check');

        // Array.from을 사용하여 HTMLCollection을 배열로 변환
        Array.from(productCheckBoxList).forEach(function (box) {
            // 체크된 항목을 해제
            if (box.checked) {
                box.checked = false; // 체크 해제
            }
        });

        // 전체 선택 체크박스 해제
        allCheckbox.checked = false; // 전체 선택 해제
    });
}

// allCheckCancel 함수를 호출하여 이벤트 리스너를 등록
allCheckCancel();

// 품절/판매종료상품 전체삭제 버튼을 눌렀을 때 데이터 베이스에서 status가 'no'인것을 찾아서 상품을 삭제
function soldoutproductAllDelete() {
    const soldoutAllDelete = document.querySelector("#soldoutcheck");


}


// 삭제 버튼을 눌렀을 때 장바구니에서 상품을 삭제
function deleteProduct() {
    // 모든 삭제 버튼을 선택합니다. ID 대신 class를 사용합니다.
    let deleteButtons = document.querySelectorAll(".subject button");

    // 각 삭제 버튼에 이벤트 리스너를 추가합니다.
    deleteButtons.forEach(function(deleteButton) {
        deleteButton.addEventListener('click', function() {
            // 해당 버튼에 연결된 상품의 체크박스를 찾습니다.
            let productElement = deleteButton.closest(".subject"); // 버튼의 부모 .subject 요소 찾기

            productElement.remove(); // 상품 삭제

        });
    });
}

// deleteProduct 함수를 호출하여 삭제 버튼에 이벤트 리스너를 등록합니다.
deleteProduct();

// 구매하기 버튼을 눌렀을 때
function buy() {
    const buybutton = document.querySelector("#buy-button");


}