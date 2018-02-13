package com.web;

import com.dao.UserDao;
import com.util.Html;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


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
		String action = request.getParameter("action");
		request.setAttribute("action",action);
		request.setAttribute("failed",false);
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
		String password = request.getParameter("password");
		
		HttpSession session = request.getSession();
		session.setAttribute("username",username);
		session.setAttribute("password",password);
		
		int user_id = UserDao.TestLogin(username,password);
		boolean signed_in = user_id != -1;
		
		session.setAttribute("signed_in",signed_in);
		session.setAttribute("user_id",user_id);
		
		if(!signed_in)
		{
			request.setAttribute("failed",true);
			request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
		}
		else{
			if(request.getParameterMap().containsKey("action"))
			{
				String action = request.getParameter("action");
				if(action != null && !action.equals("null"))
				{
					response.sendRedirect(Html.encodeURL(request,"/"+action));return;
				}
			}
			response.sendRedirect(Html.encodeURL(request,"/Home"));
		}
	}
}