package codeshare.dao;

import java.sql.*;
import java.util.*;

public class Dao {
	private Connection con; 
	private Statement stmt; 
	private ResultSet rs;
	
	private boolean connect() {
		boolean result = false;
		try {
			//con = JDBC.getConnection(//db)
					result = true;
		}catch(Exception e) {
			System.out.println("������� :" + e.getMessage());
			
		}
		return result;
	}
	
	public ResultSet select(String key) {
		
		
		
		return rs;
	}
	
	private void close() {
		try {
			if(rs!=null)
				rs.close();
			if(stmt!=null)
				stmt.close();
			if(con!=null)
				con.close();
		}
		catch(Exception e) {
			System.out.println(" :" + e.getMessage());
			
		}
	}
	
}
