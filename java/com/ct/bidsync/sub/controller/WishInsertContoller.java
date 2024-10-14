package com.ct.bidsync.sub.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.ct.bidsync.member.model.vo.Member;
import com.ct.bidsync.sub.service.WishService;

/**
 * Servlet implementation class WishInsertContoller
 */
public class WishInsertContoller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishInsertContoller() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// 로그인 정보 불러오기
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		// ctg, boardNo
		String ctg = request.getParameter("ctg");
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		System.out.println("wishInsert : " + loginUser.getUserId() + ", " + boardNo);
		
		// insert
		int result = new WishService().insertWish(loginUser.getUserNo(), boardNo);
		if(result == 0) {
			// 추가 실패
			request.setAttribute("errorMsg", "관심목록 추가에 실패했습니다. 다시 시도해주세요.");
			request.setAttribute("responseURL", request.getContextPath() + "/detail.bo?ctg=" + ctg + "&no=" + boardNo);
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		else {
			// 성공
			request.setAttribute("alertMsg", "성공적으로 추가되었습니다. 관심상품 목록으로 이동합니다.");
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
