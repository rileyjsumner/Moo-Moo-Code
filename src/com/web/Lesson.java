package com.web;

import com.code.CodeOutput;
import com.dao.LessonDao;
import com.dao.UserDao;
import com.data.Lesson.LessonId;
import com.util.LoginUtil;
import com.code.CodeEngine;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Set;


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
				request.setAttribute("lesson", lesson);
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
		HttpSession session = request.getSession();
		if(LoginUtil.TestLogin(session)) {
			int user_id = (int)session.getAttribute("user_id");
			String code = request.getParameter("code");
			System.out.println(code);
			int lesson_id = Integer.parseInt(request.getParameter("lesson"));
			
			if(LessonDao.CheckLessonAccessible(lesson_id, user_id))
			{
				CodeEngine engine = new CodeEngine();
				CodeOutput output = engine.Exec(code);
				System.out.println(output.Error);
				System.out.println(output.Text);
				System.out.println("surroundenered");
				if(!output.Error)
				{
					HashMap<String, Object> bindings = engine.GetBindings();
					Set<String> keys = bindings.keySet();
					HashMap<String, String> lessonBindings = LessonDao.getLessonBindings(lesson_id);
					Set<String> lesson_keys = lessonBindings.keySet();
					
					System.out.println(keys + "/n" + lesson_keys);
					boolean valid = true;
					
					for(String lesson_key : lesson_keys)
					{
						if(keys.contains(lesson_key)){
							Object binding = bindings.get(lesson_key);
							String database_binding = binding.toString();
							System.out.print(database_binding + "/n" + lessonBindings.get(lesson_key));
							if(database_binding.equals(lessonBindings.get(lesson_key)))
							{
								System.out.println("yay");
							} else {
								System.out.print("not equal");
								valid = false;
								break;
							}
						} else {
							System.out.println("not contain");
							valid = false;
							break;
						}
					}
					if(valid)
					{
						request.setAttribute("success", true);
						System.out.println(request.getAttribute("success"));
					}
				} else {
					System.out.println("wow dummy");
				}
				request.setAttribute("lesson_text",LessonDao.GetLessonText(lesson_id));
				request.setAttribute("lesson", lesson_id);
				request.getRequestDispatcher("/WEB-INF/lesson.jsp").forward(request, response);
			}
		}
		else
		{
			request.setAttribute("action_text","access lessons");
			request.setAttribute("action","Learn");
			request.getRequestDispatcher("/WEB-INF/login_required.jsp").forward(request, response);
		}
	}
}