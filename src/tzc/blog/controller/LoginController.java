package tzc.blog.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tzc.blog.dao.UserDao;


@WebServlet("/Login")
public class LoginController extends HttpServlet {


    public LoginController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String type = (String)session.getAttribute("type");
//		System.out.println(type);
		if(type == null)
			request.getRequestDispatcher("admin_login.jsp").forward(request, response);
		else if(type.equals("admin"))
			response.sendRedirect("admin/Home");
		else if(type.equals("user")) 
			response.sendRedirect("user/Home");
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String type = request.getParameter("type");
		UserDao userDao = new UserDao();
		boolean valid = false;
		HttpSession session = request.getSession();
		switch (type) {
		case "admin":
			valid = userDao.isValidAdmin(username, password);
			if(valid) {
				session.setAttribute("username", username);
				session.setAttribute("type", "admin");
				response.sendRedirect("admin/Home");
//				response.getWriter().write("0");
			} else {
//				response.getWriter().write("用户名或密码错误");
				request.setAttribute("error", "用户名或密码错误");
				doGet(request, response);
			}
			break;
		case "user":
			valid = userDao.isValidUser(username, password);
			if(valid) {
				session.setAttribute("username", username);
				session.setAttribute("type", "user");
				response.sendRedirect("user/Home");
//				response.getWriter().write("0");
			} else {
//				response.getWriter().write("用户名或密码错误");
				request.setAttribute("error", "用户名或密码错误");
				doGet(request, response);
			}
			break;
		}
	}

}
