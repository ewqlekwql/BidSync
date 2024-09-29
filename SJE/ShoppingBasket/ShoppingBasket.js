let btn1 = document.querySelector(".all > button");


function allCheck(_allCheckBox) {
    // 전체선택 체크박스의 값
    let checked = _allCheckBox.checked;

    // class가 one-product인 모든 체크박스를 checked로 변경
    const productCheckBoxList = document.getElementsByClassName("one-product");
    for (let box of productCheckBoxList) {
        box.checked = checked;
    }
}

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