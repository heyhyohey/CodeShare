package codeshare.service;

import java.sql.Connection;
import java.sql.SQLException;

import codeshare.dao.UserDao;
import codeshare.dto.User;
import codeshare.exception.ServiceException;
import codeshare.jdbc.ConnectionProvider;
import codeshare.jdbc.JdbcUtil;

// 회원정보수정 서비스 클래스
public class UpdateUserService {
	private static UpdateUserService instance = new UpdateUserService();
	
	public static UpdateUserService getInstance() {
		return instance;
	}
	
	private UpdateUserService() {
	}
	
	// 회원정보수정 메서드
	public void update(User user) {
		Connection conn = null;	
		try {
			conn = ConnectionProvider.getConnection();
			UserDao dao = UserDao.getInstance();
			dao.update(conn, user);
		} catch (SQLException e) {
			throw new ServiceException("정보 수정 실패: " + e.getMessage(),e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
