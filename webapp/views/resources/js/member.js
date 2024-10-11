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

//비밀번호 입력에 문자,숫자,특수문자 만 입력가능하게 변경
function passwordCheck(password) {
    const regExp = /^(?=.*[a-zA-Z])(?=.*[\d])(?=.*[!@#$%^&*()_+|~\-={}[\]:;<>?,./])[A-Za-z\d!@#$%^&*()_+|~\-={}[\]:;<>?,./]{8,20}$/;
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

//전화번호 input에 숫자,'-'만 입력할수있게 변경
function checkNumber(event) {
    const regExp = /[^0-9-]/g;
    const ele = event.target;
    if (regExp.test(ele.value)) {
      ele.value = ele.value.replace(regExp, '');
    }
  };

  //가입 하기 버튼을 눌렀을 때
function createButton(){
    const clickbutton = querySelector("#createButton");

  }