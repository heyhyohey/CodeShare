package codeshare.request.service;

import java.sql.Connection;
import java.sql.SQLException;

import codeshare.dao.RequestDao;
import codeshare.dto.Request;
import codeshare.exception.ServiceException;
import codeshare.jdbc.ConnectionProvider;
import codeshare.jdbc.JdbcUtil;

// 요청 등록 서비스 클래스
public class InsertRequestService {
	private static InsertRequestService instance = new InsertRequestService();

	public static InsertRequestService getInstance() {
		return instance;
	}

	private InsertRequestService() {
	}
	
	// 요청 등록 메서드
	public void insert(Request request) {
		Connection conn = null;	
		try {
			conn = ConnectionProvider.getConnection();
			RequestDao dao = RequestDao.getInstance();
			dao.insert(conn, request);
		} catch (SQLException e) {
			throw new ServiceException("요청 등록 실패: " + e.getMessage(),e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
