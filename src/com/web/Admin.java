package com.web;

import com.dao.UserDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.Enumeration;
import java.util.Objects;


public class Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public Admin() {
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
		// Get the admin page
		
		HttpSession session = request.getSession();
		int user_id = (int)session.getAttribute(("user_id"));
		boolean admin = UserDao.isAdmin(user_id);
		
		request.setAttribute("admin", admin);
		System.out.println(admin);
		request.getRequestDispatcher("/WEB-INF/admin.jsp").forward(request, response);
	}
	
	/**
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Log the user in
		doGet(request, response);
	}
}