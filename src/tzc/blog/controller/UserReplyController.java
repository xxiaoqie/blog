package tzc.blog.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tzc.blog.dao.ReplyDao;

/**
 * Servlet implementation class UserReplyController
 */
@WebServlet("/user/Reply")
public class UserReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserReplyController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String content = request.getParameter("content");
		String postId = request.getParameter("postId");
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		ReplyDao replyDao = new ReplyDao();
		switch (action) {
		case "add": 
			int stat = replyDao.add(username, content, postId);
			response.getWriter().write(Integer.toString(stat));
		case "delete":	
		
		}
	}
}
