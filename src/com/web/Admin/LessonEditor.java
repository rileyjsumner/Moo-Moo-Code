package com.web.Admin;

import com.dao.LessonDao;
import com.util.LoginUtil;
import com.web.Login;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LessonEditor extends HttpServlet
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		if(LoginUtil.TestAdmin(request,response))
		{
			if(request.getParameterMap().containsKey("id"))
			{
				int id = Integer.parseInt(request.getParameter("id"));
				request.setAttribute("lesson_content", LessonDao.GetLessonText(id));
				request.setAttribute("lesson_start_code", LessonDao.GetLessonCode(id));
				request.setAttribute("categories", LessonDao.GetAllLessonCategories());
				request.setAttribute("lesson_title", LessonDao.GetLessonTitle(id));
				
				request.getRequestDispatcher("/WEB-INF/admin/lesson_editor.jsp").forward(request, response);
				return;
			}
			
			request.setAttribute("lessons", LessonDao.GetAllLessonCategories());
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
		if(LoginUtil.TestAdmin(request, response))
		{
			String action = request.getParameter("submit");
			int id = Integer.parseInt(request.getParameter("id"));
			if(action.equals("Save")) {
				String title = request.getParameter("lesson_title_text");
				String start_code = request.getParameter("lesson_start_code");
				int category = Integer.parseInt(request.getParameter("category"));
				String content = request.getParameter("lesson_content");
				LessonDao.SetLessonContent(id, title, content, category, start_code);
			} else if(action.equals("Delete")) {
			
			}
		}
	}
}
