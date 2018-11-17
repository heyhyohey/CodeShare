package codeshare.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import codeshare.dto.Response;
import codeshare.jdbc.JdbcUtil;

public class ResponseDao {
	private static ResponseDao dao = new ResponseDao();

	public static ResponseDao getInstance() {
		return dao;
	}

	private ResponseDao() {
	}

	// insert
	public int insert(Connection conn, Response response) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("insert into response values(?, ?, ?, ?)");
			pstmt.setInt(1, response.getNum());
			pstmt.setString(2, response.getId());
			pstmt.setString(3, response.getContent());
			pstmt.setTimestamp(4, response.getDate());
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}
	
	// select
	public Response select(Connection conn, int num) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from response where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return makeResponseFromResultSet(rs);
			} else {
				return null;
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	// delete
	public int delete(Connection conn, int num) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("delete from reponse where num = ?");
			pstmt.setInt(1, num);
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	// update
	public int update(Connection conn, Response response) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("update response set content = ? where num = ?");
			pstmt.setString(1, response.getContent());
			pstmt.setInt(2, response.getNum());
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	// ResultSet 생성 메소드
	private Response makeResponseFromResultSet(ResultSet rs) throws SQLException {
		Response response = new Response();
		response.setNum(rs.getInt("num"));
		response.setId(rs.getString("id"));
		response.setContent(rs.getString("content"));
		response.setDate(rs.getTimestamp("date"));
		return response;
	}
}
