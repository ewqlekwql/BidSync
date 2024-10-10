package com.ct.bidsync.member.service;

import static com.ct.bidsync.common.JDBCTemplate.close;
import static com.ct.bidsync.common.JDBCTemplate.commit;
import static com.ct.bidsync.common.JDBCTemplate.getConnection;
import static com.ct.bidsync.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.ct.bidsync.member.model.dao.MemberDao;
import com.ct.bidsync.member.model.vo.Member;

public class MemberService {
	// LoginController
	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		
		close(conn);
		return m;
	}
	
	// MemberInsertController
	public int insertMember(Member m) {
		Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(conn, m);
		if(result > 0) {
			commit(conn);
			System.out.println("회원가입 커밋 완료");
		}
		else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	// MemberUpdateController
	public Member updateMember(Member m) {
		return m;
	}
}
