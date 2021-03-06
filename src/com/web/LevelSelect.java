package com.web;

import com.dao.UserLevelsDao;
import com.util.LoginUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class LevelSelect extends HttpServlet {
	// Controller for /LevelSelect
	private static final long serialVersionUID = 1L;
	
	public LevelSelect() {
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
			request.setAttribute("levels", UserLevelsDao.GetAllUserLevels((int)session.getAttribute("user_id")));
			request.getRequestDispatcher("/WEB-INF/level_select.jsp").forward(request, response);
			return;
		}
		request.setAttribute("action_text","play");
		request.setAttribute("action","LevelSelect");
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
		doGet(request,response);
	}
}