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
			int user_id = UserDao.TestLogin(username,password);
			if(user_id != -1)
			{
				session.setAttribute("signed_in",true);
				session.setAttribute("user_id",user_id);
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
}
