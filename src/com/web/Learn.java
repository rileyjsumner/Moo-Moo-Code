package com.web;

import com.dao.LessonDao;
import com.dao.UserDao;
import com.data.Lesson.LessonId;
import com.util.LoginUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class Learn extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public Learn() {
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
			LessonId progress = UserDao.GetUserLessonProgress((int)session.getAttribute("user_id"));
			request.setAttribute("progress_category",progress.Category);
			request.setAttribute("progress_lesson",progress.Lesson);
			
			request.setAttribute("show_lessons",true);
			request.setAttribute("lessons", LessonDao.GetAllLessonCategories());
			request.getRequestDispatcher("/WEB-INF/learn.jsp").forward(request, response);
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
		LoginUtil.TestLogin(request.getSession());
		request.getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
	}
}