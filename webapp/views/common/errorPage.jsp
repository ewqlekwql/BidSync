<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String errorMsg = (String)request.getAttribute("errorMsg");
	String responseURL = (String)request.getAttribute("responseURL");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>error</title>
</head>
<body onload="alertError()">
	<%@ include file="header.jsp" %>
	
	<script>
		function alertError() {
			const errorMsg = "<%=errorMsg%>";
			alert(errorMsg);
			location.href="<%=responseURL%>";
		}
	</script>
</body>
</html>