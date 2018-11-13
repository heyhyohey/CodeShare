package codeshare.service;

import java.sql.Connection;
import java.sql.SQLException;

import codeshare.dao.UserDao;
import codeshare.dto.User;
import codeshare.exception.ServiceException;
import codeshare.jdbc.ConnectionProvider;
import codeshare.jdbc.JdbcUtil;

// 로그인 서비스 클래스
public class LoginService {
	private static LoginService instance = new LoginService();

	public static LoginService getInstance() {
		return instance;
	}

	private LoginService() {
	}

	// 중복 확인 메소드
	public boolean checkId(String id) {
		Connection conn = null;
		User userInfo = null;
		try {
			conn = ConnectionProvider.getConnection();
			UserDao dao = UserDao.getInstance();
			userInfo = dao.select(conn, id);

			// 리턴 값이 있을 경우 로그인 성공
			if (userInfo != null)
				return true;
			else
				return false;
		} catch (SQLException e) {
			throw new ServiceException("아이디 체크 실패: " + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	// 로그인 메소드
	public boolean login(String id, String pw) {
		Connection conn = null;
		User user = null;
		try {
			conn = ConnectionProvider.getConnection();
			UserDao dao = UserDao.getInstance();
			user = dao.select(conn, id);
			System.out.println(user.getId() + user.getPw());
			// 1. 아이디가 존재하는지 검사
			if(user == null)
				return false;
			
			// 2. 아이디 비밀번호 일치 검사
			if(user.getPw().equals(pw))
				return true;
			else
				return false;
		} catch (SQLException e) {
			throw new ServiceException("로그인 실패: " + e.getMessage(),e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
