package codeshare.request.service;

import java.sql.Connection;
import java.sql.SQLException;

import codeshare.dao.RequestDao;
import codeshare.exception.ServiceException;
import codeshare.jdbc.ConnectionProvider;
import codeshare.jdbc.JdbcUtil;

// 요청 정보 상태 변경 서비스 클래스
public class UpdateRequestService {
	private static UpdateRequestService instance = new UpdateRequestService();
	
	public static UpdateRequestService getInstance() {
		return instance;
	}
	
	private UpdateRequestService() {
	}
	
	// 요청 정보 상태 변경 메소드
	public void update(int num) {
		Connection conn = null;	
		try {
			conn = ConnectionProvider.getConnection();
			RequestDao dao = RequestDao.getInstance();
			dao.updateState(conn, num);
		} catch (SQLException e) {
			throw new ServiceException("정보 수정 실패: " + e.getMessage(),e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
