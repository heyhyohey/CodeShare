package codeshare.service;

import java.sql.Connection;
import java.sql.SQLException;

import codeshare.dao.UserDao;
import codeshare.dto.User;
import codeshare.exception.ServiceException;
import codeshare.jdbc.ConnectionProvider;
import codeshare.jdbc.JdbcUtil;

// 유저 정보를 가져오는 서비스 클래스
public class SelectUserService {
	private static SelectUserService instance = new SelectUserService();

	public static SelectUserService getInstance() {
		return instance;
	}

	private SelectUserService() {
	}
	
	// 회원 정보 출력 메서드
	public User getInformation(String id) {
		Connection conn = null;
		User user = null;
		try {
			conn = ConnectionProvider.getConnection();
			UserDao dao = UserDao.getInstance();
			user = dao.select(conn, id);
			return user;
		} catch (SQLException e) {
			throw new ServiceException("회원정보 가져오기 실패: " + e.getMessage(),e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
