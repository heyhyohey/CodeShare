package codeshare.service;

import java.sql.Connection;
import java.sql.SQLException;

import codeshare.dao.UserDao;
import codeshare.exception.ServiceException;
import codeshare.jdbc.ConnectionProvider;
import codeshare.jdbc.JdbcUtil;

// 회원탈퇴 서비스 클래스
public class DeleteUserService {
	private static DeleteUserService instance = new DeleteUserService();
	
	public static DeleteUserService getInstance() {
		return instance;
	}
	
	private DeleteUserService() {
	}
	
	// 회원탈퇴 메소드
	public void delete(String id) {
		Connection conn = null;	
		try {
			conn = ConnectionProvider.getConnection();
			UserDao dao = UserDao.getInstance();
			dao.delete(conn, id);
		} catch (SQLException e) {
			throw new ServiceException("유저 삭제 실패: " + e.getMessage(),e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
