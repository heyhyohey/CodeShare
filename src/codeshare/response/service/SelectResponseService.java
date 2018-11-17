package codeshare.response.service;

import java.sql.Connection;
import java.sql.SQLException;

import codeshare.dao.ResponseDao;
import codeshare.dto.Response;
import codeshare.exception.ServiceException;
import codeshare.jdbc.ConnectionProvider;
import codeshare.jdbc.JdbcUtil;

// 응답 정보 출력 서비스 클래스
public class SelectResponseService {
	private static SelectResponseService instance = new SelectResponseService();

	public static SelectResponseService getInstance() {
		return instance;
	}

	private SelectResponseService() {
	}
	
	// 응답 정보 출력 메서드
	public Response select(int num) {
		Connection conn = null;
		Response response = null;
		try {
			conn = ConnectionProvider.getConnection();
			ResponseDao dao = ResponseDao.getInstance();
			response = dao.select(conn, num);
			return response;
		} catch (SQLException e) {
			throw new ServiceException("응답 정보 가져오기 실패: " + e.getMessage(),e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
