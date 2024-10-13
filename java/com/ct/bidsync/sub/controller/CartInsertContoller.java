package com.ct.bidsync.sub.controller;

import java.io.IOException;
import java.util.ArrayList;

import com.ct.bidsync.member.model.vo.Member;
import com.ct.bidsync.sub.model.vo.Cart;
import com.ct.bidsync.sub.service.CartService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class CartUpdateContoller
 */
@WebServlet(name = "insert.cart.me", description = "CartInsertContoller", urlPatterns = { "/insert.cart.me" })
public class CartInsertContoller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartInsertContoller() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// 로그인 정보
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		// 전달받은 값
		String ctg = request.getParameter("ctg");
		int boardNo = Integer.parseInt(request.getParameter("no"));
		int stock = Integer.parseInt(request.getParameter("stock"));
		System.out.println("cartUpdate : " + loginUser.getUserId() + ", " + boardNo + ", " + stock);
		
		// insert
		int result = new CartService().insertCart(loginUser.getUserNo(), boardNo, stock);
		if(result == 0) {
			// 장바구니 추가 실패
			request.setAttribute("errorMsg", "장바구니 추가에 실패했습니다. 다시 시도해주세요.");
			request.setAttribute("responseURL", request.getContextPath() + "/detail.bo?ctg=" + ctg + "&no=" + boardNo);
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		else {
			// 장바구니 추가 성공 -> 장바구니로 이동
			request.setAttribute("alertMsg", "성공적으로 추가되었습니다. 장바구니로 이동합니다.");
			request.setAttribute("responseURL", request.getContextPath() + "/cart.me");
			
			request.getRequestDispatcher("views/common/alertPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
