package com.util;

import com.dao.UserDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginUtil {
	public static boolean TestLogin(HttpSession session)
	{
		String username = (String)session.getAttribute("username");
		String password = (String)session.getAttribute("password");
		if(username != null && password != null)
		{
			int user_id = UserDao.TestLogin(username,password);
			if(user_id != -1)
			{
				session.setAttribute("signed_in",true);
				session.setAttribute("username",username);
				session.setAttribute("password",password);
				session.setAttribute("user_id",user_id);
				
				// Admin test
				if(UserDao.isAdmin(user_id)){session.setAttribute("admin",true);}
				else{session.setAttribute("admin",false);}
				return true;
			}
			else{
				session.setAttribute("signed_in",false);
				session.setAttribute("user_id",-1);
			}
		}
		else{
			session.setAttribute("username","");
			session.setAttribute("password","");
			session.setAttribute("user_id",-1);
			session.setAttribute("signed_in",false);
		}
		return false;
	}
	public static boolean TestAdmin(HttpServletRequest request, HttpServletResponse response,boolean redirect) throws IOException {
		HttpSession session = request.getSession();
		if(TestLogin(session))
		{
			if((boolean)session.getAttribute("admin"))
			{
				return true;
			}
		}
		if(redirect){response.sendRedirect(response.encodeURL("/Home"));}
		return false;
	}
	public static boolean TestAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		return TestAdmin(request,response,true);
	}
}
