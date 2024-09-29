<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CreateAccount.css"  />
    <script src="CreateAccount.js" defer></script>
    <title>회원가입 페이지</title>
</head>

<body>
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
                    <input type="text" placeholder="아이디 입력 (6~20자)">
                </div>
                <div class="index" id="password">
                    <b>비밀번호</b>
                    <br>
                    <input type="password" placeholder="비밀번호 입력 (문자,숫자,특수문자 포함 (8~20자))">
                </div>
                <div class="index" id="passwordCheck">
                    <b>비밀번호 재확인</b>
                    <br>
                    <input type="password" placeholder="비밀번호 재입력">
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
                    <select>
                        <option>naver.com</option>
                        <option>google.com</option>
                        <option>직접입력</option>
                    </select>
                </div>
                <div class="index" id="phone">
                    <b>휴대전화</b>
                    <br>
                    <input type="tel" placeholder="휴대폰 번호 입력 ('-'제외 11자리 입력)">
                </div>
                
                <div class="submit">
                    <button><b>가입 하기</b></button>
                </div>
            </div>
        </div>
    </div>
</body>

</html>