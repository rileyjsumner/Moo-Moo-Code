package com.web;

import com.dao.UserDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.Enumeration;
import java.util.Objects;


public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public Login() {
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
		// Get the login page
		String action = request.getParameter("action");
		request.setAttribute("action",action);
		request.setAttribute("failed",false);
		request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
	}
	
	/**
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Log the user in
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		HttpSession session = request.getSession();
		session.setAttribute("username",username);
		session.setAttribute("password",password);
		
		int user_id = UserDao.TestLogin(username,password);
		boolean signed_in = user_id != -1;
		
		session.setAttribute("signed_in",signed_in);
		session.setAttribute("user_id",user_id);
		
		if(!signed_in)
		{
			request.setAttribute("failed",true);
			request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
		}
		else{
			if(request.getParameterMap().containsKey("action"))
			{
				String action = request.getParameter("action");
				if(action != null && !action.equals("null"))
				{
					response.sendRedirect(action);return;
				}
			}
			response.sendRedirect("Home");
		}
	}
}