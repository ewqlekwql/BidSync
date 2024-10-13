package com.ct.bidsync.member.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

import com.ct.bidsync.member.model.vo.Cart;
import com.ct.bidsync.member.model.vo.Member;
import com.ct.bidsync.member.service.CartService;

/**
 * Servlet implementation class CartDeleteSoldOutContoller
 */
@WebServlet(name = "deleteSO.cart.me", description = "CartDeleteSoldOutContoller", urlPatterns = { "/deleteSO.cart.me" })
public class CartDeleteSoldOutContoller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartDeleteSoldOutContoller() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 정보 불러오기
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		System.out.println("deleteSO user confirm : " + loginUser.getUserId());
		
		// 장바구니 목록에서 판매가 종료된 상품을 찾아 전체 삭제
		int deleteSO = new CartService().deleteSoldOut(loginUser.getUserId());
		if(deleteSO == 0) {
			// 삭제 실패 -> error 띄운 후 장바구니 페이지로 이동
			request.setAttribute("errorMsg", "삭제할 상품이 없습니다.");
			request.setAttribute("responseURL", request.getContextPath() + "/cart.me");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		else {
			// 삭제 성공 -> 장바구니 목록 갱신
			ArrayList<Cart> list = new CartService().selectCartList(loginUser.getUserId());
			
			// 갱신한 목록을 가지고 cartList로 이동
			request.setAttribute("cartList", list);
			request.getRequestDispatcher("/cart.me").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
