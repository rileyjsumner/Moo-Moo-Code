package com.web.Admin;
import com.dao.LevelsDao;
import com.util.LoginUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class Levels extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public Levels() {super();}
	
	/**
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		if(LoginUtil.TestAdmin(request,response))
		{
			HttpSession session = request.getSession();
			request.setAttribute("levels",LevelsDao.GetAllLevels());
			request.getRequestDispatcher("/WEB-INF/admin/levels.jsp").forward(request, response);
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