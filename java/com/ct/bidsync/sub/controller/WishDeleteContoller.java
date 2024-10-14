package com.ct.bidsync.sub.controller;

import java.io.IOException;

import com.ct.bidsync.sub.service.WishService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class WishDeleteContoller
 */
@WebServlet(name = "delete.wish.me", description = "WishDeleteContoller", urlPatterns = { "/delete.wish.me" })
public class WishDeleteContoller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishDeleteContoller() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// wishNo
		int wishNo = Integer.parseInt(request.getParameter("no"));
		System.out.println("WishDelete : " + wishNo);
		
		// delete(status -> N)
		int result = new WishService().deleteWish(wishNo);
		if(result == 0) {
			// 삭제 실패 -> error 띄운 후 장바구니 페이지로 이동
			request.setAttribute("errorMsg", "삭제에 실패했습니다. 다시 시도해주세요.");
			request.setAttribute("responseURL", request.getContextPath() + "/wish.me");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		else {
			// 삭제 성공
			request.setAttribute("alertMsg", "성공적으로 삭제되었습니다. 관심상품 목록으로 돌아갑니다.");
			request.setAttribute("responseURL", request.getContextPath() + "/wish.me");
			
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
