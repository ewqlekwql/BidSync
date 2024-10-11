package com.ct.bidsync.board.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class KakaoPayServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            // 헤더 설정
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Authorization", "KakaoAK 8ab1c0135e8dce2227f968f690f83f25"); // Admin Key
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

            // 요청 파라미터 설정
            connection.setDoOutput(true);
            StringBuilder params = new StringBuilder();
            params.append("cid=").append(URLEncoder.encode("TC0ONETIME", "UTF-8"));
            params.append("&partner_order_id=").append(URLEncoder.encode("1001", "UTF-8")); // 유니크한 값인지 확인
            params.append("&partner_user_id=").append(URLEncoder.encode("user1", "UTF-8"));
            params.append("&item_name=").append(URLEncoder.encode("테스트 상품", "UTF-8"));
            params.append("&quantity=").append(URLEncoder.encode("1", "UTF-8"));
            params.append("&total_amount=").append(URLEncoder.encode("10000", "UTF-8"));  // 결제 금액
            params.append("&vat_amount=").append(URLEncoder.encode("1000", "UTF-8"));
            params.append("&tax_free_amount=").append(URLEncoder.encode("0", "UTF-8"));
            params.append("&approval_url=").append(URLEncoder.encode("http://localhost:5555/BidSync/views/bid/BidDetail.jsp", "UTF-8"));
            params.append("&cancel_url=").append(URLEncoder.encode("http://localhost:5555/BidSync/views/bid/Cancel.jsp", "UTF-8"));
            params.append("&fail_url=").append(URLEncoder.encode("http://localhost:5555/BidSync/views/bid/Fail.jsp", "UTF-8"));

            // 파라미터 전송
            try (OutputStream os = connection.getOutputStream()) {
                byte[] input = params.toString().getBytes("UTF-8");
                os.write(input, 0, input.length);
            }

            // 응답 처리
            int responseCode = connection.getResponseCode();
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            if (responseCode == HttpURLConnection.HTTP_OK) {
                try (BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
                    StringBuilder responseContent = new StringBuilder();
                    String line;
                    while ((line = br.readLine()) != null) {
                        responseContent.append(line);
                    }
                    System.out.println("KakaoPay API Response: " + responseContent.toString());
                    response.getWriter().write(responseContent.toString());
                }
            } else {
                try (BufferedReader br = new BufferedReader(new InputStreamReader(connection.getErrorStream()))) {
                    StringBuilder errorContent = new StringBuilder();
                    String line;
                    while ((line = br.readLine()) != null) {
                        errorContent.append(line);
                    }
                    // 에러 응답 디버깅
                    System.err.println("KakaoPay API Error: " + errorContent.toString());
                    response.getWriter().write("{\"error\":\"카카오페이 결제 준비 실패\", \"code\":" + responseCode + ", \"message\": \"" + errorContent.toString() + "\"}");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("{\"error\":\"서버 오류 발생: " + e.getMessage() + "\"}");
        }
        System.out.println("KakaoPayServlet is called!");
    }
}
