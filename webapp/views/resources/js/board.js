/* boardListView js */
// 헤더, 체크박스 카테고리 체크 + 필터 체크박스 선택
function checkedFilter(ctg, type, status) {
    // 카테고리 체크
    document.querySelector("#header-bottom li#" + ctg).classList.add('On');
    document.querySelector("#boardList-sidebar li#" + ctg).classList.add('On');
    
    // type 체크
    if (type === "%") {
        document.querySelector("#bid").checked = true;
        document.querySelector("#used").checked = true;
    } else if (type === "경매") {
        document.getElementById("used").checked = false;
    } else {
        document.getElementById("bid").checked = false;
    }
    
    // status 체크
    if (status === "%") {
        document.getElementById("notSoldout").checked = true;
    }
}

/* boardDetail js */