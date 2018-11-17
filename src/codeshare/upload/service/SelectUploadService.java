package codeshare.upload.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import codeshare.dao.UploadDao;
import codeshare.dto.Upload;
import codeshare.exception.ServiceException;
import codeshare.jdbc.ConnectionProvider;
import codeshare.jdbc.JdbcUtil;

// 게시글 정보를 가져오는 서비스 클래스
public class SelectUploadService {
	private static SelectUploadService instance = new SelectUploadService();

	public static SelectUploadService getInstance() {
		return instance;
	}

	private SelectUploadService() {
	}

	private static final int UPLOAD_COUNT_PER_PAGE = 10;

	// 게시글 리스트 객체를 가져오는 메소드
	public UploadListView getUploadList(int pageNumber) {
		Connection conn = null;
		int currentPageNumber = pageNumber;
		try {
			conn = ConnectionProvider.getConnection();
			UploadDao uploadDao = UploadDao.getInstance();

			int pageTotalCount = uploadDao.selectCount(conn);

			List<Upload> uploadList = null;
			int firstRow = 0;
			int endRow = 0;
			if (pageTotalCount > 0) {
				firstRow = (pageNumber - 1) * UPLOAD_COUNT_PER_PAGE + 1;
				endRow = firstRow + UPLOAD_COUNT_PER_PAGE - 1;
				uploadList = uploadDao.selectList(conn, firstRow, endRow);
				System.out.println();
			} else {
				currentPageNumber = 0;
				uploadList = Collections.emptyList();
			}
			return new UploadListView(uploadList, pageTotalCount, currentPageNumber, UPLOAD_COUNT_PER_PAGE
					, firstRow,	endRow);
		} catch (SQLException e) {
			throw new ServiceException("목록 구하기 실패 : " + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn);
		}
	}

	// 게시글 정보 출력 메서드
	public Upload select(int num) {
		Connection conn = null;
		Upload upload = null;
		try {
			conn = ConnectionProvider.getConnection();
			UploadDao dao = UploadDao.getInstance();
			upload = dao.select(conn, num);
			return upload;
		} catch (SQLException e) {
			throw new ServiceException("게시글 정보 가져오기 실패: " + e.getMessage(),e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
