package com.ct.bidsync.sub.model.dao;

import static com.ct.bidsync.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.ct.bidsync.member.model.dao.MemberDao;
import com.ct.bidsync.sub.model.vo.Wish;

public class WishDao {
private Properties prop = new Properties();
	
	// 기본 생성자
	public WishDao() {
		String filePath = MemberDao.class.getResource("/db/sql/sub-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 관심 목록 불러오기
	public ArrayList<Wish> selectWishList(Connection conn, int userNo) {
		ArrayList<Wish> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectWishList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Wish w = new Wish();
				w.setWishNo(rset.getInt("WISH_NO"));
				w.setUserId(rset.getString("USER_ID"));
				w.setBoardNo(rset.getInt("BOARD_NO"));
				w.setBoardTitle(rset.getString("BOARD_TITLE"));
				w.setProdImg(rset.getString("PROD_IMG"));
				w.setPrice(rset.getInt("PRICE"));
				w.setStatus(rset.getString("BOARD_STATUS"));
				list.add(w);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	// boardNo 불러오기
	public int selectBoardNo(Connection conn, int wishNo) {
		int no = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBoardNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, wishNo);
			
			rset = pstmt.executeQuery();
			rset.next();
			no = rset.getInt("BOARD_NO");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return no;
	}
	
	// 관심목록에서 삭제(status -> 'N')
	public int updateWish(Connection conn, int wishNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateWish");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, wishNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 관심목록에 추가
	public int insertWish(Connection conn, int boardNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertWish");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
			
		return result;
	}
}
