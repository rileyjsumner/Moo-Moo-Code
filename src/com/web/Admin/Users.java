package com.web.Admin;

import com.data.User;
import com.dao.UserDao;
import com.util.LoginUtil;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

import static com.dao.UserDao.DeleteUser;
import static com.dao.UserDao.UpdateUsers;
import static com.dao.UserDao.isAdmin;


public class Users extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public Users() {
		super();
	}
	
	/**
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int user_id = (int)session.getAttribute(("user_id"));
		boolean admin = isAdmin(user_id);
		List<User> userList = UserDao.GetUsers();
		
		request.setAttribute("users", userList);
		request.setAttribute("admin", admin);

		if(LoginUtil.TestLogin(session))
		{
			request.getRequestDispatcher("/WEB-INF/admin/users.jsp").forward(request, response);
		}
		else
		{
			request.setAttribute("action_text","access account options");
			request.setAttribute("action","Users");
			request.getRequestDispatcher("/WEB-INF/login_required.jsp").forward(request, response);
		}
		

	}
	
	/**
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("kek1: ");
		String type = request.getParameter("type");
		String value = request.getParameter("value");
		int user = Integer.parseInt(request.getParameter("user"));
		
		if(type.equals("username") || type.equals("password") || type.equals("progress_learn_category") || type.equals("progress_learn_lesson")) {
			UpdateUsers(user, type, value);
		} else if(type.equals("delete") && !isAdmin(user)) {
			System.out.println("delete me" + user);
			DeleteUser(user);
		}
	}
}