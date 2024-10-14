package com.ct.bidsync.member.controller;

import java.io.IOException;
import java.sql.Date;

import com.ct.bidsync.member.model.vo.Member;
import com.ct.bidsync.member.service.MemberService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class MemberUpdateController
 */
@WebServlet(name = "update.me", urlPatterns = { "/update.me" })
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// 유저 아이디 (변경X)
		String userId = request.getParameter("userId");
		
		// 변경값
		String userName = request.getParameter("updateName");
		
		String gender = request.getParameter("updateGender");
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
		
		String email = request.getParameter("updateEmail");
		String phone = request.getParameter("updatePhone");
		
		Member m = new Member(userId, userName, gender, birthday, email, phone);
		
		// 변경 사항 전달 -> 업데이트
		Member updateMember = new MemberService().updateMember(m);
		if(updateMember == null) {
			// 업데이트 실패
		}
		else {
			// 업데이트 성공, 갱신
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", updateMember);
			
//			request.setAttribute("loginUser", loginUser);
//			request.setAttribute("alertMsg", "성공적으로 회원가입이 완료되었습니다. BidSync에 오신 걸 환영합니다!");
//			request.setAttribute("responseURL", request.getContextPath() + "/index.jsp");
//			
//			request.getRequestDispatcher("views/common/alertPage.jsp").forward(request, response);
//			
//			response.sendRedirect(request.getContextPath());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
