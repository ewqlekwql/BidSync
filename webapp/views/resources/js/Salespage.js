        // '등록하기' 버튼 클릭 시 폼 제출을 막고 다른 페이지로 이동
        document.getElementById("productForm").addEventListener("submit", function(event) {
            event.preventDefault(); // 폼 제출 방지
            window.location.href = "Purchase completed.html"; // 페이지 이동
        });