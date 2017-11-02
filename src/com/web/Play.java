package com.web;

import com.dao.LevelsDao;
import com.util.LoginUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class Play extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public Play() {
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
		// Test if user is logged in
		HttpSession session = request.getSession();
		if(LoginUtil.TestLogin(session))
		{
			request.setAttribute("levels", LevelsDao.GetAllLevels());
			request.getRequestDispatcher("/WEB-INF/play.jsp").forward(request, response);
			return;
		}
		request.setAttribute("action_text","play");
		request.setAttribute("action","Play");
		request.getRequestDispatcher("/WEB-INF/login_required.jsp").forward(request, response);
	}
	
	/**
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("signed_in",true);
		request.setAttribute("account_name","Bob");
		LoginUtil.TestLogin(request.getSession());
		request.getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
	}
}