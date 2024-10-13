package com.ct.bidsync.order.controller;

import java.io.IOException;
import java.util.ArrayList;

import com.ct.bidsync.board.model.vo.Board;
import com.ct.bidsync.board.service.BoardService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class OrderContoller
 */
@WebServlet(name = "order.me", description = "OrderContoller", urlPatterns = { "/order.me" })
public class OrderContoller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderContoller() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// 전달받은 값
		String ctg = request.getParameter("ctg");
		
		String type = request.getParameter("type");
		String typeName = "";
		switch (type) {
		case "경매_입찰" :
			typeName = "입찰 진행";
			break;
		case "경매_낙찰" :
			typeName = "낙찰 진행";
			break;
		default :
			typeName = "구매 진행";
		}
		
		String noArr[] = request.getParameterValues("no");
		ArrayList<Board> bList = new ArrayList<>();
		for(int i = 0; i < noArr.length; i++) {
			bList.add(new BoardService().selectBoard(Integer.parseInt(noArr[i])));
		}
		
		String stringStock[] = request.getParameterValues("stock");
		int stock[] = new int[stringStock.length];
		for(int i = 0; i < stringStock.length; i++) {
			stock[i] = Integer.parseInt(stringStock[i]);
		}
		
		request.setAttribute("typeName", typeName);
		request.setAttribute("bList", bList);
		request.setAttribute("stock", stock);
		request.getRequestDispatcher("/views/member/order.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
