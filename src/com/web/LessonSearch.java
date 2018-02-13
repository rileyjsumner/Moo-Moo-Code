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
		doPost(request, response);
		
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("submit");
		String query = request.getParameter("query");
		System.out.println(search);
		if(search.equals("Search Lessons")) {
			ArrayList<Integer> idContain = new ArrayList<>();
			ArrayList<LessonCategory> lessons = LessonDao.GetAllLessonCategories();
			int x = 0;
			for(LessonCategory lesson : lessons) {
				if(lesson.Lessons.get(x).text.contains(query)) {
					idContain.add(lesson.Lessons.get(x).Id);
					System.out.println(lesson.Lessons.get(x).Id);
				}
				x++;
			}
			if(!idContain.isEmpty()) {
				ArrayList<String> results = new ArrayList<>();
				request.setAttribute("empty", false);
				for(int id : idContain) {
					String link = "";
					link += "<a class=\"edit-btn edit-btn-green\" href=\"/Lesson?id="+id+">"+LessonDao.GetLessonTitle(id)+"</a>";
					results.add(link);
					System.out.println(link);
				}
				request.setAttribute("results", results);
			} else {
				request.setAttribute("empty", true);
			}
			System.out.println("end");
			request.getRequestDispatcher("/WEB-INF/search.jsp").forward(request, response);
		}
	}
}
