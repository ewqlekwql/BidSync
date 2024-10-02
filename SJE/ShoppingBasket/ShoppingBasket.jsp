<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="ShoppingBasket.css"  />
        <script src="ShoppingBasket.js" defer></script>
        <title>장바구니 페이지</title>
    </head>
    <body>
        <div align="center">
            <div class="all" id="allID">
                <button>
                    <div class="back">
                        <b> < </b> 장바구니
                    </div>
                </button>
            </div>
            <hr border="1px" id="hr1">
    
            <div class="allCheckBox">
                <input type="checkbox" id="productAll-Check" onchange="allCheck(this)">
                <div>
                    상품 전체
                </div>
                <input type="button" id="checkreset" value="선택삭제">
                <input type="button" id="soldoutcheck" value="품절/판매종료상품 전체삭제">
            </div>
    
            <hr id="hr2">
    
            <div class="product">
                <!--왼쪽 div-->
                <div class="product-left" align="start">
                    <div class="subject">
                        <div id="basket1">
                            <div class="left-side">
                                <input type="checkbox" id="one-check" class="one-product">
                                <label for="one-check"><b>주문 상품</b></label>
                            </div>
                            <button>삭제</button>
                        </div>
    
                        <div class="infomation">
                            <div class="img">
                                <img
                                    src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRY3xhcoxZKVYzdbCzhUkk1K6hoaekcByK9nA&s">
                            </div>
    
                            <div class="productName soldoutproduct" align="start">
                                <ul>
                                    <li style="padding: 3px;">
                                        <div class="soldoutsine">
                                        <img src="./img/soldout.png" id="soldoutImg">
                                        <p>품절</p>
                                    </div>
                                    </li>
                                    <li style="padding: 3px;">상품명</li>
                                    <li style="padding: 3px;">100,000,000원</li>
    
                                </ul>
                            </div>
                        </div>
                    </div>
    
                    <div class="subject">
                        <div id="basket1">
                            <div class="left-side">
                                <input type="checkbox" id="two-check" class="one-product">
                                <label for="two-check"><b>주문 상품</b></label>
                            </div>
                            <button>삭제</button>
                        </div>
    
                        <div class="infomation">
                            <div class="img">
                                <img
                                    src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRY3xhcoxZKVYzdbCzhUkk1K6hoaekcByK9nA&s">
                            </div>
    
                            <div class="productName" align="start">
                                <ul>
                                    <li style="padding: 3px;">상품명</li>
                                    <li style="padding: 3px;">100,000,000원</li>
                                    <li style="padding: 3px;">배송비 100원</li>
    
                                    <li>
                                        <div class="count">
                                            수량
                                            <div class="countAuto">
                                                <button id="btn1"><img src="./img/pngwing.com.png"></button> 1
                                                <button id="btn2"><img src="./img/pngwing.com (1).png"></button>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
    
                    <div class="subject">
                        <div id="basket1">
                            <div class="left-side">
                                <input type="checkbox" id="three-check" class="one-product">
                                <label for="three-check"><b>주문 상품</b></label>
                            </div>
                            <button>삭제</button>
                        </div>
    
                        <div class="infomation">
                            <div class="img">
                                <img
                                    src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRY3xhcoxZKVYzdbCzhUkk1K6hoaekcByK9nA&s">
                            </div>
    
                            <div class="productName" align="start">
                                <ul>
                                    <li style="padding: 3px;">상품명</li>
                                    <li style="padding: 3px;">100,000,000원</li>
                                    <li style="padding: 3px;">배송비 100원</li>
    
                                    <li>
                                        <div class="count">
                                            수량
                                            <div class="countAuto">
                                                <button id="btn1"><img src="./img/pngwing.com.png"></button> 1
                                                <button id="btn2"><img src="./img/pngwing.com (1).png"></button>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
    
                    <div class="subject">
                        <div id="basket1">
                            <div class="left-side">
                                <input type="checkbox" id="four-check" class="one-product">
                                <label for="four-check"><b>주문 상품</b></label>
                            </div>
                            <button>삭제</button>
                        </div>
    
                        <div class="infomation">
                            <div class="img">
                                <img
                                    src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRY3xhcoxZKVYzdbCzhUkk1K6hoaekcByK9nA&s">
                            </div>
    
                            <div class="productName" align="start">
                                <ul>
                                    <li style="padding: 3px;">상품명</li>
                                    <li style="padding: 3px;">100,000,000원</li>
                                    <li style="padding: 3px;">배송비 100원</li>
    
                                    <li>
                                        <div class="count">
                                            수량
                                            <div class="countAuto">
                                                <button id="btn1"><img src="./img/pngwing.com.png"></button> 1
                                                <button id="btn2"><img src="./img/pngwing.com (1).png"></button>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
    
                    <div class="subject">
                        <div id="basket1">
                            <div class="left-side">
                                <input type="checkbox" id="five-check" class="one-product">
                                <label for="five-check"><b>주문 상품</b></label>
                            </div>
                            <button>삭제</button>
                        </div>
    
                        <div class="infomation">
                            <div class="img">
                                <img
                                    src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRY3xhcoxZKVYzdbCzhUkk1K6hoaekcByK9nA&s">
                            </div>
    
                            <div class="productName" align="start">
                                <ul>
                                    <li style="padding: 3px;">상품명</li>
                                    <li style="padding: 3px;">100,000,000원</li>
                                    <li style="padding: 3px;">배송비 100원</li>
    
                                    <li>
                                        <div class="count">
                                            수량
                                            <div class="countAuto">
                                                <button id="btn1"><img src="./img/pngwing.com.png"></button> 1
                                                <button id="btn2"><img src="./img/pngwing.com (1).png"></button>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
    
                    <div class="subject">
                        <div id="basket1">
                            <div class="left-side">
                                <input type="checkbox" id="six-check" class="one-product">
                                <label for="six-check"><b>주문 상품</b></label>
                            </div>
                            <button>삭제</button>
                        </div>
    
                        <div class="infomation">
                            <div class="img">
                                <img
                                    src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRY3xhcoxZKVYzdbCzhUkk1K6hoaekcByK9nA&s">
                            </div>
    
                            <div class="productName" align="start">
                                <ul>
                                    <li style="padding: 3px;">상품명</li>
                                    <li style="padding: 3px;">100,000,000원</li>
                                    <li style="padding: 3px;">배송비 100원</li>
    
                                    <li>
                                        <div class="count">
                                            수량
                                            <div class="countAuto">
                                                <button id="btn1"><img src="./img/pngwing.com.png"></button> 1
                                                <button id="btn2"><img src="./img/pngwing.com (1).png"></button>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
    
                    <div class="subject">
                        <div id="basket1">
                            <div class="left-side">
                                <input type="checkbox" id="seven-check" class="one-product">
                                <label for="seven-check"><b>주문 상품</b></label>
                            </div>
                            <button>삭제</button>
                        </div>
    
                        <div class="infomation">
                            <div class="img">
                                <img
                                    src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRY3xhcoxZKVYzdbCzhUkk1K6hoaekcByK9nA&s">
                            </div>
    
                            <div class="productName" align="start">
                                <ul>
                                    <li style="padding: 3px;">상품명</li>
                                    <li style="padding: 3px;">100,000,000원</li>
                                    <li style="padding: 3px;">배송비 100원</li>
    
                                    <li>
                                        <div class="count">
                                            수량
                                            <div class="countAuto">
                                                <button id="btn1"><img src="./img/pngwing.com.png"></button> 1
                                                <button id="btn2"><img src="./img/pngwing.com (1).png"></button>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
    
                    <div class="subject">
                        <div id="basket1">
                            <div class="left-side">
                                <input type="checkbox" id="eight-check" class="one-product">
                                <label for="eight-check"><b>주문 상품</b></label>
                            </div>
                            <button>삭제</button>
                        </div>
    
                        <div class="infomation">
                            <div class="img">
                                <img
                                    src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRY3xhcoxZKVYzdbCzhUkk1K6hoaekcByK9nA&s">
                            </div>
    
                            <div class="productName" align="start">
                                <ul>
                                    <li style="padding: 3px;">상품명</li>
                                    <li style="padding: 3px;">100,000,000원</li>
                                    <li style="padding: 3px;">배송비 100원</li>
    
                                    <li>
                                        <div class="count">
                                            수량
                                            <div class="countAuto">
                                                <button id="btn1"><img src="./img/pngwing.com.png"></button> 1
                                                <button id="btn2"><img src="./img/pngwing.com (1).png"></button>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
    
                </div>
    
                <!--오른쪽 div-->
                <div class="product-right">
                    <div class="order">
                        <div class="orderText" align="start">
                            <b>주문 예상 금액</b>
                        </div>
                        <div class="order-total" align="start">
                            <div class="order-total-text">
                                총 상품 가격
                            </div>
                            <div class="order-total-price">
                                <b>200,000,000원</b>
                            </div>
                        </div>
                        <div class="order-total" align="start">
                            <div class="order-total-text">
                                총 할인
                            </div>
                            <div class="order-total-price" style="color: red;">
                                <b>-0원</b>
                            </div>
                        </div>
                        <div class="order-total" align="start">
                            <div class="order-total-text">
                                총 배송비
                            </div>
                            <div class="order-total-price" id="delivery">
                                <b>+300원</b>
                            </div>
                        </div>
    
                        <hr id="hr3">
    
                        <div class="order-total-price" id="total-price">
                            <b>200,000,300원</b>
                        </div>
    
                        <div class="buy">
                            <button id="buy-button">구매하기<b> (3)</b></button>
                        </div>
                    </div>
                </div>
    
            </div>
    
        </div>
    </body>
    </html>