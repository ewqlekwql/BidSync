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
	public int selectListCount(String ctg) {
		Connection conn = getConnection();
		
		int listCount = new BoardDao().selectListCount(conn, ctg);
		
		close(conn);
		return listCount;
	}
	
	public ArrayList<Board> selectList(PageInfo pi, String ctg) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectList(conn, pi, ctg);
		
		close(conn);
		return list;
	}
}
