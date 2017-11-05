package com.web;

import com.dao.LessonDao;
import com.dao.UserDao;
import com.util.LoginUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class Lesson extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public Lesson() {
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
			// Check if requested lesson is available for this user and valid
			String lesson_s = request.getParameter("lesson");
			int lesson = Integer.parseInt(lesson_s);
			if(LessonDao.CheckLessonAccessible(lesson,(int)session.getAttribute("user_id")))
			{
				request.setAttribute("lesson_text",LessonDao.GetLessonText(lesson));
				request.getRequestDispatcher("/WEB-INF/lesson.jsp").forward(request, response);
			}
			else
			{
				request.setAttribute("user_progress", LessonDao.GetIdFromLesson(UserDao.GetUserLessonProgress((int)session.getAttribute("user_id"))));
				request.getRequestDispatcher("/WEB-INF/lesson_invalid.jsp").forward(request, response);
			}
		}
		else
		{
			request.setAttribute("action_text","access lessons");
			request.setAttribute("action","Learn");
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
		request.setAttribute("signed_in",true);
		request.setAttribute("account_name","Bob");
		LoginUtil.TestLogin(request.getSession());
		request.getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
	}
}