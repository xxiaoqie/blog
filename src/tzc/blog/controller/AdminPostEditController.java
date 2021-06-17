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
import tzc.blog.dao.CategoryDao;
import tzc.blog.dao.PostDao;

/**
 * Servlet implementation class AdminPostEditController
 */
@WebServlet("/admin/PostEdit")
public class AdminPostEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminPostEditController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String idStr = request.getParameter("id");
		int id = Integer.parseInt(idStr);
		PostDao postDao = new PostDao();
		CategoryDao categoryDao = new CategoryDao();
		Post post = postDao.getById(id);
		List<Category> categories = categoryDao.getAll();
		request.setAttribute("categories", categories);
		request.setAttribute("post", post);
		request.getRequestDispatcher("/admin_post_edit.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idStr = request.getParameter("id");
		int id = Integer.parseInt(idStr);
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String categoryName = request.getParameter("categoryName");
		
		PostDao postDao = new PostDao();
		String msg = postDao.update(id, title, content, categoryName);
		request.setAttribute("error", msg);
		if(msg == null) {
			response.sendRedirect(request.getContextPath() + "/admin/Post");
		} else {
			doGet(request, response);
		}
	}

}
