package com.ct.bidsync.member.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import com.ct.bidsync.member.model.vo.Member;
import com.ct.bidsync.member.service.MemberService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class MemberInsertController
 */
@WebServlet(name = "insert.me", urlPatterns = { "/insert.me" })
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// 회원가입 정보 객체 기록
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		
		String gender = request.getParameter("gender");
		if(gender == "") {
			gender = null;
		}
		
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		if(day.length() == 1) {
			day = "0" + day;
		}
		
		String date = year + "-" + month + "-" + day;
		Date birthday = java.sql.Date.valueOf(date);
		
		String email = (request.getParameter("emailId") + "@" + request.getParameter("emailAddr"));
		
		String phone = request.getParameter("phone");
		if(phone == "") {
			phone = null;
		}
		
		Member m = new Member(userId, userPwd, userName, gender, birthday, email, phone);
		
		// 등록 진행
		int result = new MemberService().insertMember(m);
		
		if(result > 0) {
			// 회원가입 성공
			System.out.println("회원가입 성공");
			Member loginUser = new MemberService().loginMember(userId, userPwd);
			
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			request.setAttribute("alertMsg", "성공적으로 회원가입이 완료되었습니다. BidSync에 오신 걸 환영합니다!");
			request.setAttribute("responseURL", request.getContextPath());
			
			request.getRequestDispatcher("views/common/alertPage.jsp").forward(request, response);
		}
		else {
			// 회원가입 실패
			request.setAttribute("errorMsg", "회원가입에 실패했습니다. 다시 시도해주세요.");
			request.setAttribute("responseURL", request.getContextPath() + "/enroll.me");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
