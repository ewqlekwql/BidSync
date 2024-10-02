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
