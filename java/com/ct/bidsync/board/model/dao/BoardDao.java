package com.ct.bidsync.board.model.dao;

import static com.ct.bidsync.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.ct.bidsync.board.model.vo.Board;
import com.ct.bidsync.common.PageInfo;
import com.ct.bidsync.member.model.dao.MemberDao;

public class BoardDao {
	private Properties prop = new Properties();
	
	// 기본 생성자
	public BoardDao() {
		String filePath = MemberDao.class.getResource("/db/sql/board-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 리스트 개수 반환
	public int selectListCount(Connection conn, String ctg) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ctg);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	// 리스트 목록 반환
	public ArrayList<Board> selectList(Connection conn, PageInfo pi, String ctg) {
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, ctg);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Board b = new Board();
				b.setBoardNo(rset.getInt("BOARD_NO"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setBoardType(rset.getString("BOARD_TYPE"));
				b.setBoardCtg(rset.getString("BOARD_CATEGORY"));
				b.setBoardContent(rset.getString("BOARD_CONTENT"));
				b.setProdImg(rset.getString("PROD_IMG"));
				b.setPrice(rset.getInt("PRICE"));
				b.setBidPrice(rset.getInt("BID_PRICE"));
				b.setStock(rset.getInt("STOCK"));
				b.setSeller(rset.getString("USER_ID"));
				b.setRegisterDate(rset.getDate("REGISTER_DATE"));
				list.add(b);
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
