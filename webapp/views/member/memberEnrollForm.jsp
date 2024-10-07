<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>BidSnyc - 회원가입</title>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="/views/common/header.jsp" />
	
	<main id="enroll-main">
		<section id="enroll-section">
			<form id="enroll-form" action="${pageContext.request.contextPath}/insert.me" method="post">
				<h1>회원가입</h1>
				
				<!-- 계정 -->
				<div>
					<b>아이디</b>
					<input type="text">
				</div>
				
				<!-- 회원 정보 -->
				
				
				<!-- 연락처 -->
				<input type="submit" value="가입하기">
			</form>
		</section>
	</main>
	
	<div class="new-member-all">
        <div class="wapper">
            <div id="logo">
                <p><b>BID SYNC</b></p>
            </div>
            <br>
            <div class="content">
                <div class="index" id="id">
                    <b>아이디</b>
                    <br>
                    <input type="text" id="user_id" placeholder="아이디 입력 (6~20자)" required onkeydown="noSpaceForm(this);" onkeyup="this.value=this.value.replace(/[^0-9a-zA-Z-_]/g,'');" onchange="noSpaceForm(this);" onblur="checkInput(this.id);">
                    <button id="id_overlap_check">중복 체크</button>
                    <span id="user_id_required" class="check_text hidden"><b>사용할 수 없는 아이디입니다.</b></span>
                    
                </div>
                <div class="index" id="password">
                    <b>비밀번호</b>
                    <br>
                    <input type="password" id="user_password" placeholder="비밀번호 입력 (문자,숫자,특수문자 포함 (8~20자))" onblur="checkInput(this.id);" onclick="passwordCheck(this.value)" required>
                    <span id="user_password_required" class="check_text hidden"><b>문자,숫자,특수문자 포함 (8~20자)</b></span>
                </div>
                <div class="index" id="passwordCheck">
                    <b>비밀번호 재확인</b>
                    <br>
                    <input type="password" placeholder="비밀번호 재입력" id="passwordRecheck" required onblur="passwordReCheck()">
                    <span id="pwd_check_required" class="check_text hidden"><b>비밀번호가 일치하지 않습니다.</b></span>
                </div>
                <div class="index" id="name">
                    <b>이름</b>
                    <br>
                    <input type="text" placeholder="이름을 입력해주세요">
                </div>
                <b>생년월일</b>
                <div class="index" id="birth">
                    <div class="birth-year">
                        <input type="text" placeholder="년(4자)">
                    </div>
                    <div class="index" id="birth-month">
                        <select aria-placeholder="월">
                            <option value="">선택</option>
                            <option value="1">1월</option>
                            <option value="2">2월</option>
                            <option value="3">3월</option>
                            <option value="4">4월</option>
                            <option value="5">5월</option>
                            <option value="6">6월</option>
                            <option value="7">7월</option>
                            <option value="8">8월</option>
                            <option value="9">9월</option>
                            <option value="10">10월</option>
                            <option value="11">11월</option>
                            <option value="12">12월</option>
                        </select>
                    </div>
                    <div class="index" id="birth-day">
                        <input type="text" placeholder="일">
                    </div>
                </div>

                <b>이메일 주소</b>
                
                <div class="index" id="emailAddress">
                    <input type="email">
                    <b>@</b>
                    <select id="selbox" name="selbox">
                        <option value="">선택</option>
                        <option value="네이버">naver.com</option>
                        <option value="구글">google.com</option>
                        <option value="direct">직접입력</option>
                    </select>
                </div>
                
                <div class="index" id="phone">
                    <b>휴대전화</b>
                    <br>
                    <input type="tel" placeholder="휴대폰 번호 입력 ('-'제외 11자리 입력)" onkeyup="checkNumber(event)"/>
                </div>
                
                <div class="submit">
                    <button id="createButton" onclick=""><b>가입 하기</b></button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>