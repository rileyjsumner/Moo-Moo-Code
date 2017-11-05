package com.web;

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