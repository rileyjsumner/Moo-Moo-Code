package com.web;

import com.dao.LessonDao;
import com.dao.LevelsDao;
import com.dao.UserDao;
import com.data.LessonId;
import com.util.LoginUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class Game extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public Game() {
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
		// If the user is logged in
		HttpSession session = request.getSession();
		if(LoginUtil.TestLogin(session))
		{
			if(request.getParameterMap().containsKey("level")) // If they request a level
			{
				String levelRequested = request.getParameter("level");
				try
				{
					int levelIntRequested = Integer.parseInt(levelRequested);
					
				}
				catch (NumberFormatException ex)
				{
					// level isn't an integer
				}
			}
			response.sendRedirect("Play");
		}
		else
		{
			request.setAttribute("action_text","play");
			request.setAttribute("action","Play");
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
		LoginUtil.TestLogin(request.getSession());
		request.getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
	}
}