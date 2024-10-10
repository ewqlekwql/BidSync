package com.ct.bidsync.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import com.ct.bidsync.board.model.vo.Board;
import com.ct.bidsync.board.service.BoardService;
import com.ct.bidsync.common.PageInfo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BoardUrlController
 */
@WebServlet(name = "list.bo", urlPatterns = { "/list.bo" })
public class BoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// 카테고리값
		String ctg = request.getParameter("ctg");
		System.out.println("list ctg : " + ctg);
		
		// 페이징 처리
		int listCount;
		int currentPage;
		int pageLimit = 10;
		int boardLimit = 10;
		
		int maxPage;
		int startPage;
		int endPage;
		
		listCount = new BoardService().selectListCount(ctg);
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		endPage = endPage > maxPage ? maxPage : endPage;
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		ArrayList<Board> list = new BoardService().selectList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("ctg", ctg);
		request.getRequestDispatcher("/views/board/boardListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
