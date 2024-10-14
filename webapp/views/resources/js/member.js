<<<<<<< HEAD
/* Login js */
// 아이디 유효성 검사
function validateId(input) {
    const regExp = /^(?=.*[a-zA-Z])[A-Za-z\d]{4,20}$/; // 정규식

    // 입력된 값이 정규식을 만족하지 않을 경우 경고 및 초기화
    if (!regExp.test(input.value)) {
        alert("아이디는 영문자와 숫자로만 구성되어야 하며, 최소 4자에서 최대 20자까지 입력할 수 있습니다. 또한 적어도 하나의 영문자와 하나의 숫자가 포함되어야 합니다.");
        input.value = ''; // 입력값 초기화
    }
}


/* EnrollForm js */
=======
/**
 * member js
 */

/* 로그인.js */

//데이터 베이스에 있는 값과 아이디/비밀번호 값이 다를때 메세지 추출
function loginbutton() {
    const inputId = document.querySelector("#inputid").value;
    const inputPassword = document.querySelector("#inputpassword").value;

    const hiddenMsg = document.getElementById("join_required");

    //입력한 아이디 값과 데이터 베이스의 값이 같고
    // 비밀번호에 입력한 값과 데이터 베이스의 저장된 값이 같을때
    if(inputId === "" && inputPassword === "") {
        hiddenMsg.classList.remove("hidden");
    } else {
        hiddenMsg.classList.add("hidden");
    }
}

//아이디 저장 버튼
function saveid() {
    const saveidButton = document.querySelector("check");


}

/* 회원가입.js */

>>>>>>> dd444da30f6edca4095cbabfcbdf9b2a62e988dc
//공백이 있을시 공백제거
function noSpaceForm(obj) {
    var str_space = /\s/; // 공백 체크

    // 공백이 있을 때 경고 및 공백 제거
    if (str_space.test(obj.value)) {
        obj.value = obj.value.replace(/\s/g, ''); // 모든 공백 제거
        obj.focus();
        return false;
    }
}

<<<<<<< HEAD
//아이디 입력에 문자,숫자 만 입력가능하게 변경
function checkInput(input) {
    const regExp = /^(?=.*[a-zA-Z])(?=.*\d)[A-Za-z\d]{4,20}$/; // 수정된 정규식
    const hiddenArea = document.getElementById("user_id_required");

    if (!regExp.test(input.value)) {
        hiddenArea.classList.remove("hidden"); // 유효하지 않은 경우 경고 표시
        alert("아이디는 영문자와 숫자로만 구성되어야 하며, 최소 4자에서 최대 20자까지 입력할 수 있습니다.");
    } else {
        hiddenArea.classList.add("hidden"); // 유효한 경우 경고 숨김
    }
}

