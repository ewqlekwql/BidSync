<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>BidSync - header</title>
   
   <!-- jQuery -->
    <script 
        src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
        crossorigin="anonymous"></script>
    <script
        src="https://code.jquery.com/ui/1.14.0/jquery-ui.min.js"
        integrity="sha256-Fb0zP4jE3JHqu+IBB9YktLcSjI1Zc6J2b6gTjB0LpoM="
        crossorigin="anonymous"></script>

   <!-- 외부 css/js 연결 -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/views/resources/css/index.css">
</head>
<body>
   <header>
      <!-- 상단바 -->
      <nav id="header-top">
         <ul>
            <li id="header-top-logo">
            <a href="${pageContext.request.contextPath}" target="_self"><img src="${pageContext.request.contextPath}/views/resources/images/logo.png" alt="비드싱크 로고"></a>
            </li>
            <li id="header-top-searchBar">
                  <input type="text" name="keyword" placeholder="검색어를 입력하세요">
                  <button type="button">검색</button>
            </li>
            <%-- 로그인/로그아웃 분리 --%>
            <c:choose>
            	<c:when test="${empty loginUser}">
            		<%-- 로그인 전 --%>
            		<li id="header-top-user">
		               <button type="button" onclick="location.href='${pageContext.request.contextPath}/url.me?call=login'"><img src="${pageContext.request.contextPath}/views/resources/images/btn_cart.png"></button>
		               <button type="button" onclick="location.href='${pageContext.request.contextPath}/url.me?call=login'"><img src="${pageContext.request.contextPath}/views/resources/images/btn_wish.png"></button>
		               <button type="button" onclick="location.href='${pageContext.request.contextPath}/url.me?call=login'"><img src="${pageContext.request.contextPath}/views/resources/images/btn_mypage.png"></button>
		               <button type="button" onclick="location.href='${pageContext.request.contextPath}/url.me?call=login'"><img src="${pageContext.request.contextPath}/views/resources/images/btn_login.png"></button>
		            </li>
            	</c:when>
            	<c:otherwise>
            		<%-- 로그인 후 --%>
            		<li id="header-top-user">
		               <button type="button" onclick="location.href='${pageContext.request.contextPath}/cart.me'"><img src="${pageContext.request.contextPath}/views/resources/images/btn_cart.png"></button>
		               <button type="button" onclick="location.href='${pageContext.request.contextPath}/wish.me'"><img src="${pageContext.request.contextPath}/views/resources/images/btn_wish.png"></button>
		               <button type="button" onclick="location.href='${pageContext.request.contextPath}/url.me?call=myPage'"><img src="${pageContext.request.contextPath}/views/resources/images/btn_mypage.png"></button>
		               <button type="button" onclick="location.href='${pageContext.request.contextPath}/logout.me'"><img src="${pageContext.request.contextPath}/views/resources/images/btn_logout.png"></button>
		            </li>
            	</c:otherwise>
            </c:choose>
         </ul>
      </nav>

      <!-- 카테고리 대분류 -->
      <nav id="header-bottom">
         <ul>
         	<li>
               <a href="#">#추천</a>
            </li>
            <li id="fashion">
               <a href="${pageContext.request.contextPath}/list.bo?ctg=fashion&cpage=1">패션</a>
            </li>
            <li id="digital">
               <a href="${pageContext.request.contextPath}/list.bo?ctg=digital&cpage=1">디지털·가전</a>
            </li>
            <li id="sport">
               <a href="${pageContext.request.contextPath}/list.bo?ctg=sport&cpage=1">스포츠</a>
            </li>
            <li id="deco"> 
               <a href="${pageContext.request.contextPath}/list.bo?ctg=deco&cpage=1">홈·데코</a>
            </li>
            <li id="toy">
               <a href="${pageContext.request.contextPath}/list.bo?ctg=toy&cpage=1">완구</a>
            </li>
            <li id="art">
               <a href="${pageContext.request.contextPath}/list.bo?ctg=art&cpage=1">미술</a>
            </li>
            <li id="jewelry">
               <a href="${pageContext.request.contextPath}/list.bo?ctg=jewelry&cpage=1">쥬얼리</a>
            </li>
            <li>
               <a href="#">이벤트</a>
            </li>
         </ul>
      </nav>
   </header>
</body>
</html>