package tzc.blog.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tzc.blog.dao.UserDao;

@WebServlet("/Register")
public class RegisterController extends HttpServlet {

    public RegisterController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("register.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String mobile = request.getParameter("mobile");
		UserDao userDao = new UserDao();
		String msg = userDao.addUser(username, password, mobile);
		if(msg == null) {
			response.getWriter().write("ok");
		} else {
			response.getWriter().write(msg);
		}
	}
}
