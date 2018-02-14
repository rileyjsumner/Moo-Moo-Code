package com.web;

import com.dao.LessonDao;
import com.dao.UserDao;
import com.data.Lesson.LessonCategory;
import com.data.Lesson.LessonId;
import com.util.Html;
import com.data.Lesson.Lesson;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class LessonSearch extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	public LessonSearch() {
		super();
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("submit");
		String query = request.getParameter("query");
		if(search.equals("Search Lessons")) {
			ArrayList<Integer> idContain = new ArrayList<>();
			ArrayList<Lesson> lessons = LessonDao.GetAllLessons();
			int x = 0;
			for(Lesson lesson : lessons) {
				if(lesson.text.toLowerCase().contains(query)) {
					idContain.add(lesson.Id);
				}
				x++;
			}
			if(!idContain.isEmpty()) {
				ArrayList<String> results = new ArrayList<>();
				request.setAttribute("empty", false);
				for(int id : idContain) {
					String link = "";
					link += "<a class=\"edit-btn edit-btn-green\" href=\"/Lesson?lesson="+id+"\">"+LessonDao.GetLessonTitle(id)+"</a>";
					results.add(link);
				}
				request.setAttribute("results", results);
			} else {
				request.setAttribute("empty", true);
			}
			request.getRequestDispatcher("/WEB-INF/search.jsp").forward(request, response);
		}
	}
}
