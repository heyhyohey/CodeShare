package codeshare.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import codeshare.dto.User;
import codeshare.jdbc.JdbcUtil;

public class UserDao {
	private static UserDao dao = new UserDao();

	public static UserDao getInstance() {
		return dao;
	}

	private UserDao() {
	}

	// insert
	public int insert(Connection conn, User user) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("insert into user values(?, ?, ?, ?, ?)");
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getPw());
			pstmt.setString(3, user.getLan());
			pstmt.setString(4, user.getEmail());
			pstmt.setString(5, user.getIntro());
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	// select
	public User select(Connection conn, String id) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from user where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return makeResultSet(rs);
			} else {
				return null;
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	// delete
	public int delete(Connection conn, String user) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("delete from user where id = ?");
			pstmt.setString(1, user);
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	// update
	public int update(Connection conn, User user) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("update user set pw = ?, lan = ?, email = ?, intro = ? where id = ?");
			pstmt.setString(1, user.getPw());
			pstmt.setString(2, user.getLan());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getIntro());
			pstmt.setString(5, user.getId());
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	// ResultSet 객체 생성 메소드
	private User makeResultSet(ResultSet rs) throws SQLException {
		User user = new User();

		user.setId(rs.getString("id"));
		user.setPw(rs.getString("pw"));
		user.setLan(rs.getString("lan"));
		user.setEmail(rs.getString("email"));
		user.setIntro(rs.getString("intro"));

		return user;
	}
}
