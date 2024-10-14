package com.ct.bidsync.sub.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.ct.bidsync.member.model.vo.Member;
import com.ct.bidsync.sub.service.CartService;
import com.ct.bidsync.sub.service.WishService;

/**
 * Servlet implementation class WishUpdateContoller
 */
@WebServlet(name = "update.wish.me", description = "WishUpdateContoller", urlPatterns = { "/update.wish.me" })
public class WishUpdateContoller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishUpdateContoller() {
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
		
		// wishNo
		int wishNo = Integer.parseInt(request.getParameter("no"));
		System.out.println("updateWish : " + loginUser.getUserId() + ", " + wishNo);
		
		// boardNo 받아오기
		int boardNo = new WishService().selectBoardNo(wishNo);
		
		// 장바구니에 상품 추가
		int result = new WishService().updateWish(wishNo, loginUser.getUserNo(), boardNo, 1);
		if(result == 0) {
			// 장바구니 추가 실패 | 관심목록에서 삭제 실패
			request.setAttribute("errorMsg", "장바구니 추가에 실패했습니다. 다시 시도해주세요.");
			request.setAttribute("responseURL", request.getContextPath() + "/wish.me");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		else {
			// 장바구니 추가 성공 + 관심목록에서 삭제
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