//비밀번호 입력에 문자,숫자,특수문자 만 입력가능하게 변경
function passwordCheck(password) {
    const regExp = /^(?=.*[a-zA-Z])(?=.*[\d])(?=.*[!@#$%^&*()_+|~\-={}[\]:;<>?,./])[A-Za-z\d!@#$%^&*()_+|~\-={}[\]:;<>?,./]{4,20}$/;
=======
//비밀번호 입력에 문자,숫자,특수문자 만 입력가능하게 변경
function passwordCheck(password) {
    const regExp = /^(?=.*[a-zA-Z])(?=.*[\d])(?=.*[!@#$%^&*()_+|~\-={}[\]:;<>?,./])[A-Za-z\d!@#$%^&*()_+|~\-={}[\]:;<>?,./]{8,20}$/;
>>>>>>> dd444da30f6edca4095cbabfcbdf9b2a62e988dc
    const hiddenArea = document.getElementById("user_password_required");

    if (!regExp.test(password)) {
        hiddenArea.classList.remove("hidden");
    } else {
        hiddenArea.classList.add("hidden");
    }
}

//비밀번호 재입력에서 비밀번호 input과 재입력의 input이 같지않을 때 알림이 뜸
function passwordReCheck(){
    const passwordInput = document.querySelector("#user_password").value;
    const hiddenArea = document.getElementById("pwd_check_required");
    const passwordReCheck = document.querySelector("#passwordRecheck").value;

    if (passwordInput === passwordReCheck) {
        hiddenArea.classList.add("hidden");

    } else {
        hiddenArea.classList.remove("hidden");
       
    }
}

<<<<<<< HEAD
//이름이 영문자,숫자만 입력가능하게 변경
function validateName(input) {
    // 영문자와 숫자만 허용하고 나머지는 제거
    input.value = input.value.replace(/[^가-힣a-zA-Z0-9]/g, '');
}



//생년월일에서 연도가 숫자 4자리만 입력되고, 1900년도부터 2099년까지 범위를 허용
function validateYear(input) {
	//입력된 값에서 숫자만 남기고, 최대 4자리만 허용
	input.value = input.value.replace(/[^0-9]/g, '').slice(0, 4);
	
	// 4자리 숫자가 입력된 경우 범위 체크
	if (input.value.length === 4) {
		const year = parseInt(input.value,10); // 숫자로 변환
		if (year < 1900 || year > 2099){
			alert("년도는 1900년에서 2099년 사이여야 합니다.");
			input.value = ''; // 범위 밖이면 초기화
		}
	}
}

//생년월일에서 일이 숫자 2자리만 입력되고 1부터 31까지 범위를 허용
function validateDay(input) {
	//숫자만 입력하고 최대 2자리까지 허용
	input.value = input.value.replace(/[^0-9]/g, '').slice(0,2);
	
	// 2자리 숫자가 입력된 경우 범위 체크
	if (input.value.length === 2) {
		const day = parseInt(input.value, 10); // 숫자로 변환
		if (day < 1 || day > 31) {
			alert("날짜는 1일부터 31일 사이여야 합니다.");
			input.value = ''; // 범위 밖이면 초기화
		}
	}
}

=======
>>>>>>> dd444da30f6edca4095cbabfcbdf9b2a62e988dc
//전화번호 input에 숫자,'-'만 입력할수있게 변경
function checkNumber(event) {
    const regExp = /[^0-9-]/g;
    const ele = event.target;
    if (regExp.test(ele.value)) {
      ele.value = ele.value.replace(regExp, '');
    }
<<<<<<< HEAD
	
	//최대 13자까지만 허용
	if (ele.value.length > 13) {
		ele.value = ele.value.slice(0,13); // 13자 초과시 잘라냄
	}
  };

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

// 품절, 판매종료인 상품 전체 삭제
function delectSoldOut() {
	if(confirm("정말 삭제하시겠습니까?")) {
		window.location.href = "deleteSO.cart.me";
	}
}


/* wishList js */
// 전체선택을 눌렀을때 상품 전체선택
function allCheckWish(_allCheckBox) {
    // 전체선택 체크박스의 값
    const checked = _allCheckBox.checked;

    // class가 cart-card-checkbox인 모든 체크박스를 checked로 변경
    const wishCheckBoxList = document.getElementsByClassName("wish-card-checkbox");

    // HTMLCollection을 배열로 변환하여 forEach 사용
    Array.from(wishCheckBoxList).forEach(box => {
        box.checked = checked;
    });

    // 선택된 체크박스 수 업데이트
    updateAllCheckBox();
}

// 체크가 하나라도 해제되면 전체선택 박스도 체크 해제
function updateAllCheckBox() {
    const wishCheckBoxList = document.getElementsByClassName("wish-card-checkbox");
    const allCheckBox = document.getElementById("wishAll-Check");
    
    // 전체 선택 체크박스의 상태를 업데이트
    allCheckBox.checked = Array.from(wishCheckBoxList).every(box => box.checked);
}

// 개별 체크박스에 change 이벤트 리스너 추가
document.addEventListener("DOMContentLoaded", function() {
    const wishCheckBoxList = document.getElementsByClassName("wish-card-checkbox");
    for (let box of wishCheckBoxList) {
        box.addEventListener("change", function() {
            updateAllCheckBox(); // 전체 선택 체크박스 상태 업데이트
        });
    }
});

// 관심상품 -> 장바구니 이동
function wishToCart(wishNo) {
	window.location.href="update.wish.me?no=" + wishNo;
}

// 관심상품에서 삭제
function deleteWish(wishNo) {
	window.location.href="delete.wish.me?no=" + wishNo;
}
=======
  };

  //가입 하기 버튼을 눌렀을 때
function createButton(){
    const clickbutton = querySelector("#createButton");

  }
>>>>>>> dd444da30f6edca4095cbabfcbdf9b2a62e988dc
