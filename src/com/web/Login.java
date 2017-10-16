package com.web;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.Enumeration;


public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public Login() {
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
		// Get the login page
		request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
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
		String username = request.getParameter("username");
		String password = request.getParameter("username");
		
		HttpSession session = request.getSession();
		session.setAttribute("username",username);
		session.setAttribute("password",password);
		session.setAttribute("signed_in",true);
		
		request.getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
	}
}