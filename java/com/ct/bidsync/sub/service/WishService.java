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
	
	public int updateWish(int wishNo, int userNo, int boardNo, int stock) {
		Connection conn = getConnection();
		
		int result1 = new CartService().insertCart(userNo, boardNo, 1);
		int result2 = new WishDao().updateWish(conn, wishNo);
		
		if((result1 * result2) > 0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		
		close(conn);
		return result1 * result2;
	}
	
	// WishUpdateController
	public int deleteWish(int wishNo) {
		Connection conn = getConnection();
		
		int result = new WishDao().updateWish(conn, wishNo);
		if(result > 0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	// WishInsertContoller
	public int insertWish(int userNo, int boradNo) {
		Connection conn = getConnection();
		
		int result = new WishDao().insertWish(conn, userNo, boradNo);
		if(result > 0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
}
