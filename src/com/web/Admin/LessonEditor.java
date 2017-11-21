package com.web.Admin;

import com.dao.LessonDao;
import com.data.Lesson.Lesson;
import com.util.LoginUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

import static com.dao.UserDao.isAdmin;

public class LessonEditor extends HttpServlet
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		if(LoginUtil.TestAdmin(request,response))
		{
			int user_id = (int)session.getAttribute(("user_id"));
			boolean admin = isAdmin(user_id);
			ArrayList<Lesson> lessonList = LessonDao.GetLessonContent();
			
			request.setAttribute("lessons", lessonList);
			System.out.println(lessonList.size());
			request.setAttribute("admin", admin);
			int lessonId = -1;
			if(request.getParameterMap().containsKey("lesson")) {
				try {
					lessonId = Integer.parseInt(request.getParameter("lesson"));
					request.setAttribute("lesson_id", lessonId);
				}
				catch(NumberFormatException e)
				{
					// error.isbad()
				}
			}
			
			request.setAttribute("lesson_id", lessonId);
			request.getRequestDispatcher("/WEB-INF/admin/lesson.jsp").forward(request, response);
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
