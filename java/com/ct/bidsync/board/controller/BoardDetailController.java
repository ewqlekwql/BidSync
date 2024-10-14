package com.ct.bidsync.board.controller;

import java.io.IOException;

import com.ct.bidsync.board.model.vo.Board;
import com.ct.bidsync.board.service.BoardService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BoardDetailController
 */
@WebServlet(name = "detail.bo", urlPatterns = { "/detail.bo" })
public class BoardDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDetailController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		BoardService bService = new BoardService();
		
		// 넘겨받은 ctg, boardNo
		String ctg = request.getParameter("ctg");
		int boardNo = Integer.parseInt(request.getParameter("no"));
		System.out.println("detail : " + ctg + ", " + boardNo);
		
		// board 정보 불러오기
		Board b = bService.selectBoard(boardNo);
		
		if(b == null) {
			// board 정보 X -> list 페이지로 이동
			request.setAttribute("errorMsg", "존재하지 않는 페이지거나 잘못된 접근입니다.");
			
			// ctg 정보도 없을 경우 -> index로 이동
			if(ctg == null) {
				request.setAttribute("responseURL", request.getContextPath());
			}
			else {
				request.setAttribute("responseURL", request.getContextPath() + "/list.bo?ctg=" + ctg + "&cpage=1");
			}
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		// boardDetail로 전달, 이동
		request.setAttribute("board", b);
		request.getRequestDispatcher("/views/board/boardDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
