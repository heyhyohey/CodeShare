package codeshare.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import codeshare.dto.Request;
import codeshare.jdbc.JdbcUtil;

public class RequestDao {
	private static RequestDao dao = new RequestDao();

	public static RequestDao getInstance() {
		return dao;
	}

	private RequestDao() {
	}

	// insert
	public int insert(Connection conn, Request request) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("insert into request(id, title, content, date, state) values(?, ?, ?, ?, ?)");
			pstmt.setString(1, request.getId());
			pstmt.setString(2, request.getTitle());
			pstmt.setString(3, request.getContent());
			pstmt.setTimestamp(4, request.getDate());
			pstmt.setBoolean(5, request.getState());
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	// select
	public Request select(Connection conn, int num) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from request where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return makeRequestFromResultSet(rs);
			} else {
				return null;
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	// ResultSet 생성 메소드
	private Request makeRequestFromResultSet(ResultSet rs) throws SQLException {
		Request request = new Request();
		request.setNum(rs.getInt("num"));
		request.setId(rs.getString("id"));
		request.setTitle(rs.getString("title"));
		request.setContent(rs.getString("content"));
		request.setDate(rs.getTimestamp("date"));
		request.setState(rs.getBoolean("state"));
		return request;
	}
	
	// request row 수 받아오기
	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from request");
			rs.next();
			return rs.getInt(1);
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}
	
	public List<Request> selectList(Connection conn, int firstRow, int endRow) throws SQLException{
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			String sql= "select * from request order by num desc limit " + (firstRow-1) + ',' + (endRow-firstRow+1);
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				List<Request> requestList = new ArrayList<Request>();
				do {
					requestList.add(makeRequestFromResultSet(rs));
				}while(rs.next());
				return requestList;
				}else {
					return Collections.emptyList();
			}
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}
	
	// delete
	public int delete(Connection conn, int num) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("delete from request where num = ?");
			pstmt.setInt(1, num);
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	// update
	public int update(Connection conn, Request request) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("update request set title = ?, content = ? where num = ?");
			pstmt.setString(1, request.getTitle());
			pstmt.setString(2, request.getContent());
			pstmt.setInt(3, request.getNum());
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}
	
	// update
	public int updateState(Connection conn, int num) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("update request set state = true where num = ?");
			pstmt.setInt(1, num);
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}
}
