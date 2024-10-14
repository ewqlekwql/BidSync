package com.ct.bidsync.sub.controller;

import java.io.IOException;
import java.util.ArrayList;

import com.ct.bidsync.member.model.vo.Member;
import com.ct.bidsync.sub.model.vo.Wish;
import com.ct.bidsync.sub.service.WishService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class WishListContoller
 */
@WebServlet(name = "wish.me", description = "WishListContoller", urlPatterns = { "/wish.me" })
public class WishListContoller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishListContoller() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 정보 불러오기
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		System.out.println("wish user : " + loginUser.getUserId());
		
		// 관심상품 리스트 불러오기
		ArrayList<Wish> list = new WishService().selectWishList(loginUser.getUserNo());
		
		// cartList로 이동
		request.setAttribute("wishList", list);
		request.getRequestDispatcher("/views/member/wishList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
