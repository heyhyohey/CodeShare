package codeshare.response.service;

import java.sql.Connection;
import java.sql.SQLException;

import codeshare.dao.ResponseDao;
import codeshare.dto.Response;
import codeshare.exception.ServiceException;
import codeshare.jdbc.ConnectionProvider;
import codeshare.jdbc.JdbcUtil;

// 응답 등록 서비스 클래스
public class InsertResponseService {
	private static InsertResponseService instance = new InsertResponseService();

	public static InsertResponseService getInstance() {
		return instance;
	}

	private InsertResponseService() {
	}
	
	// 응답 등록 메서드
	public void insert(Response response) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			ResponseDao dao = ResponseDao.getInstance();
			dao.insert(conn, response);
		} catch (SQLException e) {
			throw new ServiceException("응답 등록 실패: " + e.getMessage(),e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
