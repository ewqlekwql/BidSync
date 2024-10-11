<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.ct.bidsync.common.PageInfo, java.util.ArrayList, com.ct.bidsync.board.model.vo.Board" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Board> list = (ArrayList)request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BidSync</title>

    <!-- 외부 css/js 연결 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/resources/css/board.css">
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="/views/common/header.jsp" />

	<%-- 리스트 불러오는중 --%>
	
	<!-- 푸터 -->
	<jsp:include page="/views/common/footer.jsp" />
</body>
</html>