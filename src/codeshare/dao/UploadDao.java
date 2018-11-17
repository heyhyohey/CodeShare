package codeshare.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import codeshare.dto.Upload;
import codeshare.jdbc.JdbcUtil;

public class UploadDao {
	private static UploadDao dao = new UploadDao();

	public static UploadDao getInstance() {
		return dao;
	}

	private UploadDao() {
	}

	// insert
	public int insert(Connection conn, Upload upload) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("insert into upload(id, title, content, date) values(?, ?, ?, ?)");
			pstmt.setString(1, upload.getId());
			pstmt.setString(2, upload.getTitle());
			pstmt.setString(3, upload.getContent());
			pstmt.setTimestamp(4, upload.getDate());
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	// select
	public Upload select(Connection conn, int num) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from upload where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return makeUploadFromResultSet(rs);
			} else {
				return null;
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	// ResultSet 생성 메소드
	private Upload makeUploadFromResultSet(ResultSet rs) throws SQLException {
		Upload upload= new Upload();
		upload.setNum(rs.getInt("num"));
		upload.setId(rs.getString("id"));
		upload.setTitle(rs.getString("title"));
		upload.setContent(rs.getString("content"));
		upload.setDate(rs.getTimestamp("date"));
		return upload;
	}
	
	// request row 수 받아오기
	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from upload");
			rs.next();
			return rs.getInt(1);
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}
	
	public List<Upload> selectList(Connection conn, int firstRow, int endRow) throws SQLException{
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			String sql= "select * from upload order by num desc limit " + (firstRow-1) + ',' + (endRow-firstRow+1);
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				List<Upload> uploadList = new ArrayList<Upload>();
				do {
					uploadList.add(makeUploadFromResultSet(rs));
				}while(rs.next());
				return uploadList;
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
			pstmt = conn.prepareStatement("delete from upload where num = ?");
			pstmt.setInt(1, num);
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	// update
	public int update(Connection conn, Upload upload) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("update upload set title = ?, content = ? where num = ?");
			pstmt.setString(1, upload.getTitle());
			pstmt.setString(2, upload.getContent());
			pstmt.setInt(3, upload.getNum());
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}
}
