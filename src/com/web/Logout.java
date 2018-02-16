package com.web;

import com.util.Html;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class Logout extends HttpServlet {
	// Controller for /Logout
	private static final long serialVersionUID = 1L;
	
	public Logout() {
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
		
		HttpSession session = request.getSession();
		session.setAttribute("username","");
		session.setAttribute("password","");
		session.setAttribute("signed_in",false);
		response.sendRedirect(Html.encodeURL(request,"/Home"));
	}
}