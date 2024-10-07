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
            <a href="${pageContext.request.contextPath}/index.jsp" target="_self"><img src="${pageContext.request.contextPath}/views/resources/images/logo.png" alt="비드싱크 로고"></a>
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
		               <button type="button" onclick="location.href='${pageContext.request.contextPath}/views/member/memberLoginForm.jsp'"><img src="${pageContext.request.contextPath}/views/resources/images/btn_cart.png"></button>
		               <button type="button" onclick="location.href='${pageContext.request.contextPath}/views/member/memberLoginForm.jsp'"><img src="${pageContext.request.contextPath}/views/resources/images/btn_mypage.png"></button>
		               <button type="button" onclick="location.href='${pageContext.request.contextPath}/views/member/memberLoginForm.jsp'"><img src="${pageContext.request.contextPath}/views/resources/images/btn_login.png"></button>
		            </li>
            	</c:when>
            	<c:otherwise>
            		<%-- 로그인 후 --%>
            		<li id="header-top-user">
		               <button type="button"><img src="${pageContext.request.contextPath}/views/resources/images/btn_cart.png"></button>
		               <button type="button" onclick="location.href='${pageContext.request.contextPath}/mypage.me'"><img src="${pageContext.request.contextPath}/views/resources/images/btn_mypage.png"></button>
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
               <a href="#"><img src="${pageContext.request.contextPath}/views/resources/images/btn_hambuger.png"></a>
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