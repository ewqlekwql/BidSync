<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String alertMsg = (String)request.getAttribute("alertMsg");
	String responseURL = (String)request.getAttribute("responseURL");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>BidSync</title>
</head>
<body onload="alertMsg()">
	<%@ include file="header.jsp" %>
	
	<script>
		function alertMsg() {
			const alertMsg = "<%=alertMsg%>";
			alert(alertMsg);
			location.href="<%=responseURL%>";
		}
	</script>
</body>
</html>