package com.util;

import com.dao.UserDao;

import javax.servlet.http.HttpSession;

public class LoginUtil {
	public static boolean TestLogin(HttpSession session)
	{
		String username = (String)session.getAttribute("username");
		String password = (String)session.getAttribute("password");
		if(username != null && password != null)
		{
			if(UserDao.TestLogin(username,password))
			{
				session.setAttribute("signed_in",true);
				return true;
			}
			else{
				session.setAttribute("signed_in",false);
			}
		}
		else{
			session.setAttribute("username","");
			session.setAttribute("password","");
			session.setAttribute("signed_in",false);
		}
		return false;
	}
}
