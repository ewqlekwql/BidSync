<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 등록</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/views/resources/css/Purchase completed.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/views/resources/css/action page.css">
    
    
</head>
<body>
    <div class="container">
        <header>
            <a href=""><h1>BID SYNC</h1></a>
            <input type="text" placeholder="검색어를 입력해 주세요..." class="search-bar">
            <button class="search-btn">검색</button>
        </header>

        <nav class="menu">
            <a href="#">패션</a>
            <a href="#">디지털</a>
            <a href="#">스포츠</a>
            <a href="#">친구</a>
            <a href="#">예술</a>
            <a href="#">홈</a>
            <a href="#">건강</a>
            <a href="#">뷰티</a>
            <a href="#">기타</a>
        </nav>

        <main>
            <h2>판매할 상품을 등록해 주세요.</h2>
        
            <form class="product-form" onsubmit="submitForm(event)">
                <div class="image-upload">
                    <p>등록할 상품의 이미지를 넣어주세요.</p>
                    <!-- 이미지를 클릭하면 파일 선택 창이 뜨도록 설정 -->
                    <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/170356472022385905.jpg?gif=1&w=640&h=640&c=c&webp=1" alt="상품 이미지" id="product-image" style="max-width: 200px; cursor: pointer;" onclick="document.getElementById('image-input').click();">
                    <input type="file" id="image-input" accept="image/*" style="display: none;" onchange="previewImage(event)">
                </div>
        
                <div class="product-details">
                    <label for="title">제목</label>
                    <input type="text" id="title" placeholder="제목" required>
        
                    <label for="price">입찰 시작가</label>
                    <input type="text" id="price" placeholder="가격을 입력해 주세요." required>
        
                    <label for="start-time">경매 시작 시간</label>
                    <div class="time-select">
                        <select id="hour">
                            <option>01</option>
                            <option>02</option>
                            <option>03</option>
                            <option>04</option>
                            <option>05</option>
                            <option>06</option>
                            <option>07</option>
                            <option>08</option>
                            <option>09</option>
                            <option>10</option>
                            <option>11</option>
                            <option>12</option>
                        </select>
                        :
                        <select id="minute">
                            <option>00</option>
                            <option>01</option>
                            <option>02</option>
                            <option>03</option>
                            <option>04</option>
                            <option>05</option>
                            <option>06</option>
                            <option>07</option>
                            <option>08</option>
                            <option>09</option>
                            <option>10</option>
                            <option>11</option>
                            <option>12</option>
                            <option>13</option>
                            <option>14</option>
                            <option>15</option>
                            <option>16</option>
                            <option>17</option>
                            <option>18</option>
                            <option>19</option>
                            <option>20</option>
                            <option>21</option>
                            <option>22</option>
                            <option>23</option>
                            <option>24</option>
                            <option>25</option>
                            <option>26</option>
                            <option>27</option>
                            <option>28</option>
                            <option>29</option>
                            <option>30</option>
                            <option>31</option>
                            <option>32</option>
                            <option>33</option>
                            <option>34</option>
                            <option>35</option>
                            <option>36</option>
                            <option>37</option>
                            <option>38</option>
                            <option>39</option>
                            <option>40</option>
                            <option>41</option>
                            <option>42</option>
                            <option>43</option>
                            <option>44</option>
                            <option>45</option>
                            <option>46</option>
                            <option>47</option>
                            <option>48</option>
                            <option>49</option>
                            <option>50</option>
                            <option>51</option>
                            <option>52</option>
                            <option>53</option>
                            <option>54</option>
                            <option>55</option>
                            <option>56</option>
                            <option>57</option>
                            <option>58</option>
                            <option>59</option>
                        </select>
                        <select id="ampm">
                            <option>오전</option>
                            <option>오후</option>
                        </select>
                    </div>
                    <small>오전 12시에서 오전 6시 사이에 물품을 만드는 것을 권장하지 않습니다. 차떼미 시간에 시작하는 경매가 가장 많은 입찰을 받습니다.</small>
        
                    <label for="duration">경매 기간</label>
                    <select id="duration">
                        <option value="1일">1일</option>
                        <option value="3일">3일</option>
                        <option value="7일">7일</option>
                        <option value="15일">15일</option>
                        <option value="30일">30일</option>
                    </select>
        
                    <label for="category">구분</label>
                    <select id="category">
                        <option value="패션">패션</option>
                        <option value="디지털·가전">디지털·가전</option>
                        <option value="스포츠">스포츠</option>
                        <option value="홈·데코">홈·데코</option>
                        <option value="완구">완구</option>
                        <option value="미술">미술</option>
                        <option value="취미">취미</option>
                    </select>
        
                    <label for="description">상품 설명</label>
                    <textarea id="description" placeholder="상품 설명을 입력해 주세요." required></textarea>
                </div>
        
                <button type="submit" class="submit-btn">등록하기</button>
            </form>
        </main>
        
        <!-- 팝업 창 -->
<div class="popup-container" id="popup" style="display: none;">
    <h1>BID SYNC</h1>
    <h2>상품이 성공적으로 등록되었습니다!</h2>

    <div class="product-info">
        <h3>등록된 상품 정보</h3>
        <img src="" alt="등록된 상품 이미지" id="popup-product-image" style="max-width: 200px;">
        <p id="product-title"></p>
        <p id="product-price"></p>
        <p id="product-duration"></p> <!-- 경매 기간 표시 -->
        <p id="product-category"></p>
        <p id="product-description"></p>
    </div>
    <br>
    <button class="popup-btn" onclick="closePopup()">확인</button>
</div>
        
    </div>

    <script src="<%= request.getContextPath() %>/views/resources/js/Sales Page.js"></script>
    <script src="<%= request.getContextPath() %>/views/resources/js/Purchase completed.js"></script>
</body>
</html>
