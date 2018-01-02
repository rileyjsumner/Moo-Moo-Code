package com.web;

import com.dao.UserDao;
import com.util.Html;
import com.util.LoginUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class CreateAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public CreateAccount() {
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
		// If they're already logged in
		request.setAttribute("failed",false);
		if(LoginUtil.TestLogin(request.getSession()))
		{
			response.sendRedirect(Html.encodeURL(request,"/Home"));
		}
		else
		{
			request.getRequestDispatcher("/WEB-INF/createaccount.jsp").forward(request, response);
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
		// Create the account action
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		
		if(UserDao.AddUser(username,password))
		{
			// update session vars
			session.setAttribute("username",username);
			session.setAttribute("password",password);
			session.setAttribute("signed_in",true);
			response.sendRedirect(Html.encodeURL(request,"/Home"));
		}
		else // Username taken
		{
			session.setAttribute("username","");
			session.setAttribute("password","");
			session.setAttribute("signed_in",false);
			request.setAttribute("failed",true);
			request.getRequestDispatcher("/WEB-INF/createaccount.jsp").forward(request, response);
		}
		
	}
}