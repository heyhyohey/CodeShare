package codeshare.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
	public static Connection getConnection() throws SQLException {
		String jdbcDriver = "jdbc:mysql://localhost:3306/report?"
				+ "allowPublicKeyRetrieval=true&useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=UTC";
		String dbUser = "root";
		String dbPass = "0000";
		
		return DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	}
}
