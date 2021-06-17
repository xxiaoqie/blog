package tzc.blog.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tzc.blog.bean.Category;
import tzc.blog.bean.Post;
import tzc.blog.bean.Reply;
import tzc.blog.dao.CategoryDao;
import tzc.blog.dao.PostDao;
import tzc.blog.dao.ReplyDao;
import tzc.blog.dao.UserDao;

@WebServlet("/user/Home")
public class UserHomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public UserHomeController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action != null) {					//要求显示文章
			String idStr = request.getParameter("id");
			int id = Integer.parseInt(idStr);
			PostDao postDao = new PostDao();
			ReplyDao replyDao = new ReplyDao();
			Post post = postDao.getById(id);
			postDao.addView(id);
			List<Reply> replies = replyDao.findReplyByPostId(id);
			request.setAttribute("post", post);
			request.setAttribute("replies", replies);
			if(post.getId() == 0) {				//文章不存在 显示404页面
				request.getRequestDispatcher("/404.jsp").forward(request, response);
			} else {							//文章存在 显示文章页面
				request.getRequestDispatcher("/article.jsp").forward(request, response);
			}
			return;
		}
		CategoryDao categoryDao = new CategoryDao();
		UserDao userDao = new UserDao();
		List<Category> categories = categoryDao.getAll();
		request.setAttribute("categories", categories);
		request.setAttribute("count", userDao.count());
		request.getRequestDispatcher("/user_home.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
