package com.ct.bidsync.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import com.ct.bidsync.board.model.vo.Board;
import com.ct.bidsync.board.service.BoardService;
import com.ct.bidsync.member.model.vo.Cart;
import com.ct.bidsync.member.model.vo.Member;
import com.ct.bidsync.member.service.CartService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class CartListController
 */
@WebServlet(name = "cart.me", description = "CartListContoller", urlPatterns = { "/cart.me" })
public class CartListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartListController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 정보 불러오기
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		System.out.println("cart user : " + loginUser.getUserId());
		
		// 장바구니 리스트 불러오기
		ArrayList<Cart> list = new CartService().selectCartList(loginUser.getUserId());
		
		// cartList로 이동
		request.setAttribute("cartList", list);
		request.getRequestDispatcher("/views/member/cartList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
