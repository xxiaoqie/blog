package tzc.blog.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tzc.blog.bean.Category;
import tzc.blog.bean.Post;
import tzc.blog.bean.Reply;
import tzc.blog.dao.PostDao;
import tzc.blog.dao.ReplyDao;


@WebServlet("/admin/Reply")
public class AdminReplyController extends HttpServlet {

       
    public AdminReplyController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idStr = request.getParameter("id");
		int id = Integer.parseInt(idStr);
		ReplyDao replyDao = new ReplyDao();
		PostDao postDao = new PostDao();
		List<Reply> replies = replyDao.findReplyByPostId(id);
		Post post = postDao.getById(id);
		request.setAttribute("replies", replies);
		request.setAttribute("post", post);
		
		request.getRequestDispatcher("/admin_reply.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idStr = request.getParameter("id");
		String action = request.getParameter("action");
		String reply = request.getParameter("reply");
		ReplyDao replyDao = new ReplyDao();
		int id = Integer.parseInt(idStr);
	
		switch(action) {
		case "delete":
			id = Integer.parseInt(idStr);
			replyDao.delete(id);
			return;
		}
//		case "add":
//		boolean ok = replyDao.add(reply,username,postId);
//		doGet(request, response);
	}

}
