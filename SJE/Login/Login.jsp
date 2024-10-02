<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="Login.css"  />
        <script src="Login.js" defer></script>
        <title>로그인 페이지</title>
    </head>
    
    <body>
        <div class="wapper">
            <div class="inputtype">
                <h1>LOGIN</h1>
                
                <input type="text" id="inputid" placeholder="아이디를 입력하세요."><br>
                <input type="password" id="inputpassword" placeholder="비밀번호를 입력하세요.">
                
                <span id="join_required" class="join_text hidden"><b>아이디 또는 비밀번호가 잘못 되었습니다. 아이디와 비밀번호를 정확히 입력해주세요.</b></span>
                
                <br><br>
    
                <input type="button" id="loginbtn" value="LOGIN" onclick="loginbutton();">
                
                <div class="remember">
                    <input type="checkbox" id="check">
                    <label for="check">아이디저장</label>
    
                    <b>&ensp;|</b>
                    <a href="">아이디 / 비밀번호 찾기</a>
                </div>
    
                <br><br>
                
                <div class="site">
                    <h1>SNS</h1>
                </div> 
    
                <div class="icon">
                    <div class="google">
                        <button>
                            <img src="./img/social_10091758 (1).png" id="google" onclick="window.open('https://accounts.google.com/v3/signin/identifier?authuser=0&continue=https%3A%2F%2Fwww.google.co.kr%2F&ec=GAlAmgQ&hl=ko&flowName=GlifWebSignIn&flowEntry=AddSession&dsh=S304405156%3A1725998631822941&ddm=0')">
                        </button>
                        
                    </div>
                    <div>
                        <button><img src="./img/symbol_9920651.png" id="naver" onclick="window.open('https://nid.naver.com/nidlogin.login?mode=form&url=https://www.naver.com/')"></button>
                    </div>
                    <div>
                        <button><img src="./img/kakao-talk_4494570.png" id="kakao" onclick="window.open('https://accounts.kakao.com/login/?continue=https%3A%2F%2Fkauth.kakao.com%2Foauth%2Fauthorize%3Fproxy%3DeasyXDM_Kakao_qm2fwpv4ulg_provider%26ka%3Dsdk%252F1.43.5%2520os%252Fjavascript%2520sdk_type%252Fjavascript%2520lang%252Fko-KR%2520device%252FWin32%2520origin%252Fhttps%25253A%25252F%25252Fwww.epis.or.kr%26origin%3Dhttps%253A%252F%252Fwww.epis.or.kr%26response_type%3Dcode%26redirect_uri%3Dkakaojs%26state%3Dkmpfyp45n3ifwonn7p31b7%26through_account%3Dtrue%26client_id%3D950f3ae1f2f550e5ba7ff7d9fffc7781&talk_login=hidden#login')"></button>
                    </div>
                </div>
    
            </div>
    
        </div>
    </body>
    </html>