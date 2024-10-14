package com.ct.bidsync.order.service;

import static com.ct.bidsync.common.JDBCTemplate.close;
import static com.ct.bidsync.common.JDBCTemplate.commit;
import static com.ct.bidsync.common.JDBCTemplate.getConnection;
import static com.ct.bidsync.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.ct.bidsync.order.model.dao.OrderDao;
import com.ct.bidsync.order.model.vo.Order;

public class OrderService {
	// OrderInsertContoller
	public int insertOrder() {
		Connection conn = getConnection();
		
		int result = new OrderDao().insertOrder(conn);
		
		close(conn);
		return result;
	}
}
