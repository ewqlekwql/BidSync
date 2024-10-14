package com.ct.bidsync.order.model.dao;

import static com.ct.bidsync.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.ct.bidsync.member.model.dao.MemberDao;

public class OrderDao {
	private Properties prop = new Properties();
	
	// 기본 생성자
	public OrderDao() {
		String filePath = MemberDao.class.getResource("/db/sql/order-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 새 주문 추가
	public int insertOrder(Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertOrder");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
