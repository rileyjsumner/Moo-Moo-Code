package com.web.Admin;

import com.dao.LessonDao;
import com.dao.UserDao;
import com.data.User;
import com.util.Html;
import com.util.LoginUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import static com.dao.UserDao.*;


public class Reports extends HttpServlet
{
	// Controller for /Users
	private static final long serialVersionUID = 1L;
	
	public Reports()
	{
		super();
	}
	
	/**
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		if (LoginUtil.TestAdmin(request, response))
		{
			if (LoginUtil.TestAdmin(request, response))
			{
				request.setAttribute("userCount", UserDao.GetUserCount());
				ArrayList<Integer> categoryCounts = new ArrayList<>();
				int cat_count = LessonDao.GetTotalCategories();
				for(int x = 0; x < cat_count; x++) {
					categoryCounts.add(UserDao.GetUsersAtCategory(x));
				}
				request.setAttribute("user_progress", categoryCounts);
			}
			request.getRequestDispatcher("/WEB-INF/admin/reports.jsp").forward(request, response);
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
	
	}
}