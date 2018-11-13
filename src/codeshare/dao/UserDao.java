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

	/**
	 * <pre>
	 * select
	 * </pre>
	 * 
	 * @param conn
	 * @param userId
	 * @return UserInfo instance
	 * @throws SQLException
	 */
	public User select(Connection conn, String userId) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from users where userid = ?");
			pstmt.setString(1, userId);
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

	/**
	 * <pre>
	 * delete
	 * </pre>
	 * 
	 * @param conn
	 * @param userId
	 * @return status number
	 * @throws SQLException
	 */
	public int delete(Connection conn, String user) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("delete from users where userid = ?");
			pstmt.setString(1, user);
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	/**
	 * <pre>
	 * update
	 * </pre>
	 * 
	 * @param inputInfo
	 * @return status number
	 * @throws SQLException
	 */
	public int update(Connection conn, User inputInfo) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("update users set userpw = ?, username = ?, phonenumber = ?," +
					"email = ?, address = ?, introduce = ? where userid = ?");
			/*
			pstmt.setString(1, inputInfo.getUserPw());
			pstmt.setString(2, inputInfo.getUserName());
			pstmt.setString(3, inputInfo.getPhoneNumber());
			pstmt.setString(4, inputInfo.getEmail());
			pstmt.setString(5, inputInfo.getAddress());
			pstmt.setString(6, inputInfo.getIntroduce());
			pstmt.setString(7, inputInfo.getUserId());
			*/
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	/**
	 * <pre>
	 * ResultSet 생성 메소드
	 * </pre>
	 * 
	 * @param rs
	 * @return UserInfo instance
	 */
	private User makeResultSet(ResultSet rs) throws SQLException {
		 User user = new User();
		 /*
		userInfo.setUserId(rs.getString("userid"));
		userInfo.setUserPw(rs.getString("userpw"));
		userInfo.setUserName(rs.getString("username"));
		userInfo.setPhoneNumber(rs.getString("phonenumber"));
		userInfo.setEmail(rs.getString("email"));
		userInfo.setAddress(rs.getString("address"));
		userInfo.setIntroduce(rs.getString("introduce"));
*/
		return user;
	}
}
