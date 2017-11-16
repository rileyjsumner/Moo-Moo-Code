package com.web.Admin;

import com.dao.LessonDao;
import com.dao.MapsDao;
import com.dao.UserDao;
import com.data.Lesson;
import com.data.MapData;
import com.data.User;
import com.util.LoginUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import static com.dao.UserDao.isAdmin;

public class LessonEditor extends HttpServlet
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int user_id = (int)session.getAttribute(("user_id"));
		boolean admin = isAdmin(user_id);
		ArrayList<Lesson> lessonList = LessonDao.GetLessonContent();
		
		request.setAttribute("lessons", lessonList);
		request.setAttribute("admin", admin);
		
		if(LoginUtil.TestAdmin(request,response))
		{
			request.getRequestDispatcher("/WEB-INF/admin/lessons.jsp").forward(request, response);
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
