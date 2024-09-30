function checkInput(id) {
    const checkValue = document.getElementById(id).value;
    const hiddenId = document.getElementById(id + "_required");
    
    if(checkValue === "") {
        hiddenId.classList.remove("hidden");
    } else {
        hiddenId.classList.add("hidden");
    }
}

function passwordCheck(password) {
    const regExp = /^(?=.*[a-zA-Z])(?=.*[\d])(?=.*[!@#$%^&*()_+|~\-={}[\]:;<>?,./])[A-Za-z\d!@#$%^&*()_+|~\-={}[\]:;<>?,./]{8,20}$/;
    const hiddenArea = document.getElementById("user_password_required");

    if (!regExp.test(password)) {
        hiddenArea.classList.remove("hidden");
    } else {
        hiddenArea.classList.add("hidden");
    }
}

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