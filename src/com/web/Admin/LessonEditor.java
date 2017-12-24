package com.web.Admin;

import com.dao.LessonDao;
import com.util.LoginUtil;

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
				request.setAttribute("categories", LessonDao.GetAllLessonCategories());
				if(id != -1)
				{
					request.setAttribute("lesson_content", LessonDao.GetLessonText(id));
					request.setAttribute("lesson_start_code", LessonDao.GetLessonCode(id));
					request.setAttribute("lesson_title", LessonDao.GetLessonTitle(id));
					request.setAttribute("category_id", LessonDao.GetCategoryId(id));
					request.setAttribute("output", LessonDao.GetLessonOutput(id));
					request.setAttribute("bindings", LessonDao.getLessonBindings(id));
				}
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
			if(action.equals("Save")) {
				int id = Integer.parseInt(request.getParameter("id"));
				String title = request.getParameter("lesson_title_text");
				String start_code = request.getParameter("lesson_start_code");
				int category = Integer.parseInt(request.getParameter("category"));
				String content = request.getParameter("lesson_content");
				String output = request.getParameter("lesson_content_output");
				LessonDao.SetLessonContent(id, title, content, category, start_code, output);
				response.sendRedirect(response.encodeURL("/Admin/Lessons?id="+id));
				return;
			} else if(action.equals("Delete")) {
				int id = Integer.parseInt(request.getParameter("id"));
				LessonDao.DeleteLesson(id);
				response.sendRedirect(response.encodeURL("/Admin/Lessons"));
				return;
			} else if(action.equals("Add")) {
				String title = request.getParameter("lesson_title_text");
				String start_code = request.getParameter("lesson_start_code");
				int category = Integer.parseInt(request.getParameter("category"));
				String content = request.getParameter("lesson_content_editor");
				String output = request.getParameter("lesson_content_output");
				int maxID = LessonDao.AddLesson(title, content, category, start_code, output);
				response.sendRedirect(response.encodeURL("/Admin/Lessons?id="+maxID));
			} else if(action.equals("Add Category")) {
				String categoryName = request.getParameter("category_name");
				LessonDao.AddCategory(categoryName);
				response.sendRedirect(response.encodeURL("/Admin/Lessons"));
			} else if(action.equals("Add Binding")) {
				int id = Integer.parseInt(request.getParameter("id"));
				String title = request.getParameter("binding");
				String value = request.getParameter("value");
				if(title != null && value != null) {
					LessonDao.AddBinding(title, value, id);
				}
				response.sendRedirect(response.encodeURL("/Admin/Lessons?id="+id));
			} else if(action.equals("Update Binding")) {
				String col = request.getParameter("type");
				String val = request.getParameter("value");
				int lesson_id = Integer.parseInt(request.getParameter("lesson"));
				int bind_id = Integer.parseInt(request.getParameter("id"));
				if(val != null && col != null) {
					LessonDao.UpdateBinding(col, val, bind_id, lesson_id);
				}
				response.sendRedirect(response.encodeURL("/Admin/Lessons?id="+lesson_id));
			} else if(action.equals("Delete Binding")) {
				int id = Integer.parseInt(request.getParameter("lesson"));
				int bind_id = Integer.parseInt(request.getParameter("id"));
				LessonDao.DeleteBinding(bind_id);
				response.sendRedirect(response.encodeURL("/Admin/Lessons?id="+id));
			}
			
		}
	}
}
