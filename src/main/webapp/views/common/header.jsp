<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>BidSync - header</title>

   <!-- 외부 css/js 연결 -->
   <link rel="stylesheet" href="views/resources/css/index.css">
</head>
<body>
   <!-- 헤더 -->
   <header>
      <!-- 상단바 -->
      <nav id="header-top">
         <ul>
            <li id="header-top-logo">
               <a href="index.html" target="_self"><img src="views/resources/images/logo.png" alt="비드싱크 로고"></a>
            </li>
            <li id="header-top-searchBar">
                  <input type="text" name="keyword" placeholder="검색어를 입력하세요">
                  <button type="button">검색</button>
            </li>
            <%-- 로그인/로그아웃 분리 추가 예정 --%>
            <li id="header-top-user">
               <button type="button"><img src="views/resources/images/btn_cart.png"></button>
               <button type="button"><img src="views/resources/images/btn_mypage.png"></button>
               <button type="button"><img src="views/resources/images/btn_logout.png"></button>
            </li>
         </ul>
      </nav>

      <!-- 카테고리 대분류 -->
      <nav id="header-bottom">
         <ul>
            <li>
               <a href="#"><img src="views/resources/images/btn_hambuger.png"></a>
            </li>
            <li>
               <a href="#">패션</a>
            </li>
            <li>
               <a href="#">디지털·가전</a>
            </li>
            <li>
               <a href="#">스포츠</a>
            </li>
            <li> 
               <a href="#">홈·데코</a>
            </li>
            <li>
               <a href="#">완구</a>
            </li>
            <li>
               <a href="#">미술</a>
            </li>
            <li>
               <a href="#">쥬얼리</a>
            </li>
         </ul>
      </nav>
   </header>
</body>
</html>