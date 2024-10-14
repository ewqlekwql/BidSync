package com.ct.bidsync.sub.service;

import static com.ct.bidsync.common.JDBCTemplate.close;
import static com.ct.bidsync.common.JDBCTemplate.commit;
import static com.ct.bidsync.common.JDBCTemplate.getConnection;
import static com.ct.bidsync.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.ct.bidsync.sub.model.dao.WishDao;
import com.ct.bidsync.sub.model.vo.Wish;

public class WishService {
	// WishListController
	public ArrayList<Wish> selectWishList(int userNo) {
		Connection conn = getConnection();
		
		ArrayList<Wish> list = new WishDao().selectWishList(conn, userNo);
		
		close(conn);
		return list;
	}
	
	// WishUpdateContoller
	public int selectBoardNo(int wishNo) {
		Connection conn = getConnection();
		
		int no = new WishDao().selectBoardNo(conn, wishNo);
		
		close(conn);
		return no;
	}
}
