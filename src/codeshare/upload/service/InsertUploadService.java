package codeshare.upload.service;

import java.sql.Connection;
import java.sql.SQLException;

import codeshare.dao.UploadDao;
import codeshare.dto.Upload;
import codeshare.exception.ServiceException;
import codeshare.jdbc.ConnectionProvider;
import codeshare.jdbc.JdbcUtil;

// 게시글 등록 서비스 클래스
public class InsertUploadService {
	private static InsertUploadService instance = new InsertUploadService();

	public static InsertUploadService getInstance() {
		return instance;
	}

	private InsertUploadService() {
	}
	
	// 게시글 등록 메서드
	public void insert(Upload upload) {
		Connection conn = null;	
		try {
			conn = ConnectionProvider.getConnection();
			UploadDao dao = UploadDao.getInstance();
			dao.insert(conn, upload);
		} catch (SQLException e) {
			throw new ServiceException("게시글 등록 실패: " + e.getMessage(),e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
