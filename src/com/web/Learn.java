package com.web;

import com.dao.LessonDao;
import com.util.LoginUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
		if(LoginUtil.TestLogin(request.getSession()))
		{
			request.setAttribute("show_lessons",true);
			request.setAttribute("lessons", LessonDao.GetAllLessonCategories());
			request.getRequestDispatcher("/WEB-INF/learn.jsp").forward(request, response);
		}
		else
		{
			request.setAttribute("show_lessons",false);
			request.getRequestDispatcher("/WEB-INF/learn.jsp").forward(request, response);
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
		request.getRequestDispatcher("/WEB-INF/learn.jsp").forward(request, response);
	}
}