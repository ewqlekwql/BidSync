<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>BidSync - 로그인</title>
	
	<!-- 외부 css/js 연결 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/views/resources/css/member.css">
	<script src="${pageContext.request.contextPath}/views/resources/member.js" defer></script>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="/views/common/header.jsp" />
	
	<main id="login-main">
		<section id="login-section">
			<!-- 회원 로그인 -->
			<article id="login-article-member">
				<h1>LOGIN</h1>
				<form action="${pageContext.request.contextPath}/login.me" method="post">
					<input type="text" id="inputid" name="userId" placeholder="아이디를 입력하세요." required>
		            <input type="password" id="inputpassword" name="userPwd" placeholder="비밀번호를 입력하세요." required>
		            <label for="saveId">
		            	<input type="checkbox" id="saveId"> 아이디 저장
		            </label>
		            <button type="submit">LOGIN</button>
				</form>
				<div>
					<span>
						<a href="">비밀번호 찾기</a>
					</span>
					<b>&ensp;|&ensp;</b>
					<span>
						<a href="">아이디 찾기</a>
					</span>
					<b>&ensp;|&ensp;</b>
					<span>
						<a href="${pageContext.request.contextPath}/url.me?call=enroll">회원가입</a>
					</span>
				</div>
			</article>
			
			<!-- sns 로그인 -->
			<article id="login-article-sns">
				<h1>SNS</h1>
				<div>
					<button onclick="location.href='https://accounts.google.com/'">
                        <img src="${pageContext.request.contextPath}/views/resources/images/btn_google.png" id="google">
                    </button>
                    <button onclick="location.href='https://nid.naver.com/nidlogin.login?mode=form&url=https://www.naver.com/'">
                    	<img src="${pageContext.request.contextPath}/views/resources/images/btn_naver.png">
                    </button>
                     <button onclick="location.href='https://accounts.kakao.com/login/?continue=https%3A%2F%2Fcs.kakao.com%2F#login'">
                    	<img src="${pageContext.request.contextPath}/views/resources/images/btn_kakao.png">
                    </button>
				</div>
			</article>
		</section>
	</main>
	
	<!-- 푸터 -->
	<jsp:include page="/views/common/footer.jsp" />
</body>
</html>