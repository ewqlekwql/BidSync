package com.ct.bidsync.member.model.dao;

import static com.ct.bidsync.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.ct.bidsync.member.model.vo.Cart;

public class CartDao {
	private Properties prop = new Properties();
	
	// 기본 생성자
	public CartDao() {
		String filePath = MemberDao.class.getResource("/db/sql/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 장바구니 목록 불러오기
	public ArrayList<Cart> selectCartList(Connection conn, String userId) {
		ArrayList<Cart> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCartList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			while (rset.next()) {
			    Cart c = new Cart();
			    c.setCartNo(rset.getInt("CART_NO"));
			    c.setUserId(rset.getString("USER_ID"));
			    c.setBoardNo(rset.getInt("BOARD_NO"));
			    c.setBoardTitle(rset.getString("BOARD_TITLE"));
			    c.setProdImg(rset.getString("PROD_IMG"));
			    c.setPrice(rset.getInt("PRICE"));
			    c.setStock(rset.getInt("STOCK"));
			    list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
}
