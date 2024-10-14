<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>BidSnyc - 회원가입</title>
	
	<!-- 외부 css/js 연결 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/views/resources/css/index.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/views/resources/css/member.css">
	<script src="${pageContext.request.contextPath}/views/resources/js/member.js" defer></script>
</head>
<body>
	<main id="enroll-main">
		<section id="enroll-section">
			<form id="enroll-form" action="${pageContext.request.contextPath}/insert.me" method="post">
				<!-- 헤더 대용 -->
				<a class="enroll-logo" href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/views/resources/images/logo.png"></a>
			
				<!-- 계정 -->
				<div class="enroll-form-div">
					<h3>아이디 <font color="red">*</font></h3>
					<div class="sub">
						<input type="text" id="user_id" name="userId" placeholder="아이디 입력 (4~20자)" required onkeyup="noSpaceForm(this);" onblur="checkInput(this);">
                    	<button type="button" id="id_overlap_check">중복 체크</button>
					</div>
                    <span id="user_id_required" class="check_text hidden">사용할 수 없는 아이디입니다.</span>
				</div>
				
				<div class="enroll-form-div" id="password">
					<h3>비밀번호 <font color="red">*</font></h3>
                    <input type="password" id="user_password" name="userPwd" placeholder="비밀번호 입력 (문자,숫자,특수문자 포함 4~20자)" onkeyup="noSpaceForm(this);" onclick="passwordCheck(this.value)"  required>
                    <span id="user_password_required" class="check_text hidden">문자,숫자,특수문자 포함 (4~20자)</span>
                </div>
                           
                <div class="enroll-form-div" id="passwordCheck">
	                <h3>비밀번호 확인 <font color="red">*</font></h3>
                    <input type="password" placeholder="비밀번호 재입력" id="passwordRecheck" onblur="passwordReCheck()" required>
                    <span id="pwd_check_required" class="check_text hidden">비밀번호가 일치하지 않습니다.</span>
                </div>
				
				<!-- 회원 정보 -->
				<div class="enroll-form-div" id="name">
					<h3>이름 <font color="red">*</font></h3>
                    <input type="text" name="userName" placeholder="이름을 입력해주세요" onkeyup="validateName(this)">
                </div>
               
                <div class="enroll-form-div">
                	<h3>성별</h3>
                	<select name="gender">
                		<option value="">비공개</option>
                		<option value="남">남성</option>
                		<option value="여">여성</option>
                	</select>
                </div>
               
                <div class="enroll-form-div" id="birth">
                	<h3>생년월일 <font color="red">*</font></h3>
                	<div class="sub">
                		<input type="text" name="year" placeholder="년(4자)" maxlength="4" onkeyup="validateYear(this)">
                		<select aria-placeholder="월" name="month">
                            <option value="01">1월</option>
                            <option value="02">2월</option>
                            <option value="03">3월</option>
                            <option value="04">4월</option>
                            <option value="05">5월</option>
                            <option value="06">6월</option>
                            <option value="07">7월</option>
                            <option value="08">8월</option>
                            <option value="09">9월</option>
                            <option value="10">10월</option>
                            <option value="11">11월</option>
                            <option value="12">12월</option>
                        </select>
                        <input type="text" name="day" placeholder="일" maxlength="2" onkeyup="validateDay(this);" required>
                	</div>
                </div>
				
				<!-- 연락처 -->
                <div class="enroll-form-div" id="emailAddress">
                	<h3>이메일 주소 <font color="red">*</font></h3>
                	<div class="sub">
                		<input type="text" name="emailId" onkeyup="noSpaceForm(this);">
                		<p>@</p>
                		<input type="text" name="emailAddr" onkeyup="noSpaceForm(this);">
	                    <select id="selbox" name="selbox">
	                    	<option value="">직접입력</option>
	                        <option value="naver.com">네이버(naver)</option>
	                        <option value="gmail.com">구글(gmail)</option>
	                    </select>
                	</div>
                </div>
               
                <div class="enroll-form-div" id="phone">
                	<h3>휴대전화</h3>
                    <input type="tel" name="phone" placeholder="휴대폰 번호 입력 (하이픈 '-'제외)" onkeyup="checkNumber(event)"/>
                </div>
				
				<button id="createButton" onclick="">가입하기</button>
			</form>
		</section>
	</main>
</body>
</html>