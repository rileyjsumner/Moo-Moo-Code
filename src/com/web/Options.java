package com.web;

import com.beans.UserBean;
import com.dao.UserDao;
import com.util.LoginUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.Enumeration;
import java.util.List;
import java.util.Objects;


public class Options extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public Options() {
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
		boolean admin = UserDao.isAdmin(user_id);
		List<UserBean> userBeanList = UserDao.GetUsers();
		
		request.setAttribute("users", userBeanList);
		request.setAttribute("admin", admin);
		request.getRequestDispatcher("/WEB-INF/admin.jsp").forward(request, response);

		if(LoginUtil.TestLogin(session))
		{
			request.getRequestDispatcher("/WEB-INF/options.jsp").forward(request, response);
		}
		else
		{
			request.setAttribute("action_text","access account options");
			request.setAttribute("action","Options");
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
		doGet(request, response);
	}
}