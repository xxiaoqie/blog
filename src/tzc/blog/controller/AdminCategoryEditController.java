package tzc.blog.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tzc.blog.bean.Category;
import tzc.blog.dao.CategoryDao;

/**
 * Servlet implementation class AdminCategoryEditController
 */
@WebServlet("/admin/CategoryEdit")
public class AdminCategoryEditController extends HttpServlet {
    public AdminCategoryEditController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idStr = request.getParameter("id");
		int id = Integer.parseInt(idStr);
		CategoryDao categorydao = new CategoryDao();
		Category category = categorydao.getById(id);
		request.setAttribute("category", category);
		request.getRequestDispatcher("/admin_category_edit.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String msg = "";
		String action = request.getParameter("action");
		CategoryDao categoryDao = new CategoryDao();
		String title = request.getParameter("title");
		String idStr = request.getParameter("id");
		int id = Integer.parseInt(idStr);
		if("edit".equals(action)) {
			msg = categoryDao.editById(id, title);
			request.setAttribute("error", msg);
			if(msg == null) {
				response.sendRedirect(request.getContextPath() + "/admin/Category");
			} else {
				doGet(request, response);
			}
//			if(title == null || "".equals(title)) {
//				request.setAttribute("error", "分类名称不能为空");
//				doGet(request, response);
//				return;
//			}
//			boolean isExists = categoryDao.exists(title);
//			if(isExists) {
//				request.setAttribute("error", "分类名称已经存在");
//				doGet(request, response);
//				return;
//			}
//			
//			categoryDao.editById(id, title);
			
		} 
//		else if("delete".equals(action)) {
//			msg = categoryDao.deleteById(id);
//			request.setAttribute("error", msg);
//			request.getRequestDispatcher("/admin/Category").forward(request, response);
//		}
//		response.sendRedirect(request.getContextPath() + "/admin/Category");

	}

}
