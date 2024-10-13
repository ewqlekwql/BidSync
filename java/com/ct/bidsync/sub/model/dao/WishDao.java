package com.ct.bidsync.sub.model.dao;

import static com.ct.bidsync.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
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
}
