package com.web;

import com.dao.LessonDao;
import com.dao.UserDao;
import com.data.Lesson.LessonCategory;
import com.util.Html;

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
		String search = request.getParameter("submit");
		String query = request.getParameter("query");
		if(search.equals("Search Lessons")) {
			ArrayList<Integer> idContain = new ArrayList<>();
			ArrayList<LessonCategory> lessons = LessonDao.GetAllLessonCategories();
			int x = 0;
			for(LessonCategory lesson : lessons) {
				if(lesson.Lessons.get(x).text.contains(query)) {
					idContain.add(lesson.Lessons.get(x).Id);
				}
				x++;
			}
			if(!idContain.isEmpty()) {
				request.setAttribute("empty", false);
				request.setAttribute("SearchResults", idContain);
			} else {
				request.setAttribute("empty", true);
			}
			
		}
		
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
