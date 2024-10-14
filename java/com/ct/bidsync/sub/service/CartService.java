package com.ct.bidsync.sub.service;

import static com.ct.bidsync.common.JDBCTemplate.close;
import static com.ct.bidsync.common.JDBCTemplate.commit;
import static com.ct.bidsync.common.JDBCTemplate.getConnection;
import static com.ct.bidsync.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.ct.bidsync.sub.model.dao.CartDao;
import com.ct.bidsync.sub.model.vo.Cart;

public class CartService {
	// CartListContoller
	public ArrayList<Cart> selectCartList(String userId) {
		Connection conn = getConnection();
		
		ArrayList<Cart> list = new CartDao().selectCartList(conn, userId);
		
		close(conn);
		return list;
	}
	
	// CartInsertContoller
	public int insertCart(int userNo, int boardNo, int stock) {
		Connection conn = getConnection();
		
		int result = new CartDao().insertCart(conn, userNo, boardNo, stock);
		if(result > 0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		
		return result;
	}
	
	// CartDeleteSoldOutContoller
	public int deleteSoldOut(String userId) {
		Connection conn = getConnection();
		
		int result = new CartDao().deleteSoldOut(conn, userId);
		if(result > 0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		
		return result;
	}
}
