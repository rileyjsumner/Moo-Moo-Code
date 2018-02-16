package com.web;

import com.code.CodeEngine;
import com.code.CodeOutput;
import com.dao.LessonDao;
import com.dao.UserDao;
import com.data.Lesson.Binding;
import com.util.Html;
import com.util.LoginUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;


public class Lesson extends HttpServlet {
	// Controller for /Lesson
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
		int user_id = (int)session.getAttribute("user_id");
		if(LoginUtil.TestLogin(session))
		{
			// Check if requested lesson is available for this user and valid
			String lesson_s = request.getParameter("lesson");
			int lesson = Integer.parseInt(lesson_s);
			if(LessonDao.CheckLessonAccessible(lesson,(int)session.getAttribute("user_id")))
			{
				request.setAttribute("lesson", lesson);
				request.setAttribute("lesson_text",LessonDao.GetLessonText(lesson));
				request.setAttribute("start_code", LessonDao.GetLessonCode(user_id, lesson, false));
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
			int lesson_id = Integer.parseInt(request.getParameter("lesson"));
			String action = request.getParameter("submit");
			if(LessonDao.CheckLessonAccessible(lesson_id, user_id))
			{
				if(action.equals("Run Code"))
				{
					CodeEngine engine = new CodeEngine();
					CodeOutput output = engine.Exec(code);
					LessonDao.UpdateLessonCode(user_id, lesson_id, code);
					if (!output.Error)
					{
						HashMap<String, Object> bindings = engine.GetBindings();
						Set<String> keys = bindings.keySet();
						ArrayList<Binding> lessonBindings = LessonDao.getLessonBindings(lesson_id);
						
						boolean valid = true;
						
						for (Binding bind : lessonBindings)
						{
							
							if (keys.contains(bind.title))
							{
								Object binding = bindings.get(bind.title);
								String database_binding = binding.toString();
								System.out.println("Start:"+database_binding);
								database_binding = database_binding.replaceAll("\r", "");
								database_binding = database_binding.replaceAll("\n", "");
								database_binding = database_binding.replaceAll("\t", "");
								database_binding = database_binding.replaceAll(" ", "");
								System.out.println("END:"+database_binding);
								System.out.println("Start:"+bind.value);
								bind.value = bind.value.replaceAll("\r", "");
								bind.value = bind.value.replaceAll("\n", "");
								bind.value = bind.value.replaceAll("\t", "");
								bind.value = bind.value.replaceAll(" ", "");
								System.out.println("END:"+bind.value);
								if (database_binding.equals(bind.value))
								{
								
								} else if(bind.value.equals("?")) {
								
								}
								else
								{
									System.out.println(bind.title);
									System.out.println(database_binding);
									output.Text += "\nValues not assigned correctly";
									valid = false;
									break;
								}
							} else
							{
								output.Text += "\nCheck code to include all elements";
								valid = false;
								break;
							}
						}
						if (valid)
						{
							request.setAttribute("success", true);
						}
					}
					request.setAttribute("output", output.Text);
					request.setAttribute("lesson_text", LessonDao.GetLessonText(lesson_id));
					request.setAttribute("lesson", lesson_id);
					request.setAttribute("start_code", LessonDao.GetLessonCode(user_id, lesson_id, false));
					request.getRequestDispatcher("/WEB-INF/lesson.jsp").forward(request, response);
				}
				else if(action.equals("Advance")) {
					response.sendRedirect(Html.encodeURL(request, "/Lesson?lesson="+LessonDao.getNextLesson(user_id, lesson_id)));
					return;
				}
				else if(action.equals("Review Lesson")) {
					LessonDao.UpdateLessonAccessible(lesson_id, user_id);
					response.sendRedirect(Html.encodeURL(request, "/Lesson?lesson="+lesson_id));
					return;
				}
			} else {
				System.out.println("Does this work?");
				if(action.equals("Advance")) {
					if(LessonDao.UpdateLessonAccessible(lesson_id, user_id)) {
						response.sendRedirect(Html.encodeURL(request, "/Lesson?lesson="+LessonDao.getNextLesson(user_id, lesson_id)));
						return;
					}
				}
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