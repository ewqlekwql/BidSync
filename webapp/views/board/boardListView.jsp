<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.ct.bidsync.common.PageInfo, java.util.ArrayList, com.ct.bidsync.board.model.vo.Board" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Board> list = (ArrayList)request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
	String ctg = request.getParameter("ctg");
	String ctgName = (String)request.getAttribute("ctgName");
	String type = (String)request.getAttribute("type");
	String status = (String)request.getAttribute("status");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BidSync | <%=ctgName%></title>

    <!-- 외부 css/js 연결 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/resources/css/board.css">
    <script src="${pageContext.request.contextPath}/views/resources/js/board.js"></script>
</head>
<body onload="checkedFilter('<%=ctg%>', '<%=type%>', '<%=status%>')">
	<!-- 헤더 -->
	<jsp:include page="/views/common/header.jsp" />
	
	
	<main id="boardList-main">
		<!-- 사이드바 -->
		<aside id="boardList-sidebar">
			<!-- 내비게이션 -->
			<h3>카테고리</h3>
            <ul>
                <li id="fashion"><a href="${pageContext.request.contextPath}/list.bo?ctg=fashion&cpage=1">패션</a></li>
                <li id="digital"><a href="${pageContext.request.contextPath}/list.bo?ctg=digital&cpage=1">디지털·가전</a></li>
                <li id="sport"><a href="${pageContext.request.contextPath}/list.bo?ctg=sport&cpage=1">스포츠</a></li>
                <li id="deco"><a href="${pageContext.request.contextPath}/list.bo?ctg=deco&cpage=1">홈·데코</a></li>
                <li id="toy"><a href="${pageContext.request.contextPath}/list.bo?ctg=toy&cpage=1">완구</a></li>
                <li id="art"><a href="${pageContext.request.contextPath}/list.bo?ctg=art&cpage=1">미술</a></li>
                <li id="jewelry"><a href="${pageContext.request.contextPath}/list.bo?ctg=jewelry&cpage=1">쥬얼리</a></li>
            </ul>
            
            <hr>
            
            <!-- 검색 필터 -->
            <form id="boardList-form" action="${pageContext.request.contextPath}/list.bo?ctg=<%=ctg%>&cpage=1" method="post">
            	<table>
	            	<tr>
	            		<td rowspan="2">
	            			<label for="allCheck" class="table-label">
	            				<input type="checkbox" id="allCheck">
	            				<span class="span-box"></span>
	            				<span class="span-text">전체선택</span>
	            			</label>
	            		</td>
	            		<td>
	            			<label for="bid" class="table-label">
		            			<input type="checkbox" id="bid" name="type" value="경매" checked>
		            			<span class="span-box"></span>
	            				<span class="span-text">경매</span>
		            		</label>
	            		</td>
	            		<td>
	            			<label for="used" class="table-label">
	            				<input type="checkbox" id="used" name="type" value="중고거래" checked>
	            				<span class="span-box"></span>
	            				<span class="span-text">중고거래</span>
	            			</label>
	            		</td>
	            	</tr>
	            	<tr>
	            		<td>
	            			<label for="notSoldout" class="table-label">
	            				<input type="checkbox" id="notSoldout" name="status" value="N">
	            				<span class="span-box"></span>
	            				<span class="span-text">품절 보기</span>
	            			</label>
	            		</td>
	            	</tr>
	            	<tr>
	            		<td colspan="3" align="center">
	            			<button type="submit">검색</button>
	            		</td>
	            	</tr>
	            </table>
            </form>
       </aside>
	
		<!-- 상품 리스트 -->
		<section id="boardList-section">
			<h1>BID SHOP</h1>
			
			<!-- 정렬 탭 -->
			<nav id="boardList-section-nav">
				<ul>
					<li class="On"><a href="#">NEW</a></li>
					<li><a href="#">HOT</a></li>
                    <li><a href="#">BEST</a></li>
				</ul>
			</nav>
			
			<!-- 상품 목록 -->
			<article id="boardList-article">
				<% for(Board b : list) { %>
					<div class="board-card" onclick="location.href='${pageContext.request.contextPath}/detail.bo?ctg=<%=ctg%>&no=<%=b.getBoardNo()%>'">
						<div class="PrdImg"><img src="${pageContext.request.contextPath}<%=b.getProdImg()%>"></div>
                        <h3 title="<%=b.getBoardTitle()%>"><%=b.getBoardTitle()%></h3>
                        <p class="Price"><%=b.getPrice()%> 원</p>
                        <p class="Rating"><a href="${pageContext.request.contextPath}/" onclick="event.stopPropagation();"><%=b.getSeller()%></a> ★★★★ (4.0)</p>
					</div>
				<% } %>
			</article>
			
			<!-- 페이지 번호 -->
			<span>
				<% if(currentPage > 1) { %>
					<button class="MoveArrow" onclick="location.href='${pageContext.request.contextPath}/list.bo?ctg=<%=ctg%>&cpage=<%=currentPage - 1%>'">&lt;</button>
				<% } else { %>
					<button class="MoveArrow" disabled>&lt;</button>
				<% } %>
				<% for(int p = startPage; p <= endPage; p++) { %>
					<% if(p == currentPage) { %>
						<button disabled><%=p%></button>
					<% } else { %>
						<button onclick="location.href='${pageContext.request.contextPath}/list.bo?ctg=<%=ctg%>&cpage=<%=p%>'"><%=p%></button>
					<% } %>
				<% } %>
				<% if(currentPage < maxPage) { %>
					<button class="MoveArrow" onclick="location.href='${pageContext.request.contextPath}/list.bo?ctg=<%=ctg%>&cpage=<%=currentPage + 1%>'">&gt;</button>
        		<% } else { %>
        			<button class="MoveArrow" disabled>&gt;</button>
        		<% } %>
			</span>
		</section>
	</main>
	
	<!-- 푸터 -->
	<jsp:include page="/views/common/footer.jsp" />
</body>
</html>