package tzc.blog.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tzc.blog.dao.CategoryDao;
import tzc.blog.dao.PostDao;
import tzc.blog.dao.ReplyDao;
import tzc.blog.dao.UserDao;

/**
 * Servlet implementation class AdminHomeController
 */
@WebServlet("/admin/Home")
public class AdminHomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminHomeController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDao userDao = new UserDao();
		CategoryDao categoryDao = new CategoryDao();
		ReplyDao replyDao = new ReplyDao();
		PostDao postDao = new PostDao();
		int userCount = userDao.count();
		int categoryCount = categoryDao.count();
		int replyCount = replyDao.count();
		int postCount = postDao.count();
		request.setAttribute("userCount", userCount);
		request.setAttribute("categoryCount", categoryCount);
		request.setAttribute("replyCount", replyCount);
		request.setAttribute("postCount", postCount);
		request.getRequestDispatcher("/admin_home.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
