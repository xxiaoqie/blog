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
import tzc.blog.dao.CategoryDao;
import tzc.blog.dao.PostDao;

/**
 * Servlet implementation class AdminPostController
 */
@WebServlet("/admin/Post")
public class AdminPostController extends HttpServlet {
	
    public AdminPostController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostDao postDao = new PostDao();
		CategoryDao categoryDao = new CategoryDao();
		String action = request.getParameter("action");
		String idStr = request.getParameter("categoryId");
		List<Post> posts = null;
		if(action == null||action.equals("add")) {
			posts = postDao.getAll();
		}
		else if(action.equals("filter")){
			int id = Integer.parseInt(idStr); 
			posts = postDao.getByCategoryId(id);
		}
		List<Category> categories = categoryDao.getAll();
		request.setAttribute("categories", categories);
		request.setAttribute("posts", posts);
//		System.out.println(posts.size());
		request.getRequestDispatcher("/admin_post.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		String Strid = request.getParameter("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String categoryName = request.getParameter("categoryName");
		
		String msg = "";
		PostDao postDao = new PostDao();
		switch(action) {
		case "delete":
			int id = Integer.parseInt(Strid);
			postDao.deleteById(id);
			break;
		case "add":
			msg = postDao.add(title, content, categoryName);
			request.setAttribute("error", msg);
			break;
		}
//		response.sendRedirect("Post");
		doGet(request, response);
	}

}
