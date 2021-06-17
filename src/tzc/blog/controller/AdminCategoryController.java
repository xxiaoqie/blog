package tzc.blog.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.jdt.core.compiler.CategorizedProblem;

import tzc.blog.bean.Category;
import tzc.blog.dao.CategoryDao;

/**
 * Servlet implementation class AdminCategoryController
 */
@WebServlet("/admin/Category")
public class AdminCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCategoryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CategoryDao categoryDao = new CategoryDao();
		List<Category> categories = categoryDao.getAll();
		request.setAttribute("categories", categories);
		
		request.getRequestDispatcher("/admin_category.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String title = request.getParameter("title");
		String idStr = request.getParameter("id");
		CategoryDao categoryDao = new CategoryDao();
		String msg = "";
		switch(action) {
		case "add":
			msg = categoryDao.addCategory(title);
//			System.out.println(msg);
//			request.setAttribute("error", msg);
			if(msg != null) response.getWriter().write(msg);
			else response.getWriter().write("0");
			return;
		case "delete":
			int id = Integer.parseInt(idStr);
			msg = categoryDao.deleteById(id);
//			request.setAttribute("error", msg);
			if(msg != null) response.getWriter().write(msg);
			else response.getWriter().write("0");
			return;
		case "check":
			boolean exists = categoryDao.exists(title);
			if(exists) response.getWriter().write("0");
			else response.getWriter().write("文章不存在或连接数据库失败");
			return;
		}
//		doGet(request, response);
	}
}
