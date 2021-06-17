package tzc.blog.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import tzc.blog.bean.Category;
import tzc.blog.util.DBUtils;

public class CategoryDao {
	public String addCategory(String title) {
		Connection conn = null;
		String msg="";
		try {
			conn = DBUtils.getConnection();
			CallableStatement sp = conn.prepareCall("{call sp_add_category(?,?)}");
			sp.setString(1, title);
			sp.registerOutParameter(2, Types.VARCHAR);
			sp.execute();
			msg = sp.getString(2);
		} catch (SQLException e) {
			msg = "连接数据库失败";
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return msg;
	}
	
	public boolean exists(String title) {
		boolean isExists = false;
		
		Connection conn = null;
		try {
			conn =  DBUtils.getConnection();
			PreparedStatement stat = conn.prepareStatement("select * from category where title = ?");
			stat.setString(1, title);
			ResultSet rs = stat.executeQuery();
			if(rs.next()) isExists = true;
		} catch (SQLException e) {
			isExists = false;
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		return isExists;
	}
	

	public List<Category> getAll() {
		List<Category> categories = new ArrayList<Category>();
		
		Connection conn = null;
		try {
			conn = DBUtils.getConnection();
			PreparedStatement stat = conn.prepareStatement("select * from category");
			ResultSet rs = stat.executeQuery();
			while(rs.next()) {
				Category category = new Category();
				category.setId(rs.getInt("id"));
				category.setTitle(rs.getString("title"));
				category.setCreateAt(rs.getDate("create_at"));
				categories.add(category);
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
		
		return categories;
	}
	
	public Category getById(int id) {
		Category category = new Category();
		
		Connection conn = null;
		try {
			conn = DBUtils.getConnection();
			PreparedStatement stat = conn.prepareStatement("select * from category where id = ?");
			stat.setInt(1, id);
			ResultSet rs = stat.executeQuery();
			if(rs.next()) {
				category.setId(rs.getInt("id"));
				category.setTitle(rs.getString("title"));
				category.setCreateAt(rs.getDate("create_at"));
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
		return category;
	}
	
	public String editById(int id, String title) {
		Connection conn = null;
		String msg = "";
		try {
			conn = DBUtils.getConnection();
			CallableStatement sp = conn.prepareCall("{call sp_update_category_by_id(?,?,?)}");
			sp.setInt(1, id);
			sp.setString(2, title);
			sp.registerOutParameter(3, Types.VARCHAR);
			sp.execute();
			msg = sp.getString(3);
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
	
	public String deleteById(int id) {
		Connection conn = null;
		String msg = "";
		try {
			conn = DBUtils.getConnection();
			CallableStatement sp = conn.prepareCall("{call sp_delete_category_by_id(?,?)}");
			sp.setInt(1, id);
			sp.registerOutParameter(2, Types.VARCHAR);
			sp.execute();
			msg = sp.getString(2);
		} catch (SQLException e) {
			msg = "连接数据库失败";
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
	
	public int count() {
		Connection conn = null;
		int count = 0;
		try {
			conn = DBUtils.getConnection();
			PreparedStatement stat = conn.prepareStatement("select count(1) [count] from category");
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
