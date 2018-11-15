package codeshare.request.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import codeshare.dao.RequestDao;
import codeshare.dao.UserDao;
import codeshare.dto.Request;
import codeshare.dto.User;
import codeshare.exception.ServiceException;
import codeshare.jdbc.ConnectionProvider;
import codeshare.jdbc.JdbcUtil;

// 요청 목록 출력 서비스 클래스
public class SelectRequestService {
	private static SelectRequestService instance = new SelectRequestService();

	public static SelectRequestService getInstance() {
		return instance;
	}

	private SelectRequestService() {
	}

	private static final int REQUEST_COUNT_PER_PAGE = 10;

	public RequestListView getRequestList(int pageNumber) {
		Connection conn = null;
		int currentPageNumber = pageNumber;
		try {
			conn = ConnectionProvider.getConnection();
			RequestDao requestDao = RequestDao.getInstance();

			int pageTotalCount = requestDao.selectCount(conn);

			List<Request> requestList = null;
			int firstRow = 0;
			int endRow = 0;
			if (pageTotalCount > 0) {
				firstRow = (pageNumber - 1) * REQUEST_COUNT_PER_PAGE + 1;
				endRow = firstRow + REQUEST_COUNT_PER_PAGE - 1;
				requestList = requestDao.selectList(conn, firstRow, endRow);
				System.out.println();
			} else {
				currentPageNumber = 0;
				requestList = Collections.emptyList();
			}
			return new RequestListView(requestList, pageTotalCount, currentPageNumber, REQUEST_COUNT_PER_PAGE
					, firstRow,	endRow);
		} catch (SQLException e) {
			throw new ServiceException("목록 구하기 실패 : " + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn);
		}
	}

	// 요청 정보 출력 메서드
	public Request select(int num) {
		Connection conn = null;
		Request request = null;
		try {
			conn = ConnectionProvider.getConnection();
			RequestDao dao = RequestDao.getInstance();
			request = dao.select(conn, num);
			return request;
		} catch (SQLException e) {
			throw new ServiceException("요청 정보 가져오기 실패: " + e.getMessage(),e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
