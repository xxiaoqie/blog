package tzc.blog.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import tzc.blog.bean.Category;
import tzc.blog.bean.Post;
import tzc.blog.util.DBUtils;

public class PostDao {
	public List<Post> getAll() {
		List<Post> posts = new ArrayList<Post>();
		Connection conn = null;
		try {
			conn = DBUtils.getConnection();
			CallableStatement sp = conn.prepareCall("{call sp_select_all_post}");
			ResultSet rs = sp.executeQuery();
			while(rs.next()) {
				Post post = new Post();
				post.setId(rs.getInt("id"));
				post.setTitle(rs.getString("title"));
				post.setCategoryId(rs.getInt("category_id"));
				post.setContent(rs.getString("content"));
				post.setViewCount(rs.getInt("view_count"));
				post.setCreateAt(rs.getDate("create_at"));
				post.setCategoryTitle(rs.getString("category_title"));
				post.setReplyCount(rs.getInt("reply_count"));
				posts.add(post); 		//这样写太糟糕了！！！！
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
		return posts;
	}
	
	public void deleteById(int id) {
		Connection conn = null;
		try {
			conn = DBUtils.getConnection();
			CallableStatement sp = conn.prepareCall("{call sp_delete_post_by_id(?)}");
			sp.setInt(1, id);
			sp.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public List<Post> getByCategoryId(int id) {
		List<Post> posts = new ArrayList<Post>();
		Connection conn = null;
		try {
			conn = DBUtils.getConnection();
			CallableStatement sp = conn.prepareCall("{call sp_select_post_by_category_id(?)}");
			sp.setInt(1, id);
			ResultSet rs = sp.executeQuery();
			while(rs.next()) {
				Post post = new Post();
				post.setId(rs.getInt("id"));
				post.setTitle(rs.getString("title"));
				post.setContent(rs.getString("content"));
				post.setCreateAt(rs.getDate("create_at"));
				post.setViewCount(rs.getInt("view_count"));
				post.setCategoryId(rs.getInt("category_id"));
				post.setCategoryTitle(rs.getString("category_title"));
				post.setReplyCount(rs.getInt("reply_count"));
				posts.add(post);
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
		return posts;
	}
	
	public Post getById(int id) {
		Post post = new Post();
		Connection conn = null;
		try {
			conn = DBUtils.getConnection();
			CallableStatement sp = conn.prepareCall("{call sp_select_post_by_id(?)}");
			sp.setInt(1, id);
			ResultSet rs = sp.executeQuery();
			if(rs.next()) {
				post.setId(rs.getInt("id"));
				post.setTitle(rs.getString("title"));
				post.setContent(rs.getString("content"));
				post.setCreateAt(rs.getDate("create_at"));
				post.setViewCount(rs.getInt("view_count"));
				post.setCategoryTitle(rs.getString("category_title"));
				post.setReplyCount(rs.getInt("reply_count"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return post;
	}
	
	public String add(String title, String content, String categoryTitle) {
		Connection conn = null;
		String msg = "";
		try {
			conn = DBUtils.getConnection();
			CallableStatement sp = conn.prepareCall("{call sp_insert_post(?,?,?,?)}");
			sp.setString(1, title);
			sp.setString(2, content);
			sp.setString(3, categoryTitle);
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
	
	public String update(int id, String title, String content, String categoryTitle) {
		Connection conn = null;
		String msg = "";
		try {
			conn = DBUtils.getConnection();
			CallableStatement sp = conn.prepareCall("{call sp_update_post_by_id(?,?,?,?,?)}");
			sp.setInt(1, id);
			sp.setString(2, title);
			sp.setString(3, content);
			sp.setString(4, categoryTitle);
			sp.registerOutParameter(5, Types.VARCHAR);
			sp.execute();
			msg = sp.getString(5);
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
	
	public void addView(int id) {
		Connection conn = null;
		try {
			conn = DBUtils.getConnection();
			PreparedStatement stat = conn.prepareStatement("update post set view_count=view_count+1 where id = ?");
			stat.setInt(1, id);
			stat.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public int count() {
		Connection conn = null;
		int count = 0;
		try {
			conn = DBUtils.getConnection();
			PreparedStatement stat = conn.prepareStatement("select count(1) [count] from post");
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
