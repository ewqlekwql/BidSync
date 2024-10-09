package com.ct.bidsync.member.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class MemberUrlController
 */
@WebServlet(name = "url.me", urlPatterns = { "/url.me" })
public class MemberUrlController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUrlController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// URL 필터 대용
		String call = request.getParameter("call");
		
		switch(call) {
		case "login" :
			request.getRequestDispatcher("/views/member/memberLoginForm.jsp").forward(request, response);
			break;
		case "enroll" :
			request.getRequestDispatcher("/views/member/memberEnrollForm.jsp").forward(request, response);
			break;
		case "myPage" :
			request.getRequestDispatcher("/views/member/myPage.jsp").forward(request, response);
			break;
		default :
			request.setAttribute("errorMsg", "잘못된 접근입니다.");
			request.setAttribute("responseURL", request.getContextPath() + "/index.jsp");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
