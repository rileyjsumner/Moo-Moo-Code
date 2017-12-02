package com.web.Admin;

import com.data.User;
import com.dao.UserDao;
import com.util.LoginUtil;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

import static com.dao.UserDao.*;


public class Users extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	public Users()
	{
		super();
	}
	
	/**
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		if (LoginUtil.TestAdmin(request, response))
		{
			HttpSession session = request.getSession();
			int user_id = (int) session.getAttribute(("user_id"));
			boolean admin = isAdmin(user_id);
			List<User> userList = UserDao.GetUsers();
			
			request.setAttribute("users", userList);
			request.setAttribute("admin", admin);
			
			request.getRequestDispatcher("/WEB-INF/admin/users.jsp").forward(request, response);
		}
		
		
	}
	
	/**
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		if (LoginUtil.TestAdmin(request, response))
		{
			if (LoginUtil.TestAdmin(request, response))
			{
				String type = request.getParameter("type");
				String value = request.getParameter("value");
				
				if (type.equals("username") || type.equals("password") || type.equals("progress_learn_category") || type.equals("progress_learn_lesson"))
				{
					int user = Integer.parseInt(request.getParameter("user"));
					UpdateUsers(user, type, value);
				} else if (type.equals("delete") && !isAdmin(Integer.parseInt(request.getParameter("user"))))
				{
					int user = Integer.parseInt(request.getParameter("user"));
					DeleteUser(user);
				} else if (type.equals("add"))
				{
					String username = request.getParameter("username");
					String password = request.getParameter("password");
					int categoryProgress = Integer.parseInt(request.getParameter("categoryProgress"));
					int lessonProgress = Integer.parseInt(request.getParameter("lessonProgress"));
					int admin = Integer.parseInt(request.getParameter("admin"));
					AddUser(username, password, categoryProgress, lessonProgress, admin);
					response.sendRedirect("/Admin/Users");
				}
			}
		}
	}
}