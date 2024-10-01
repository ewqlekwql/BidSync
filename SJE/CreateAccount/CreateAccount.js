//공백이 있을시 공백제거
function noSpaceForm(obj) {
    var str_space = /\s/; //공백체크

    if(str_space.exec(obj.value) || regExp.test(del.value)) {
        obj.focus();
        obj.valu = obj.value.replace(' ',''); //공백제거
        return false;
    }
}

//아이디 input값이 ""와 같을때 알림이 뜸
function checkInput(id) {
    const checkValue = document.getElementById(id).value;
    const hiddenId = document.getElementById(id + "_required");
    
    if(checkValue === "") {
        hiddenId.classList.remove("hidden");
    } else {
        hiddenId.classList.add("hidden");
    }
}

//중복 체크 버튼 눌렀을 시
function DuplicateCheck(){
    const Duplicate = document.querySelector("#id_overlap_check");


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