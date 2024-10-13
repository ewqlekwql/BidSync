package com.ct.bidsync.member.service;

import static com.ct.bidsync.common.JDBCTemplate.close;
import static com.ct.bidsync.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.ct.bidsync.member.model.dao.CartDao;
import com.ct.bidsync.member.model.vo.Cart;

public class CartService {
	// CartListContoller
	public ArrayList<Cart> selectCartList(String userId) {
		Connection conn = getConnection();
		
		ArrayList<Cart> list = new CartDao().selectCartList(conn, userId);
		
		close(conn);
		return list;
	}
}
