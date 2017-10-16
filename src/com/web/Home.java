package com.web;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public Home() {
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
	    request.setAttribute("signed_in",false);
		request.setAttribute("account_name","Phil");
		request.getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
	}
	
	/**
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("signed_in",true);
		request.setAttribute("account_name","Bob");
		request.getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
	}
}