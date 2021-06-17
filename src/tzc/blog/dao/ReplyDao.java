package tzc.blog.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import tzc.blog.bean.Reply;
import tzc.blog.util.DBUtils;

public class ReplyDao {
	public List<Reply> findReplyByPostId(int id) {
		List<Reply> replies = new ArrayList<Reply>();
		Connection conn = null;
		try {
			conn = DBUtils.getConnection();
			CallableStatement sp = conn.prepareCall("{call sp_select_reply_by_post_id(?)}");
			sp.setInt(1, id);
			ResultSet rs = sp.executeQuery();
			while(rs.next()) {
				Reply reply = new Reply();
				reply.setId(rs.getInt("id"));
				reply.setContent(rs.getString("content"));
				reply.setUsername(rs.getString("username"));
				reply.setCreateAt(rs.getDate("create_at"));
				reply.setPostId(rs.getInt("post_id"));
				reply.setPhone(rs.getString("mobile"));
				replies.add(reply);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return replies;
	}
	
	public void delete(int id) {
		Connection conn = null;
		try {
			conn = DBUtils.getConnection(); 
			PreparedStatement stat = conn.prepareStatement("delete from reply where ? = reply.id");
			stat.setInt(1, id);
			stat.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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

	public int add(String username, String content, String postId) {
		Connection conn = null;
		int stat = 0;
		try {
			conn = DBUtils.getConnection();
			CallableStatement sp = conn.prepareCall("{call sp_add_reply(?,?,?,?)}");
			sp.setString(1, username);
			sp.setString(2, content);
			sp.setString(3, postId);
			sp.registerOutParameter(4, Types.INTEGER);
			sp.execute();
			stat = sp.getInt(4);
		} catch (SQLException e) {
			stat = 1;
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return stat;
	}
	
	public int count() {
		Connection conn = null;
		int count = 0;
		try {
			conn = DBUtils.getConnection();
			PreparedStatement stat = conn.prepareStatement("select count(1) [count] from reply");
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
