package tzc.blog.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import tzc.blog.util.DBUtils;

public class UserDao {
	
	
	public boolean isValidAdmin(String username, String password) {
		boolean valid = false;
		Connection conn = null;
		
		try {
			conn = DBUtils.getConnection();
			PreparedStatement stat = conn.prepareStatement("select * from [user] where username = ? and password = ? and is_admin = ?");
			stat.setString(1, username);
			stat.setString(2, password);
			stat.setBoolean(3, true);
			ResultSet rs = stat.executeQuery();
			if(rs.next()) valid = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return valid;
	}
	
	public boolean isValidUser(String username, String password) {
		boolean valid = false;
		Connection conn = null;
		
		try {
			conn = DBUtils.getConnection();
			PreparedStatement stat = conn.prepareStatement("select * from [user] where username = ? and password = ?");
			stat.setString(1, username);
			stat.setString(2, password);
			ResultSet rs = stat.executeQuery();
			if(rs.next()) valid = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return valid;
	}
	
	public String addUser(String username, String password, String mobile) {
		Connection conn = null;
		String msg = "";
		try {
			conn = DBUtils.getConnection();
			CallableStatement sp = conn.prepareCall("{call sp_add_user(?,?,?,?)}");
			sp.setString(1, username);
			sp.setString(2, password);
			sp.setString(3, mobile);
			sp.registerOutParameter(4, Types.VARCHAR);
			sp.execute();
			msg = sp.getString(4);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return msg;
	}
	
	public boolean deleteUser(String username) {
		Connection conn = null;
		boolean ok = false;
		try {
			conn = DBUtils.getConnection();
			CallableStatement sp = conn.prepareCall("{call sp_delete_user(?,?)}");
			sp.setString(1, username);
			sp.registerOutParameter(2, Types.BIT);
			sp.execute();
			ok = sp.getBoolean(2);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return ok;
	}
	
	public int count() {
		Connection conn = null;
		int count = 0;
		try {
			conn = DBUtils.getConnection();
			PreparedStatement stat = conn.prepareStatement("select count(1) [count] from [user]");
			ResultSet rs = stat.executeQuery();
			if(rs.next()) {
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return count;
	}
}
