package com.ct.bidsync.board.service;

import static com.ct.bidsync.common.JDBCTemplate.close;
import static com.ct.bidsync.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.ct.bidsync.board.model.dao.BoardDao;
import com.ct.bidsync.board.model.vo.Board;
import com.ct.bidsync.common.PageInfo;

public class BoardService {
	// BoardListController
	public int selectListCount(String ctg, String type, String status) {
		Connection conn = getConnection();
		
		int listCount = new BoardDao().selectListCount(conn, ctg, type, status);
		
		close(conn);
		return listCount;
	}
	
	public ArrayList<Board> selectList(PageInfo pi, String ctg, String type, String status) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectList(conn, pi, ctg, type, status);
		
		close(conn);
		return list;
	}
	
	// BoardDetailController
	public Board selectBoard(int boardNo) {
		Connection conn = getConnection();
		
		Board b = new BoardDao().selectBoard(conn, boardNo);
		
		close(conn);
		return b;
	}
}
