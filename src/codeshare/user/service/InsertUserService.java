package codeshare.user.service;

import java.sql.Connection;
import java.sql.SQLException;

import codeshare.dao.UserDao;
import codeshare.dto.User;
import codeshare.exception.ServiceException;
import codeshare.jdbc.ConnectionProvider;
import codeshare.jdbc.JdbcUtil;

// 회원가입 서비스 클래스
public class InsertUserService {
	private static InsertUserService instance = new InsertUserService();

	public static InsertUserService getInstance() {
		return instance;
	}

	private InsertUserService() {
	}
	
	// 회원가입 메서드
	public void insert(User user) {
		Connection conn = null;	
		try {
			conn = ConnectionProvider.getConnection();
			UserDao dao = UserDao.getInstance();
			dao.insert(conn, user);
		} catch (SQLException e) {
			throw new ServiceException("유저 등록 실패: " + e.getMessage(),e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
